<%-- 
    Document   : index.jsp
    Created on : Nov 30, 2020, 4:12:54 PM
    Author     : korisnik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/loginstyle.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
       <%
           
            HttpSession sesija = request.getSession();
            if(sesija.getAttribute("korisnik")!=null){
                sesija.removeAttribute("user");
                sesija.removeAttribute("editor");
                sesija.removeAttribute("admin");
            }
       
            
       %>
        
        
        <!--<form action="Login" method="POST">
            <input type="text" name="username" >
            <input type="text" name="password">
            <input type="submit" name="submit" value="Login">
            <input type="submit" name="reset" value="rest">
        </form>
            SETOVATI VRIJEDNOSTI UN i PW U BEAN
        <div>
                <a href="dodaj.jsp"> Registracija...</a>
            </div>
        -->

            <div class="login login_edit">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Dobrodošli</h2>

  <form action="Login" class="login-container" method="POST">
    <p><input id="usern" required type="text" placeholder="Username" name="username"></p>
    <p><input id="pass" required type="password" placeholder="Password" name="password"></p>
    <p><input id="submit_butt" type="submit" name="submit" value="Log in"></p>
        <a href="dodaj.jsp" id="registernowp">
    <input value="Register" placeholder="Register" id="register_now" type="button"></a>
        <br>
        <a id="quest_mode" href="maingost.jsp">Posjetite stranicu kao gost.</a>
         <p id="login-error">${(poruka != null) ? poruka : ""}</p>
         
 </form>
 
</div>

            <script>
            </script>
    </body>
</html>
