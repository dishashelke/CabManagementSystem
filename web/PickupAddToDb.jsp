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
    <link rel="stylesheet" href="CSS/AdminHome.css" type="text/css" charset="utf-8" />
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
        <a href="./Employee/DispEmp.jsp">Display</a>


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


      		<form name="FinalExecution" action="PickAlloc.jsp" method="POST">

             <%
              ConnBean con1 = new ConnBean();
              Connection conn = con1.connect();
              Statement stmt = conn.createStatement();
              char s='\0';
              String shift=request.getParameter("shift");
              String cab_id=request.getParameter("cabid");
              String route_id=request.getParameter("route");
              String driver_name=request.getParameter("Drivername");
              String emp_name[]=request.getParameterValues("Employeename");
              System.out.println("Shift="+shift);
              System.out.println("Cab="+cab_id);
              System.out.println("Route id="+route_id);
              System.out.println("driver name="+driver_name);
              String sq="select driver_license_no from DriverMaster where driver_name='"+driver_name+"'";
              ResultSet rst = stmt.executeQuery(sq);
              rst.next();
              String driver_id=rst.getString(1);
              for(int i=0;i<emp_name.length;i++)
                  {
                    System.out.println(" selected Emp are ="+emp_name[i]);
                  }
                  if(shift.equalsIgnoreCase("Morning"))
                      {
                      s='M';
                      }
              else
                  if(shift.equalsIgnoreCase("Evening"))
                      {
                      s='E';
                      }
                  else
                       s='N';
              System.out.println("Final shift is"+s);
              int i=0,a=0;
              while(i<emp_name.length)
                  {
                    System.out.println("Emppppppppppp"+emp_name[i]);
                    i++;
                  }
              if(emp_name.length>4)
              {
                                %>
                                Please select at most four employee's.<br/>
                                <a href="DropAlloc.jsp">BACK..</a>
                                <%
              }
              else
             {
              i=0;
              while(i<emp_name.length)
                  {
                        //System.out.println("Ename="+emp_name[i]);
                        String sql5="select * from EmployeeMaster where emp_name='"+emp_name[i]+"'";
                        //System.out.println(sql5);
                        ResultSet rst1 = stmt.executeQuery(sql5);
                        rst1.next();
                        String emp_id=rst1.getString(1);
                        //System.out.println("Eid="+emp_id);
                        String sql="insert into Execution values('"+cab_id+"','"+route_id+"','"+driver_id+"','"+emp_id+"','"+" "+"','a101',current_timestamp,'','0')";
                       a=stmt.executeUpdate(sql);
                       if(i==0)
                       {
                        String sql1="insert into CabRoute values('"+cab_id+"','"+route_id+"')";
                        a=stmt.executeUpdate(sql1);
                        //String sql2="update CabMaster set available_status= 0 where cab_id='"+cab_id+"'";
                        //a=stmt.executeUpdate(sql2);
                       }
                       i++;
                  }
              }
                  if(a != 0)
                {
                out.println("Cab '"+ cab_id+"' is allocated to route '"+route_id+"' Successfully....!");
                }

                              %>
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
