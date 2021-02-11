<%-- 
    Document   : novost
    Created on : Dec 12, 2020, 11:44:12 PM
    Author     : korisnik
--%>

<%@page import="beans.korisnik"%>
<%@page import="java.sql.SQLException"%>
<%@page import="util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href="css/novost.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body> 
        
        <% 
            HttpSession sesija2 = request.getSession();

            String username = "";
            korisnik k = (korisnik)sesija2.getAttribute("editor");
            if(k != null){
             username = k.getUsername();
          }
        %>
      <div id="panel">
          <p> USERNAME: <b><%=username%></b> </p>
          <button id="cbutton"><a href="controlpanel.jsp">CONTROL PANEL</a></button>
        <img src="https://visualpharm.com/assets/387/Person-595b40b75ba036ed117da139.svg" alt="">
        <div id="container_button">
            <button id="button" class="learn-more">
              <span class="circle" aria-hidden="true">
                <span class="icon arrow"></span>
              </span>
                <a href="index.jsp"><span class="button-text">Log Out</span></a>
            </button>
          </div>
    </div>
    
    
    <button id="nekodugme">
         <img id="imgg" src="https://visualpharm.com/assets/387/Person-595b40b75ba036ed117da139.svg" alt="">
    </button>  
        
      <section>
      <div class="news-menu">
          <div class="news-menu-left">
            <a href="" class="news-menu-links">Politics</a>
            <a href="" class="news-menu-links">Justice</a>
            <a href="" class="news-menu-links">National Security</a>
            <a href="" class="news-menu-links">World</a>
            <a href="" class="news-menu-links">Technology</a>
            <a href="" class="news-menu-links">Environment</a>
        </div>
          <div class="news-menu-right">
              <a href="" class="about-link news-menu-links">About</a>
              <a href="" class="become-a-member news-menu-links">Become a member</a>
              
          </div>
      </div>
  </section>
    
        
<h1 id="top_stories">Selected story: </h1>
    
    <div class="news-section-trending">
       
        <% 
            
           HttpSession sesija = request.getSession();
           String id = (String) sesija.getAttribute("ID");
        %>
        <%
         
        
        String upit = "select * from novosti";
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null; 
        int broj = Integer.parseInt(id);
            
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit); %>
            
            <%
            while (rs.next()) { 
           
            if(broj == rs.getInt("idnovosti")) {
            %> 
           <div class="news-section-container">
                <div class="top-stories-left">
                     <a href="Novost?ID=<%=rs.getInt("idnovosti")%>"><img src="<%=rs.getString("slika")%>" alt=""></a>
                </div>
                <div class="top-stories-right">
                     <h1 class="top-stories-heading"><%=rs.getString("naslov")%></h1>
                     <p class="author-purple"><%=rs.getString("autor")%></p>
                     <p class="gray-desc"><%=rs.getString("sadrzaj") %></p>
                </div>
            </div>
     
        <%                  
            }}
        } catch (SQLException e) {
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
        }
        %>
</div>





    <div class="komentari-container"> 
        
        <form id="komforma" action="DodajKomentar" method="POST">
        <p><input required type="text" placeholder="Komentar" name="komentar"></p>
            <p><input type="submit" value="Dodaj komentar"></p>
        </form>
        
        
        <%
        String upit2 = "select * from komentari where idnovosti='" + broj + "'";
        con = null;
        stmt = null;
        rs = null; 
        boolean postoji = false;
        try {
            con = DB.getInstance().getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(upit2); %>
            
            <%
            while (rs.next()) { %>
            <div class="komentari">
            <div>
                <img src="https://visualpharm.com/assets/387/Person-595b40b75ba036ed117da139.svg" alt=""> 
                <p id="pomjeri"> <%=rs.getString("ime")%></p>
            </div>
                <div>
                    <p> <%=rs.getString("sadrzaj") %></p>
              </div>
           
            </div>
            <%
                
                              
            } 
        } catch (SQLException e) {
            sesija.invalidate();
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
        }
        
        %>
        
   

      
    
            
          
        </div>
      
    <footer class="footer-distributed">

			<div class="footer-left">

				<h3>Company<span>logo</span></h3>

				<p class="footer-links">
					<a href="#">Home</a>
					·
					<a href="#">Blog</a>
					·
					<a href="#">Pricing</a>
					·
					<a href="#">About</a>
					·
					<a href="#">Faq</a>
					·
					<a href="#">Contact</a>
				</p>

				<p class="footer-company-name">Company Name © 2015</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>

			</div>

			<div class="footer-right">

				<p>Contact Us</p>

				<form action="#" method="post">

					<input type="text" name="email" placeholder="Email">
					<textarea name="message" placeholder="Message"></textarea>
					<button>Send</button>

				</form>

			</div>

		</footer>

<script>
    
    
        clicked = false;
const nekodugme = document.querySelector("#nekodugme");
const panel = document.querySelector("#panel");
nekodugme.addEventListener("click",()=>{
  if(!clicked) {
    panel.style.transform = "translateX(0)";
    nekodugme.style.right = "320px";
    clicked = true;
  } else {
    panel.style.transform = "translateX(100%)";
    nekodugme.style.right = "0px";
    clicked = false;
  }
})

</script>

        
    </body>
</html>