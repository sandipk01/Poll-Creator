<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>



<% 
    // check session is ture then allow to enter page-------------------------------------------------------------------------
if(session.getAttribute("currentSessionUser") != null)
{ 
    %>
<jsp:include page="header1new.html"/>
<!--enter session here -------------------------------------------------------------------------------------------->
&nbsp;&nbsp;&nbsp;<h6 style="color:green;"><%=session.getAttribute("currentSessionUser")%></h6>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-primary" href="logout.jsp" role="button">Logout</a></p>

<!-- End session here --------------------------------------------------------------------------------------------------------->
  <jsp:include page="header2.html"/>
  <header class="intro-header">
      
<script language="javascript">
function fncSubmit()
{
if(document.ChangePasswordForm.txtopass.value === "")
{
alert('Please input old password');
document.ChangePasswordForm.txtopass.focus();
return false;
} 

if(document.ChangePasswordForm.txtnpass.value === "")
{
alert('Please input Password');
document.ChangePasswordForm.txtnpass.focus(); 
return false;
} 

if(document.ChangePasswordForm.txtcpass.value === "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.txtcpass.focus(); 
return false;
} 

if(document.ChangePasswordForm.txtnpass.value !== document.ChangePasswordForm.txtcpass.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>

    <br>
   
        <center>
            <table>
                <tr>
                    <td></td>
                    <td>
          <div class="container">
 <div class="jumbotron" style="margin-top:30px">
     <center><h3 style="color:black;">Change Password:</h3></center> 
          <br>
          <form name="ChangePasswordForm" action="ChangePass1.jsp" method="post" OnSubmit="return fncSubmit();">
        <div class="form-group">
            <div style="color: black;"> Enter Your Old password:</div> <input type="password"  class="form-control" name="txtopass" placeholder="" required>
        </div>
        <div class="form-group">
            <div style="color: black;">Enter Your New Password: </div><input type="password" pattern=".{5,10}" title="password range must be between 5 to 10"   class="form-control" name="txtnpass" placeholder="" required>
        </div>
       <div class="form-group">
           <div style="color: black;">Enter Confirm Password: </div><input type="password" pattern=".{5,10}" title="password range must be between 5 to 10"   class="form-control" name="txtcpass" placeholder="" required>
        </div>
        <button type="submit" class="btn btn-primary form-control">Change</button>
      </form>
         
        </div>
      </div></td>
                    <td></td>
                </tr>
            </table>
            
           
     </center>
      
 
    </header>

    <!-- Page Content -->
  
    <!-- end page content -->
<jsp:include page="footer.html"/>

<%
}
else
{
response.sendRedirect("homepage.jsp");
}      // END check session is ture then allow to enter page-------------------------------------------------------------------------

%>