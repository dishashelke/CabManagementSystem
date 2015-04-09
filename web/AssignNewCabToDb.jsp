<!--maintainace -->


<%@page import="java.sql.*"%>
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
        <a href="../Employee/DispEmp.jsp">Display</a>


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
              <pre>
              <%
              String new_cab_id = request.getParameter("new_cabid");
              String new_driver_id = request.getParameter("new_driverid");
              String old_cab_id = (String)session.getAttribute("old_cab_id");
              String old_driver_id = (String)session.getAttribute("old_driver_id");
              int emp_count ;
              String route_id = (String)session.getAttribute("route_id");

System.out.println(" old CAb id is="+old_cab_id+"new cab='"+new_cab_id+"old driver"+old_driver_id+"new diver ="+new_driver_id+"route id ="+route_id);

              String guard_id = null;
              String admin_id = null;


                ConnBean conn = new ConnBean();
                Connection con = conn.connect();
                //Timestamp breakdown_time;
                String time=null;
                ResultSet rst=null;
                Statement stmt=null;
                stmt=con.createStatement();
                String sql = null;

                if((new_cab_id == null) || (new_driver_id == null))
                    out.println("Can not allocate");

                else
              {

                //get breakdown_time & emp_count from CurrentCabprogress
                sql = "select time_current,emp_count from CurrentCabProgress where cab_id='"+old_cab_id+"'";
                rst = stmt.executeQuery(sql);
                rst.next();
                //breakdown_time = rst.getTimestamp(1);
                time=rst.getString(1);
                emp_count = rst.getInt(2);

                //get emp_id & guard_id from Execution
                sql = "select count(emp_id),emp_id,guard_id from Execution where date(alloc_time)=current_date and driver_license_no='"+old_driver_id+"' and route_id='"+route_id+"'";
                rst = stmt.executeQuery(sql);
                int i = 0;

                rst.next();

                int count  = rst.getInt(1);
                String[] emp_id = new String[count];
                guard_id = rst.getString(3);

                rst.previous();
                while(rst.next())
                {
                    emp_id[i] = rst.getString(2);
                    i++;
                }

                //update cab status of broken cab
                sql = "update CabMaster set available_status = 0 where cab_id = '"+old_cab_id+"'";
                if(stmt.executeUpdate(sql) != 0)
                {
                    System.out.println("Query Executed Successfully....!(update cab)");
                }

                //insert into breakdown
                sql = "insert into Breakdown values('"+old_cab_id+"','"+old_driver_id+"','"+new_cab_id+"','"+new_driver_id+"','"+time+"',"+emp_count+")";
                if(stmt.executeUpdate(sql) != 0)
                {
                    System.out.println("Query Executed Successfully....!(insert breakdown)");
                }

                //update execution
                sql = "update Execution set execution_status=1,remark='breakdown occured' where cab_id = 'old_cab_id' and date(alloc_time) = current_date and driver_license_no = '"+old_driver_id+"' and route_id = '"+route_id+"'";
                if(stmt.executeUpdate(sql) != 0)
                {
                    System.out.println("Query Executed Successfully....!(update execution)");
                }

                //insert into execution
                for(int j=0 ; j<i ; j++)
                {
                    sql =  "insert into Execution values('"+new_cab_id+"','"+route_id+"','"+new_driver_id+"','"+emp_id[j]+"','"+guard_id+"','"+admin_id+"',current_timestamp,'Assigned for broken cab',0)";
                    if(stmt.executeUpdate(sql) == 0)
                    {
                        out.println("Error while inserting into execution .");
                        break;
                    }
                }
                //send broken cab for maintainance
                sql = "select maintainance_id from Maintainance order by maintainance_id desc limit 1 ";
                String m_id = null;
                String temp = null;
            rst = stmt.executeQuery(sql);
            if(rst.next())
                m_id = rst.getString(1);
            if(m_id == null)
               m_id = "m101";
            else
            {
                    temp = m_id.substring(1);
                    int n = Integer.parseInt(temp);
                    n++;
                    m_id = "m"+n;
            }

            System.out.println("id ="+m_id);
                sql = "insert into Maintainance(maintainance_id,cause,in_date,description,cab_id) values('"+m_id+"','breakdown',current_date,'allocated for broken cab','"+old_cab_id+"')";
                //sql = "insert into Maintainance values('"+m_id+"','breakdown',current_date,'allocated for broken cab','"+old_cab_id+"')";
                int a = stmt.executeUpdate(sql);
                if (a == 1)
                    System.out.println("inserted in maintainance");

              }
                out.println("Executed Sucessfully");

                //update exception
                sql = "update Exception set exception_status = 1,action_taken='New cab assigned' where cab_id='"+old_cab_id+"' and date(exception_time) = current_date";
                stmt.executeUpdate(sql);

                //delete entry of old cab from CurrentCabProgress
                sql = "delete from CurrentCabProgress where cab_id = '"+old_cab_id+"'";
                stmt.executeUpdate(sql);

                //update into CabRoute
                sql = "update CabRoute set cab_id = '"+new_cab_id+"' where cab_id = '"+old_cab_id+"' and route_id = '"+route_id+"'";
                stmt.executeUpdate(sql);
            %>
            </pre>
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
