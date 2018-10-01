<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>





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
 
      <div class="container">  
                <br />  
                <br />  
                
                <div class="jumbotron">
                     <h2 style="color:blue; text-align: left">CREATE A NEW POLL</h2>
                     <br>
                        <center>
     
         
                    <form action="CreatePoll" method="post" name="add_name" id="add_name">  
                        
                       
                                       <input type="text" class="form-control" required="required" name="txtque" pattern=".{10,100}" title="question must be greather than 10 characters" placeholder="Enter Your Question Here ?" required>
                                       <br>
                                       <input type="text" class="form-control" required="required" name="txtc1" pattern=".{1,50}" title="choice must be enter atleast 1 character" placeholder="Choice 1" required>
                                        <br>
                                       <input type="text" class="form-control" required="required" name="txtc2" pattern=".{1,50}" title="choice must be enter atleast 1 character" placeholder="Choice 2" required>
                                       <br>
                                       <input type="text" class="form-control" required="required" name="txtc3" pattern=".{1,50}" title="choice must be enter atleast 1 character" placeholder="Choice 3" required>
                                       <br>
                                       <input type="text" class="form-control" required="required" name="txtc4" pattern=".{1,50}" title="choice must be enter atleast 1 character" placeholder="Choice 4" required>
                                       <br>
                                       <p style="color:black;">  Start Date:&nbsp;&nbsp;&nbsp;<input type="date" name="startdate" required>
                                      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; End Date:&nbsp;&nbsp;&nbsp;<input type="date" name="enddate" >
</p>
                                       
                                  
             
                                   
                                         
                                         
<div style="position: relative;
    left: 420px;"> <button  type="submit" name="add" id="add" class="btn btn-primary" value="CreatePoll">Create</button>  </div>     
                     
                     </form>  
                </div>
                                    </center>
                </div>
      </div>
 
          
       
 
 
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