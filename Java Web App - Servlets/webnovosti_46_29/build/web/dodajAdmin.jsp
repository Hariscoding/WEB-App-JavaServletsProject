<%-- 
    Document   : dodaj
    Created on : Nov 12, 2020, 6:29:56 PM
    Author     : Alem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/loginstyle.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<form action="Dodavanje" method="POST">
            <input type="text" name="username">
            <input type="text" name="password">
            <input type="text" name="email">
            <input type="text" name="telefon">
            <input type="text" name="ime">
            <input type="text" name="prezime">
            
            <input type="submit" value="Dodaj korisnika">
        </form> -->
        
    <div class="login register">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">ADMIN CP - DODAJ NOVOG KORISNIKA</h2>

  <form action="DodavanjeAdmin" class="login-container" method="POST">
    <p><input required type="text" placeholder="Username" name="username"></p>
    <p><input required type="password" placeholder="Password" name="password"></p>
    <p><input required type="email" placeholder="E-mail" name="email"></p>
    <p><input required type="text" placeholder="Telefon" name="telefon"></p>
    <p><input required type="text" placeholder="Firstname" name="ime"></p>
    <p><input required type="text" placeholder="Lastname" name="prezime"></p>
    <p><input required type="text" placeholder="Uloga(Admin/user/editor)" name="uloga"></p>
   	<p><input type="submit" value="Dodaj"></p>

    <a href="controlpanel.jsp" id="registernowp2">
    <input value="Nazad" placeholder="Nazad" id="register_now2" type="button"></a>
    <p id="login-error">${(poruka != null) ? poruka : ""}</p>
  </form>
</div> 
        
    </body>
</html>
