
package com.servlet;
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import javax.servlet.http.HttpSession;



/**
 *
 * @author Sandip
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
         TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
            SimpleDateFormat format=new SimpleDateFormat("dd-MM-yyyy");
            Date today=new Date();
            String date=format.format(today);
            
           String username=request.getParameter("txtusername");
           String email=request.getParameter("txtemail");
           String mobile=request.getParameter("txtmobile");
           String password=request.getParameter("txtcpassword");
           ResultSet rs;
          
           try{
              
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                String sql = "SELECT * FROM registration WHERE email = ? ";
                PreparedStatement preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, email);
                Statement s = conn.createStatement();
                rs =preparedStatement.executeQuery();
              if(rs.next()) {
               out.println("<script>\n" +
"          alert(\"this email is already exist\" );\n" +
"          window.location = 'Register.jsp';\n" +
"     </script> ");
              
             }
              else
              {
                Statement st=conn.createStatement();
                st.executeUpdate("insert into registration(username,email,mobile,password,date) values('"+username+"','"+email+"','"+mobile+"','"+password+"','"+date+"')");
                 HttpSession session = request.getSession(true);	    
                       session.setAttribute("currentSessionUser",email); 
                       response.sendRedirect("homepagenew.jsp");
              }
           }
           catch(Exception e)
           {
               out.println("Exception :"+e.getMessage());
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
