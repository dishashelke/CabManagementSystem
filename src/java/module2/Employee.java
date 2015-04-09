/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package module2;
import common.ConnBean;
import java.sql.*;


/**
 *
 * @author Sidharam
 */
public class Employee {

    String emp_id;
    String emp_name;
    String emp_address;
    long emp_contact_no;
    String emp_email;
    String emp_shift;
    String emp_gender;
    String emp_password;



    public Employee() {
        System.out.println("Inside Employee Bean....");

    }

    public String getEmp_address() {
        return emp_address;
    }

    public void setEmp_address(String emp_address) {
        this.emp_address = emp_address;
    }

    public long getEmp_contact_no() {
        return emp_contact_no;
    }

    public void setEmp_contact_no(long emp_contact_no) {
        this.emp_contact_no = emp_contact_no;
    }

    public String getEmp_email() {
        return emp_email;
    }

    public void setEmp_email(String emp_email_id) {
        this.emp_email = emp_email_id;
    }

    public String getEmp_gender() {
        return emp_gender;
    }

    public void setEmp_gender(String emp_gender) {
        this.emp_gender = emp_gender;
    }

    public String getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getEmp_password() {
        return emp_password;
    }

    public void setEmp_password(String emp_password) {
        this.emp_password = emp_password;
    }

    public String getEmp_shift() {
        return emp_shift;
    }

    public void setEmp_shift(String emp_shift) {
        this.emp_shift = emp_shift;
    }

    public boolean AddEmployeeToTempDb(String shift,String gender)
    {
        try{
            /*char g,s;
            String pp;
            String ee;
            pp=p;
            ee=em;
            g=gg;
            s=ss;*/
            int a;
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            //ResultSet rst=null;
            Statement stmt=null;
            String sql = null;
            ResultSet rst = null;
            String id = null;//emp_id
            String temp = null;
            con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");

            sql = "select emp_id from TempEmployee order by emp_id desc limit 1 ";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                id = rst.getString(1);
            if(id == null)
               id = "e101";
            else
            {
                    temp = id.substring(1);
                    int n = Integer.parseInt(temp);
                    n++;
                    id = "e"+n;
            }

            System.out.println("id ="+id);
            sql = "insert into TempEmployee values('"+id+"','"+emp_name+"','"+emp_address+"','"+emp_contact_no+"','"+emp_email+"','"+shift+"','"+gender+"','"+emp_password+"','','')";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);
            emp_id = id;

            if(a != 0)
                {
                System.out.println("Query Executed Successfully....!");
                }

            //rst.close();
            con.close();
            return true;
            }
         catch(Exception e)
         {
             e.printStackTrace();
             return false;
        }
    }

         public boolean Display(String emp_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from EmployeeMaster where emp_id='"+emp_ID+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                emp_id = rst.getString(1);
                emp_name = rst.getString(2);
                emp_address=rst.getString(3);
                emp_contact_no=rst.getLong(4);
                emp_email = rst.getString(5);
               // emp_shift = rst.getCharacterStream(6);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }

          public boolean DisplayTemp(String emp_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from TempEmployee where emp_id='"+emp_ID+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                emp_id = rst.getString(1);
                emp_name = rst.getString(2);
                emp_address=rst.getString(3);
                emp_contact_no=rst.getLong(4);
                emp_email = rst.getString(5);
                emp_shift = rst.getString(6);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }

          public boolean Delete(String emp_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "delete from EmployeeMaster where emp_id='"+emp_ID+"'" ;
            int a = stmt.executeUpdate(sql);
            if(a!= 0)
            {
                sql = "delete from EmployeeStop where emp_id='"+emp_ID+"'" ;
                int b = stmt.executeUpdate(sql);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
          public boolean DeleteTemp(String emp_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "delete from TempEmployee where emp_id='"+emp_ID+"'" ;
            int a = stmt.executeUpdate(sql);
            //if(a)
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }


    public boolean updateEmpFromDb(String emp_id)
    {
        try{
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = null;
        ResultSet rst = null;
        stmt = conn.createStatement();

        String sql="select * from EmployeeMaster where emp_id ='"+emp_id+"'";
        PreparedStatement pst=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
          rst=pst.executeQuery();
          rst.next();

          rst.updateString(2,emp_name);
          rst.updateString(3,emp_address);
          rst.updateLong(4,emp_contact_no);
          rst.updateString(5,emp_email);
          String shift = ""+emp_shift.charAt(0);
          rst.updateString(6,shift);
          String gender = ""+emp_gender.charAt(0);
          rst.updateString(7,gender);
          rst.updateString(8,emp_password);
          rst.updateRow();

          System.out.println("Emp Updated Successfully...!");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;

    }

}
