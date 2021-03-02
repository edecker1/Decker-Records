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
    <title>Checkout</title>
  </head>
  <% // session control
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp?Error=MustBeLoggedIn");
      }
    %>

    
    <%
      DBConnect dbConnect = new DBConnect();
      out.print(dbConnect.checkout(person));
      
      %>

    
    <%@include file="footer.jsp" %>
  