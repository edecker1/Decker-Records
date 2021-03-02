<%-- 
    Document   : shopAction
    Created on : Feb 16, 2021, 2:07:19 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="header.jsp" %>
    <title>Product Info</title>
  </head>

    
    <%
      if (person != null){
        String amount = request.getParameter("amount");
        int num = Integer.parseInt(amount);
        String cd1 = request.getParameter("title");
        String id1 = person.trim();
        out.print("You chose to add " + amount + " copies of "+cd1+" to your cart");
        DBConnect dbConnect = new DBConnect();
        out.print(dbConnect.addToCart(id1, cd1, num));
        String sql = "SELECT Title, Price, Number FROM cd INNER JOIN cart ON cart.CD_ID = cd.CD_ID WHERE PersonID='"+id1+"'";
        out.print(dbConnect.createCart(sql));
      } else {
        response.sendRedirect("index.jsp?NeedtobeLoggedIn");
      }
      
      %>



    
    <%@include file="footer.jsp" %>
  