/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.korisnik;
import java.awt.Color;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DB;


/**
 *
 * @author Alem
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        HttpSession sesija = request.getSession();
        
        korisnik k = new korisnik();
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        
        String poruka = "";
        Connection con = null;
        Statement stmt = null;
        String address = "";
        String upit = "select * from korisnikinfo where username = '" + username + "' and password = '" + pass + "'";
        ResultSet rs = null;
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit);
            
            if (rs.next()) {
                k.setUsername(rs.getString("username"));
                k.setEmail(rs.getString("email"));
                k.setIme(rs.getString("ime"));
                k.setPrezime(rs.getString("prezime"));
                k.setTelefon(rs.getString("telefon"));
                k.setUloga(rs.getString("uloga"));
                if(rs.getString("status").equalsIgnoreCase("neaktivan")){
                poruka = "Vas profil je deaktiviran. Login neuspjesan.";
                request.setAttribute("poruka", poruka);
                }
                if(k.getUloga().equalsIgnoreCase("admin")){
                    response.sendRedirect("mainadmin.jsp");
                    sesija.setAttribute("admin", k);
                }
                if(k.getUloga().equalsIgnoreCase("editor")){
                    response.sendRedirect("maineditor.jsp");
                    sesija.setAttribute("editor", k);
                }
                if(k.getUloga().equalsIgnoreCase("user")){
                     response.sendRedirect("mainuser.jsp");
                     sesija.setAttribute("user", k);
                }
            } else {
                poruka = "Neispravno kosisnicko ime ili password! pokusajte ponovo!";
                request.setAttribute("poruka", poruka);
                response.sendRedirect("index.jsp");
            }

        } catch (SQLException e) {
 
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error";
        }
       
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
