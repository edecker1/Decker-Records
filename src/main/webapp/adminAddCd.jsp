<%-- 
    Document   : admin
    Created on : Feb 16, 2021, 2:07:07 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="header.jsp" %>
    <title>Admin Page</title>
  </head>
    <% // session control
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp");
      } else if (status.equals("1")){
          response.sendRedirect("customer.jsp");
        }
    %>
    <% out.print("<div class='container'><h2>Admin Page <br><br><br>Welcome "+name+"!</h2></div>"); %>
    <br><br>
    <div class='container'>
      <h4>Welcome to the Admin Add CD Page. Below you will be able to add in new product.</h4>
      <h5>Click on the 'Decker Records' button in the navigation in order to reach the home at any time.</h5>
      <br><br>

    <%-- Add a CD to the directory --%>  
    <form name="shop" action="adminAddAction.jsp" class='container p-3 my-3 bg-dark text-white' >
      <div>
        <p>
          <label class="lead">Title:</label>
          <input class='w3-input w3-border' id='title' name='title' type="text" placeholder="Enter title of CD"required>
        </p>
        <p>
          <label class="lead">Artist:</label>
          <input class='w3-input w3-border' id='artist' name='artist' type="text" placeholder="Enter the artist of the CD"required>
        </p>
        <p>
          <label class="lead">Genre:</label>
          <input class='w3-input w3-border' id='genre' name='genre' type="text" placeholder="Enter the genre of the CD"required>
        </p>
        <p>
          <label class="lead">Date:</label>
          <input class='w3-input w3-border' id='date' name='date' type="date" placeholder="Date Released" value="2017-06-01" required>
        </p>
        <p>
          <label class="lead">Quantity:</label>
          <input class='w3-input w3-border' id='quantity' name='quantity' type="number" min='1' step='1.00' placeholder="Number in stock"required>
        </p>
        <p>
          <label class="lead">Cover Art URL:</label>
          <input class='w3-input w3-border' id='image' name='image' type="text" placeholder="Album Cover Image URL"required>
        </p>
      </div>
      
      <div class='w3-container'>
        <button type='btnSubmit' class='btn btn-light' >Submit</button>
        <button type='reset' class='btn btn-secondary'>Reset</button> 
      </div>
    </form>
    
    <%@include file="footer.jsp" %>
  </body>
</html>
