/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DB;

/**
 *
 * @author bnc
 */
@WebServlet(name = "DodajNovost", urlPatterns = {"/DodajNovost"})
public class DodajNovost extends HttpServlet {

 
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String naslov = request.getParameter("naslov");
        String autor = request.getParameter("autor");
        String slikaUrl = request.getParameter("slikaurl");
        String sadrzaj = request.getParameter("sadrzaj");
            
        String upit = "insert into novosti(naslov, autor, sadrzaj, slika) values ('" + naslov + "', '" + autor + "', '" + sadrzaj + "', '" + slikaUrl + "')";
        Connection con = null;
        Statement stmt = null;
        String address = "maineditor.jsp";
        String poruka = "";
        
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(upit); 
        } catch (SQLException e) {
            
            String err = e.getMessage();
            address = "error";
        }
        response.sendRedirect("maineditor.jsp");    
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