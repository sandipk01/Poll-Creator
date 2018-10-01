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
        <%@page language="java"%>
<%@page import="java.sql.*"%>
<br>
<br>
  <div class="container">
           <div class="alert alert-success" style=" font-style: italic; opacity: 0.6; filter: alpha(opacity=100);">
<form method="post" action="update.jsp">
    <h2>Edit User Details:</h2>
<table class="table table-hover">
    <thead>
      <tr>
        <td>USERNAME</td>
        <td>EMAIL</td>
        <td>MOBILE NUMBER</td>
           <td>PASSWORD</td>
              <td>REGISTER DATE</td>
      </tr>
    </thead>
      <tbody>
<%
String id=request.getParameter("edit");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
String query = "select * from registration where email='"+id+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="name" value="<%=rs.getString(1)%>"></td>
<td><input type="text" name="email" value="<%=rs.getString(2)%>"></td>
<td><input type="text" name="mobile" value="<%=rs.getString(3)%>"></td>
<td><input type="text" name="password" value="<%=rs.getString(4)%>"></td>
<td><input type="date" name="date" value="<%=rs.getString(5)%>"></td>
</tr>
      </tbody>
      <tbody>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
<td><td><a href="adminhomepage.jsp" class="btn btn-info" role="button">back</a></td>
<td>Date is:</td><td><%=rs.getString(5)%></td>
</tr>
<%
}
}
catch(Exception e){}
%>
      </tbody>
</table>
</form>
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