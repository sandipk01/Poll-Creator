<%@page import="java.sql.*"%>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");
String date=request.getParameter("date");
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("update registration set username='"+name+"',email='"+email+"',mobile="+mobile+",password='"+password+"' where email='"+email+"'");
%>
<script>
          alert("record updated" );
          window.location = 'adminhomepage.jsp';
     </script> 
<%
}
catch(Exception e){
System.out.println(e);
    }
%>