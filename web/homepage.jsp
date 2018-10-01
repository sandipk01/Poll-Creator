<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<% 
    // check session is ture then allow to enter page-------------------------------------------------------------------------
if(session.getAttribute("currentSessionUser") != null)
{ 
response.sendRedirect("homepagenew.jsp");
    
}
else
{
    %>
    

    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header1.html"/>

<!--enter session here -->

<!-- End session here -->

  <jsp:include page="header2.html"/>
  <header class="intro-header">
<center>
  <table>
    <tr>
      <td>
        <center>
           <h1> We Make Publishing Real Simple</h1>
        <h3>The Smoothest Way to Create Viral, Engaging and Fun Content!</h3>

<center>Creative ideas are the things you should be spending time on. Your audience doesn't care about programming,<br> scalability, security and those kinds of things. We build free tools that ensure you're thinking about how<br> to engage and entertain your audience.<br> They're so easy to use you can forget about the stuff that doesn't add value.
     </center>   
     </center>
      </td>
      <td>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
      <td>
        <div class="container">
 <div class="jumbotron" style="margin-top:30px">
     <center><h3 style="color:black;">Please Signin</h3></center> 
          <br>
          <form action="Login" method="post">
        <div class="form-group">
          <input type="email" class="form-control" name="txtusername" placeholder="Enter the email"  required>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" name="txtpassword" placeholder="Enter the password"  required>
        </div>
        <div class="checkbox">
        <label style="color: black;">
         &nbsp;&nbsp;&nbsp; <input type="checkbox" name="" >
         remember me
        </label>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">Forgot Password</a>
        </div>
        <button type="submit" class="btn btn-primary form-control">Signin</button>
      </form>
          <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a href="Register.jsp">Register Here</a>
        </div>
      </div>

      </td>
    </tr>
  </table>
  </center>
  

   <h4>News:</h4><marquee direction = "left" scrolldelay="100"> Creative ideas are the things you should be spending time on. Your audience doesn't care about programming, scalability, security and those kinds of things. We build free tools that ensure you're thinking about how to engage and entertain your audience. They're so easy to use you can forget about the stuff that doesn't add value.</marquee>
      
    </header>

    <!-- Page Content -->
  
    <!-- end page content -->
<jsp:include page="footer.html"/>
<%

}      // END check session is ture then allow to enter page-------------------------------------------------------------------------

%>