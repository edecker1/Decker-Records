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
    <title>Search Page</title>
  </head>
    <div class='container'>
      <br>
      <h2> Your Search Results: </h2>
      <br>
    </div>
    <% 
      String type = request.getParameter("type");
      String search = request.getParameter("search");
      String sql = "SELECT Title, Artist, Genre, Date FROM `cd` WHERE "+type+"='"+search+"' ORDER BY "+type+"";
      DBConnect dbConnect = new DBConnect();
      out.print(dbConnect.search(sql, search));
    %>

    <% //out.print(dbConnect.createCart(sql)); %>
    
    <form name="productInfo" method="post" action="shopAction.jsp" id="hiddenForm">
      <input type="hidden" id="cd" name="cd"/>
    </form>
    
    <%@include file="footer.jsp" %>
  

