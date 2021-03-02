<%-- 
    Document   : myFormAction
    Created on : Oct 28, 2020, 4:11:51 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  
    <%@include file="header.jsp" %>
    <%
      String email = request.getParameter("email");
      String pwd = request.getParameter("pwd");
      String sql = "SELECT PersonID, firstName, lastName, status FROM person where email = ? and password = ?";
      DBConnect dbConnect = new DBConnect();
      String[] result = dbConnect.isPwdValid(sql, email, pwd);
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
          response.sendRedirect("admin.jsp");
        } else if (userType.equals("1")) {
          response.sendRedirect("customer.jsp");
        } else {
          response.sendRedirect("index.jsp");
        }
      }
    %>

   
    
 
    <%@include file="footer.jsp" %>
  
</html>
