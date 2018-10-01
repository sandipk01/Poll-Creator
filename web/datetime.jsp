<%-- 
    Document   : datetime
    Created on : 21 Oct, 2017, 4:20:05 PM
    Author     : Sandip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
 <%@page import="java.util.TimeZone" %>
<%@page import="java.util.Date" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
            SimpleDateFormat format=new SimpleDateFormat("dd-MM-yyyy");
            Date today=new Date();
            String date1=format.format(today);
            out.println(date1);
            %>
            <br>


    </body>
</html>
