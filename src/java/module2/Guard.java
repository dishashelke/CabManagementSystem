package module2;
import common.ConnBean;
import java.sql.*;

public class Guard {
    String guard_id;
    String guard_name;
    String guard_address;
    String guard_contact_no;
    String guard_shift;

    public Guard()
    {
        System.out.println("Inside Guard Bean...");
    }

    public String getGuard_address() {
        return guard_address;
    }

    public void setGuard_address(String guard_address) {
        this.guard_address = guard_address;
    }

    public String getGuard_contact_no() {
        return guard_contact_no;
    }

    public void setGuard_contact_no(String guard_contact_no) {
        this.guard_contact_no = guard_contact_no;
    }

    public String getGuard_id() {
        return guard_id;
    }

    public void setGuard_id(String guard_id) {
        this.guard_id = guard_id;
    }

    public String getGuard_name() {
        return guard_name;
    }

    public void setGuard_name(String guard_name) {
        this.guard_name = guard_name;
    }

    public String getGuard_shift(){
        return guard_shift;
    }

    public void setGuard_shift(String guard_shift){
        this.guard_shift=guard_shift;
    }
    
    public boolean addGuardToDb(String gid)
    {
         try{
            guard_id=gid;
            int a;
            ConnBean conn = new ConnBean();
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver).newInstance();
            Connection con = null;
            ResultSet rst=null;
            Statement stmt=null;
            System.out.print("---------------------------------------------------");
            con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");
            String sql = "insert into GuardMaster values('"
                            +guard_id+"','"
                            +guard_name+"','"+guard_address+"','"+guard_contact_no+"','"+ guard_shift+"' )";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);

            if(a != 0)
                {
                System.out.println("Query Executed Successfully....!");
                }

            sql="select * from GuardMaster";
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

     public boolean Display(String guard_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from GuardMaster where guard_id='"+guard_ID+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                guard_name = rst.getString(2);
                guard_address=rst.getString(3);
                guard_contact_no=rst.getString(4);
                guard_shift=rst.getString(5);

            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }

    public boolean updateGuardFromDb(String gid)
    {
         try{
        guard_id = gid;
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = null;
        ResultSet rst = null;
        stmt = conn.createStatement();
        String sql1="update GuardMaster set guard_name = '"+guard_name+"' where guard_id = '"+guard_id+"'";
        String sql2="update GuardMaster set guard_address = '"+guard_address+"' where guard_id = '"+guard_id+"'";
        String sql3="update GuardMaster set guard_contact_no = '"+guard_contact_no+"' where guard_id = '"+guard_id+"'";
        String sql4="update GuardMaster set guard_shift = '"+guard_shift+"' where guard_id = '"+guard_id+"'";
                System.out.println(sql1);
                System.out.println(sql2);
                System.out.println(sql3);
                System.out.println(sql4);
        int a;
        a=stmt.executeUpdate(sql1);
         a = stmt.executeUpdate(sql2);
          a = stmt.executeUpdate(sql3);
          a = stmt.executeUpdate(sql4);
          
        System.out.println("Guard Updated Successfully...!!!!");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;

    }


}
