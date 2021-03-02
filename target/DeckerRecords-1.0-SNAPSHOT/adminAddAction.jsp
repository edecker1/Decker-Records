<%-- 
    Document   : addCD
    Created on : Nov 19, 2020, 4:21:56 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >

  </head>
  <body>
    <%@include file="header.jsp" %>
    <% 
    String title = request.getParameter("title"); 
    String genre = request.getParameter("genre"); 
    String date = request.getParameter("date"); 
    String artist = request.getParameter("artist");
    String quantity = request.getParameter("quantity");
    String image = request.getParameter("image");
    String sql = "insert into cd values (0, '" + artist + "', '" + genre + "', '"
              + date + "', '9.99', '"+quantity+"', '" + image + "', '"+title+"')";
    String sql2 = "select Title, Artist, Genre, Date, Price, Quantity from cd";
    DBConnect dbConnect = new DBConnect();
    %>
    <h2><%= dbConnect.updateDB(sql, "yes")%></h2>
    <div class='container'>
      <br><br>
      <h2 class='display-3'>We have the following CD's:</h3>
    </div>
    <br>
    <table class="table table-dark table-hover">
         <%= dbConnect.createHTMLTable(sql2)%>   
    </table>


    <%@include file="footer.jsp" %>
  </body>
</html>
