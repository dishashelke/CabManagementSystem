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
             <%@page import="java.sql.*"%>
             <%@page import="java.util.*"%>
<%@page import="common.ConnBean"%>
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
     <a href="FinalAllocation.jsp"> Final Allocation </a>

     <a href="HandleBreakdowns.jsp" > Handle Cab Breakdown </a>

     <a href="../Reports/Reports..html"> View Reports </a>

     <a href="Delays.jsp" > Delay Status </a>





        </pre>
                      <hr/><pre>


Notifications

                      </pre>

          </div>


          <div id="middle">
                            <form action="allocation.jsp" method="Post">
              <center>
              <%

              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              Statement stmt1 = conn.createStatement();
              Statement stmt2 = conn.createStatement();
              Statement stmt3 = conn.createStatement();
              %>
              <h3>Recent Allocation Of Girls</h3>
                            <br><br><table border="1" ><tr>
			<td>EMP ID</td>
			<td>CAB ID</td>
                        <td>DRIVER ID</td>
			<td>GUARD ID</td>
			<td>ROUTE</td>
                        <td>DATE TIME</td>
                        </tr>
              <%
              int count=1;
              String sql1 = "select * from Execution order by alloc_time desc";
              ResultSet rst1 = stmt1.executeQuery(sql1);

              while(rst1.next() && count<=15)
              {
                 String emp_id1=rst1.getString(4);
                 String sql2 = "select emp_id from EmployeeMaster where emp_id='"+emp_id1+"' && emp_gender='F'";
                 ResultSet rst2 = stmt2.executeQuery(sql2);

                     while(rst2.next())
                         {
                  %>
                  <tr>

                  <td><%=rst2.getString(1)%></td>
                  <td><%=rst1.getString(1)%></td>
                  <td><%=rst1.getString(3)%></td>
                  <td><%=rst1.getString(5)%></td>
                  <td><%=rst1.getString(2)%></td>
                  <td><%=rst1.getString(7)%></td>
                  <%
                  count++;
                  }
              }

                        %>
                        </table>
<br><br>


              <h3>Replacement of Cabs in case of BreakDown</h3>
                            <br><br><table border="1" >
                                <tr>
			<td>CAB ID</td>
			<td>DRIVER ID</td>
                        <td>NEW CAB ID</td>
			<td>NEW DRIVER ID</td>
			<td>DATE</td>
                        <td>SERVICING_DUE_DATE</td>
                        </tr>
              <%
              String sql = "select * from Breakdown order by breakdown_time desc limit 15";
              ResultSet rst = stmt.executeQuery(sql);
              while(rst.next())
                  {

                  String cab_id=rst.getString(1);
                  %>
                  
                  <%

                  String sql3="select servicing_due_date from CabMaster where cab_id='"+cab_id+"'";
                  ResultSet rst3 = stmt3.executeQuery(sql3);
                    rst3.next();

                      String sdate=rst3.getString(1);
                      System.out.println("date = " +sdate);
                      String date=rst.getString(5);
                      System.out.println("Cur date = " +date);
                  //rst1.next();
                  %>
                  <tr>

                  <td><%=cab_id%></td>
                  <td><%=rst.getString(2)%></td>
                  <td><%=rst.getString(3)%></td>
                  <td><%=rst.getString(4)%></td>
                  <td><%=date%></td>
                  <td><%= sdate %></td>
                  </tr>
                   <%
                  // cnt++;
                  }

                  //out.println(cnt);
                        %>
                        </table>
<br><br>

             <input type="Button" value="Print"  />
             <%-- <META HTTP-EQUIV="Refresh" CONTENT="15">--%>
             <input type="submit" value="REFRESH"/>
             <a href="Reports..html"> .....BACK</a>
              </center>
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
