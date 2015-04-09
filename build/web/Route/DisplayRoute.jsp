
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!--
Fine With Add, Update, Delete, Display
Done with AdminHome.css
Created A folder named Database with FinalDb.txt & insertDB.txt
Trying to structurize the files...
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page  import="common.ConnBean" %>
<%@page import="module1.Cab" %>
<%@page import="java.sql.*" %>


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
    <link rel="stylesheet" href="../CSS/AdminHome.css" type="text/css" charset="utf-8" />
  </head>
  <body>

      <div id="outer">

         <div id="header">


             <img src="../Images/images.jpeg" alt="Cab" height="90"/>
          <table id="table" rows=1 cols=4 border=0 align="right">
              <tr>
                <th><a href="../Search.html" target="_parent">Search | </a></th>
                <th><a href="../CmsHome.html" target="_parent">Log Out</a></th>
              </tr>
               </table>


    <ul id="sddm">
    <li><a href="#"
        onmouseover="mopen('m1')"
        onmouseout="mclosetime()">Cab</a>
        <div id="m1"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
            <a href="../Cab/AddCab.html">Add</a>
        <a href="../Cab/UpdateCab.jsp">Update</a>
        <a href="../Cab/DeleteCab.jsp">Delete</a>
        <a href="../Cab/Servicing.jsp">Servicing</a>
        <a href="../Cab/MaintainanceCab.jsp">Maintainance</a>
        <a href="../Cab/DisplayCab.jsp">Display</a>
        </div>
    </li>
    <li><a href="#"
        onmouseover="mopen('m2')"
        onmouseout="mclosetime()">Driver</a>
        <div id="m2"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="../Driver/AddDriver.html">Add</a>
        <a href="../Driver/UpdateDriver.jsp">Update</a>
        <a href="../Driver/DeleteDriver.jsp">Delete</a>
        <a href="../Driver/DisplayDriver.jsp">Display</a>
        </div>
    </li>
    <li><a href="#"
           onmouseover="mopen('m3')"
           onmouseout="mclosetime()">Employee</a>
    <div id="m3"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="../Employee/AddEmp.jsp">Add</a>
        <a href="../Employee/DispEmp.jsp">Display</a>


        </div>
    </li>

    <li><a href="#"
        onmouseover="mopen('m4')"
        onmouseout="mclosetime()">Route</a>
        <div id="m4"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="../Route/AddRoute.jsp">Add</a>
        <a href="../Route/UpdateRoute.jsp">Update</a>
        <a href="../Route/DeleteRoute.jsp">Delete</a>
        <a href="../Route/DisplayRoute.jsp">Display</a>
        </div>
    </li>

   <li><a href="#"
        onmouseover="mopen('m5')"
        onmouseout="mclosetime()">Stop</a>
        <div id="m5"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
            <a href="../Stop/AddStop.jsp">Add</a>
        <a href="../Stop/UpdateStop.jsp">Update</a>
        <a href="../Stop/DeleteStop.jsp">Delete</a>
        <a href="../Stop/DisplayStop.jsp">Display</a>
        </div>
    </li>

    <li><a href="#"
        onmouseover="mopen('m6')"
        onmouseout="mclosetime()">Guard</a>
        <div id="m6"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="../Guard/AddGuard.jsp">Add</a>
        <a href="../Guard/UpdateGuard.jsp">Update</a>
        <a href="../Guard/DeleteGuard.jsp">Delete</a>
        <a href="../Guard/DisplayGuard.jsp">Display</a>
        </div>
    </li>


        <li><a href="#"
        onmouseover="mopen('m7')"
        onmouseout="mclosetime()">Feedback</a>
        <div id="m7"
            onmouseover="mcancelclosetime()"
            onmouseout="mclosetime()">
        <a href="../Feedback/cabfeedback.jsp">Cab</a>
        <a href="../Feedback/driverfeedback.jsp">Driver</a>
        <a href="../Feedback/empfeedback.jsp">Employee</a>
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

           <jsp:useBean id="Conn" class="common.ConnBean">
           <jsp:useBean id="Route" class="module2.Route" >
    <h2>
                  Route Details...!
              </h2>
              <%
              try
            {
              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              Statement stmt1 = conn.createStatement();
              Statement stmt2= conn.createStatement();
              String sql = "select route_id from RouteMaster";
              ResultSet rst = stmt.executeQuery(sql);
              %>
              <table border="1" align="center">
                        <th> ROUTE ID</th>
                        <th> SOURCE</th>
                        <th> DESTINATION</th>
                        <th> STOPS</th>
                        <th> TIME</th>
                        <th> DISTANCE</th>

              <%
              while(rst.next())
              {
                    String route_id = rst.getString(1);
                    String sql3="select stop_id from RouteStop where route_id='"+route_id+"'";
                    ResultSet rst3=stmt1.executeQuery(sql3);

                    Route.Display(route_id);

                    %>
                            <tr>
                            <td><%=Route.getRoute_id() %></td>
                            <td><%=Route.getSource() %></td>
                            <td><%=Route.getDestination() %></td>
                            <td> <%
                            while(rst3.next())
                                {
                                    String stop_id=rst3.getString(1);
                                    String sql4="select stop_name from StopMaster where stop_id='"+stop_id+"'";

                                    System.out.println("In whileeeeeeeeeeeee");
                                    ResultSet rst4=stmt2.executeQuery(sql4);
                                    System.out.println("In whileeeeeeeeeeeee111");
                                    rst4.next();
                                    System.out.println("In whileeeeeeeeeeeee222");
                            %>
                                <%=rst4.getString(1)%>,
                            <%
                            System.out.println("In whileeeeeeeeeeeee33333");
                                }
                            %>                           </td>
                            <td><%=Route.getReqd_time() %></td>
                            <td><%=Route.getDistance()%></td>
                        </tr>

                    <%
                    System.out.println("Time ="+Route.getReqd_time());
                    System.out.println("Distance ="+Route.getDistance());
              }
              }
              catch(Exception e)
                      {
                  System.out.println("Exception occured......."+e);
                  }

              %>
              </table>
              </jsp:useBean>
          </jsp:useBean>


          


     <%--     <div id="footer">
            Thanks for using our Application...!
          </div>--%>

</div>    </body>
</html>

