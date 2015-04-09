<%--
    Document   : CheckPassword
    Created on : Nov 3, 2010, 11:04:15 PM
    Author     : Jayanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>
<%@page import="module1.Driver"%>
<%@page import="common.Status"%>
<jsp:useBean id="Driver" class="module1.Driver" scope="request">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        try{
            //out.println("Hello World...!");
            String user_type = request.getParameter("login");
            //System.out.println(user);
            String user_name = request.getParameter("name");
            String password = request.getParameter("password");
            if(user_type.equalsIgnoreCase("admin"))
                {
                if(user_name.matches("a") && password.matches("a"))
                    {
                    %>
                    <jsp:forward page="./AdminHome.jsp"/>
                    <%
                    }
                else{
                        %>
                        Invalid User Name or Password...!
                        <a href="CmsHome.html"> Go Back....!</a>
                        <%
                    }
                }
            else if(user_type.equalsIgnoreCase("driver"))
                {

                         ConnBean con = new ConnBean();
                         Connection conn = con.connect();
                         Statement stmt = conn.createStatement();
                         String sql = "select driver_password,driver_license_no from DriverMaster where driver_license_no = '"+user_name+"'";
                         //out.println(sql);
                         ResultSet rst = stmt.executeQuery(sql);
                         System.out.println(sql);
                         while(rst.next())
                             {
                            if(user_name.matches(rst.getString(2)) && password.matches(rst.getString(1)))
                                {
                                System.out.println(rst.getString(2)+" IS the Driver...!");
                                session.setAttribute("Driver_license_no", rst.getString(2));
                                %>
                                <jsp:forward page="DriverHome/DriverHome.jsp"/>
                                <%

                                }
                                else{
                                System.out.println("Inside Else...!");
                                %>
                                    Invalid User Name or Password...!
                                    <a href="CmsHome.jsp"> Go Back....!</a>
                                <%
                                 }
                            }
                }
            else if(user_type.equalsIgnoreCase("employee"))
                {

                         ConnBean con = new ConnBean();
                         Connection conn = con.connect();
                         Statement stmt = conn.createStatement();
                         String sql = "select emp_password,emp_id from EmployeeMaster where emp_id = '"+user_name+"'";
                         //out.println(sql);
                         ResultSet rst = stmt.executeQuery(sql);
                         while(rst.next())
                             {
                            if(user_name.matches(rst.getString(2)) && password.matches(rst.getString(1)))
                                {
                                System.out.println(rst.getString(2)+" IS the Employee...!");
                                session.setAttribute("Employee_id",""+rst.getString(2));
System.out.println("chk pw emp_id="+(String)session.getAttribute("Employee_id"));
                                %>
                                <jsp:forward page="EmployeeHome/EmployeeHome.jsp"/>
                                <%

                                }
                                else{
                                System.out.println("Inside Else...!");
                                %>
                                    Invalid User Name or Password...!
                                    <a href="CmsHome.html"> Go Back....!</a>
                                <%
                                 }
                            }



                }
            }
        catch(Exception e)
                {
                    System.out.println("***************88");
                    e.printStackTrace();
                }
        %>
        </jsp:useBean>
    </body>
</html>
