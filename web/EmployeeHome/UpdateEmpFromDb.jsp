<%--
    Document   : UpdateEmpFromDb
    Created on : Apr 10, 2011, 8:26:50 PM
    Author     : Administrator
--%>
<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="conn" class="common.ConnBean" >
<jsp:useBean id="Employee" class="module2.Employee" >
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


        <%
        String emp_id = (String)session.getAttribute("Employee_id");
        System.out.println("update emp"+emp_id);

        String emp_name = request.getParameter("emp_name");
        String emp_address = request.getParameter("emp_address");
        String emp_contact_no1 = request.getParameter("emp_contact_no");
        long emp_contact_no = new Long(emp_contact_no1);
        String emp_email = request.getParameter("emp_email");
        String emp_gender = request.getParameter("gender");
        String emp_shift = request.getParameter("shift");
        String emp_password = request.getParameter("emppassword1");
        String pickup_stop_name = request.getParameter("pickup_stop_name");
        String dropoff_stop_name = request.getParameter("dropoff_stop_name");

        Employee.setEmp_name(emp_name);
        Employee.setEmp_address(emp_address);
        Employee.setEmp_contact_no(emp_contact_no);
        Employee.setEmp_email(emp_email);
        Employee.setEmp_gender(emp_gender);
        Employee.setEmp_shift(emp_shift);
        Employee.setEmp_password(emp_password);

        Employee.updateEmpFromDb(emp_id);
        out.println("Emp Updated");

         //ConnBean conn = new ConnBean();
         Connection con = conn.connect();
         ResultSet rst=null;
         Statement stmt=null;
         stmt=con.createStatement();
         String sql = null;

         sql = "select stop_id from StopMaster where stop_name = '"+pickup_stop_name+"'";
         rst = stmt.executeQuery(sql);
         rst.next();
         String pickup_stop_id = rst.getString(1);
         sql = "select stop_id from StopMaster where stop_name = '"+dropoff_stop_name+"'";
         rst = stmt.executeQuery(sql);
         rst.next();
         String dropoff_stop_id = rst.getString(1);

         sql = "update EmployeeStop set pickup_stop_id = '"+pickup_stop_id+"',dropoff_stop_id = '"+dropoff_stop_id+"' where emp_id ='"+emp_id+"'";
         int a = stmt.executeUpdate(sql);
         if(a != 0)
             System.out.println("EmpStop updated");
         else
             System.out.println("EmpStop not updated");

        %>

        </jsp:useBean>
        </jsp:useBean>

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