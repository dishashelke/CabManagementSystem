<!--show msg : not available-->



<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <script language="javascript">
    var timeout	= 500;
	var closetimer	= 0;
	var ddmenuitem	= 0;

// open hidden layer
function mopen(id)
{
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out

document.onclick = mclose;
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="./CSS/AdminHome.css" type="text/css" charset="utf-8" />
  </head>
  <body>

      <div id="outer">

         <div id="header">


             <img src="./Images/images.jpeg" alt="Cab" height="90"/>
          <table id="table" rows=1 cols=4 border=0 align="right">
              <tr>
                <th><a href="./Search.html" target="_parent">Search | </a></th>
                <th><a href="./CmsHome.html" target="_parent">Log Out</a></th>
              </tr>
               </table>


    <ul id="sddm">
    <li><a href="#"
        onmouseover="mopen('m1')"
        onmouseout="mclosetime()">Cab</a>
        <div id="m1"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
            <a href="./Cab/AddCab.html">Add</a>
        <a href="./Cab/UpdateCab.jsp">Update</a>
        <a href="./Cab/DeleteCab.jsp">Delete</a>
        <a href="./Cab/Servicing.jsp">Servicing</a>
        <a href="./Cab/MaintainanceCab.jsp">Maintainance</a>
        <a href="./Cab/DisplayCab.jsp">Display</a>
        </div>
    </li>
    <li><a href="#"
        onmouseover="mopen('m2')"
        onmouseout="mclosetime()">Driver</a>
        <div id="m2"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="./Driver/AddDriver.html">Add</a>
        <a href="./Driver/UpdateDriver.jsp">Update</a>
        <a href="./Driver/DeleteDriver.jsp">Delete</a>
        <a href="./Driver/DisplayDriver.jsp">Display</a>
        </div>
    </li>
    <li><a href="#"
           onmouseover="mopen('m3')"
           onmouseout="mclosetime()">Employee</a>
    <div id="m3"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="./Employee/AddEmp.jsp">Add</a>


        </div>
    </li>

    <li><a href="#"
        onmouseover="mopen('m4')"
        onmouseout="mclosetime()">Route</a>
        <div id="m4"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="./Route/AddRoute.jsp">Add</a>
        <a href="./Route/UpdateRoute.jsp">Update</a>
        <a href="./Route/DeleteRoute.jsp">Delete</a>
        <a href="./Route/DisplayRoute.jsp">Display</a>
        </div>
    </li>

   <li><a href="#"
        onmouseover="mopen('m5')"
        onmouseout="mclosetime()">Stop</a>
        <div id="m5"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
            <a href="./Stop/AddStop.jsp">Add</a>
        <a href="./Stop/UpdateStop.jsp">Update</a>
        <a href="./Stop/DeleteStop.jsp">Delete</a>
        <a href="./Stop/DisplayStop.jsp">Display</a>
        </div>
    </li>

    <li><a href="#"
        onmouseover="mopen('m6')"
        onmouseout="mclosetime()">Guard</a>
        <div id="m6"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="./Guard/AddGuard.jsp">Add</a>
        <a href="./Guard/UpdateGuard.jsp">Update</a>
        <a href="./Guard/DeleteGuard.jsp">Delete</a>
        <a href="./Guard/DisplayGuard.jsp">Display</a>
        </div>
    </li>


        <li><a href="#"
        onmouseover="mopen('m7')"
        onmouseout="mclosetime()">Feedback</a>
        <div id="m7"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="./Feedback/cabfeedback.jsp">Cab</a>
        <a href="./Feedback/driverfeedback.jsp">Driver</a>
        <a href="./Feedback/empfeedback.jsp">Employee</a>
        </div>
    </li>

    <li><a href="#"
        onmouseover="mopen('m8')"
        onmouseout="mclosetime()">Back Up</a>
        <div id="m8"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="#">Send SMS</a>
        <a href="#">Take BackUp</a>
        </div>
    </li>

</ul></div>
<div style="clear:both"></div>


          <div id="left">

                      Get The Links...!
        <pre>
     <a href="./FinalAllocation.jsp"> Final Allocation </a>

     <a href="./HandleBreakdowns.jsp" > Handle Cab Breakdown </a>

     <a href="./Reports/Reports..html"> View Reports </a>

     <a href="./Delays.jsp" > Delay Status </a>




        </pre>
                      <hr/><pre>


Notifications

                      </pre>

          </div>


          <div id="middle">
              <form method="post" action="AssignNewCabToDb.jsp">
                  <pre>

<%

            String route_id = null;
            String driver_license_no = null;
            String driver_id = null;
            String driver_shift = null;

            int a;
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            Timestamp time_current;
            ResultSet rst=null;
            Statement stmt=null;
            String sql = null;
            System.out.print("---------------------------------------------------");
            //con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");

            String cab_id = request.getParameter("cabid");
            session.setAttribute("old_cab_id", cab_id);

            %>

        Cab Id 	             	<input  name="old_cabid" disabled="true" value="<%=cab_id%>">


        <%
        //sql = "select time_current from CurrentCabProgress where cab_id='"+cab_id+"'";
        sql = "select * from CurrentCabProgress where cab_id='"+cab_id+"'";
        rst = stmt.executeQuery(sql);
        while(rst.next())
            {
            time_current = rst.getTimestamp(1);
            driver_license_no = rst.getString(3);
            route_id= rst.getString(4);
            }
        sql = "select driver_shift from DriverMaster where driver_license_no = '"+driver_license_no+"'";
        rst = stmt.executeQuery(sql);
        rst.next();
        driver_shift = rst.getString(1);

        sql = "select * from Execution where cab_id = '"+cab_id+"'&& date(alloc_time) = current_date and route_id= '"+route_id+"'";
        rst = stmt.executeQuery(sql);
        rst.next();
        driver_license_no = rst.getString(3);
        route_id = rst.getString(2);
        rst.getString(4);

        /*sql = "select * from Execution where cab_id = '"+cab_id+"' && allo_date = current_date" ;
        rst = stmt.executeQuery(sql);
        while(rst.next())
            {
            driver_license_no = rst.getString(3);
            route_id = rst.getString(2);
            rst.getString(4);
            }
 * */
        session.setAttribute("route_id", route_id);
        session.setAttribute("old_driver_id", driver_license_no);
        %>
        Route Id	        <input type="text" name="route_id" disabled="true" value="<%=route_id%>">


        Driver License No       <input type="text" name="old_driverid" disabled="true" value="<%=driver_license_no%>">

<hr>

                        Assign Back Up Cab


            <%
            cab_id = null;

            //int a1;

            System.out.print("---------------------------------------------------");
            //con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            System.out.print("Connected Successfully..!");
            //sql="select distinct cab_id from CabMaster where available_status = 1";

            //sql = "select distinct CabMaster.cab_id from CabMaster,Execution where date(alloc_time)=current_date and available_status=1 and execution_status = 1 and CabMaster.cab_id=Execution.cab_id;";
            sql = "select distinct cab_id from CabMaster where available_status = 1 and cab_id not in (select cab_id from Execution where date(alloc_time) = current_date and execution_status = 0)";
            rst = stmt.executeQuery(sql);

            if(rst.next())
            {
                cab_id = rst.getString(1);
                rst.previous();
            }
            if(cab_id == null)
                out.println("cab not available");

            else
           {
                %>
        Cab Id 	             	<select name="new_cabid" >

                 <%
                    while(rst.next())
                {
                    cab_id = rst.getString(1);
                    %>
                    <option ><%=cab_id%></option>
                    <%
                }

            }
            %>

            	</select>
            <%

            sql = "select driver_license_no from DriverMaster where driver_shift='"+driver_shift+"' and driver_license_no !='"+driver_license_no+"' and driver_license_no not in ( select driver_license_no from Execution where date(alloc_time) = current_date and execution_status=0)";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                {
                    driver_id = rst.getString(1);
                    rst.previous();
                }
            if(driver_id == null)
            {
                System.out.println("driver = "+driver_id);
                out.println("Driver not available");

                %>

        Driver not available
                <%
             }
             else
            {
%>

        Driver Id 	        <select     Driver Id 	  name="new_driverid" >

            <%

                //sql= "select driver_license_no from DriverMaster where driver_license_no not in ( select driver_license_no from Execution where date(alloc_time) = current_date )";

                while(rst.next())
                {
                    driver_id = rst.getString(1);
                    //System.out.println("Cab_Id is "+cab_id);
                    %>
                    <option ><%=driver_id%></option>
                    <%
                }
            }
%>
					</select>
                                        </pre>
                                        <input type="submit" value="Allocate"/> <input type="reset"/>
              </form>
          </div>


          <div id="right">

             <h3>Status</h3>

              <pre>
Cab Details

Allotted Cab        :   100
Spare Cab           :   15
Cabs Send For
Servicing           :   5</pre>
                    <hr/>
                   <pre>
Driver Details

Total Drivers        :   125
Allotted Drivers     :   100
Available Drivers    :   10</pre>
                    <hr/>
                   <pre>
Employee Details
Total Employees      :   400
Employees Picked-Up  :   25</pre>
                    <hr/>
          </div>

          <div id="footer">
            Thanks for using our Application...!
          </div>

</div>
      </body>
</html>
