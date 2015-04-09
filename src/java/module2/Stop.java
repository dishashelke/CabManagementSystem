/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package module2;
import common.ConnBean;
import java.sql.*;

public class Stop{

    String stop_id;
    String stop_name;
    int reqd_hour,reqd_min,reqd_sec;
    String time;
    Time tt;
    public Stop()
    {
        System.out.println("Inside Stop Bean...");
    }

    public String getStop_id() {
        return stop_id;
    }

    public void setStop_id(String stop_id) {
        this.stop_id = stop_id;
    }

    public String getStop_name() {
        return stop_name;
    }

    public void setStop_name(String stop_name) {
        this.stop_name = stop_name;
    }
    public int getReqd_hour() {
        return reqd_hour;
    }

    public void setReqd_hour(int reqd_hour) {
        this.reqd_hour = reqd_hour;
    }

    public int getReqd_min() {
        return reqd_min;
    }

    public void setReqd_min(int reqd_min) {
        this.reqd_min = reqd_min;
    }

    public int getReqd_sec() {
        return reqd_sec;
    }

    public void setReqd_sec(int reqd_sec) {
        this.reqd_sec = reqd_sec;
    }


    public Time getTime() {
        java.sql.Time t=new java.sql.Time(reqd_hour, reqd_min, reqd_sec);
        System.out.print(t);
        return t;
    }

    public void setTime(Time t)
    {
      this.tt=t;
    }
    public boolean addStopToDb(String sid)
    {
                stop_id=sid;
                try{
            java.sql.Time t=new java.sql.Time(reqd_hour,reqd_min,reqd_sec);
            System.out.print(t);
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
            String sql = "insert into StopMaster values('" +stop_id+ "','" +stop_name+ "', '"+t+"')";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);

            if(a != 0)
                {
                System.out.println("Query Executed Successfully....!");
                }

            sql="select * from StopMaster";
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

     public boolean Display(String stop_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from StopMaster where stop_id='"+stop_ID+"'" ;
            rst = stmt.executeQuery(sql);
            System.out.println(sql);
            while(rst.next())
            {
                stop_name = rst.getString("stop_name");
                time=rst.getString("reqd_time");
                System.out.print("stop.java"+time);
            }
            rst.close();

         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
     public boolean updateStopFromDb(String sid)
    {
        stop_id=sid;
          try{
                      java.sql.Time t=new java.sql.Time(reqd_hour,reqd_min,reqd_sec);
                    ConnBean con = new ConnBean();
                    Connection conn = con.connect();
                    Statement stmt = null;
                    ResultSet rst = null;
                    stmt = conn.createStatement();
                    String sql="update StopMaster set stop_name = '"+stop_name+"' where stop_id = '"+stop_id+"'";
                    String sql1="update StopMaster set reqd_time = '"+ t +"' where stop_id = '"+stop_id+"'";

                    System.out.println(sql);
                    System.out.println(sql1);

                    int a = stmt.executeUpdate(sql);
                    a = stmt.executeUpdate(sql1);
                    System.out.print("aaaaaaa"+a);
                    try{
                        if(!stmt.execute(sql1))
                        {
                        //System.out.println(sql2);
                        //System.out.print("aaaaaaa"+a);
                        System.out.println("Stop Updated Successfully...!!!!");
                         }
                    }
                      catch(Exception e){
                          System.out.println(e);
                      }
              }
        catch(Exception e)
        {
            e.printStackTrace();
        }


return true;
    }
}