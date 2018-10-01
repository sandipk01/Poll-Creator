<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.TimeZone" %>


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
      <h3>Please Give Your vote</h3>
    <%
       TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            Date today=new Date();
            String date=format.format(today); 
            
try {
    
   
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/poll";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.

String QueryString = "SELECT * from poll where start_date<='"+date+"' AND end_date>='"+date+"'";
rs = statement.executeQuery(QueryString);
%>
<br>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%
while (rs.next()) {
%>
<center>
          
 
    
       <div class="container">
           <div class="alert alert-success" style=" font-style: italic; opacity: 0.6; filter: alpha(opacity=100);">
               <strong><img src="img/new.gif" height="42" width="42">&nbsp;&nbsp;&nbsp;<label>Poll Genrated By,&nbsp;&nbsp;&nbsp;<label style="color:#7D1935;"><%=rs.getString(2)%></label></label>&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/click.gif" height="60" width="60">&nbsp;&nbsp;<a style="color:green; font-size: 20px;" href="makepoll1.jsp?pollid=<%=rs.getString(1)%>"><%=rs.getString(3)%></a>&nbsp;&nbsp;&nbsp;Last Date Is:&nbsp;&nbsp;&nbsp;<label style="color:#7D1935;"><%=rs.getString(9)%></label></strong> 
</div>       
</div>


</center>
<% }

%>
<%
// close all the connections.

rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("No poll is display.");

}
%>
<a href="showallresults.jsp" class="btn btn-info" role="button">Show current and old results</a>
<TABLE>
<TR>
<TD><FORM ACTION="welcome_to_database_query.jsp" method="get" >

</TR>
</TABLE>
    
    
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