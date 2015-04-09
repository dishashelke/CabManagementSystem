<%--
    Document   : DisplayInfo
    Created on : Nov 4, 2010, 11:16:08 AM
    Author     : Jayanta
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

        <%
        String driver_shift = null;
        String cab_id = null;
        String route_id = null;
        ResultSet rst1 = null;
        String[] emp_id = new String[5];
        int i = 0 ;
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = conn.createStatement();
        Statement stmt1 = conn.createStatement();
        String sql = null;
        String driver_id = (String)session.getAttribute("Driver_license_no");
        String stop_id = null;
        System.out.println("con admin "+driver_id);
        sql = "select stop_id,cab_id from CurrentCabProgress where driver_license_no='"+driver_id+"'";
        System.out.println("sql= "+sql);
        rst1 = stmt.executeQuery(sql);
        rst1.next();
        stop_id = rst1.getString(1);
        cab_id = rst1.getString(2);
        sql = "update CurrentCabProgress set breakdown_status = 1 where driver_license_no='"+session.getAttribute("Driver_license_no")+"'";
        System.out.println(sql);
        i = stmt.executeUpdate(sql);
        if( i > 0)
            {

        %>
            Request Sent to Admin...!
            <u><a href="DriverHome.jsp">Go Home...!</a></u>
        <%
        String id = "select max(Exception_id) from Exception";
                    int temp = 0;
                    ResultSet rs = stmt.executeQuery(id);
                    while (rs.next())
                    {
                        temp = rs.getInt(1);
                        temp = temp + 1;
                    }
                    String desc = "Delay";
                    sql = "insert into Exception values(" + temp + ",'Breakdown',current_timestamp,'','"+stop_id+"','00:00:00','" + cab_id + "',0)";
                    System.out.println(sql);
                    int a = stmt.executeUpdate(sql);
                    System.out.println(sql);
                    if(a!=0)
                    {
                        out.println("Executed Successfully...!");
                    }
        }
        else
            {
    %>
    Try Again...! <u><a href="DriverHome.jsp">Go Home...!</a></u>
            <%
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
