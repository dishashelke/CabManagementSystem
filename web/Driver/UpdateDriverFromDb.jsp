<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
          <%@page import="java.sql.*"%>
          <%@page import="common.ConnBean"%>
          <%@page import="java.util.Date" %>
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


          <div id="middle">
                       <form name="UpdateDriver" action="UpdateDriverToDb.jsp" method="POST">
          <pre>
        Update Driver Details...
        <%
        String name = request.getParameter("Driver_name");
        System.out.println(name);
        %>
         Selected Driver Name   <input type="text" name="Driver_name" value="<%=name%>" />


        <jsp:useBean id="Conn" class="common.ConnBean">
            <jsp:useBean id="Driver" class="module1.Driver">
        <%
       // String cab_id = session.getAttribute("cab_id").toString();
        //String driver_name = request.getParameter("driver_name");
        String driver_name = name;
        System.out.println(driver_name);
        String license_no = null;
        ConnBean conn = new ConnBean();
        Connection con = conn.connect();
        Statement stmt = null;
        String sql = "select driver_license_no from DriverMaster where driver_name = '"+driver_name+"'";
        System.out.println(sql);
        stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery(sql);
        while(rst.next())
            {
            license_no = rst.getString(1);
            }

        Driver.Display(license_no);
        Date jdate = Driver.getDriver_joining_date();
        System.out.println("The Date is..."+jdate);
        int day = jdate.getDay();
        int month = jdate.getMonth()+1;
        int year = jdate.getYear()+1900;
        Driver.setDay(day);
        Driver.setMonth(month);
        Driver.setYear(year);
        char shift=Driver.getDriver_shift();
        String ss=Character.toString(shift);
        System.out.println("Checking Date.. "+day+" "+month+" "+year);
        %>

        License No. <input type="text" name="driver_license_no" value="<%=Driver.getDriver_license_no()%>" size="20"/>

        Address
                    <textarea name ="driver_address" cols="20" rows="3"> <%=Driver.getDriver_address()%></textarea>

                         <%--Purchase Date    <input type="text" name="purchasedate" value="<%=Cab.getPurchase_date()%>"/>--%>

        Contact No   <input type="text" name="driver_contact_no" value="<%=Driver.getDriver_contact_no()%>" size="10"/>

        Shift      <%
            if(ss.equalsIgnoreCase("M"))
            {
        %>
                               <input type="radio" name="shift" value="Morning" checked="checked" />  Morning
        <%
           }
            else
            {
         %>
                               <input type="radio" name="shift" value="Morning"  />  Morning
         <%
            }
            if(ss.equalsIgnoreCase("E"))
            {
         %>
                               <input type="radio" name="shift" value="Evening" checked="checked"/> Evening
        <%
           }
            else
            {
         %>
                               <input type="radio" name="shift" value="Evening"/> Evening
         <%
            }
            if(ss.equalsIgnoreCase("N"))
            {
         %>
                               <input type="radio" name="shift" value="Night" checked="checked" />  Night
        <%
           }
            else
           {
         %>
                               <input type="radio" name="shift" value="Night" />  Night
         <%
           }
         %>
        Legal Info
                     <textarea name="legal_info" rows="4" cols="20">
                        <%=Driver.getLegal_info()%>
                        </textarea>

        Joining Date    <input type="text" name="day" value="<%=Driver.getDay()%>" size="2" />   DD   <input type="text" name="month" value="<%=Driver.getMonth()%>" size="2" />  MM    <input type="text" name="year" value="<%=Driver.getYear()%>" size="4" /> YYYY

        Password     <input type="password" name="driver_password" value="<%=Driver.getDriver_password()%>"/>
        <%--<%

        Cab.setDesc(request.getParameter("desc"));
        Cab.updateCabFromDb(cab_id);

%>--%>

            </jsp:useBean>
        </jsp:useBean>

          <input type="submit" value="Enter" name="submit" />         <input type="reset" value="Reset" name="reset"  />
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

