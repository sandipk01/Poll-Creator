<%-- 
    Document   : logout
    Created on : 20 Oct, 2017, 11:52:59 AM
    Author     : Sandip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
   <%  session.invalidate(); 
 response.sendRedirect("homepage.jsp"); 
   %>

    </body>
</html>
