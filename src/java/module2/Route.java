/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package module2;

import java.sql.Time;
import common.ConnBean;
import java.sql.*;


/**
 *
 * @author Jayanta
 */
public class Route  {

    String route_id;
    String source;
    String destination;
    Time reqd_time;
    String distance;
    String reqd_hour;
    String reqd_min;
    String reqd_sec;

    public Route() {
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public Time getReqd_time() {
        return reqd_time;
    }

    public void setReqd_time(Time reqd_time) {
        this.reqd_time = reqd_time;
    }

    public String getRoute_id() {
        return route_id;
    }

    public void setRoute_id(String route_id) {
        this.route_id = route_id;
    }

    public String getSource() {
        return source;
    }
//stmt.executeUpdate(sql2);
    public void setSource(String source) {
        this.source = source;
    }

    public String getReqd_hour() {
        return reqd_hour;
    }

    public void setReqd_hour(String reqd_hour) {
        this.reqd_hour = reqd_hour;
    }

    public String getReqd_min() {
        return reqd_min;
    }

    public void setReqd_min(String reqd_min) {
        this.reqd_min = reqd_min;
    }

    public String getReqd_sec() {
        return reqd_sec;
    }

    public void setReqd_sec(String reqd_sec) {
        this.reqd_sec = reqd_sec;
    }


    public boolean AddRouteToDb(String rid)
    {
        try{
            route_id=rid;
            int hh,min,sec;
            hh=Integer.parseInt(reqd_hour);
            min=Integer.parseInt(reqd_min);
            sec=Integer.parseInt(reqd_sec);
            reqd_time = new Time(hh,min,sec);
            int a;
            ConnBean conn = new ConnBean();         
            Connection con = conn.connect();
            //ResultSet rst=null;
            Statement stmt=null;
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");
            String sql = "insert into RouteMaster values('"
                            +route_id+"','"
                            +source+"','"+destination+"','"+reqd_time+"',"+distance+")";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);

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


    public boolean AddNewRouteToDb(String rid)
    {
        try{
            int hh,min,sec;
            hh=Integer.parseInt(reqd_hour);
            min=Integer.parseInt(reqd_min);
            sec=Integer.parseInt(reqd_sec);
            reqd_time = new Time(hh,min,sec);
            int a;
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            //ResultSet rst=null;
            Statement stmt=null;
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");
            String sql = "insert into RouteMaster values('" +rid+"','"+destination+"','"+source+"','"+reqd_time+"',"+distance+")";
            System.out.println(sql);
            a = stmt.executeUpdate(sql);

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

     public boolean updateRouteFromDb(String r_id)
    {

        try
        {
            int hh,min,sec;
            hh=Integer.parseInt(reqd_hour);
            min=Integer.parseInt(reqd_min);
            sec=Integer.parseInt(reqd_sec);
            reqd_time = new Time(hh,min,sec);
            System.out.println("hh"+reqd_hour);
            System.out.println("min"+reqd_min);
            System.out.println("ss"+reqd_sec);
            String temp = r_id;
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql1="update RouteMaster set source = '"+source+"' where route_id = '"+temp+"'";
            String sql2="update RouteMaster set destination = '"+destination+"' where route_id = '"+temp+"'";
            String sql3="update RouteMaster set distance = '"+distance+"' where route_id = '"+temp+"'";
            String sql4="update RouteMaster set required_time = '"+reqd_time+"' where route_id = '"+temp+"'";

            System.out.println(sql1);
            System.out.println(sql2);
            System.out.println(sql3);
            System.out.println(sql4);

            int a = stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            stmt.executeUpdate(sql3);
            stmt.executeUpdate(sql4);

            System.out.print("aaaaaaa"+a);

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }


    return true;
    }

     public boolean updateNewRouteFromDb(String r_id)
    {

        try
        {
            int hh,min,sec;
            hh=Integer.parseInt(reqd_hour);
            min=Integer.parseInt(reqd_min);
            sec=Integer.parseInt(reqd_sec);
            reqd_time = new Time(hh,min,sec);
            System.out.println("hh"+reqd_hour);
            System.out.println("min"+reqd_min);
            System.out.println("ss"+reqd_sec);
            String temp = r_id;
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql1="update RouteMaster set source = '"+destination+"' where route_id = '"+temp+"'";
            String sql2="update RouteMaster set destination = '"+source+"' where route_id = '"+temp+"'";
            String sql3="update RouteMaster set distance = '"+distance+"' where route_id = '"+temp+"'";
            String sql4="update RouteMaster set required_time = '"+reqd_time+"' where route_id = '"+temp+"'";

            System.out.println(sql1);
            System.out.println(sql2);
            System.out.println(sql3);
            System.out.println(sql4);
            int a = stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            stmt.executeUpdate(sql3);
            stmt.executeUpdate(sql4);

            System.out.print("aaaaaaa"+a);

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }


    return true;
    }

public boolean Display(String route_ID)
         {
        try{
            ConnBean con = new ConnBean();
            Connection conn = con.connect();
            Statement stmt = null;
            ResultSet rst = null;
            stmt = conn.createStatement();
            String sql = "select * from RouteMaster where route_id='"+route_ID+"'" ;
            rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                route_id=rst.getString(1);
                source = rst.getString(2);
                destination=rst.getString(3);
                reqd_time=rst.getTime(4);
                distance=rst.getString(5);

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
