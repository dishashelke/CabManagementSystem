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

              <form name="feedback" action="actionFeedback.jsp" method="Post" onsubmit="return message()" >
              <h3>Feedback Of Employee</h3>

          <%
          //  String cab_id = request.getParameter("cab_id");
            String route_id = null;
            String feedback_about = null;
            String description = null;
            String feedback_time = null;
            String emp_id = null;
            int a;
            ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            Timestamp time_current;
            ResultSet rst=null;
            ResultSet rst1=null;
            ResultSet rst2=null;
            Statement stmt2=null;
            Statement stmt=null;
            Statement stmt1=null;
            System.out.print("---------------------------------------------------");
            //con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
            stmt=con.createStatement();
            stmt2=con.createStatement();
            stmt1=con.createStatement();
            System.out.print("Connected Successfully..!");
            String sql2 = "select feedback_about,description,feedback_time from Feedback where action_taken = ''";
            rst = stmt.executeQuery(sql2);
            if(!rst.next())
                    {
                        out.println("No Feedback About Any Employees............");

                    }
            else
            {

            %>
            <script type="text/javascript">
               function message()
               {

                   var flag="0";
                   for(i=0;i<document.feedback.user.length;i++)
                   {
                        if (document.feedback.user[i].checked==true)
                        {
                            flag="1";
                            break;
                            alert("Please Select Cab Id");
                            document.feedback.user[i].focus();
                            return false;
                        }

                   }
                   if(flag=="0")
                   {
                         alert("Please Select Employee Id");
                         return false;
                   }

                   if(document.feedback.takeaction.value=="")
                    {
                        alert("Please Fill Action Field");
                        document.feedback.takeaction.focus();
                        return false;
                    }

                    return true;
               }
              </script>
                <table border="1">
                                    <tr>
                                     <th></th>
                                    <th>Employee ID</th>
                                    <th>Description</th>
                                    <th>Feedback Date</th>
                                    </tr>
            <%
            String sql1 = "select feedback_about,description,feedback_time from Feedback where action_taken = ''";
            rst2= stmt2.executeQuery(sql1);
            while(rst2.next())
            {
                feedback_about = rst2.getString(1);
                description = rst2.getString(2);
                feedback_time = rst2.getString(3);
                String sql="select emp_id from EmployeeMaster";
                rst1 = stmt1.executeQuery(sql);
                while(rst1.next())
                {
                     emp_id = rst1.getString(1);
                     if(emp_id.equalsIgnoreCase(feedback_about))
                          {
                          %>

                                    <tr>
                                        <td><input type="radio" name="user" value="<%=emp_id%>,<%=description%>" id="d1"></td>
                                        <td><%=emp_id%></td>

                                    <td><%=description%></td>
                                    <td><%=feedback_time%></td>
                                    </tr>

                                    <%--Cab Id    :  <input type="text" name="cabid" value="<%=cab_id%>" readonly="true">

                                    Description :<input type="text" name="desc" value="<%=description%>" readonly="true">

                                Feedback Date:<input type="text" name="feedback_time" value="<%=feedback_time%>" readonly="true">--%>
                                <%
                          }
                }
            }
            %> </table><br><br>
                    Take Action  :
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <textarea rows="4" cols="25" name="takeaction"></textarea><br><br><br>
                                <center><input type="submit" value="Take Action" ></center>
                                <%
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

