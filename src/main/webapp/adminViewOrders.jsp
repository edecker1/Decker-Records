<%-- 
    Document   : admin
    Created on : Feb 16, 2021, 2:07:07 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <% out.print("<div class='container'><h2>Admin Page <br><br><br>Welcome "+name+"!</h2></div>"); %>
    <br><br>
    <div class='container'>
      <h4>Welcome to the Admin Pages. Below you can view orders that need to be fulfilled.</h4>
      <h5>Click on the 'Decker Records' button in the navigation in order to reach the home page at any time.</h5>
      <br><br>
      
      <%
        DBConnect dbConnect = new DBConnect();
        out.print(dbConnect.viewOrders());
        %>
    </div>
    
    <%@include file="footer.jsp" %>
  </body>
</html>
