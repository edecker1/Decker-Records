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
      String cd1 = request.getParameter("cd");
      String cd = cd1.trim();
      String sql = "SELECT * FROM `cd` WHERE Title='"+cd+"'";
      DBConnect dbConnect = new DBConnect();
      
      %>
      <br><br>
      <div id='info'>
      <%
        out.print(dbConnect.createInfo(sql));
        %>
      </div>

    
    
    <%@include file="footer.jsp" %>
  