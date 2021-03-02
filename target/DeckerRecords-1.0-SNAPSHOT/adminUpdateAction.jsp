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
    <br><br>
    <div class='container'>
      <h4>Welcome to the Admin Pages. Below you can add stock to any of the CD's in our store.</h4>
      Click on the 'Decker Records' button in the navigation in order to reach the home page at any time.
      <br><br>
      <%
        String title = request.getParameter("title"); 
        String amount = request.getParameter("quantity");
        int num = Integer.parseInt(amount);
        String sql = "UPDATE `cd` SET Quantity=(Quantity + "+num+") WHERE Title='"+title+"'";
        DBConnect dbConnect = new DBConnect();
        out.print(dbConnect.updateDB(sql, "yes"));
        
        %>

    </div>
    <%@include file="footer.jsp" %>
  </body>
</html>
