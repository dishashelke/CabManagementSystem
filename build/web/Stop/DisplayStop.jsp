<%--
    Document   : DisplayStop
    Created on : Nov 9, 2010, 5:13:14 PM
    Author     : Jayanta
--%>
<%@page  import="common.ConnBean" %>
<%@page import="module1.Cab" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
<jsp:useBean id="Stop" class="module2.Stop">
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




          

<h2>
                  Stop Details...!
              </h2>
              <%
              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              String sql = "select * from StopMaster";
              ResultSet rst = stmt.executeQuery(sql);
              %>
              <table border="1" align="center">
                        <th>STOP NAME</th>
                        <th>TIME</th>

              <%
              while(rst.next())
              {
                    String stop_id = rst.getString(1);
                    //Time time = rst.getTime(3);
                    String t=rst.getString(3);
                    Stop.Display(stop_id);
                    %>
                            <tr>
                            <td><%=Stop.getStop_name() %></td>
                            <td><%= t %></td>
                        </tr>

                    <%
              }

              %>
              </table>
              </jsp:useBean>
          

 

      <%--    <div id="footer">
            Thanks for using our Application...!
          </div>--%>

</div>
      </body>
</html>
