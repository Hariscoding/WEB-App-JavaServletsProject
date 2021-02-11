<%-- 
    Document   : controlpanel
    Created on : Dec 12, 2020, 8:29:20 PM
    Author     : korisnik
--%>

<%@page import="util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/cpcss.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div id="panel-options">
        <div id="panel-options-container">
            <div class="options">
                <a href="dodajAdmin.jsp" class="options-link">DODAJ KORISNIKA</a>
            </div>
            <div class="options">
                <a href="izmjena.jsp" class="options-link">EDITUJ PODATKE</a>
            </div>
            <div class="options">
                <a href="mainadmin.jsp" class="options-link">IDI NAZAD</a>
            </div>
        </div>
        
    </div>
        
        
        <table>
    
    <thead>
        <tr>
            
            <th>
                User ID
            </th>
            
            <th>
                Username
            </th>
            
            <th>
                Ime
            </th>
            
            <th>
                Prezime
            </th>
            
            <th>
                Email
            </th>
            
            <th>
                Status
            </th>
            <th>
                Uloga
            </th>
            
        </tr>
    </thead>
    
    <tbody>
        
        <%
        String upit = "select * from korisnikinfo";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null; 
        boolean postoji = false;
         String naslov; 
         String autor; 
         String sadrzaj;
         String slika;
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit); %>
            
            <%
                
                 while (rs.next()) { %>
        
        <tr>
            <td>
                <%= rs.getString("id")%>
            </td>
            
            <td>
                 <%= rs.getString("username")%>
            </td>
            
            <td>
                 <%= rs.getString("ime")%>
            </td>
            
            <td>
                 <%= rs.getString("prezime")%>
            </td>
            
            <td>
                 <%= rs.getString("email")%>
            </td>
            
            <td>
                <%= rs.getString("status")%>
            </td>
            
             <td>
                <%= rs.getString("uloga")%>
            </td>
            
        </tr>
         <%
                
                              
            } 
        } catch (SQLException e) {
           
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
        }
        
        %>
        
        
    </tbody>
    
</table>
    </body>
</html>
