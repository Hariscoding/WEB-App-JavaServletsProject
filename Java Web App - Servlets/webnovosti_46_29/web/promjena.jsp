<%-- 
    Document   : promjena
    Created on : Nov 12, 2020, 6:35:07 PM
    Author     : Merisa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Izmjena" method="POST">
            <input type="text" name="username" value="${korisnik.username}">
            <input type="text" name="password" value="${korisnik.password}">
            <input type="text" name="email" value="${korisnik.email}">
            <input type="text" name="telefon" value="${korisnik.telefon}">
            <input type="text" name="ime" value="${korisnik.ime}">
            <input type="text" name="prezime" value="${korisnik.prezime}">
            
            <input type="submit" value="Izmijeni">
        </form>
    </body>
</html>
