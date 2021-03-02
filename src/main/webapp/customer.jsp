<%-- 
    Document   : customer
    Created on : Feb 16, 2021, 2:07:19 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="header.jsp" %>
    <title>Customer Page</title>
  </head>
    <% // session control
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp?NeedtobeLoggedIn");
        out.print("Must be logged in to view cart!");
      }
    %>
    <% 
      out.print("<div class='container'><h2>Welcome "+name+"! <br><br><br> Here is your cart!</h2></div>");
      DBConnect dbConnect = new DBConnect();
      String id1 = "";
      if (person != null){
        id1 = person.trim();
      }
      String sql = "SELECT Title, Price, Number FROM cd INNER JOIN cart ON cart.CD_ID = cd.CD_ID WHERE PersonID='"+id1+"'";
    %>

    <% out.print(dbConnect.createCart(sql)); %>
    
    <%
      out.print("<br><br><div class='container'><h4>Here is your order history:</h4></div>");
      out.print(dbConnect.pastOrders(id1));
      %>

</div>
    <%@include file="footer.jsp" %>
  

