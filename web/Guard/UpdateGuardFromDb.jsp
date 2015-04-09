
<%@page import="common.ConnBean"%>
 <%@page import="java.sql.*"%>
          <%@page import="java.util.Date" %>
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
    <link rel="stylesheet" href="../CSS/AdminHome.css" type="text/css" charset="utf-8" />
  </head>
  <body>

      <div id="outer">
<jsp:useBean id="Conn" class="common.ConnBean">
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
            if(!regexLetter.test(document.UpdateGuard.guard_name1.value) || document.UpdateGuard.guard_name1.value=="")
            {
                alert("Please insert valid guard name:");
                document.UpdateGuard.guard_name1.focus();
                return false;
            }

           if(document.UpdateGuard.guard_contact_no.value=="" || isNaN(document.UpdateGuard.guard_contact_no.value))
                {
                    alert("Please insert valid contact no.");
                    document.UpdateGuard.guard_contact_no.focus();
                    return false;
                }

            if(document.UpdateGuard.guard_address.value=="")
                {
                    alert("Please insert guard address");
                    document.UpdateGuard.guard_address.focus();
                    return false;
                }
       }
              </script>





          <div id="middle">
              <form name="UpdateGuard" action="UpdateGuardToDb.jsp" method="POST">
          <pre>

        Update Guard Details...
<%
        String name = request.getParameter("Guard_name");
        System.out.println(name);
        %>
Selected Guard Name    <input type="text" name="guard_name" value="<%=request.getParameter("Guard_name")%>" />
      <jsp:useBean id="Guard" class="module2.Guard" scope="request">
            <jsp:setProperty name="Guard" property="*"/>

        <%
        String Guard_name = name;
        System.out.println(Guard_name);
        ConnBean conn = new ConnBean();
        Connection con = conn.connect();
        Statement stmt = null;
        String sql = "select guard_id from GuardMaster where guard_name = '"+Guard_name+"'";
        System.out.println(sql);
        stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery(sql);
        while(rst.next())
            {
            Guard_name = rst.getString(1);
            }

        Guard.Display(Guard_name);
        String shift=Guard.getGuard_shift();
        %>
        Guard Name           <input type="text" name="guard_name1" value="<%=Guard.getGuard_name()%>" onblur="checkname()"/>

        Guard Address        <textarea name ="guard_address" cols="20" rows="4" onblur="checkadd()"> <%=Guard.getGuard_address()%></textarea>

        Guard Contact Number <input type="text" name="guard_contact_no" value="<%=Guard.getGuard_contact_no()%>" onblur="checkno()" maxlength="10"/>

        Shift     :         <% if(shift=="M") %>
                 <input type="radio" name="shift" value="Morning" checked="checked" />  Morning
                            <% if(shift=="E")   %>
                 <input type="radio" name="shift" value="Evening" checked="checked"/> Evening
                            <% if(shift=="N")   %>
                 <input type="radio" name="shift" value="Night" checked="checked"/>  Night
             </jsp:useBean>
        </jsp:useBean>

          <input type="submit" value="Enter" name="submit" onclick="return check_v()"/>         <input type="reset" value="Reset" name="reset"  />
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