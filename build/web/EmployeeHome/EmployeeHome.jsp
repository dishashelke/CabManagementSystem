<%--
    Document   : EmpHome
    Created on : Apr 12, 2011, 4:54:34 PM
    Author     : guest
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
<link href="./CSS/CmsHome.css" rel="stylesheet" type="text/css" media="screen" />
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

				<li><a href="./CmsHome.html">Log out</a></li>
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

        Welcome Employee
        <%
        String cab_id = null;
        String driver_id = null;
        String driver_name = null;
        String pickup_stop_id = null;
        String dropoff_stop_id = null;
        String pickup_stop_name = null;
        String dropoff_stop_name = null;
        ResultSet rst1 ;
        int i = 0 ;

        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = conn.createStatement();
        String emp_id = (String)(session.getAttribute("Employee_id"));

        String sql = "select cab_id,driver_license_no from Execution where date(alloc_time) = current_date and execution_status = 0 and emp_id='"+session.getAttribute("Employee_id")+"'";
        ResultSet rst = stmt.executeQuery(sql);

        if(rst.next())
        {
            cab_id = rst.getString(1);
            driver_id = rst.getString(2);
        }

        if(cab_id == null)
            out.println("Not allocated");
         else
        {
            sql = "select driver_name from DriverMaster where driver_license_no ='"+driver_id+"'";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                driver_name = rst.getString(1);
            sql = "select * from EmployeeStop where emp_id ='"+emp_id+"'";
            rst = stmt.executeQuery(sql);
            if(rst.next())
            {
                pickup_stop_id = rst.getString(2);
                dropoff_stop_id = rst.getString(3);
            }
            sql = "select stop_name from StopMaster where stop_id ='"+pickup_stop_id+"'";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                pickup_stop_name = rst.getString(1);
            sql = "select stop_name from StopMaster where stop_id ='"+dropoff_stop_id+"'";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                dropoff_stop_name = rst.getString(1);
                
        %>


        Cab Allocated   :        <%=cab_id%>

	Driver Name     :        <%=driver_name%>

        <!--Pick Up Time    :-->

	Pick Up Stop	:        <%=pickup_stop_name%>

	Drop Off Stop	:        <%=dropoff_stop_name%>


        <%
        }
        %>
        <u><a href="EmployeeHome/UpdateEmp.jsp">Modify Your Details</a></u>

	<u><a href="EmployeeHome/DeleteReq.jsp">Delete Registration</a></u>

	<!--<u><a href="LeaveNotification.html">Leave Notification To Admin</a></u>

	<u><a href="LateNotification.html">Late Notification</a></u>-->
        <u><a href="EmployeeHome/DisplayEmployee.jsp">Display Your Details</a></u>

	<u><a href="EmployeeHome/EmpFeedback.jsp">Enter Feedback</a></u>
        

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
