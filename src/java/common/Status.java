/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package common;

import java.util.Date;
import java.sql.*;
import common.ConnBean;

/**
 *
 * @author guest
 */
public class Status {
    private static int allotted_cab;
    private static int spare_cab;
    private static int servicing_cab;
    private static int maintaince_cab;
    private static int total_cab;

    private static int allotted_driver;
    //private int available_driver;
    private static int total_driver;

    private static int allotted_employee;
    private static int total_employee;

    public static int getAllotted_cab() {
        return allotted_cab;
    }

    public void setAllotted_cab(int allotted_cab) {
        this.allotted_cab = allotted_cab;
    }
    public static int getSpare_cab() {
        return spare_cab;
    }

    public void setSpare_cab(int spare_cab) {
        this.spare_cab = spare_cab;
    }
    public static int getServicing_cab() {
        return servicing_cab;
    }

    public void setServicing_cab(int servicing_cab) {
        this.servicing_cab = servicing_cab;
    }
    public static int getMaintaince_cab() {
        return maintaince_cab;
    }

    public void setMaintaince_cab(int maintaince_cab) {
        this.maintaince_cab = maintaince_cab;
    }
    public static int getTotal_cab() {
        return total_cab;
    }

    public void setTotal_cab(int total_cab) {
        this.total_cab = total_cab;
    }


     public int getAllotted_driver() {
         System.out.println("In getallo driver");
        return allotted_driver;
    }

    public void setAllotted_driver(int allotted_driver) {
        this.allotted_driver = allotted_driver;
    }

    public int getTotal_driver() {
        System.out.println("In total driver");
        return total_driver;
    }

    public void setTotal_driver(int total_driver) {
        this.total_driver = total_driver;
    }
    public int getAllotted_employee() {
        return allotted_employee;
    }

    public void setAllotted_employee(int allotted_employee) {
        this.allotted_employee = allotted_employee;
    }

    public int getTotal_employee() {
        return total_employee;
    }

    public void setTotal_employee(int total_employee) {
        this.total_employee = total_employee;
    }

    public static boolean CabStatus()
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();

            Status status = new Status();

            String sql = "select count(cab_id)from CabMaster" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setTotal_cab(rst.getInt(1));
            int a = rst.getInt(1);
            System.out.println("total = "+status.getTotal_cab());
            sql = "select count( distinct cab_id) from Execution where date(alloc_time) = current_date and execution_status=0" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setAllotted_cab(rst.getInt(1));
            sql = "select count(cab_id) from Maintainance where in_date<current_date and out_date='null'" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setMaintaince_cab(rst.getInt(1));
            sql = "select count(cab_id) from CabMaster where available_status = 1 and cab_id not in(select distinct cab_id from Execution where date(alloc_time)= current_date  and execution_status=0)" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setSpare_cab(rst.getInt(1));
            sql = "select count(cab_id) from CabMaster where available_status = 0 and servicing_due_date<current_date and cab_id not in(select cab_id from Maintainance where in_date<current_date and out_date='null' ) " ;
           rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setServicing_cab(rst.getInt(1));
           // int temp= status.getTotal_cab() - status.getAllotted_cab() - status.getMaintaince_cab() - status.getSpare_cab();
            //status.setServicing_cab(temp);

            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }


    public void DriverStatus()

    {
        System.out.println("In driver status");
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();

            Status status = new Status();

            String sql = "select count(driver_license_no)from DriverMaster" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setTotal_driver(rst.getInt(1));
            int a = rst.getInt(1);
            System.out.println("total driver= "+status.getTotal_driver());

            sql = "select count( distinct driver_license_no) from Execution where date(alloc_time) = current_date and execution_status=0" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setAllotted_driver(rst.getInt(1));
             System.out.println("allotted driver= "+status.getAllotted_driver());
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }


    public void EmployeeStatus()

    {
        System.out.println("In Employee status");
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();

            Status status = new Status();

            String sql = "select count(emp_id)from EmployeeMaster" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setTotal_employee(rst.getInt(1));
            int a = rst.getInt(1);
            System.out.println("total emp= "+status.getTotal_employee());

            sql = "select count( distinct emp_id) from Execution where date(alloc_time) = current_date and execution_status=0" ;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                status.setAllotted_employee(rst.getInt(1));
             System.out.println("allotted emp= "+status.getAllotted_employee());
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
