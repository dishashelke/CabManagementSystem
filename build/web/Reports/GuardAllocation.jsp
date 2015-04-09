<%@page import="com.sun.java_cup.internal.runtime.Symbol"%>
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



<script LANGUAGE="JavaScript">
<!--

<!-- Begin
function Check(chk)
{
if(document.guardAlloc.Check_ctr.checked==true){
for (i = 0; i < chk.length; i++)
chk[i].checked = true ;
}else{

for (i = 0; i < chk.length; i++)
chk[i].checked = false ;
}
}
function unCheck(ch)
{
            ch.checked=false;
    
}

// End -->
</script>
          <div id="result">                   <form action="GuardAllocation2.jsp" name="guardAlloc" method="Post">
              <center>
              <%

              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              Statement stmt1 = conn.createStatement();
              Statement stmt2 = conn.createStatement();
              Statement stmt3 = conn.createStatement();
              %>
              <h3>Recent Allocation Of Guards</h3>
              <tr></tr>
      <tr></tr>
     <td style="width: 800px;">

 <div style="overflow:auto; width:600px; height: 450px;">

                        <table border="1" ><tr>
                        <td><input type="checkbox" name="Check_ctr" value="yes" onClick="Check(document.guardAlloc.user)"> </td>
			<td>GUARD ID</td>
			<td>GUARD NAME</td>
                        <td>CAB ID</td>
			<td>EMP ID</td>
			<td>DATE TIME</td>
                        </tr>
              <%
              int count=1;
              String sql1 = "select * from Execution order by alloc_time desc";
              ResultSet rst1 = stmt1.executeQuery(sql1);

              while(rst1.next() && count<=20)
              {
                 String guard_id=rst1.getString(5);
                 String sql2 = "select guard_name from GuardMaster where guard_id='"+guard_id+"'";
                 ResultSet rst2 = stmt2.executeQuery(sql2);
                 //System.out.println(sql2);
                 try
                 {
                     while(rst2.next())
                         {
                            //System.out.println("name="+rst2.getString(1));
                  %>
                  <tr>
                      <td><input type="checkbox" name="user" value="<%=rst1.getString(4)%>,<%=rst1.getString(7)%>" onClick="unCheck(document.guardAlloc.Check_ctr)"></td>
                  <td><%=guard_id%></td>
                  <td><%=rst2.getString(1)%></td>
                  <td><%=rst1.getString(1)%></td>
                  <td><%=rst1.getString(4)%></td>
                  <td><%=rst1.getString(7)%></td>
                  </tr>

                  <%
                  count++;
                  }
                  }catch(Exception e)
                          {
                                out.println(e);
                            }
              }

                        %>

                        </table></div>
<br><br>



<br><br>

             <input type="Button" value="Print"  />
             <%-- <META HTTP-EQUIV="Refresh" CONTENT="15">--%>
             <input type="submit" value="SUBMIT"/>
             <a href="Reports..html"> .....BACK</a>
              </center>
              </form>



         </div>
         </div>

      </body>
</html>

