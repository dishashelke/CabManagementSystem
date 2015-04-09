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
<script type="text/javascript">
function load()
{

    //alert("ok");
   // doucument.FinalExecution.submit();
    document.forms["FinalExecution"].submit();


/*
for(var i=0; i < document.FinalExecution.shift.length; i++)
{

if(document.FinalExecution.shift[i].checked)
var val=document.FinalExecution.shift[i].value
}
System.out.println("Value ="+val);
*/
}

function routeload()
{
    document.forms["FinalExecution"].submit();
}



        function check_v()
        {

           if(document.Drop.cabid.value=="select" )
                {
                    alert("Please select cab.");
                    document.Drop.cabid.focus();
                    return false;
                }

           if(document.Drop.Drivername.value=="select" )
                {
                    alert("Please select driver.");
                    document.Drop.Drivername.focus();
                    return false;
                }

           if(document.Drop.Employeename.value=="select" )
                {
                    alert("Please select employee.");
                    document.Drop.Employeename.focus();
                    return false;
                }
       }

</script>
<%
    String shift=null;
    char s='\0';
    String mor="Morning";
    String eve="Evening";
    String nig="Night";
    String Radio=request.getParameter("shift");
    if(Radio!=null)
    {
        System.out.println("Value="+Radio.toString());
        shift=Radio.toString();
        if(shift.equalsIgnoreCase(mor))
            s='M';
        else
            if(shift.equalsIgnoreCase(eve))
                s='E';
            else
                s='N';
    }

            String rid=request.getParameter("route");
            System.out.println("Route id="+rid);
              System.out.println("Shiftttt"+s);
              ConnBean con1 = new ConnBean();
              Connection conn = con1.connect();
              Statement stmt = conn.createStatement();
              Statement stmt1 = conn.createStatement();
              Statement stmt2 = conn.createStatement();


%>


          <div id="middle">
              <form action="DropoffAddToDb.jsp" method="post" name="Drop">
                  <pre>
              <%
              String newshift=request.getParameter("shift");
              String newrid=request.getParameter("route");
              System.out.println("New shift"+newshift);
              System.out.println("New route id"+newrid);

                //String sql2 = "select cab_id from CabMaster where available_status=1";
                String sql2 = "select cab_id from CabMaster where available_status = 1 and cab_id not in(select cab_id from Execution where date(alloc_time)= current_date and execution_status=0)";
                ResultSet rst2 = stmt.executeQuery(sql2);
              %>

                Selected Shift     <input type="text" value="<%=newshift%>" readonly="true" name="shift">

                Selected route id  <input type="text" value="<%=newrid%>" readonly="true" name="route">

		Select Cab
      		           <select name="cabid">
                               <option value="select">SELECT</option>
               <%
                while(rst2.next())
                {
                %>
                <option ><%=rst2.getString(1)%></option>
                <%
            }
                %>
		             </select>

		Select Driver
			      <select name="Drivername">
                                         <option value="select">SELECT</option>
                                     <%
                  String sql0 = "select * from DriverMaster where driver_license_no not in (select driver_license_no from Execution where date(alloc_time) = current_date) and driver_shift='"+s+"'";
              ResultSet rst0 = stmt.executeQuery(sql0);
                while(rst0.next())
                {
                %>
                <option ><%=rst0.getString(2)%></option>
                <%
                }
            %>
					</select>

		Select Employees
                                 <select name="Employeename" multiple="multiple" size="4">
                                            <option value="select">SELECT</option>
				<%
              String sql3="select * from RouteStop where route_id='"+rid+"'";
              ResultSet rst3 = stmt2.executeQuery(sql3);
              String sql = "select * from EmployeeMaster where emp_id not in (select emp_id from Execution where date(alloc_time) = current_date) and emp_shift='"+s+"'";
              ResultSet rst = stmt1.executeQuery(sql);
               while(rst.next())
                {
                    //System.out.println("Employee is1111:"+rst.getString(2));
                    String sql4="select * from EmployeeStop where emp_id='"+rst.getString(1)+"'";
                    System.out.println(sql4);
                    ResultSet rst4 = stmt.executeQuery(sql4);
                    rst4.next();
                    System.out.println("Drop off stop is:"+rst4.getString(3));
                    while(rst3.next())
                        {
                            System.out.println("Stop is:"+rst3.getString(2));
                           // System.out.println("aaaaaaaaaaaaaa");
                            //System.out.println("Pick up stop is:"+rst4.getString(1));
                            //System.out.println("aaaaaaaaaaaaaabbbbbbbbbbbbbb");
                            String stop_id=rst3.getString(2);
                            String dropoff_stop_id=rst4.getString(3);
                           // System.out.println("stop2="+stop_id);
                            //System.out.println("pick id"+pickup_stop_id);
                            if(stop_id.equalsIgnoreCase(dropoff_stop_id))
                            {
                                System.out.println("Final emp is:"+rst.getString(2));
                                %>
                                      <option ><%=rst.getString(2)%></option>
                                <%
                             }
                         }
                         rst3.first();
                         rst3.previous();
                 }
            %>
                                    	</select>

                Select Guard
                                 <select name="Guardname">
                                            <option>SELECT</option>
				<%
              String sql5 = "select * from GuardMaster where guard_id not in (select guard_id from Execution where date(alloc_time) = current_date) and guard_shift='"+s+"'";
              ResultSet rst5 = stmt.executeQuery(sql5);
                while(rst5.next())
                {
                %>
                <option ><%=rst5.getString(2)%></option>
                <%
            }
            %>
                                    	</select>

          </pre>
                           <input type="submit" value="Accept" onclick="return check_v()"/>
                           <input type="reset" value="Clear" />
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
