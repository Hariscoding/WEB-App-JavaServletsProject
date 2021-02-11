<%-- 
    Document   : mainadmin
    Created on : Dec 7, 2020, 6:44:04 PM
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="css/editorcss.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
</head>
<body>
    <% 
            HttpSession sesija = request.getSession();
            if(sesija.getAttribute("editor")==null){
                response.sendRedirect("index.jsp");
            }
            String username = "";
            korisnik k = (korisnik)sesija.getAttribute("editor");
            if(k != null){
             username = k.getUsername();
}
        %>
      <div id="panel">
          <p> USERNAME: <b><%=username%></b> </p>
          <p>Editor</p>
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
     <div id="bgscroll"></div>
    <header>
        <div class="header-overlay"> 
        </div>
        <div class="header-container"> 
            <div class="carousels carousel-bg1"></div>
            <div class="carousels carousel-bg2"></div>
            <div class="carousels carousel-bg3"></div>
            <div class="headers header-trending">
              <div class="trending-play-button">
                <i id="playButton" class="fa fa-play" aria-hidden="true"></i>
            </div>
            <h1> Progressive look to wield power in a new place: the foreign affairs committee </h1>
            <p> Haris Hrustic1 </p>
          </div>
          <div class="headers header-trending">
              <div class="trending-play-button">
                <i id="playButton" class="fa fa-play" aria-hidden="true"></i>
            </div>
            <h1> Progressive look to wield power in a new place: the foreign affairs committee </h1>
            <p> Haris Hrustic2 </p>
          </div>
          <div class="headers header-trending">
              <div class="trending-play-button">
                <i id="playButton" class="fa fa-play" aria-hidden="true"></i>
            </div>
            <h1> Progressive look to wield power in a new place: the foreign affairs committee </h1>
            <p> Haris Hrustic3 </p>
          </div>
        </div>
      </header>
  
  <div class="hamb-container">
      <div class="hamb-line"></div>
      <div class="hamb-line"></div>
      <div class="hamb-line"></div>
  </div>
   
  <div class="website-name">
      <h3>The <br> Informative_</h3> 
  </div>
  
  <div class="hamb-content">
      <div class="hamb-content-header">
          <h1> Haris&Alem </h1>
      </div>
      <div class="hamb-content-searchbar">
          <i class="fa fa-search"></i>
          <input type="search">
      </div>
      <div class="hamb-content-options">
          <a href="" class="hamb-content-links">Politics</a>
          <a href="" class="hamb-content-links">Justice</a>
          <a href="" class="hamb-content-links">National Security</a>
          <a href="" class="hamb-content-links">World</a>
          <a href="" class="hamb-content-links">Technology</a>
          <a href="" class="hamb-content-links">Environment</a>
      </div>
      <div class="hamb-content-straight-line"></div>
      <div class="hamb-content-options">
          <a href="" class="hamb-content-links">Podcasts</a>
          <a href="" class="hamb-content-links">Videos</a>
          <a href="" class="hamb-content-links">Voices</a>
      </div>
      <a href="" id="hamb-button"> Become a member </a>
      <div class="hamb-content-straight-line"></div>
      <div class="hamb-content-socials">
          <div class="socials-inside">
          <i class="fa fa-facebook"></i>
          <i class="fa fa-instagram"></i>
          <i class="fa fa-twitter"></i>
          <i class="fa fa-youtube"></i>
          </div>
          <p>All rights reserved to Haris&Alem news</p>
          <p> © Haris&Alem news</p>
      </div>
  </div>
  
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
    
  <h1 id="top_stories">Top stories</h1>
  <a id="dodajnovost" href="dodajnovost.jsp">Dodaj novost <span>+</span></a>
    <div class="news-section-trending">
        <%
        String upit = "select * from novosti";
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
             <div class="news-section-container">
            <div class="top-stories-left">
                 <a href="Novost?ID=<%=rs.getInt("idnovosti")%>"><img src="<%=rs.getString("slika")%>" alt=""></a>
             </div>
             <div class="top-stories-right">
                 <a href="Novost?ID=<%=rs.getInt("idnovosti")%>"><h1 class="top-stories-heading"><%=rs.getString("naslov")%></h1> </a>
                 <p class="author-purple"><%=rs.getString("autor")%></p>
                 <p class="gray-desc"><%=rs.getString("sadrzaj") %></p>
                 <div class="obrisi-kontainer">
                 <a class="linkovi-brisanje" href="Obrisi?ID=<%=rs.getInt("idnovosti")%>"> Izbrisi pricu: <i class="fa fa-trash" aria-hidden="true"></i> </a>
                </div>
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

        <h3>The<span>Informative_</span></h3>

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

        <p class="footer-company-name">Haris & Alem © 2020</p>

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
         
        const bgscroll = document.querySelector("#bgscroll"); 

window.onscroll = function() {skrol()};

function skrol() {
  if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
    bgscroll.style.transform = "translateX(0)";
  } else { 
    bgscroll.style.transform = "translateX(-100%)";
  }    
}
    // Hamburger menu functionality
const hamb_lines = [...document.querySelectorAll(".hamb-line")];
const hamb_container = document.querySelector(".hamb-container");
const hamb_content = document.querySelector(".hamb-content");

hamb_container.addEventListener("click", () => {
    hamb_lines[1].classList.toggle("remove_middle");
    hamb_lines[0].classList.toggle("rotate_animation_top");
    hamb_lines[2].classList.toggle("rotate_animation_bottom");
    hamb_content.classList.toggle("show_hamb_content");
    hamb_container.classList.toggle("remove_bg");
})

// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("carousels");
  var x2 = document.getElementsByClassName("headers");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
    x2[i].style.opacity = 0;
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  x2[myIndex-1].style.opacity = 1;
  setTimeout(carousel, 4000);    
}
    </script>
</body>
</html>
