<%-- 
    Document   : Register
    Created on : 19 Oct, 2017, 2:36:57 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header1.html"/>

<!--enter session here -->

<!-- End session here -->

  <jsp:include page="header2.html"/>
  

  <!-- page containt -->
  
   <header class="intro-header">
<center>
  <table>
    <tr>
      <td>
        <center>
        <h1>We Make Publishing Real Simple</h1>
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
     <center><h3 style="color:black;">Please Signup</h3></center> 
          <br>
      <form action="Register" action="Register.jsp" method="post">
          <div class="form-group">
            <input type="text" class="form-control" required="required" name="txtusername" placeholder="Enter the username">
        </div>
        <div class="form-group">
            <input type="email" class="form-control" required="required" name="txtemail" placeholder="Enter the email">
        </div>
        <div class="form-group">
          <input type="text" class="form-control" required="required"s pattern="[789][0-9]{9}" title="please enter valid mobile no" name="txtmobile" placeholder="Enter the mobile no">
        </div>
           <div class="form-group">
          <input type="password" class="form-control" name="txtpassword" placeholder="Enter the password">
        </div>
             <div class="form-group">
          <input type="password" class="form-control" name="txtcpassword" placeholder="Enter the confirm password">
        </div> 
        <div class="checkbox">
            <center> <label style="color: black;">
         <input type="checkbox" name="" >
         Agree Terms & Conditions
        </label>
       </center>
        </div>
        <button type="submit" class="btn btn-primary form-control" value="Register">Signup</button>
      </form>
          <br>
          <center> <a href="homepage.jsp">I have already Account</a></center>
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


