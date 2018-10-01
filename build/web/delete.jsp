<%@page import="java.sql.*"%>
<%

String id=request.getParameter("delete");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
Statement st = conn.createStatement();
st.executeUpdate("DELETE FROM registration WHERE email= '"+id+"'");
%>
<script>
          alert("record deleted" );
          window.location = 'adminhomepage.jsp';
     </script> 
<%
}
catch(Exception e){}
%>
