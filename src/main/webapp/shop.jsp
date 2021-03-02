<%-- 
    Document   : shop
    Created on : Nov 19, 2020, 4:19:50 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shop</title>
    <%@include file="header.jsp" %>
  </head>
  <body>
    <% 
      String sql = "select Title, Artist, Genre, Price, Picture, Quantity from cd order by Title, Quantity";
      DBConnect dbConnect = new DBConnect();
    %>
    <h1 class='display-2 centered'>Our CD Collection</h1>
    <table class="table table-dark table-hover">
      <%= dbConnect.createItems(sql)%> 
    </table>
    
    <form name="productInfo" method="post" action="shopAction.jsp" id="hiddenForm">
      <input type="hidden" id="cd" name="cd"/>
    </form>
    
    
    
    <%@include file="footer.jsp" %>
  </body>
</html>
