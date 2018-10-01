<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String OldPassword = request.getParameter("txtopass");
String Newpass = request.getParameter("txtnpass");
String conpass = request.getParameter("txtcpass");


Connection con = null;
Statement st = null;
String pass = "";
int id = 0;
try {

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
st = conn.createStatement();
ResultSet rs = st.executeQuery("select * from registration where password= '"+ OldPassword + "'");
if (rs.next()) { 
pass = rs.getString("password");
} 
if(Newpass.equals(conpass))
{
if (pass.equals(OldPassword)) {
st = conn.createStatement();
int i = st.executeUpdate("update registration set password='"+ conpass + "'");
    session.invalidate(); 
%>
     <script>
          alert("your password is Change your redirected to homepage" );
          window.location = 'homepage.jsp';
     </script> 
<%

 
st.close();
con.close();
} else {
%>
     <script>
          alert("OLD PASSWORD WAS NOT MATCH" );
          window.location = 'ChangePass.jsp';
     </script> 

<%
}
/*}else{
out.println("new password and confirm new password is not matching");
}*/
}
} catch (Exception e) {
out.println(e);
}
%>
