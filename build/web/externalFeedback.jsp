<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.ConnBean"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <title></title>
    </head>
    <body bgcolor="#BFB28D">
        <script type="text/javascript">
         function message()
        {

            if(document.feedback.desc.value=="" && document.feedback.location.value=="")
                {
                        alert("Please Fill All Fields");
                        document.feedback.desc.focus();
                        return (false);
                }
            if(document.feedback.desc.value=="")
                {
                        alert("Please Enter Description  Field");
                        document.feedback.desc.focus();
                        return (false);
                }
                
            if(document.feedback.location.value=="")
                {
                        alert("Please Enter Location also");
                        document.feedback.location.focus();
                        return (false);
                }
            if(document.feedback.cabid.value=="cab_id")
                {
                        alert("Please Select Cab Id");
                        document.feedback.cabid.focus();
                        return (false);
                }
                return true;
        }
       </script>
      <form name="feedback" action="externalFeedbackToAdmin.jsp" method="POST" onsubmit="return message()">

        <h1>Enter Feedback</h1>


        <!-- <input type="radio" name="usertype" value="Driver" />  Driver-->

	<!-- <input type="radio" name="usertype" value="Thirdparty" />  Third Party-->

	<!-- User Id         :  <input type="text" name="user_id"/>-->
	<pre>
        <%
       /* Date d1 = new Date();
        int day = d1.getDay();
        int month = d1.getMonth();
        int year = d1.getYear() + 1900;*/
        String s="select CURDATE()";
        ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();

        ResultSet rs=stmt.executeQuery(s);
        String d = null;
        while(rs.next())
            d=rs.getString(1);

        %>
	Today's Date   :	<%=d%>

        <%
          String cab_id = null;
          /*
          ConnBean con = new ConnBean();
          Connection conn = con.connect();
          Statement stmt = conn.createStatement();*/
          String sql= "select cab_id from CabMaster";
          ResultSet rst = stmt.executeQuery(sql);
          %>

          Select Cab Id  	<select name="cabid" >
                                <option value="cab_id">select....</option>
          <%
              while(rst.next())
              {
                  cab_id = rst.getString(1);
           

          %>
	
              <option ><%=cab_id%></option>
              <%
               }
               %>
               </select>        

		<%--Time <input type="text" name="time">--%>

        <%--Date     <input type="text" name="date">--%>

        Location <input type="text" name="location">
        Description

		<textarea rows="4" cols="25" name="desc"></textarea>


        <input type="submit" value="Enter" name="submit" />         <input type="reset" value="Reset" name="reset"  />
          </pre>

        </form>
   </body>

</html>
