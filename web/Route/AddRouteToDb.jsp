
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

        <jsp:useBean id="Route" class="module2.Route" scope="request">
                  <jsp:setProperty name="Route" property="*"/>
              <%

              String finalrid1=null,finalrid2=null;
              try
              {



                    String source=request.getParameter("source");
                    String destition=request.getParameter("destition");
                    String distance=request.getParameter("distance");
                    ConnBean con = new ConnBean();
                    Connection conn = con.connect();
                    Statement stmt = conn.createStatement();
                    Statement stmt1 = conn.createStatement();
                    int i =0 ,n=0;
              


                    String sql0 = "select route_id from RouteMaster order by route_id desc limit 1";
                        System.out.println(sql0);
                        ResultSet rst0 = stmt.executeQuery(sql0);
                        //rst.next();
                        if(!rst0.next())
                            {
                                System.out.println("In IFFFFFFFFFFFFFF");
                               finalrid1="r101";
                            }
                        else
                        {
                            System.out.println("In Elseeeeeeeeeeeeeeeee");
                                String rid0=rst0.getString(1);
                                int newrid=0;
                                 String temp=rid0.toString();
                                   //System.out.println("Value is="+id[i].toCharArray());
                                   String rid1="";

                                   for(int j=0;j<temp.length();j++)
                                   {
                                       if(j==0)
                                           {

                                            }
                                       else
                                           {
                                        rid1=rid1+temp.charAt(j);
                                           }
                                   }
                                   System.out.println("Route id="+rid1);
                                   newrid=Integer.parseInt(rid1);
                                   newrid++;
                                   String r1=String.valueOf(newrid);

                                   String tr="r";
                                   finalrid1=tr.concat(r1);
                           }
                        System.out.println("Final route id1="+finalrid1);





                    int newrid=0;
                    String temp=finalrid1.toString();
                           String rid1="";
                           
                           for(int j=0;j<temp.length();j++)
                           {
                               if(j==0)
                                   {

                                    }
                               else
                                   {
                                rid1=rid1+temp.charAt(j);
                                   }
                           }
                           System.out.println("Route id="+rid1);
                           newrid=Integer.parseInt(rid1);
                           newrid++;

                           
                           String r1=String.valueOf(newrid);
                           
                           String tr="r";
                           finalrid2=tr.concat(r1);
                    System.out.println("Final route id2="+finalrid2);
                           
                    





                    String sql = "select count(*) from StopMaster";
                    ResultSet rst = stmt.executeQuery(sql);
                    
                    try
                    {
                        String sql1 = "select * from StopMaster order by reqd_time";
                        ResultSet rst1 = stmt1.executeQuery(sql1);
                        rst.next();
                        System.out.println("count is="+rst.getInt(1));
                        String ch[]=request.getParameterValues("cb");
                        int x=ch.length;
                        String stopid[]=new String[ch.length];
                        n=ch.length-1;
                        int i1=0;
                        while(n>=0)
                        {
                                //System.out.println("Selected stop:"+ch[i1]);
                                stopid[i1]=ch[n];
                                n--;
                                i1++;
                        }
                        System.out.println("Length="+x);
                        //System.out.println("Stop Name="+rst1.getString(2));
                        int count=rst.getInt(1);
                        n=0;
                        
                        while(n<ch.length)
                        {
                                System.out.println("Selected stop:"+ch[n]);
                                n++;
                        }
                        int c=0;
                        n=0;
                        String sel_stop,ori_stop;
                        int j1=0;
                        while(i<count && rst1.next() && c<ch.length)
                        {
                            sel_stop=ch[n];
                            ori_stop=rst1.getString(1);
                            System.out.println("Sel Stop Name:"+sel_stop);
                            System.out.println("Ori Stop Name:"+ori_stop);
                            
                            if(sel_stop.equalsIgnoreCase(ori_stop))
                            {
                                System.out.println("In While loooooooooopp");
                                String sql2="insert into RouteStop values('"+ finalrid1 +"','"+ sel_stop +"')";
                                String sql3="insert into RouteStop values('"+ finalrid2 +"','"+ stopid[j1] +"')";
                                stmt.executeUpdate(sql2);
                                stmt.executeUpdate(sql3);
                                System.out.println(sql2);
                                System.out.println(sql3);
                                i++;
                                n++;
                                c++;
                                j1++;
                            }
                            else
                            {
                                i++;
                            }
                        }
                    }
                    catch(Exception e)
                        {
                            System.out.println(e);
                        }
                }
                
              catch(Exception e)
              {
               System.out.println("Exception Occured=....."+e);
              }
                    if(Route.AddRouteToDb(finalrid1))
                    {
                      System.out.println("Route added successfully..........");
                     }

              %>
              Route with source <%=Route.getSource()%> and destination <%=Route.getDestination()%> Added Successfully...!
              <%
              if(Route.AddNewRouteToDb(finalrid2))
                    {
                      System.out.println("Route added successfully..........");
                     }
              %>
          </div>

        </jsp:useBean>

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

