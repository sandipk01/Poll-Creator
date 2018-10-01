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

    <br>
     
  <% 
      try
      {
   String email1=(String)session.getAttribute("currentSessionUser");
      
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                 String Query="select * from registration where email='"+email1+"'";
                PreparedStatement ps1=conn.prepareStatement(Query);
                ResultSet rs=ps1.executeQuery();
                
               if(rs.next())
               {
  %>
 
        <center>
            <table>
                <tr>
                    <td></td>
                    <td>
          <div class="container">
 <div class="jumbotron" style="margin-top:30px">
     <center><h3 style="color:black;">Your Profile</h3></center> 
          <br>
          <form action="userprofileedit1.jsp" method="post">
        <div class="form-group">
         <div style="color: black;">   Your Email Address:</div> <input type="text" value="<%=rs.getString(2)%>" class="form-control" name="email" placeholder="">
        </div>
        <div class="form-group">
            <div style="color: black;">Your Mobile Number: </div><input type="text" value="<%=rs.getString(3)%>" class="form-control" name="mobile" placeholder="">
        </div>
      
        <button type="submit" class="btn btn-primary form-control">update</button>
      </form>
         
        </div>
      </div></td>
                    <td></td>
                </tr>
            </table>
            
  <%
}
    

}
          catch (Exception ex) {
            out.println("Unable to connect to database.");
    
               }
  %>              
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