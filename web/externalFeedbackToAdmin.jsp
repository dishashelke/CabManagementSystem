<%--
    Document   : FeedbackToAdmin
    Created on : Dec 9, 2010, 12:59:28 PM
    Author     : Sidharam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="common.ConnBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%--<h1>Hello World!</h1>--%>
        <%
           String feedback_about = request.getParameter("cabid");
           String location = request.getParameter("location");
           String desc = request.getParameter("desc");
         //  String time = request.getParameter("time");
          // String date = request.getParameter("date");
                    // String driver_id = session.getAttribute("Driver_license_no").toString();
           //out.println(emp_name);
          ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();
          String id = "select max(feedback_id) from Feedback";
          int temp = 0;
       //    out.println("hiii");
          ResultSet rs = stmt.executeQuery(id);
          String External="External";
          while(rs.next())
              {
              temp = rs.getInt(1);
              temp = temp + 1;
              }
           //    out.println("hiii");
          String sql = "insert into Feedback values("+temp+",'"+External+"','"+feedback_about+"','"+desc+"','','"+location+"',current_timestamp)";

          %>
          <br/>
          <br/>
          <%
          try{
          if(!stmt.execute(sql))
              {
                // out.println("hiii");
              out.println("Inserted successfully...!");
              }
          else{
              out.println("Exception Occured...!");
              }
          }
          catch(Exception e)
                  {
              out.println("------------------------------------------");
              e.printStackTrace();
              }
        %>
    </body>
</html>
