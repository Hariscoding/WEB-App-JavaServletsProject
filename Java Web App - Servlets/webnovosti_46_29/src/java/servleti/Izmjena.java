    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DB;

/**
 *
 * @author korisnik
 */
@WebServlet(name = "Izmjena", urlPatterns = {"/Izmjena"})
public class Izmjena extends HttpServlet {

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

      
        int id = Integer.parseInt(request.getParameter("id"));
        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String tel = request.getParameter("telefon");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String uloga = request.getParameter("uloga");
        String status = request.getParameter("status");
        String upit = "update korisnikinfo set username = '" + un + "', password = '" + pass + "', email = '" + email + "', telefon = '" + tel + "', ime = '" + ime + "', prezime = '" + prezime + "', uloga = '" + uloga + "', status = '" + status + "' where id= '" + id + "'";
        String upit2 = "select * from korisnikinfo";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String address = "izmjena.jsp";
        String poruka = "";
        boolean postoji = false;
        boolean pogresnaUloga = false;
        boolean postojiid = false;
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit2);
            while (rs.next()) {
                String unBaza = rs.getString("username");
                String emailBaza = rs.getString("email");
                int idBaza = rs.getInt("id");
                if(idBaza == id){
                    postojiid = true;
                }
                if(un.equalsIgnoreCase(unBaza) || email.equalsIgnoreCase(emailBaza)){
                    postoji = true;
                }
                if(!uloga.equalsIgnoreCase("admin") && !uloga.equalsIgnoreCase("editor") && !uloga.equalsIgnoreCase("user")){
                    pogresnaUloga=true;
                }
                
            }
            
         if(postoji){
                    poruka = "Username ili email vec postoji!";
                    request.setAttribute("poruka", poruka);
             
            }else if(pogresnaUloga){
                    poruka = "Nije prepoznata unesena uloga.";
                    request.setAttribute("poruka", poruka);
            }else if(!postojiid){
                    poruka = "Nije pronadjen ID.";
                    request.setAttribute("poruka", poruka);
            }
            else{
              stmt.executeUpdate(upit);
              poruka = "Uspjesno editovan korisnik.";
              request.setAttribute("poruka", poruka);
            }  
        } catch (SQLException e) {
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error";

        }
        RequestDispatcher rd = request.getRequestDispatcher(address);
        rd.forward(request, response);
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
