
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


          <div id="left">

                      Get The Links...!
        <pre>
     <a href="../FinalAllocation.jsp"> Final Allocation </a>

     <a href="../HandleBreakdowns.jsp" > Handle Cab Breakdown </a>

     <a href="../Reports/Reports..html"> View Reports </a>

     <a href="../Delays.jsp" > Delay Status </a>




        </pre>
                      <hr/><pre>


Notifications

                      </pre>

          </div>



          <script type="text/javascript">
        function check_v()
        {
            var regexLetter = /^[a-zA-Z ]{1,50}$/;
            if(!regexLetter.test(document.UpdateRoute.source.value) || document.UpdateRoute.source.value=="")
            {
                alert("Please insert valid source:");
                document.UpdateRoute.source.focus();
                document.UpdateRoute.source="";
                return false;
            }

            var regexLetter = /^[a-zA-Z ]{1,50}$/;
            if(!regexLetter.test(document.UpdateRoute.destination.value) || document.UpdateRoute.destination.value=="")
            {
                alert("Please insert valid destination:");
                document.UpdateRoute.destination.focus();
                document.UpdateRoute.destination="";
                return false;
            }

           if(document.UpdateRoute.distance.value=="" || isNaN(document.UpdateRoute.distance.value))
                {
                    alert("Please insert valid distance.");
                    document.UpdateRoute.distance.focus();
                    document.UpdateRoute.distance="";
                    return false;
                }

           if(document.UpdateRoute.reqd_hour.value=="" || isNaN(document.UpdateRoute.reqd_hour.value|| document.UpdateRoute.reqd_hour.value>23))
                {
                    alert("Please insert valid hour.");
                    document.UpdateRoute.reqd_hour.focus();
                    document.UpdateRoute.reqd_hour="";
                    return false;
                }

           if(document.UpdateRoute.reqd_min.value=="" || isNaN(document.UpdateRoute.reqd_min.value || document.UpdateRoute.reqd_min.value>60))
                {
                    alert("Please insert valid minute.");
                    document.UpdateRoute.reqd_min.focus();
                    document.UpdateRoute.reqd_min="";
                    return false;
                }



           if(document.UpdateRoute.reqd_sec.value=="" || isNaN(document.UpdateRoute.reqd_sec.value || document.UpdateRoute.reqd_sec.value>60))
                {
                    alert("Please insert valid sec.");
                    document.UpdateRoute.reqd_sec.focus();
                    document.UpdateRoute.reqd_sec="";
                    return false;
                }
       }
              </script>




          <div id="middle">

          <form name="UpdateRoute" action="UpdateRouteToDb.jsp" method="POST">

              <jsp:useBean id="Conn" class="common.ConnBean">
            <jsp:useBean id="Route" class="module2.Route">
         <pre>
        Update Route Details...
        <%
        String id = request.getParameter("Route_id");
        System.out.println(id);
        %>
         Selected Route id   <input type="text" name="Route_id" value="<%=id%>" readonly="true"/>
        <%
        String route_id = id;
        String hh = null;
        String min = null;
        String sec = null;
        System.out.println(route_id);
        ConnBean conn = new ConnBean();
        Connection con = conn.connect();
        Statement stmt = null;
        String sql = "select * from RouteMaster where route_id = '"+id+"'";
        System.out.println(sql);
        stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery(sql);
        String source=null,destination=null,distance=null,time=null;
        while(rst.next())
            {
                  route_id = rst.getString(1);
                  source = rst.getString(2);
                  destination = rst.getString(3);
                  time = rst.getString(4);
                  distance = rst.getString(5);

            }
        String sql1 = "select hour(required_time) from RouteMaster where route_id = '"+id+"'";
        stmt = con.createStatement();
        ResultSet rst1 = stmt.executeQuery(sql1);
        rst1.next();
        hh=rst1.getString(1);

        String sql2 = "select minute(required_time) from RouteMaster where route_id = '"+id+"'";
        stmt = con.createStatement();
        ResultSet rst2 = stmt.executeQuery(sql2);
        rst2.next();
        min=rst2.getString(1);

        String sql3 = "select second(required_time) from RouteMaster where route_id = '"+id+"'";
        stmt = con.createStatement();
        ResultSet rst3 = stmt.executeQuery(sql3);
        rst3.next();
        sec=rst3.getString(1);
        //Stop.Display(stop_name);
        %>
         <%--     Route Id     :    <input type="text" name="route_id"  value="<%= route_id%>"/>--%>

              Source       :   	<input type="text" name="source" value="<%= source%>" size="20" onblur="checksource()"/>

              Destination  :   	<input type="text" name="destination" value="<%= destination%>" size="20" onblur="checkdestination()"/>

              Select Stops :
              <%

              String sql4 = "select * from StopMaster order by reqd_time";
              ResultSet rst4 = stmt.executeQuery(sql4);
              while(rst4.next())
              {
                %>
                      <input type="checkbox" name="cb" value="<%=rst4.getString(1)%>"/>   <%=rst4.getString(2)%>
                      <%
              }
              %>

              Distance  :   <input type="text" name="distance" size="3" value="<%= distance%>" onblur="checkdistance()"/>

              Required Time: <input type="text" name="reqd_hour" size="2" value="<%= hh%>" maxlength="2" onblur="checkhh()"/> hour   <input type="text" name="reqd_min" size="2" value="<%= min%>" maxlength="2" onblur="checkmm()"/> min <input type="text" name="reqd_sec" size="2" value="<%= sec%>" maxlength="2" onblur="checkss()"/> sec


            </jsp:useBean>
        </jsp:useBean>

          <input type="submit" value="Enter" name="submit" onclick=" return check_v() "/>         <input type="reset" value="Reset" name="reset"  />
        </pre>
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

