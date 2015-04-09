<%-- 
    Document   : DisplayEmp
    Created on : Apr 12, 2011, 11:07:54 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Adhesive
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20100406

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Adhesive by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="Adhesive" content="" />
<link href="../CSS/CmsHome.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
	<!-- start header -->
	<div id="header">
		<div id="logo">
                    <h1><a href="#"><span>Employee Home</span></a></h1>
		</div>
		<div id="menu">
			<ul id="main">

				<li><a href="../CmsHome.html">Log out</a></li>
			</ul>
		</div>
	</div>
	<!-- end header -->
	<!-- start page -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">


				<!-- end content -->
				<!-- start sidebars -->

                                 <pre>
              <form name="DisplayEmployee" action="../EmployeeHome/EmployeeHome.jsp" method="POST">
    <pre>
        <%
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            ResultSet rst=null;
            Statement stmt=null;
            String sql = null;
            stmt=con.createStatement();

            String emp_id = (String)(session.getAttribute("Employee_id"));

            sql = "select * from EmployeeStop where emp_id = '"+emp_id+"'";
            rst = stmt.executeQuery(sql);
            rst.next();

            String pickup_stop_id = rst.getString(2);
            String dropoff_stop_id = rst.getString(3);

            sql = "select * from EmployeeMaster where emp_id = '"+emp_id+"'";
            rst = stmt.executeQuery(sql);
            rst.next();

            String emp_shift = rst.getString(6);
            String emp_gender = rst.getString(7);
            String emp_password = rst.getString(8);

        %>

        Employee Name       :  <%=rst.getString(2)%>
        Employee Address    :
                               <%= rst.getString(3)%>
        Contact No          :  <%=rst.getString(4)%>
        Email id            :  <%=rst.getString(5)%>
        <%
            if(emp_gender.equalsIgnoreCase("M"))
            {
        %>
        Gender              :   Male
        <%
           }
            else
            {
         %>
         Gender             :   Female
         <%
           }
         %>
        <%
            if(emp_shift.equalsIgnoreCase("M"))
            {
        %>
        Employee  Shift     :   Morning
        <%
           }

            if(emp_shift.equalsIgnoreCase("E"))
            {
         %>
         Employee  Shift     :   Evening
        <%
           }
            
            if(emp_shift.equalsIgnoreCase("N"))
            {
         %>
            Employee  Shift     :   Night
        <%
           }
            
         %>        
        <!--Rewrite Password    :  <input type="password" name="emp_password" value=""/>-->

        <%
         String pickup_stop_name1=null;
         String dropoff_stop_name1=null;
         sql = "select stop_name from StopMaster where stop_id = '"+pickup_stop_id+"'";
         rst = stmt.executeQuery(sql);
         if(rst.next())
             pickup_stop_name1 = rst.getString(1);
         sql = "select stop_name from StopMaster where stop_id = '"+dropoff_stop_id+"'";
         rst = stmt.executeQuery(sql);
         if(rst.next())
             dropoff_stop_name1 = rst.getString(1);
        %>
        Route To  Office    :
        Pick-Up Stop  	       <%=pickup_stop_name1%>

        Route To  Home	    :
        Drop-Off Stop          <%=dropoff_stop_name1%>
            
	<!--Route Not Available...? Contact Administrator	<a href="CmsHome.html">Redirect To Login</a>-->

                    <input type="submit" value="Back" />
    </pre>
         </form>

      </pre>



				<!-- end sidebars -->
				<div style="clear: both;">&nbsp;</div>
			</div>
			<!-- end page -->
		</div>
	</div>
</div>
<div id="footer-wrapper">
	<div id="footer">
		<p class="copyright">&copy;&nbsp;&nbsp;2010 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.freecsstemplates.org/">ISSC UoP</a>.</p>
	</div>
</div>
</body>
</html>
