<%-- 
    Document   : MarkOuttime
    Created on : Apr 8, 2011, 2:48:01 AM
    Author     : guest
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>

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
                    <h1><a href="#"><span>Driver Home</span></a></h1>
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
            <jsp:useBean id="Driver" class="module1.Driver" scope="request">
       <jsp:setProperty name="Driver" property="*"/>


        <%
        String driver_license_no = session.getAttribute("Driver_license_no").toString();
        String route_id=null;
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = conn.createStatement();
        ResultSet rst = null;
        //Statement stmt1 = conn.createStatement();

//Date din = new java.sql.Date()
        String sql="insert into driver_log values (current_date,'"+session.getAttribute("Driver_license_no")+"',"+Driver.getDriver_in_time()+",current_timestamp,'')";
        int i = stmt.executeUpdate(sql);
        if(i>0)
        {
               %>Driver Mark out Time Checked!!!!!!
               <%
        }
        %>
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
