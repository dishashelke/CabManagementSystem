<%-- 
    Document   : UpdateEmp
    Created on : Oct 16, 2010, 1:34:17 PM
    Author     : Sidharam
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
              <form name="EmpRegistration" action="UpdateEmpFromDb.jsp" method="POST">
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

           EMPLOYEE REGISTRATION

        Employee Name       :  <input type="text" name="emp_name" value ="<%=rst.getString(2)%>"/>
        Employee Address    :
                               <textarea rows="4" cols="25" name="emp_address" ><%= rst.getString(3)%></textarea>
        Contact No          :  <input type="text" name="emp_contact_no" value ="<%=rst.getString(4)%>"/>
        Email id            :  <input type="text" name="emp_email" value ="<%=rst.getString(5)%>"/>
        Gender              : 
        <%
            if(emp_gender.equalsIgnoreCase("M"))
            {
        %>
                               <input type="radio" name="gender" value="Male" checked="checked" />  Male
                               <input type="radio" name="gender" value="Female" /> Female
        <%
           }
            else
            {
         %>
                                <input type="radio" name="gender" value="Male"  />  Male
                               <input type="radio" name="gender" value="Female" checked="checked" /> Female
         <%
           }
         %>
        Employee  Shift     :  
        <%
            if(emp_shift.equalsIgnoreCase("M"))
            {
        %>
                               <input type="radio" name="shift" value="Morning" checked="checked" />  Morning
        <%
           }
            else
            {
         %>
                               <input type="radio" name="shift" value="Morning"  />  Morning
         <%
            }
            if(emp_shift.equalsIgnoreCase("E"))
            {
         %>
                               <input type="radio" name="shift" value="Evening" checked="checked"/> Evening
        <%
           }
            else
            {
         %>
                               <input type="radio" name="shift" value="Evening"/> Evening
         <%
            }
            if(emp_shift.equalsIgnoreCase("N"))
            {
         %>
                               <input type="radio" name="shift" value="Night" checked="checked" />  Night
        <%
           }
            else
           {
         %>
                               <input type="radio" name="shift" value="Night" />  Night
         <%
           }
         %>
        Password            :  <input type="password" name="emppassword1" value="<%--=emp_password%>--%>"/>
        <!--Rewrite Password    :  <input type="password" name="emp_password" value=""/>-->

        Route To  Office    :

        Pick-Up Stop  	       <select name="pickup_stop_name" >
            <%             

            sql = "select stop_name from StopMaster";
            rst = stmt.executeQuery(sql);
            while(rst.next())
                {
                String stop_name = rst.getString(1);
                if(stop_name.equalsIgnoreCase(pickup_stop_id))
                    {
            %>
                               <option selected><%=stop_name%></option>
            <%
                    }
                else
                    {
            %>
                               <option><%=stop_name%></option>
            <%
                    }
                }
            %>
                               </select>

        Route To  Home	    :

        Drop-Off Stop          <select name="dropoff_stop_name">
            <%
            rst.beforeFirst();
            while(rst.next())
                {               
                String stop_name = rst.getString(1);          
                if(stop_name.equalsIgnoreCase(dropoff_stop_id))
                    {
            %>
			       <option selected><%=stop_name%></option>
            <%
                    }
                else
                    {
            %>
                               <option><%=stop_name%></option>
            <%
                    }
                }
            %>
			       </select>

	<!--Route Not Available...? Contact Administrator	<a href="CmsHome.html">Redirect To Login</a>-->

                    <input type="submit" value="Update" />                         <input type="reset" value="Clear" name="clear" />
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
