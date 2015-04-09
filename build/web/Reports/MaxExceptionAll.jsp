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
     <a href="FinalAllocation.jsp"> Final Allocation </a>

     <a href="HandleBreakdowns.jsp" > Handle Cab Breakdown </a>

     <a href="../Reports/Reports..html"> View Reports </a>

     <a href="Delays.jsp" > Delay Status </a>





        </pre>
                      <hr/><pre>


Notifications

                      </pre>

          </div>


          <div id="middle">

  <head>
    <title></title>

  </head>

	<form action="cabException.jsp" method="post">

<h3>
		<u>All Exceptions</u>

 </h3>

<br><br>
From Date:    <select name="Day">

			<option>1</option>
			<option>2</option>
		 	<option>3</option>
			<option>4</option>

			<option>5</option>
			<option>6</option>
		 	<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>

		 	<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
		 	<option>15</option>
			<option>16</option>

			<option>17</option>
			<option>18</option>
		 	<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>

		 	<option>23</option>
			<option>24</option>
			<option>25</option>
			<option>26</option>
		 	<option>27</option>
			<option>28</option>

			<option>29</option>
			<option>30</option>
                        <option>31</option>/</select><select name="month">
                        <option >01</option>
                        <option >02</option>
			<option >03</option>
			<option >04</option>
			<option >05</option>
		 	<option >06</option>
			<option >07</option>
			<option >08</option>
			<option >09</option>
		 	<option >10</option>
			<option >11</option>
                        <option >12</option></select>/<select name="year">
                        <option>2013</option>
                        <option>2012</option>
                        <option>2011</option>
			<option>2010</option>
			<option>2009</option>
			<option>2008</option>
			<option>2007</option>
		 	<option>2006</option>
			<option>2005</option>
			<option>2004</option>
			<option>2003</option></select>
		<br><br>To Date:    <select name="ToDay">

			<option>1</option>
			<option>2</option>
		 	<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
		 	<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
		 	<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
		 	<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
		 	<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
		 	<option>23</option>
			<option>24</option>
			<option>25</option>
			<option>26</option>
		 	<option>27</option>
			<option>28</option>
			<option>29</option>
			<option>30</option>
		 	<option>31</option>


                </select>/<select name="Tomonth">
                        <option >01</option>
                        <option >02</option>
			<option >03</option>
			<option >04</option>
			<option >05</option>
		 	<option >06</option>
			<option >07</option>
			<option >08</option>
			<option >09</option>
		 	<option >10</option>
			<option >11</option>
                        <option >12</option></select>/<select name="Toyear">
                        <option>2013</option>
                        <option>2012</option>
                        <option>2011</option>
			<option>2010</option>
			<option>2009</option>
			<option>2008</option>
			<option>2007</option>
		 	<option>2006</option>
			<option>2005</option>
			<option>2004</option>
			<option>2003</option></select><br><br>
                        

			

             <input type="submit" value="Search"  />
	     <input type="button" value="reset"  />
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

