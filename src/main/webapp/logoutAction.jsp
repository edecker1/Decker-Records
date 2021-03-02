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
    <title>Log Out</title>
  </head>
  <%
      session.setAttribute("logged", "index");
      session.setAttribute("name", "null");
      session.setAttribute("person", "null");
      response.sendRedirect("index.jsp");
    %>
    
    <%@include file="footer.jsp" %>