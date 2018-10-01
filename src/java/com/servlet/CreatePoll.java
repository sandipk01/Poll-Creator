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
@WebServlet(name = "CreatePoll", urlPatterns = {"/CreatePoll"})
public class CreatePoll extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
          String username=(String) session.getAttribute("currentSessionUser");
           String que=request.getParameter("txtque");
           String c1=request.getParameter("txtc1");
           String c2=request.getParameter("txtc2");
           String c3=request.getParameter("txtc3");
           String c4=request.getParameter("txtc4");
           String startdate=request.getParameter("startdate");
           String enddate=request.getParameter("enddate");

          
           try{
              
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/poll","root","");
                Statement st=conn.createStatement();
                st.executeUpdate("insert into poll(email,question,choice1,choice2,choice3,choice4,start_date,end_date) values('"+username+"','"+que+"','"+c1+"','"+c2+"','"+c3+"','"+c4+"','"+startdate+"','"+enddate+"')");
                       
                       response.sendRedirect("homepagenew.jsp");
                 
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
