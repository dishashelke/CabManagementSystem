<%--
    Document   : EmpFeedback
    Created on : Oct 16, 2010, 1:34:46 PM
    Author     : Sidharam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.ConnBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
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
        <%
           String feedback_about = request.getParameter("feedback_about");
           String user_type = request.getParameter("usertype");
           String desc = request.getParameter("desc");
           String emp_id = session.getAttribute("Employee_id").toString();
           //out.println(emp_name);
          ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();
          String id = "select max(feedback_id) from Feedback";
          int temp = 0;
          ResultSet rs = stmt.executeQuery(id);
          while(rs.next())
              {
              temp = rs.getInt(1);
              temp = temp + 1;
              }

          String sql = "insert into Feedback values("+temp+",'"+emp_id+"','"+feedback_about+"','"+desc+"','','',current_timestamp)";
         // out.println(sql);
          %>
          <br/>
          <br/>
          <%
          try{
          if(!stmt.execute(sql))
              {
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