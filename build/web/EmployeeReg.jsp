<%--
    Document   : EmpReg
    Created on : Nov 8, 2010, 2:18:01 PM
    Author     : Sidharam
--%>

<%@page import="java.sql.*"%>
<%@page import="common.ConnBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <title></title>
    </head>
    <body bgcolor="#BFB28D">
        <script type="text/javascript">
        function Msg()
        {
            var id =/^[0-9]$/;
            if((document.EmpRegistration.emp_name.value=="")/*|| (document.EnterCabprogress.running.value==null)*/)
                {
                    alert("enter name");
                    document.EmpRegistration.emp_name.focus();
                    return false;
                }
                /*if(isNaN(document.EnterCabProgress.running.value))
                {
                    alert("Running should be numeric");
                    document.EnterCabprogress.running.focus();
                    return false;
                }*/
                 if(document.EmpRegistration.emp_address.value=="")
                {
                    alert("enter address");
                    document.EmpRegistration.emp_address.focus();
                    return false;
                }
                if(document.EmpRegistration.emp_contact_no.value=="")
                {
                    alert("enter contact no");
                    document.EmpRegistration.emp_contact_no.focus();
                    return false;
                }
                var x = document.EmpRegistration.emp_contact_no.value;
                if(isNaN(x))
                {
                    alert("Enter numeric contact no")
                    return false;
                }
                /*if ((x.charAt(0)!="9") || (x.charAt(0)!="8") || (x.charAt(0)!="7"))
                {
                    alert("contact no should start with 9/8/7");
                    return false
                }*/
                if (x.length > 10)
                {
                    alert("enter max 10 characters in contact no");
                    return false;
                }
                if (x.length < 8)
                {
                    alert("enter min 8 characters in contact no");
                    return false;
                }
                var e=document.forms["EmpRegistration"]["emp_email"].value
                var atpos=e.indexOf("@");
                var dotpos=e.lastIndexOf(".");
                if(e!="")
                 {
                    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=e.length)
                    {
                         alert("Not a valid e-mail address");
                         return false;
                    }
                }
                var p=document.forms["EmpRegistration"]["emp_password"].value
                var p1=document.forms["EmpRegistration"]["emppassword1"].value
                if(document.EmpRegistration.emppassword1.value=="")
                {
                    alert("enter password");
                    document.EmpRegistration.emppassword1.focus();
                    return false;
                }
                if(document.EmpRegistration.emp_password.value=="")
                {
                    alert("rewite password");
                    document.EmpRegistration.emp_password.focus();
                    return false;
                }
                if(p.lenght < 4)
                {
                    alert("short password(min 4 characters)");
                    document.EmpRegistration.emp_password.focus();
                    return false;
                }
                if(p.lenght > 8)
                {
                    alert("long password(max 8 characters)");
                    document.EmpRegistration.emp_password.focus();
                    return false;
                }
                if(p != p1)
                {
                    alert("The Password and verified password does not match");
                    document.EmpRegistration.emp_password.focus();
                    return false;
                }
                return true;
        }
    </script>
              <form name="EmpRegistration" action="AddEmpToTempDb.jsp" method="POST" onsubmit="return Msg()">
    <pre>
          <h4> EMPLOYEE REGISTRATION </h4>

                Employee Name       :  <input type="text" name="emp_name" value=""/>

                Employee Address    :
                                       <textarea rows="4" cols="25" name="emp_address" value=""></textarea>

                Contact No          :  <input type="text" name="emp_contact_no" value=""/>

                Email id            :  <input type="text" name="emp_email" value=""/>

                Gender              :  <input type="radio" name="gender" value="Male" checked="checked" />  Male
                                       <input type="radio" name="gender" value="Female" /> Female

                Employee  Shift     :  <input type="radio" name="shift" value="Morning" checked="checked" />  Morning
                                       <input type="radio" name="shift" value="Evening" /> Evening
                                       <input type="radio" name="shift" value="Night" />  Night

                Password            :  <input type="password" name="emppassword1" value=""/>

                Rewrite Password    :  <input type="password" name="emp_password" value=""/>

       

                Pick-Up Stop  	       <select name="pickup_stop_name">
            <%
             ConnBean conn = new ConnBean();
            Connection con = conn.connect();
            ResultSet rst=null;
            Statement stmt=null;
            String sql = null;
             stmt=con.createStatement();

            sql = "select stop_name from StopMaster";
            rst = stmt.executeQuery(sql);
            while(rst.next())
                {
            %>
                               <option><%=rst.getString(1)%></option>
            <%
                }
            %>
                               </select>
        

                Drop-Off Stop          <select name="dropoff_stop_name">
            <%
            rst.beforeFirst();
            while(rst.next())
                {
            %>
			       <option><%=rst.getString(1)%></option>
            <%
                }
            %>
			       </select>

	<!--Route Not Available...? Contact Administrator	<a href="CmsHome.html">Redirect To Login</a>-->

                    <input type="submit" value="Accept" />                         <input type="reset" value="Clear" name="clear" />
    </pre>
         </form>

      </body>

</html>