<%-- 
    Document   : dodajnovost
    Created on : Dec 14, 2020, 7:09:04 PM
    Author     : korisnik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/dodajpricu.css" rel="stylesheet" type="text/css">
           <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Orbitron">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
    <section id="top">
      <img src="https://lh3.googleusercontent.com/proxy/e0yLAAuyQBW-SVwZ05gCqjtIDj6mkdBdEnZMoPjUm3zkTm8PTIo_gszT2TYuxPp_NuY8N0mJqwl2fzvtQ5nw7OMuhkNPrT2rdLR3GKMru5Y8G4tvvYMSDs3E0ItQVo7HDkJ5nMImdAA" alt="Form A Story Logo">
    </section>

    <section id="main">
      <h1>DODAJ PRICU</h1>
      <hr>
      <!--Add your form below:-->
      <form action="DodajNovost" method="POST">
        <!--Text entry-->
        <label id="naslovid" for="naslov">Naslov:</label>
        <input id="naslov" type="text" name="naslov" placeholder=
"" required>
        <br>
        <label for="autor">Autor:</label>
        <input id="autor" type="text" name="autor" placeholder="" required>
        <br>
        <label for="slikaurl">Slika (url):</label>
        <input id="slikaurl" type="text" name="slikaurl" required minlength="3">
        <br>
        <label for="sadrzaj">Sadrzaj price:</label>
        <textarea name="sadrzaj" id="message" rows="8" cols="40" required></textarea>
        <br>
        <input id="dodajpricu" type="submit" value="Dodaj pricu">
      </form>
    </section>
        <p id="login-error">${(poruka != null) ? poruka : ""}</p>
  </body>
</html>
    </body>
</html>