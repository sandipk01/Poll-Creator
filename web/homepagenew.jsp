<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServlet" %>


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

    <br>
    
  
        <center>
         
           
            <div class="container marketing">   
                 <div class="jumbotron" style="margin-top:30px">
            <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="img/create.png" alt="Generic placeholder image" width="140" height="140">
            <br>
            <br>
            <h2 style="color:black;">CREATE POLL</h2>
            <p style="color:black;">You can create your polls from here just adding your question and choices..</p>
            <p style="color:black;"><a class="btn btn-primary" href="CreatePoll.jsp" role="button">Click Here &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-rectangle" src="img/result.png" alt="Generic placeholder image" width="140" height="140">
            <br>
            <br>
            <h2 style="color:black;">SHOW RESULT</h2>
            <p style="color:black;">you can see the all new and old poll results & your voted result also see here.</p>
            <p><a class="btn btn-primary" href="showresult.jsp" role="button">Click Here &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-rectangle" src="img/makepoll.png" alt="Generic placeholder image" width="140" height="140">
            <br>
            <br>
            <h2 style="color:black;">Give Vote</h2>
            <p style="color:black;">You can give your vote to any poll just click on below link and free fill to vote.</p>
            <p><a class="btn btn-primary" href="makepoll.jsp" role="button">Click Here &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
        </div>
                 </div>
                </div>
               
                
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