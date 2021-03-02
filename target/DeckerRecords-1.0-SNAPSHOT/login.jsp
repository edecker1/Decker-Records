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
        // pass
      } else {
      // log out
      response.sendRedirect("logout.jsp");
        }
    %>
      <div class='container'>
      <h2>Login to your account below</h2>
      <br>
      <form name='login' action='loginAction.jsp' class='w3-container'>
        <div>
          <br>
          <br>
          <p>
            <label class="w3-text-black">Email:</label>
            <input class='w3-input w3-border' id='email' name='email' type="email" placeholder="Enter your email"required>
          </p>
          <p>
            <label class="w3-text-black">Password:</label>
            <input class='w3-input w3-border' id='pwd' name='pwd' type="password"  placeholder="Enter your password"required>
          </p>
        </div>       
        <div class='w3-container'>
          <button type='btnSubmit' class='btn btn-dark' >Submit</button>
          <button type='reset' class='btn btn-light'>Reset</button> 
        </div>
      </form>
      </div>
        <%@include file="footer.jsp" %>
    </body>
</html>