<%--
    Document   : AddEmpToDb
    Created on : Oct 10, 2010, 11:45:02 PM
    Author     : Sidharam
--%>


<!--check password1 == password2
-->

<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body bgcolor="#BFB28D">
                <jsp:useBean id="Employee" class="module2.Employee" scope="request">
                 <jsp:setProperty name="Employee" property="*"/>
                 <form name="EmpRegistration1" action="CmsHome.html" method="POST" >
                          <%
                          String g,s;
                          if(request.getParameter("gender").equals("Male"))
                {
                g="M";
                }
            else
                {
                g="F";
                }
            if(request.getParameter("shift").equals("Morning"))
                {
                s="M";
                }
            else
                if(request.getParameter("shift").equals("Evening"))
                    {
                    s="E";
                    }
            else
                {
                s="N";
                }
                      String p=request.getParameter("emppassword2");
                      String e1=request.getParameter("emp_email_id");
                      String pickup_stop_name = request.getParameter("pickup_stop_name");
                      String dropoff_stop_name = request.getParameter("dropoff_stop_name");
                      String pickup_stop_id = null;
                      String dropoff_stop_id = null;
                    if(Employee.AddEmployeeToTempDb(/*g,s,p,*/s,g))
                        {
                        ConnBean conn = new ConnBean();
                        Connection con = conn.connect();
                        ResultSet rst=null;
                        Statement stmt=null;
                        stmt=con.createStatement();
                        String sql = null;

                        sql = "select stop_id from StopMaster where stop_name = '"+pickup_stop_name+"'";
                        rst = stmt.executeQuery(sql);
                        if(rst.next())
                            pickup_stop_id = rst.getString(1);
                        sql = "select stop_id from StopMaster where stop_name = '"+dropoff_stop_name+"'";
                        rst = stmt.executeQuery(sql);
                        if(rst.next())
                            dropoff_stop_id = rst.getString(1);
String temp = Employee.getEmp_id();
                        %>
                        <pre>
                        Employee <%=Employee.getEmp_name()%> Added To DB Successfully...!
                        <%

System.out.println(temp);
                        sql = "update TempEmployee set pickup_stop_id='"+pickup_stop_id+"',dropoff_stop_id='"+dropoff_stop_id+"' where emp_id='"+temp+"'";

                        int a =  (stmt.executeUpdate(sql));
                        if(a == 1)
                            System.out.println("inserted into employeestop");

                    }
                        else{
                            %>
                            Please Try Again...!
                            <br/>
                            <a href="EmpReg.jsp">Go Back...!</a>
                            <%}
                        %>

              </pre>
                             <input type="submit" value="Ok" />
        </jsp:useBean>
</form>
         

    </body>
</html>