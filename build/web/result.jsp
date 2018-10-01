<%-- 
    Document   : homepage
    Created on : 19 Oct, 2017, 2:18:35 PM
    Author     : Sandip
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="javax.servlet.http.HttpServlet" %>
<%@page import="javax.servlet.http.HttpServlet" %>

 


<% 
    // check session is ture then allow to enter page-------------------------------------------------------------------------
if(session.getAttribute("currentSessionUser") != null)
{
    
    %>
    
   
<jsp:include page="header1new.html"/>
<!--enter session here -------------------------------------------------------------------------------------------->
&nbsp;&nbsp;&nbsp;<h6 style="color:green;"><%String email=(String)session.getAttribute("currentSessionUser"); 
out.print(email);%></h6>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-primary" href="logout.jsp" role="button">Logout</a></p>

<!-- End session here --------------------------------------------------------------------------------------------------------->
 <jsp:include page="header2.html"/>
 <header class="intro-header">

    <br>
    
        
        <%String ans=request.getParameter("favoriteLanguage");%>
  
       <br>
       <div class="container">
           <div class="alert alert-success" style=" font-style: italic; opacity: 0.6; filter: alpha(opacity=100);">
<%String pid=(String)session.getAttribute("pollid"); 

   try{
              String c1="0";
              String c2="0";
              String c3="0";
              String c4="0";
              String ans1="0";
              String ans2="0";
              String ans3="0";
              String ans4="0";
              String que1="";
              
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                 String Query="select * from result where email=? and poll_id=?";
                PreparedStatement ps1=conn.prepareStatement(Query);
                ps1.setString(1,email);
                ps1.setString(2,pid);
                ResultSet rs=ps1.executeQuery();
                
               if(rs.next())
               { 
                // displaying choices    
                String sql="select * from poll where poll_id='"+pid+"'";
              PreparedStatement pst=conn.prepareStatement(sql);
               ResultSet rs1=pst.executeQuery();
                if(rs1.next())
                {
                   c1=rs1.getString(4);
                    c2=rs1.getString(5);
                    c3=rs1.getString(6);
                    c4=rs1.getString(7);
                   que1=rs1.getString(3);
                  
                           
                 
          // counting the choice 1  
            String sql1="select answer, count(answer) as num from result WHERE answer='"+c1+"' AND poll_id='"+pid+"' group by answer order by count(answer)";
              PreparedStatement pst1=conn.prepareStatement(sql1);
               ResultSet rs3=pst1.executeQuery();
                if(rs3.next())
                {
                   
                     ans1=rs3.getString("num");
                    
                   
                 }
                // end counting choice 1
                
                // counting the choice 2  
            String sql2="select answer, count(answer) as num from result WHERE answer='"+c2+"' AND poll_id='"+pid+"' group by answer order by count(answer)";
              PreparedStatement pst3=conn.prepareStatement(sql2);
               ResultSet rs4=pst3.executeQuery();
                if(rs4.next())
                {
                    ans2=rs4.getString("num");
                   
                   
                 }
                // end counting choice 2
                 // counting the choice 3
                String sql3="select answer, count(answer) as num from result WHERE answer='"+c3+"' AND poll_id='"+pid+"' group by answer order by count(answer)";
              PreparedStatement pst4=conn.prepareStatement(sql3);
               ResultSet rs5=pst4.executeQuery();
                if(rs5.next())
                {
                    ans3=rs5.getString("num");
              
                   
                 }
                // end counting choice 3
                
                 // counting the choice 4
                String sql4="select answer, count(answer) as num from result WHERE answer='"+c4+"' AND poll_id='"+pid+"' group by answer order by count(answer)";
              PreparedStatement pst5=conn.prepareStatement(sql4);
               ResultSet rs6=pst5.executeQuery();
                if(rs6.next())
                {
                    ans4=rs6.getString("num");

                   
                 }
                // end counting choice 4
                %>
                
  
               <div class="container">
  <h2>Result of:</h2>
  <h3><%=que1%></h3>  
  <center> <table>
      <tr>
          <td></td>
          <td>
         
  <table class="table table-hover">
    <tbody>
      <tr>
          <td>choices :</td>
        <td><%=c1%></td>
        <td><%=c2%></td>
        <td><%=c3%></td>
        <td><%=c4%></td>
      </tr>
      <tr>
          <td>vote counting :</td>
          <td><center><%=ans1%></center></td>
        <td><center><%=ans2%></center></td>
        <td><center><%=ans3%></center></td>
        <td><center><%=ans4%></center></td>
      </tr>
    </tbody>
  </table>
              </td>
   <td></td>
      </tr>
  </table>
      </center>
</div>
      <br>

     

  <center><div id="piechart"></div></center>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
var c1="<%=c1%>";
var c2="<%=c2%>";
var c3="<%=c3%>";
var c4="<%=c4%>";
var ans1="<%=ans1%>";
var ans2="<%=ans2%>";
var ans3="<%=ans3%>";
var ans4="<%=ans4%>";
// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Task', 'Hours per Day'],
  [c1, parseInt(ans1)],
  [c2, parseInt(ans2)],
  [c3, parseInt(ans3)],
  [c4, parseInt(ans4)],
  
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Result', 'width':400, 'height':300};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
<br>
<br>

                <%   
                }
             
                out.print("<script>alert('u are already voted for this poll');</script>");
               }
               else
               {
                    Statement st=conn.createStatement();
                st.executeUpdate("insert into result(poll_id,email,answer) values('"+pid+"','"+email+"','"+ans+"')");
               out.println("inserted");
               out.println("<br><a href='result.jsp' class='btn btn-info' role='button'>show result</a>");
               }
   


               
   }
           catch(Exception e)
           {
               out.println("Exception :"+e.getMessage());
           }
   

    
%>

           </div>
       </div>
    

</header>
  

<jsp:include page="footer.html"/>

<%
}
else
{
response.sendRedirect("homepage.jsp");
}      // END check session is ture then allow to enter page-------------------------------------------------------------------------

%>