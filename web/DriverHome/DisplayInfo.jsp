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
        ResultSet rst1 ;
        String[] emp_id = new String[5];
        int i = 0 ;
        ConnBean con = new ConnBean();
        Connection conn = con.connect();
        Statement stmt = conn.createStatement();
        Statement stmt1 = conn.createStatement();
        String sql = "select * from Execution where date(alloc_time) = current_date and execution_status = 0 && driver_license_no='"+session.getAttribute("Driver_license_no")+"'";
        ResultSet rst = stmt.executeQuery(sql);

        if(rst.next())
        {
            cab_id = rst.getString(1);
//            System.out.println("Display info \n cab_id : "+cab_id);
            route_id = rst.getString(2);
            rst.previous();
        }
        if(cab_id == null)
            out.println("Not allocated");
         else
        {
        %>

        You are allocated to cab  :  <%=cab_id%>
        <br/>
        <br/>
        <br/>
        You are allocated to route  : <%=route_id%>
        <br/>
        <br/>
        <br/>
        Employees in your cab with their stops :


                             <table border="1" align="left">
                                <th>EMPLOYEE NAME</th>
                                <th>PICKUP STOP</th>
                                <th>DROPOFF STOP</th>
              <%
//              sql = "select emp_id from Execution where driver_license_no = '"+session.getAttribute("Driver_license_no")+"' and execution_status = 0 && alloc_time=current_date";
  //            rst = stmt.executeQuery(sql);
              while(rst.next())
              {
                    emp_id[i] = rst.getString("emp_id");
                    sql = "select * from EmployeeStop where emp_id='"+emp_id[i]+"'" ;
                    rst1 = stmt1.executeQuery(sql);
                    while(rst1.next())
                        {
                    %>
                                    <tr>
                                    <td><%=emp_id[i] %></td>
                                    <td><%=rst1.getString(2)%></td>
                                    <td><%=rst1.getString(3)%></td>
                                    </tr>

                    <%
                    }
                    i++;
              }
            }
              %>
              </table>
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