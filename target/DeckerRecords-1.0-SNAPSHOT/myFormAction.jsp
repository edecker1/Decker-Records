<%-- 
    Document   : myFormAction
    Created on : Oct 28, 2020, 4:11:51 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  <body>
    <%@include file="header.jsp" %>
    <% 
      String first = request.getParameter("first");
      String last = request.getParameter("last"); 
      String phone = request.getParameter("phone");
      String email = request.getParameter("email"); 
      String pwd = request.getParameter("pwd"); 
      out.print("<div class='container'><h2>Welcome "+first+" "+last+"! <br><br> Your account information will be sent to "+email+" !</h2>");
      out.print("<br><h3> Keep your password safe! </h3></div>");
      
      String sql = "insert into person values (0, '"+first+"', '"+last+"', '"+phone+"', '"+email+"', '"+pwd+"', 1)";
      String sql2 = "select PersonID, firstName, lastName, phone, email, password from person";
      DBConnect dbConnect = new DBConnect();
      dbConnect.updateDB(sql, "no");
      
      String sql1 = "SELECT PersonID, firstName, lastName, status FROM person where email = ? and password = ?";
      String[] result = dbConnect.isPwdValid(sql1, email, pwd);
      if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
        session.setAttribute("logged", "index");
        response.sendRedirect("index.jsp?error='" + result[0] + "'");
        out.print("Invalid login credentials!");
      } else {
        String personIDcheck = result[0];
        String userName = " " + result[1] + " " + result[2];
        String userType = result[3];
        session.setAttribute("logged", userType);
        session.setAttribute("id", personIDcheck);
        session.setAttribute("name", userName);
        session.setAttribute("type", userType);
        if (userType.equals("0")) {
          out.print("You have signed up for an admin account.");
        } 
      }
      
    %>
    <br>


    <br><br>
    <div class='container'>
      <br><br>
      <h2 class='display-3'>Thank you for signing up!</h3>
      <br>
      <h4>Your benefits include:</h4>
      <br>
      <ul>
        <br>
        <li>Free shipping when ordering from our website!</li> <br>
        <li>Get points for your purchases!</li><br>
        <li>Track your receipts!</li><br>
        <li>Ability to rate the albums and provide recommendations to others!</li> <br>
      </ul>
      <br>
    </div>
    <%@include file="footer.jsp" %>
  </body>
</html>
