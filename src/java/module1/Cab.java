/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package module1;

import java.util.Date;
import java.sql.*;
import common.ConnBean;
/**
 *
 * @author kjayanta
 */
public class Cab {

    private String cab_id;
    private String desc;
    private Date purchase_date;
    private boolean allocation_status ;
    private Date servicing_due_date;
    private String servicing_remark ;
    private int day;
    private int month;
    private int year;

    public Cab() {
        System.out.println("Inside Cab Constructor...!");
        allocation_status = false;
        servicing_due_date = null;
        //purchase_date = new Date(year,month,day);

    }

    public boolean isAllocation_status() {
        return allocation_status;
    }

    public void setAllocation_status(boolean allocation_status) {
        this.allocation_status = allocation_status;
    }

    public String getCab_id() {
        return cab_id;
    }

    public void setCab_id(String cab_id) {
        this.cab_id = cab_id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getPurchase_date() {
        return purchase_date;
    }

    public void setPurchase_date(Date purchase_date) {
        //this.purchase_date = purchase_date;
        purchase_date = new java.sql.Date(year, month, day);
    }

    public Date getServicing_due_date() {
        return servicing_due_date;
    }

    public void setServicing_due_date(Date servicing_due_date) {
        this.servicing_due_date = servicing_due_date;
    }

    public String getServicing_remark() {
        return servicing_remark;
    }

    public void setServicing_remark(String servicing_remark) {
        this.servicing_remark = servicing_remark;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
        System.out.println("Day is"+ day);
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
        System.out.println("month is"+ month);
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
        System.out.println("Year is"+ year);
    }

    public boolean addCabToDb()
    {

         try{
            purchase_date = new java.sql.Date(year-1900, month-1, day);
            System.out.println("Inside Add Cab To Db...!");
            int a;
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            ResultSet rst=null;
            Statement stmt=null;
            System.out.print("---------------------------------------------------");
            con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");

            String  sql = "select date_add('"+purchase_date+"',interval 1 year)";
             rst = stmt.executeQuery(sql);
             rst.next();
             String servicing_due_date = rst.getString(1);
             sql = "insert into CabMaster values('"
                            +cab_id+"','"
                            +desc+"',1,'"+purchase_date+"','"+servicing_due_date+"','N/A')";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);

            if(a != 0)
                {
                System.out.println("Query Executed Successfully....!");
                }

            sql="select * from CabMaster";
            rst = stmt.executeQuery(sql);

            while(rst.next())
            {
                String id = rst.getString(1);
                System.out.println(id);
                System.out.println("---");
            }
            rst.close();
            con.close();
            return true;
            }
         catch(Exception e)
         {
             e.printStackTrace();
             return false;
        }
    }

    public boolean updateCabFromDb(String cab_id)
    {
        try{
        purchase_date = new java.sql.Date(year-1900, month-1, day);
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = null;
        ResultSet rst = null;
        stmt = conn.createStatement();

        String sql="select a.* from CabMaster a";
        System.out.println("Inside Update... "+purchase_date);
        PreparedStatement pst=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
          rst=pst.executeQuery();
          while(rst.next())
          {
              if(rst.getString("cab_id").equalsIgnoreCase(cab_id))
                  {
                   System.out.println("Purchase Date & Desc"+purchase_date+" "+desc);
                   rst.updateDate(4, (java.sql.Date) purchase_date);
                   rst.updateString(2,desc);
                    rst.updateRow();
              }
          }
          System.out.println("Cab Updated Successfully...!");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;

    }

   /* public boolean Display(String cab_id)
    {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select purchase_date from CabMaster where cab_id='"+cab_id+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                purchase_date = rst.getDate(1);
            }

            sql = "select description from CabMaster where cab_id='"+cab_id+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                desc = rst.getString(1);
            }
         }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return true;
    }*/

     public boolean Display(String cab_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from CabMaster where cab_id='"+cab_ID+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                cab_id = rst.getString(1);
                desc = rst.getString(2);
                allocation_status = rst.getBoolean(3);
                purchase_date = rst.getDate(4);
                servicing_due_date = rst.getDate(5);
                servicing_remark = rst.getString(6);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
}

