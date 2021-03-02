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
        response.sendRedirect("welcome.jsp");
      }
    %>
      <div class='container'>
        <h2 class='display-2'>Welcome to Decker Records!</h2>
        <br>
        <div class='centered'>
        <img src='images/music1.jpg' height='400' width='500'>
        <br>
        <br>
        <br>
        <h4>Here at Decker Records, we are dedicated to being there for all your music needs!</h4>
        <br>
        <h5>You can find any number of CD's here and get it with very fast shipping!</h5>
        <br>
        <br>
        <br>
        </div>
        <h5>You will get numerous benefits if you sign up for an account today! Some benefits include:
          <br>
          <ul>
            <li> Ability to view orders. </li>
            <li> Track your shipments </li>
            <li> Save your shopping cart for later
          </ul>
        </h5>
   
        <br> 
        <br>
        <br>
      </div>
      <div class="container p-3 my-3 bg-dark text-white">
        <h4>Sign up for an account today to track you order!</h4>
        <h6>If you already have an account, click <a href="login.jsp">here</a></h6>
      <form name='myForm' action='myFormAction.jsp' class='w3-container'>
        <div>
          <br>
          <br>
          <br>
          <p>
            <label class="w3-text-white">First Name:</label>
            <input class='w3-input w3-border' id='first' name='first' type="text" placeholder="Enter First Name Here"required>
          </p>
          <p>
            <label class="w3-text-white">Last Name:</label>
            <input class='w3-input w3-border' id='last' name='last' type="text" placeholder="Enter Last Name Here"required>
          </p>
          <p>
            <label class="w3-text-white">Phone Number:</label>
            <input class='w3-input w3-border' id='phone' name='phone' type="tel" placeholder="Enter Your Phone Number here"required>
          </p>
          <p>
            <label class="w3-text-white">Email:</label>
            <input class='w3-input w3-border' id='email' name='email' type="email" onInput='validateEmail()' placeholder="Enter Email Here (a Gmail account required)"required>
          </p>
          <p>
            <label class="w3-text-white">Confirm Email:</label>
            <input class='w3-input w3-border' id='email2' name='email2' type="email" onInput='validateEmail2()' placeholder="Confirm your email here!"required>
          </p>
          <p>
            <label class="w3-text-white">Password:</label>
            <input class='w3-input w3-border' id='pwd' name='pwd' type="password"  onchange='validatePWD()'placeholder="Must be 8 or more characters, have a number and a special character. Cannot include your name."required>
          </p>
          <p>
            <label class="w3-text-white">Confirm Password:</label>
            <input class='w3-input w3-border' id='pwd2' name='pwd2' type="password" onchange='validatePWD2()' placeholder="Confirm Password Here"required>
          </p>
        </div>
        
        <div class='w3-container'>
          <button type='btnSubmit' class='btn btn-secondary' onclick='validate()'>Submit</button>
          <button type='reset' class='btn btn-light'>Reset</button> 
        </div>
      </form>
      </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
