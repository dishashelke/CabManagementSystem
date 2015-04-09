<%--
    Document   : ContactAdminForDelay
    Created on : Feb 1, 2011, 11:41:18 PM
    Author     : Variant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>
<%@page import="module1.Driver"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Adhesive by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="Adhesive" content="" />
<link href="../CSS/CmsHome.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
	<!-- start header -->
	<div id="header">
		<div id="logo">
                    <h1><a href="#"><span>Driver Home</span></a></h1>
		</div>
		<div id="menu">
			<ul id="main">

				<li><a href="../CmsHome.html">Log out</a></li>
			</ul>
		</div>
	</div>
	<!-- end header -->
	<!-- start page -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">


				<!-- end content -->
				<!-- start sidebars -->

                                 <pre>
    <script>
        function validate()
        {
            if(document.delay.second.value=="ss" && document.delay.minute.value=="mm" && document.delay.hour.value=="hh")
            {
                alert("Please select Time");
                document.delay.second.focus();
                return false;
            }
            if(document.delay.hour.value=="hh")
            {
                alert("Please select hour also");
                document.delay.hour.focus();
                return false;
            }
            if(document.delay.minute.value=="mm")
            {
                alert("Please select minute also");
                document.delay.minute.focus();
                return false;
            }
            if(document.delay.second.value=="ss")
            {
                alert("Please select second also");
                document.delay.second.focus();
                return false;
            }

            return true;

        }
    </script>
    <body>

        <form name="delay" action="messageaboutdelay.jsp" method="post" onsubmit="return validate()">
        <pre>
            <h3>Inform Admin About Delay....</h3>

            <%
                    String driver_license_no = session.getAttribute("Driver_license_no").toString();
                    int i = 0;
                    ConnBean con = new ConnBean();
                    Connection conn = con.connect();
                    Statement stmt = conn.createStatement();
                    String sql = "select cab_id,route_id from Execution where Driver_license_no='" + driver_license_no+ "' && (select date(alloc_time)) = CURDATE() && execution_status='0'";
                    ResultSet rst = stmt.executeQuery(sql);
                    if(!rst.next())
                    {
                         out.println("You are not allocated...........");
                    }
                    else
                    {
                    %>

            Enter Delay :    <select name="hour">
                        <option value="hh">hh</option>
                        <option>00</option>
			<option>01</option>
			<option>02</option>
		 	<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
		 	<option>07</option>
			<option>08</option>
			<option>09</option>
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
                        <option>31</option></select>:<select name="minute">
                        <option value="mm">mm</option>
                        <option>00</option>
                        <option>01</option>
                        <option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
		 	<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
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
                        <option>32</option>
			<option>33</option>
                        <option>34</option>
			<option>35</option>
		 	<option>36</option>
			<option>37</option>
			<option>38</option>
			<option>39</option>
		 	<option>40</option>
			<option>41</option>
			<option>42</option>
			<option>43</option>
                        <option>44</option>
			<option>45</option>
		 	<option>46</option>
			<option>47</option>
			<option>48</option>
			<option>49</option>
		 	<option>50</option>
			<option>51</option>
			<option>52</option>
			<option>53</option>
                        <option>54</option>
			<option>55</option>
		 	<option>56</option>
			<option>57</option>
			<option>58</option>
			<option>59</option>
		 	<option>60</option>
			</select>:<select name="second">
                        <option value="ss">ss</option>
                        <option>00</option>
			<option>01</option>
                        <option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
		 	<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
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
                        <option>32</option>
			<option>33</option>
                        <option>34</option>
			<option>35</option>
		 	<option>36</option>
			<option>37</option>
			<option>38</option>
			<option>39</option>
		 	<option>40</option>
			<option>41</option>
			<option>42</option>
			<option>43</option>
                        <option>44</option>
			<option>45</option>
		 	<option>46</option>
			<option>47</option>
			<option>48</option>
			<option>49</option>
		 	<option>50</option>
			<option>51</option>
			<option>52</option>
			<option>53</option>
                        <option>54</option>
			<option>55</option>
		 	<option>56</option>
			<option>57</option>
			<option>58</option>
			<option>59</option>
		 	<option>60</option></select>
		<br><br>

            <input type="submit" value="Send Message">
            <%
            }
            %>
        </pre>
        </form>

     </pre>
    				<!-- end sidebars -->
				<div style="clear: both;">&nbsp;</div>
			</div>
			<!-- end page -->
		</div>
	</div>
</div>
<div id="footer-wrapper">
	<div id="footer">
		<p class="copyright">&copy;&nbsp;&nbsp;2010 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.freecsstemplates.org/">ISSC UoP</a>.</p>
	</div>
</div>
</body>
</html>
