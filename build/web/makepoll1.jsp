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
    
    <%
        String choice=request.getParameter("optradio");
       TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            Date today=new Date();
            String date=format.format(today); 
           String pollid=request.getParameter("pollid");
    
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

String QueryString = "SELECT * from poll where poll_id='"+pollid+"'";
rs = statement.executeQuery(QueryString);
%>
<br>
 

<%
while (rs.next()) {
session.setAttribute("pollid",pollid);

%>

<center>
    <br>
    <br>
    <br>
    <form action="result.jsp">
    <table>
        <tr>
            
            <td>
                
            </td>
            
            <td>
                <div class="container" style="font-size:20px;">
           <div class="alert alert-success" style=" font-style: italic; opacity: 0.6; filter: alpha(opacity=100);">
               <label style="color:green; font-size:20px;">Question:</label>&nbsp;&nbsp;&nbsp;<label style="color: #7D1935; font-size:20px;"><%=rs.getString(3)%></label> 
               <br>
               <center>
                 <input  type="radio" name="favoriteLanguage" value="<%=rs.getString(4)%>"><%=rs.getString(4)%>
                 <br>
	<input type="radio" name="favoriteLanguage" value="<%=rs.getString(5)%>"> <%=rs.getString(5)%>
<br>
	<input type="radio" name="favoriteLanguage" value="<%=rs.getString(6)%>"> <%=rs.getString(6)%>
<br>
	<input type="radio" name="favoriteLanguage" value="<%=rs.getString(7)%>"> <%=rs.getString(7)%>
</center>

<br>
<center>  <input type="submit" value="Submit" class="btn btn-info" /></center>
  <!-- <a href="result.jsp?pollid1=<%=rs.getString(1)%>" class="btn btn-info" role="button">Submit</a> -->
           </div>       
</div>   

            </td>
            <td>
                
            </td>
          </tr>
        
    </table></form>
      
    
 <br>
    <br>
    <br>
     <br>
    <br>


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