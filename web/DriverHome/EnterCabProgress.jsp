<%--
    Document   : EnterCabProgress
    Created on : Nov 4, 2010, 6:05:11 PM
    Author     : Jayanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
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
    <script type="text/javascript">
        /*function Check()
        {
            var id =/^[0-9]{1,100000}$/;
            alert("ok..");
           // var run = document.EnterCabProgress.running.value;
           if(document.EnterCabprogress.running.value == "")
                {
                    alert("enter running");
                    document.EnterCabprogress.running.focus();
                    return false;
                }
                /*if(isNaN(document.EnterCabProgress.running.value))
                {
                    alert("Running should be numeric");
                    document.EnterCabprogress.running.focus();
                    return false;
                }*/
             /*    if(!id.test(document.EnterCabprogress.running.value))
                // if(isNaN(run))
                {
                    alert("Running should be numeric");
                    document.EnterCabprogress.running.focus();
                    return false;
                }
                return true;
        }*/


            function check_v()
        {
           // alert("Ok");
            var regexLetter = /^[a-zA-Z ]{1,50}$/;

           if(document.EnterCabprogress.running.value=="" || isNaN(document.EnterCabprogress.running.value))
                {
                    alert("Please insert valid distance.");
                    document.EnterCabprogress.running.focus();
                    document.EnterCabprogress.running=" ";
                    return false;
                }




       }


    </script>

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
    
<form action="EnterCabProgressToDB.jsp" method="post" name="EnterCabprogress">
    <pre>
	ENTER CAB PROGRESS

<%
    String driver_license_no = session.getAttribute("Driver_license_no").toString();
    System.out.println("Driver_license_no is "+driver_license_no);
    String stop_id = null;
    ConnBean con = new ConnBean();
    Connection conn = con.connect();
    Statement stmt = conn.createStatement();
    ResultSet rst = null;

    String sql = "select * from Execution where date(alloc_time) = current_date and execution_status = 0 && driver_license_no='"+session.getAttribute("Driver_license_no")+"'";
    rst = stmt.executeQuery(sql);

     String cab_id = null;
     if(rst.next())
         cab_id = rst.getString(1);

     if(cab_id == null)
       out.println("Not allocated");

     else
     {

        sql = "select source from RouteMaster where route_id = (select route_id from Execution where driver_license_no='"+driver_license_no+"'&& date(alloc_time)=current_date and execution_status = 0 limit 1)" ;
        rst = stmt.executeQuery(sql);
        rst.next();
        String source = rst.getString(1);
        sql = "select stop_name from StopMaster where stop_name = '"+source+"'" ;
        rst = stmt.executeQuery(sql);
        rst.next();
        stop_id = rst.getString(1);

        %>
	 Select Stop     <select name="stop_name" >


                <option ><%=stop_id%></option>
        <%
       
              sql = "select stop_name from RouteStop r,StopMaster s where r.stop_id = s.stop_id and route_id = (select route_id from Execution where driver_license_no='"+driver_license_no+"' && date(alloc_time)=current_date and execution_status=0 limit 1)" ;
              rst = stmt.executeQuery(sql);
            while(rst.next())
            {
                stop_id = rst.getString(1);
                %>
                <option ><%=stop_id%></option>
                <%
            }

              sql = "select destination from RouteMaster where route_id = (select route_id from Execution where driver_license_no='"+driver_license_no+"'&& date(alloc_time)=current_date limit 1)" ;
              rst = stmt.executeQuery(sql);
              rst.next();
        String destination = rst.getString(1);
        System.out.println("dest = "+destination);
        sql = "select stop_name from StopMaster where stop_name = '"+destination+"'" ;
        rst = stmt.executeQuery(sql);
        rst.next();
        stop_id = rst.getString(1);           
                %>
                <option ><%=stop_id%></option>
                <%
           

             rst.close();

            %>
        </select>

	No. of Employees   :       <select name="employee">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
            </select>
<!no of emps should be verified from db >

	Enter Current Running of the cab   :         <input type="text" name="running" size="6"  value=""/>



        In Case of Breakdown Click Here     	     <u><a href="ContactAdminForBreakdown.jsp"> Contact Admin </a></u>

	In Case of Delays Click Here (Driver)        <u><a href="ContactAdminForDelay.jsp"> Contact Admin </a></u>

	<!--In Case Of Delay Click Here (Employee)	     <u><a href="SendMessageToEmployee.html"> Send Message </a></u>-->


        <input type="submit" name="submit" value="Submit" onclick="return check_v()">	<input type="reset" name="Reset">

        <%
        }
     %>

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