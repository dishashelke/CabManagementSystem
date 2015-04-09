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
 * @author Jayanta
 */
public class Driver  {

   // private String driver_id;
    private String driver_name;
    private String driver_address;
    private long driver_contact_no;
    private String driver_license_no;
    private char driver_shift;
    private Date driver_joining_date;
    private String legal_info;
    private String driver_password;
    private int day;
    private int month;
    private int year;
    private Date in_time;
    private Date out_time;

    public Driver() {
    }

    public String getDriver_address() {
        return driver_address;
    }

    public void setDriver_address(String driver_address) {
        this.driver_address = driver_address;
    }

    public long getDriver_contact_no() {
        return driver_contact_no;
    }

    public void setDriver_contact_no(long driver_contact_no) {
        this.driver_contact_no = driver_contact_no;
    }
    public void setDriver_in_time(Date s)
    {
        this.in_time=s;
    }

    public void setDriver_out_time(Date s)
    {
        this.out_time=s;
    }
    public Date getDriver_in_time()
    {
        return this.in_time;
    }

    public Date getDriver_out_time()
    {
        return this.out_time;
    }
   /* public String getDriver_id() {
        return driver_id;
    }

    public void setDriver_id(String driver_id) {
        this.driver_id = driver_id;
    }*/


    public Date getDriver_joining_date() {
        return driver_joining_date;
    }

    public void setDriver_joining_date(Date driver_joining_date) {
        this.driver_joining_date = driver_joining_date;
    }

    public String getDriver_license_no() {
        return driver_license_no;
    }

    public void setDriver_license_no(String driver_license_no) {
        this.driver_license_no = driver_license_no;
    }

    public String getDriver_name() {
        return driver_name;
    }

    public void setDriver_name(String driver_name) {
        this.driver_name = driver_name;
    }

    public char getDriver_shift() {
        return driver_shift;
    }

    public void setDriver_shift(char driver_shift) {
        this.driver_shift = driver_shift;
    }

    public String getLegal_info() {
        return legal_info;
    }

    public void setLegal_info(String legal_info) {
        this.legal_info = legal_info;
    }

    public String getDriver_password() {
        return driver_password;
    }

    public void setDriver_password(String driver_password) {
        this.driver_password = driver_password;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }


    public boolean addDriverToDb()
    {
        try{
            driver_joining_date = new java.sql.Date(year-1900, month-1, day);
            System.out.println("Inside Add Driver To Db...!");
            int a;
            ConnBean conn = new ConnBean();
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver).newInstance();
            Connection con = null;
            ResultSet rst=null;
            Statement stmt=null;
            System.out.println("---------------------------------------------------");
            con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.println("Connected Successfully..!");
            String sql = "insert into DriverMaster values('"
                            +driver_license_no+"','"+driver_name+"','"+driver_address+"','"+driver_contact_no+"','"+driver_shift+"','"+driver_joining_date+"','"
                            +legal_info+"','"+driver_password+"')";
            System.out.println(sql);
            //con_no, lic no, shift, joining date, legal_info, driverpass
            a = stmt.executeUpdate(sql);

            if(a != 0)
                {
                System.out.println("Query Executed Successfully....!");
                }

            sql="select * from DriverMaster";
            rst = stmt.executeQuery(sql);

            while(rst.next())
            {
                String id = rst.getString(1);
                System.out.println(id);
                System.out.println("---");
            }
            rst.close();
          
            return true;
            }
         catch(Exception e)
         {
             e.printStackTrace();
             return false;
        }
    }

     public boolean Display(String license_no)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from DriverMaster where driver_license_no ='"+license_no+"'" ;
            System.out.println(sql);
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                driver_license_no = rst.getString(1);
                driver_name = rst.getString(2);
                driver_address = rst.getString(3);
                driver_contact_no = rst.getLong(4);
                driver_shift = rst.getString(5).charAt(0);
                driver_joining_date = rst.getDate(6);
                legal_info = rst.getString(7);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }

     public boolean updateDriverFromDb(String license_no)
    {
        try{
        String temp = new String(String.valueOf(driver_shift));
        driver_joining_date = new java.sql.Date(year-1900, month-1, day);
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = null;
        ResultSet rst = null;
        stmt = conn.createStatement();

        String sql="select a.* from DriverMaster a";
        
        PreparedStatement pst=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
          rst=pst.executeQuery();
          while(rst.next())
          {
              if(rst.getString("driver_license_no").equalsIgnoreCase(license_no))
                  {
                   //System.out.println("Purchase Date & Desc"+purchase_date+" "+desc);

                   //rst.updateDate(4, (java.sql.Date) purchase_date);
                   //rst.updateString(2,desc);
                    rst.updateString(2,driver_name);
                    rst.updateString(3,driver_address);
                    rst.updateLong(4,driver_contact_no);
                    rst.updateString(5,temp);
                    rst.updateDate(6, (java.sql.Date)driver_joining_date);
                    rst.updateString(7,legal_info);
                    rst.updateString(8, driver_password);
                    rst.updateRow();
              }
          }
          System.out.println("Driver Updated Successfully...!");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;

    }





}
