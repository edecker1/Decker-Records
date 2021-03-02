<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>
    <link rel="stylesheet" type="text/css" href="myStyle.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="validation.js"></script>
    <script src="productInfo.js"></script>
    <script>
      function preventBack() {
        window.history.forward();
      }
      setTimeout("preventBack()", 0);
      window.onunload = function () {
        null
      };
    </script>    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <% // session control
      String logged = (String) session.getAttribute("logged");
      String name = (String) session.getAttribute("name");
      String person = (String) session.getAttribute("id");
      String status = (String) session.getAttribute("type");
    %>  
      
    <div class="jumbotron-fluid">
      <br>
      <br>
      <h3 class='display-3'><img src='images/title.png' height='200' width='200'>Decker Records!<small>For all your music needs</small></h3>
      <br>
      <br>
    </div>
    
    <%
       if (logged == null){
        out.print("<div style='float:right;'><h5>Sign up for an account today!</h5></div><br><br>");
      }
       else if (logged.equals("index")){
        out.print("<div style='float:right;'><h5>Sign up for an account today!</h5></div><br><br>");
      } else {
        out.print("<div style='float:right;'><h5>Welcome, "+name+"!</h5></div><br><br>");
      }
      %>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="index.jsp">Decker Records</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="shop.jsp">Shop </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="customer.jsp">Cart</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login/Logout</a>
          </li>
          
        </ul>
        <form class="form-inline my-2 my-lg-0" action='searchAction.jsp'>
          <input class="form-control mr-sm-2" type="search" name='search' id='search' placeholder="Search" aria-label="Search">
          <select id='type' name = 'type' class="custom-select">
            <option value="Title">Title</option>
            <option value="Artist">Artist</option>
            <option value="Genre">Genre</option>
          </select>
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>
    
    

  </body>
