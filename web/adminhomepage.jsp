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
if(session.getAttribute("admin") != null)
{
    
    %>
<jsp:include page="adminheader.html"/>
<!--enter session here -------------------------------------------------------------------------------------------->
&nbsp;&nbsp;&nbsp;<h6 style="color:green;"><%=session.getAttribute("admin")%></h6>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-primary" href="logout.jsp" role="button">Logout</a></p>

<!-- End session here --------------------------------------------------------------------------------------------------------->
  <jsp:include page="header2.html"/>
  <header class="intro-header">

    <br>
    
  
        <center>
         
         <%@ page import="java.sql.*" %>
<html>

<body>

<br><br>
  <div class="container">
           
           <div class="alert alert-success" style=" font-style: italic; opacity: 0.6; filter: alpha(opacity=100);">
<form method="post" name="form">
<div class="container">
  <h2>User Data</h2>
            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>USERNAME</th>
        <th>EMAIL</th>
        <th>MOBILE NUMBER</th>
           <th>PASSWORD</th>
              <th>REGISTER DATE</th>
      </tr>
    </thead>
      <tbody>
<%
Statement st;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
String query = "select * from registration";
st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
%>

<%
while(rs.next()){
%>
<tr><td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><a href="edit.jsp?edit=<%=rs.getString(2)%>" class="btn btn-info" role="button">EDIT</a></td>
<td><a href="delete.jsp?delete=<%=rs.getString(2)%>" class="btn btn-info" role="button">DELETE</a></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>

     </tbody>
</table>
</form>
</div>
           </div>      
</body>
</html>       
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