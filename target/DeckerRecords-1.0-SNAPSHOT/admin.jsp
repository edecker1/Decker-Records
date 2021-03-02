<%-- 
    Document   : admin
    Created on : Feb 16, 2021, 2:07:07 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" import="myBeans.DBConnect, java.sql.ResultSet">
    <%@include file="header.jsp" %>
    <title>Admin Page</title>
  </head>
  <body>
    <% // session control
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp");
      } else if (status.equals("1")){
          response.sendRedirect("customer.jsp");
        }
    %>
    <% out.print("<div class='container'><h2>Admin Home Page <br><br><br>Welcome "+name+"!</h2></div>"); %>
    <br><br>
    <div class='container'>
      <h4>Welcome to the Admin Home Page. Below you will see links to take care of admin duties.</h4>
      <h5>Click on the 'Decker Records' button in the navigation in order to reach this page at any time.</h5>
      <br><br>
      <div class="btn-group btn-group-lg">
        <button class='btn btn-dark' onclick="document.location='adminViewOrders.jsp'">Fulfill Orders</button>
        <button class='btn btn-dark' onclick="document.location='adminUpdateStock.jsp'">Update Stock</button>
        <button class='btn btn-dark' onclick="document.location='adminAddCd.jsp'">Add New Stock</button>        
      </div>
    </div>
    
    <%@include file="footer.jsp" %>
  </body>
</html>
