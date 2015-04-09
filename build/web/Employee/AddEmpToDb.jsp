<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page  import="common.ConnBean" %>
<%@page import="module1.Cab" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>

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

     <a href="../Delays.jsp" > Delay Status </a>        </pre>
                      <hr/><pre>


Notifications

                      </pre>

          </div>


          <div id="middle">

               <jsp:useBean id="Employee" class="module2.Employee" scope="request">
               <jsp:setProperty name="Employee" property="*"/>

              <center>
              <%

              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              ResultSet rst = null;
              String sql= null;



              //String emp_id = null;
              String emp_name = null;
              String emp_address =null;
              String emp_contact_no = null;
              String emp_email = null;
              String emp_shift = null;
              String emp_gender = null;
              String emp_password = null;
              String pickup_stop_id = null;
              String dropoff_stop_id = null;

                      String id[]=request.getParameterValues("user");
                      String emp[]=new String[id.length];
                                        
                      try
                      {
                      for(int i=0;i<id.length;i++)
                          {
                          emp[i]=id[i].toString();
                          System.out.println("i = "+emp[i]);

                          sql = "select * from TempEmployee where emp_id = '"+emp[i]+"'";
                          rst = stmt.executeQuery(sql);
                          rst.next();
                          emp_name = rst.getString(2);
                          emp_address = rst.getString(3);
                          emp_contact_no = rst.getString(4);
                          emp_email = rst.getString(5);
                          emp_shift = rst.getString(6);
                          emp_gender = rst.getString(7);
                          emp_password = rst.getString(8);
                          pickup_stop_id = rst.getString(9);
                          dropoff_stop_id = rst.getString(10);
                          //sql = "insert into EmployeeMaster values('"+emp[i]+"','"+emp_name+"','"+emp_address+"','"+emp_contact_no+"')";

                          System.out.println(emp_name+"  "+emp_address);
                          //if(Employee.AddEmployeeToDb(/*g,s,p,*/emp_shift,emp_gender))

                           String eid = null;//emp_id
            String temp = null;

            sql = "select emp_id from EmployeeMaster order by emp_id desc limit 1 ";
            rst = stmt.executeQuery(sql);
            if(rst.next())
                eid = rst.getString(1);
            if(id == null)
                {System.out.println("if id="+id);
               eid = "e101";}

            else
            {
                    temp = eid.substring(1);
                    int n = Integer.parseInt(temp);
                    n++;
                    eid = "e"+n;
            }
System.out.println("add emp to db"+eid);

                          sql = "insert into EmployeeMaster values('"+eid+"','"+emp_name+"','"+emp_address+"','"+emp_contact_no+"','"+emp_email+"','"+emp_shift+"','"+emp_gender+"','"+emp_password+"')";
                          System.out.println(sql);
                          int a = stmt.executeUpdate(sql);
                          if(a != 0)
                          {
                                System.out.println("Query Executed Successfully....!");
System.out.println("Emp added Successfully....!"+eid);
                                Employee.DeleteTemp(emp[i]);

                                sql = "insert into EmployeeStop values('"+eid+"','"+pickup_stop_id+"','"+dropoff_stop_id+"')";
                                a = stmt.executeUpdate(sql);

                           %>
                                <br><br> Employee <%=emp_name%> Added To DB Successfully...!
                            <%
                           }
                           else
                                out.println("Can not add  "+emp_name);
                            

                          }
                      }
                      catch(Exception e)
                          {
                          System.out.println(e);
                          }
                        %>

                 


              </center>




               </jsp:useBean>
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