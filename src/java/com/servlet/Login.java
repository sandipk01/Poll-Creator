/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Sandip
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String email=request.getParameter("txtusername");
           String password=request.getParameter("txtpassword");
        try
        {
            if(email!=null)
            {
                if(!"admin@gmail.com".equals(email) && !"admin".equals(password))
                {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                String Query="select * from registration where email=? and password=?";
                PreparedStatement ps=conn.prepareStatement(Query);
                ps.setString(1,email);
                ps.setString(2,password);
                ResultSet rs=ps.executeQuery();
                
               if(rs.next())
               {        
                       HttpSession session = request.getSession(true);	    
                       session.setAttribute("currentSessionUser",email); 
                       response.sendRedirect("homepagenew.jsp");
               }
               else
               {
                     out.println("<script>\n" +
"          alert(\"username or password is not valid please try valid on\" );\n" +
"          window.location = 'homepage.jsp';\n" +
"     </script> ");
               }
                }
                else
                {
                     HttpSession session = request.getSession(true);	    
                       session.setAttribute("admin",email); 
                       response.sendRedirect("adminhomepage.jsp");
                }
            }
        }
        catch(Exception e)
        {
            out.println("Exception:"+e.getMessage());
        }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
