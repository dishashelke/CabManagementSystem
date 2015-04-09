<%--
    Document   : EnterCabProgressToDB
    Created on : Nov 4, 2010, 8:28:50 PM
    Author     : Jayanta
--%>
<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">



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
          String driver_license_no = session.getAttribute("Driver_license_no").toString();
          String cab_id = null;
          String route_id = null;
          String dest = null;
          String dest_name = null;
          ResultSet rst = null;
          int temp = 0;
          int emp_count = Integer.parseInt(request.getParameter("employee"));

          ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();
          String sql = null;
          sql = "select route_id, cab_id from Execution where date(alloc_time) = current_date and execution_status = 0 && driver_license_no='"+driver_license_no+"'";
          rst = stmt.executeQuery(sql);


          while(rst.next())
              {
                route_id = rst.getString(1);
                cab_id = rst.getString(2);
              }

          String stop_name = request.getParameter("stop_name");
          String stop_id = null;
          sql = "select stop_id from StopMaster where stop_name = '"+stop_name+"'";
          rst = stmt.executeQuery(sql);
          rst.next();
          stop_id=rst.getString(1);

          //sql = "delete from currentcabprogerss where driver_license_no = '"+driver_license_no+"'";
          sql="select destination from RouteMaster where route_id='"+route_id+"'";
          rst = stmt.executeQuery(sql);
          rst.next();              
          dest_name=rst.getString(1);

          sql="select stop_id from StopMaster where stop_name='"+dest_name+"'";
          rst = stmt.executeQuery(sql);
          rst.next();
          dest=rst.getString(1);

          System.out.println("dest="+dest+"stop_name"+stop_name);
          if(stop_id.equalsIgnoreCase(dest))
              {
              System.out.println("dest = stop_name");
                sql = "delete from CurrentCabProgress where driver_license_no = '"+driver_license_no+"'";
                if(stmt.execute(sql))
                    {
                    out.println("Executed sucessfully");
                    System.out.println("Deleted From DataBase...!");
                    }
                sql = "update Execution  set execution_status=1 where driver_license_no = '"+driver_license_no+"' and cab_id='"+cab_id+"' and date(alloc_time)=current_date";
                if(stmt.execute(sql))
                    {
                    out.println("Executed sucessfully");
                    System.out.println("Updated From DataBase...!");
                    }
                %>
                       <u><a href="DriverHome.jsp">Go Home...!</a></u>
                 <%
              }
          else
          {
          String run = request.getParameter("running");
         //ouble running = new Double(run);
          double r=Double.parseDouble(run);
          String employee = request.getParameter("employee");


          sql = "select * from CurrentCabProgress where driver_license_no = '"+driver_license_no+"'";
          System.out.println(sql);
          rst=null;
          rst = stmt.executeQuery(sql);
          String route=null;
            while(rst.next())
            {
            route = rst.getString(4);
            System.out.println("route="+route);
//            System.out.println("Display info \n cab_id : "+cab_id);
            //route_id = rst.getString(2);
            }
          System.out.println("route="+route);

          if( route != null)
              {

                System.out.println("in if stmt");
                sql="update CurrentCabProgress set time_current = current_timestamp,stop_id = '"+stop_id+"',running = "+r+",emp_count="+emp_count+" where driver_license_no='"+driver_license_no+"'";
                System.out.println(sql);
                int a1 = stmt.executeUpdate(sql);
                if(a1 != 0)
                    out.println("Currnet cab progress updated");

              }

          else
              {

                sql = "insert into CurrentCabProgress values(current_timestamp,'"+cab_id+"','"+driver_license_no+"','"+route_id+"','"+stop_id+"',"+r+","+emp_count+",0)";
                System.out.println(sql);
                int a = stmt.executeUpdate(sql);
                if(a!=0)
                    out.println("Executed Successfully...!");
              }%>
          <u><a href="EnterCabProgress.jsp">Back</a></u>
          <%}

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