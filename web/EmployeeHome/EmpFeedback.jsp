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
    <h1>Enter Feedback</h1>
<form name="feedback" action="empFeedbackToAdmin.jsp" method="POST" onsubmit="return message()">
<%
    /*Date d1 = new Date();
    int day = d1.getDay();
    int month = d1.getMonth()+ 1;
    int year = d1.getYear() + 1900;*/
        String emp_id = null;
        String driver_id = null;
        String cab_id = null;
        String s="select CURDATE()";
        ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();

        ResultSet rs=stmt.executeQuery(s);
        String d = null;
        while(rs.next())
            d=rs.getString(1);

        %>
	Today's Date   :	<%=d%>

        <script type="text/javascript">
        function checkMe(me,bool)
        {
            if(me.checked)
                {
                    document.getElementById("d2").disabled=bool;
                    document.getElementById("d3").disabled=bool;
                    document.getElementById("d1").disabled=false;
                }



        }

        function checkMe1(me,bool)
        {
            if(me.checked)
                {
                    document.getElementById("d1").disabled=bool;
                    document.getElementById("d3").disabled=bool;
                    document.getElementById("d2").disabled=false;
                }
        }
        function checkMe3(me,bool)
        {
            if(me.checked)
                {
                    document.getElementById("d1").disabled=bool;
                    document.getElementById("d2").disabled=bool;
                    document.getElementById("d3").disabled=false;
                }
        }


        function checkMe2(me,bool)
        {
            if(!me.checked)
                {
                    document.getElementById("d1").disabled=bool;
                    document.getElementById("d2").disabled=bool;
                    document.getElementById("d3").disabled=bool;
                }
        }
        function message()
        {
            if (!document.feedback.usertype[0].checked && !document.feedback.usertype[1].checked && !document.feedback.usertype[2].checked && document.feedback.desc.value=="")
            {
                        alert("Please Select one of the Radio button");
                        document.feedback.desc.focus();
                        return false;
            }

            if (document.feedback.feedback_about.value=="empid")
            {
                        alert("Please Select Employee Id");
                        document.feedback.feedback_about.focus();
                        return false;
            }



            if (!document.feedback.usertype[0].checked && !document.feedback.usertype[1].checked && !document.feedback.usertype[2].checked)
            {
                        alert("Please Select one of the Radio button");
                        document.feedback.desc.focus();
                        return false;
            }

            if(document.feedback.desc.value=="")
            {
                   alert("Please Fill Description Field also");
                   document.feedback.desc.focus();
                   return (false);
            }
            return true;
        }
</script>

	Enter Feedback About:

	  <input type="radio" name="usertype" value="Employee" id="rad1" onclick="checkMe(this,true);" />  Employee

	  <input type="radio" name="usertype" value="Cab" onclick="checkMe1(this,true);"/>  Cab

          <input type="radio" name="usertype" value="Driver" onclick="checkMe3(this,true);"/>  Driver
          <%
                String sql="select emp_id from EmployeeMaster";
                rs=stmt.executeQuery(sql);
               
          %>
        Enter Employee Id :   <select name="feedback_about" id="d1">
            
          <%
                while(rs.next())
                {
                    emp_id = rs.getString(1);

          %>
                <option><%=emp_id%></option>
          <%
                 }
           %>
            </select>
           <%
         
           String sql1="select cab_id from CabMaster";
                rs=stmt.executeQuery(sql1);
         
          %>
        Enter Cab Id :   <select name="feedback_about" id="d2">
         
          <%
                while(rs.next())
                {
                    cab_id = rs.getString(1);

          %>
                <option><%=cab_id%></option>
          <%
                 }
           %>
            </select>
           <%
                
         
           String sql2="select driver_license_no from DriverMaster";
                rs=stmt.executeQuery(sql2);
         
          %>
        Enter Cab Id :   <select name="feedback_about" id="d3">
         
          <%
                while(rs.next())
                {
                    driver_id = rs.getString(1);

          %>
                <option><%=driver_id%></option>
          <%
                 }
           %>
            </select>
           %>

           <%--Enter Respective Id(cab) :  <input type="text" name="feedback_about">
              OR
          Name(Employee)
           --%>


         Description 	    :
		               <textarea rows="4" cols="25" name="desc"></textarea>

                               <%

                               %>
        <input type="submit" value="Submit" name="submit"/>         <input type="reset" value="Clear" name="reset" onclick="checkMe2(this,false);"  />
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