<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decker Records</title>
    </head>
    <body>
      <% // session control
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp");
      } else if (status.equals("0")){
          response.sendRedirect("admin.jsp");
        }
    %>
      <div class='container'>
        <h2 class='display-2'>Welcome to Decker Records!</h2>
        <br>
        <img src='images/music1.jpg' height='400' width='500'>
        <br>
        <h4>Here at Decker Records, we are dedicated to being there for all your music needs!</h4>
        <br>
        <h5>You can find any number of CD's here and get it with very fast shipping!</h5>
        <br>
        <h5>Some new releases in our shop:
          <ul>
            <li> "Your Receding Warmth" By Boundaries </li>
            <li> "Nothing Left to Love" By Counterparts</li>
          </ul>
        </h5>
        <br> 
        <br>
        <h4> Happy New Years from the Decker Records team! (01/01/2021) </h4>
      </div>
      <br>
      
        <%@include file="footer.jsp" %>
    </body>
</html>
