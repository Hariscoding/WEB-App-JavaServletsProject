<%-- 
    Document   : izmjena
    Created on : Dec 13, 2020, 2:15:27 PM
    Author     : korisnik
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
  
  <h2 class="login-header">ADMIN CP - IZMJENA KORISNIKA</h2>

  <form action="Izmjena" class="login-container" method="POST">
       <p><input required type="text" placeholder="ID korisnika" name="id"></p>
    <p><input required type="text" placeholder="Novi username" name="username"></p>
    <p><input required type="password" placeholder="Novi password" name="password"></p>
    <p><input required type="email" placeholder="Novi E-mail" name="email"></p>
    <p><input required type="text" placeholder="Novi telefon" name="telefon"></p>
    <p><input required type="text" placeholder="Novo ime" name="ime"></p>
    <p><input required type="text" placeholder="Novo prezime" name="prezime"></p>
    <p><input required type="text" placeholder="Nova uloga (Admin/user/editor)" name="uloga"></p>
    <p><input required type="text" placeholder="Status (Aktivan/neaktivan)" name="status"></p>
    <p id="login-error">Ukoliko je status neaktivan, korisnik nece imati pristup stranici.</p>
   	<p><input type="submit" value="Edit"></p>

    <a href="controlpanel.jsp" id="registernowp2">
    <input value="Nazad" placeholder="Nazad" id="register_now2" type="button"></a>
    <p id="login-error">${(poruka != null) ? poruka : ""}</p>
  </form>
</div> 
        
    </body>
</html>
