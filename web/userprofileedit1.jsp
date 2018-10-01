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
         


<%
try{
String email2=(String)session.getAttribute("currentSessionUser");
      String email1=request.getParameter("email");
//int no=Integer.parseInt(code);
String mobile1=request.getParameter("mobile");
out.print(email2);
out.print(mobile1);
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                  Statement st=null;
               st=conn.createStatement();
           st.executeUpdate("update registration set email='"+email1+"',mobile='"+mobile1+"' where email='"+email2+"'");
           out.print("user data is update");
}
catch(Exception e){
System.out.println("error");
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