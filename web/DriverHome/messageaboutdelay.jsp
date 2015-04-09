<%--
    Document   : messageaboutdelay
    Created on : Feb 1, 2011, 11:57:00 PM
    Author     : Variant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>
<%@page import="module1.Driver"%>

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
        Message sent to Admin about Delay.............

        <%
                    String driver_shift = null;
                    String cab_id = null;
                    String route_id = null;
                    String driver_license_no = session.getAttribute("Driver_license_no").toString();
                    int i = 0;
                    ConnBean con = new ConnBean();
                    Connection conn = con.connect();
                    Statement stmt = conn.createStatement();
                   // String delay = request.getParameter("delay");
                    System.out.println(request.getParameter("hour"));
                    int hour = new Integer(request.getParameter("hour"));
                    System.out.println(request.getParameter("minute"));
                    int minute = new Integer( request.getParameter("minute") );
                    int second = new Integer(request.getParameter("second"));
                    java.sql.Time delay=new java.sql.Time(hour, minute, second);
                    String sql = "select cab_id,route_id from Execution where Driver_license_no='" + driver_license_no+ "' && (select date(alloc_time)) = CURDATE() && execution_status='0'";
                    System.out.println(sql);
                    ResultSet rst = stmt.executeQuery(sql);
                    //if(!rst.next())
                    while (rst.next())
                    {
                        cab_id = rst.getString(1);
                        route_id = rst.getString(2);
                        System.out.println(cab_id);

                    }
                    String id = "select max(Exception_id) from Exception";
                    int temp = 0;
                    ResultSet rs = stmt.executeQuery(id);
                    while (rs.next())
                    {
                        temp = rs.getInt(1);
                        temp = temp + 1;
                    }
                    String desc = "Delay";
                    sql = "insert into Exception values(" + temp + ",'" + desc + "',current_timestamp,'','','" + delay + "','" + cab_id + "',0)";
                    System.out.println(sql);
                    int a = stmt.executeUpdate(sql);
                    System.out.println(sql);
                    if(a!=0)
                    {
                        out.println("Executed Successfully...!");
                    }

        %>

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