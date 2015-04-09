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

                            <form action="GuardAlloc3.jsp" method="Post">
              <center>
              <%

              ConnBean con = new ConnBean();
              Connection conn = con.connect();
              Statement stmt = conn.createStatement();
              Statement stmt1 = conn.createStatement();
              Statement stmt2 = conn.createStatement();
              Statement stmt3 = conn.createStatement();
              Statement stmt4 = conn.createStatement();
              ResultSet rst1,rst2,rst3,rst5,rst4;
              String guard_id;
              String guard_name;
              String cab_id;
              String emp_id;
              String route_id;
              String driver_id;
              String alloc_time;
              %>
              <h3>Recent Allocation Of Guards</h3>
              <td style="width: 800px;">

                 <div style="overflow:auto; width:600px; height: 450px;">

                        <table border="1" >
                        <tr>
                        <td>GUARD ID</td>
			<td>GUARD NAME</td>
                        <td>CAB ID</td>
			<td>EMP ID</td>
			<td>DATE TIME</td>
                        </tr>

                 <%
                      String id[]=request.getParameterValues("user");
                      System.out.println("Length="+id.length);
                      int c=0;
                      //char temp[];
                      String empid[]=new String[id.length];
                      String finaldate[]=new String[id.length];
                      String cur_date="",eid,temp;
                       for(int i=0;i<id.length;i++)
                       {
                           temp=id[i].toString();
                           //System.out.println("Value is="+id[i].toCharArray());
                           eid="";
                           c=0;
                           cur_date="";
                           for(int j=0;j<temp.length();j++)
                           {
                               if(temp.charAt(j)==',')
                                   {
                                   c++;
                                   break;
                                   }
                               else
                                   {
                                eid=eid+temp.charAt(j);
                                c++;
                                    }
                           }

                           for(int j=c;j<temp.length();j++)
                           {
                                cur_date=cur_date+temp.charAt(j);
                           }
                           empid[i]=eid;
                           finaldate[i]=cur_date;
                           //System.out.println("New empid  is="+eid);
                           //System.out.println("New date is="+cur_date);
                           //System.out.println("combine Value is "+temp);
                       }
                      try
                      {
                      for(int i=0;i<id.length;i++)
                          {
                              //System.out.println("New Emp id="+empid[i]);
                              //System.out.println("New date="+finaldate[i]);
                              String sql1 = "select * from Execution  where emp_id='"+empid[i]+"'and alloc_time='"+finaldate[i]+"'";
                              rst1 = stmt1.executeQuery(sql1);
                              //System.out.println(sql1);
                              rst1.next();
                              System.out.println("aaa");
                              guard_id=rst1.getString(5);
                              cab_id=rst1.getString(1);
                              emp_id=rst1.getString(4);
                              route_id=rst1.getString(2);
                              driver_id=rst1.getString(3);
                              alloc_time=rst1.getString(7);
                              String sql2 = "select guard_name from GuardMaster where guard_id='"+guard_id+"'";
                              rst2 = stmt2.executeQuery(sql2);
                              rst2.next();
                              guard_name=rst2.getString(1);
                              System.out.println("bbb");
                              String sql3="select date(breakdown_time),old_driver_license_no from Breakdown where old_cab_id ='"+cab_id+"' order by breakdown_time desc";
                              rst3 = stmt1.executeQuery(sql3);
                              String brk_date=null;
                              String brkdriverid=null;
                              if(rst3.next())
                              {
                              System.out.println("ccc");
                              brk_date=rst3.getString(1);
                              brkdriverid=rst3.getString(2);
                              }
                              System.out.println("Date is :"+brk_date);
                              System.out.println("Driver is :"+brkdriverid);
                              System.out.println("Ghe ata...!");
                              String sql4="select date_sub(servicing_due_date,interval 1 year) from CabMaster where cab_id ='"+cab_id+"' order by servicing_due_date desc";
                              //String sql4="select date_sub(servicing_due_date,interval 1 year) from CabMaster where cab_id ='' order by servicing_due_date desc";
                              rst4 = stmt2.executeQuery(sql4);
                              //System.out.println(rst4);
                              rst4.next();
                              String serv_date=rst4.getString(1);
                              System.out.println("Ghe ata...!!!!!!!!!!!!!");
                              String sql5="select count(old_cab_id) from Breakdown where old_cab_id='"+cab_id+"'";
                              rst5 = stmt2.executeQuery(sql5);
                              rst5.next();
                              System.out.println("eee");
                              String count=rst5.getString(1);
                              try
                              {
                                  if(brk_date!=null && brkdriverid!=null)
                                      {
                              String sql6="insert into GuardLogTable values('"+guard_id+"','"+cab_id+"','"+route_id+"','"+emp_id+"','"+brk_date+"','"+brkdriverid+"','"+serv_date+"','"+count+"')";
                              System.out.println(sql6);
                              int a = stmt.executeUpdate(sql6);
                                       }
                                  }
                              catch(Exception e)
                              {
                                  System.out.println("Exception occured2....."+e);
                                  out.println();
                                  %>
                                  <br/>
                                  <%
                                  out.println("Duplicate Employee Entry:"+emp_id);
                              }
                 %>
                  <tr>
                  <td><%=guard_id%></td>
                  <td><%=guard_name%></td>
                  <td><%=cab_id%></td>
                  <td><%=emp_id%></td>
                  <td><%=alloc_time%></td>
                  </tr>
                  <%
                           }
                           }
                      catch(Exception e1)
                          {
                            System.out.println("Exception Occured1......"+e1+"\n");
                            //e1.printStackTrace();
                          }

                        %>

                        </table>
                 </div>
                        <br><br>
                        <br><br>
              </center>
              </form>






      </div>
          
      </body>
</html>

