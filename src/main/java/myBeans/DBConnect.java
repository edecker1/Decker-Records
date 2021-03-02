/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import java.sql.*;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nmahadev
 */
public class DBConnect {

  // connection string
  private String driver = "com.mysql.jdbc.Driver";
  private String url = "jdbc:mysql://localhost:3306/deckerrecords";
  private String user = "mahadev";
  private String pwd = "mahadev";

  // JDBC variables and methods
  private Connection conn = null;
  private Statement stm = null;
  private Statement stm1 = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;
  private ResultSetMetaData rsmd = null;
  private ResultSet rst1 = null;
  private ResultSetMetaData rsmd1 = null;

  //method to connect to database
  private String openDB() {
    String message = "Opened";
    try {
      Class.forName(driver); // loads the driver into memory.
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
      stm1 = conn.createStatement();
    } catch (Exception e) {
      return e.getMessage();
    }
    return message;
  }

  private String closeDB() {
    String message = "Closed";
    try {
      stm.close();
      conn.close();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }

  // method to execute update
  public String updateDB(String sql, String print) {
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        closeDB();
        if (print.equals("yes")){
          return "<div class='container'><h5>Update is Successful</h5></div>";   
        }
        return "";
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  // method for displaying query results as an HTML table.  Has HTML code for 
  // what goes between the <table> tags.
  public String createHTMLTable(String sql) {
    String html = "<div class='container'><table class='table table-dark table-hover'>";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        html += "<thead><tr>";
        for (int i = 1; i <= count; i++) {
          html += "<td>" + rsmd.getColumnName(i) + "</td>";
        }
        html += "</tr></thead>";

        html += "<tbody>";
        while (rst.next()) {
          html += "<tr>";
          for (int i = 1; i <= count; i++) {
            html += "<td>" + rst.getString(i) + "</td>";
          }
          html += "</tr>";
        }
        html += "</tbody></div></table>";
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }

  }
  
    // Business logic: Method to verify password. Avoids SQL injection
  // Returns the column values requested in a array of Strings.
  public String[] isPwdValid(String sql, String user, String pwd) {
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        pstm = conn.prepareStatement(sql);
        pstm.setString(1, user);
        pstm.setString(2, pwd);
        rst = pstm.executeQuery();
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        String[] result = new String[count];
        int records = 0;
        while (rst.next()) {
          records++;
          for (int i = 0; i < count; i++) {
            result[i] = rst.getString(i + 1);
          }
        }
        closeDB();
        if (records == 0) {
          result[0] = "Error: Invalid Credentials";
        }
      return result;
      } catch (Exception e) {
        String[] result = new String[1];
        result[0] = "Error: " + e.getMessage();
        return result;
      }
    } else {
      String[] result = new String[1];
      result[0] = "Error: " + message;
      return result;
    }
  }
  
  // Method to create a drowdown list of the query.  Has HTML code to go between 
  // the <select> tag in HTML.  First column represents
  // the values and the the rest the list elements
  public String createHTMLDropdown(String sql) {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        while (rst.next()) {
          html += "<option value='"+rst.getString(1)+"'>";
          for (int i=2; i <= count; i++)
            html += rst.getString(i)+" ";
          html += "</option>";
        }
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
  
  // method for displaying query results as an HTML table.  Has HTML code for 
  // what goes between the <table> tags.
  public String createCDTable(String sql) {
    String html = "<div class='container'><table class='table table-dark table-hover'>";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        html += "<thead><tr>";
        for (int i = 1; i <= count; i++) {
          html += "<td>" + rsmd.getColumnName(i) + "</td>";
        }
        html += "</tr></thead>";

        html += "<tbody>";
        while (rst.next()) {
          html += "<tr>";
          for (int i = 1; i <= count; i++) {
            String inventory = rst.getString(i);
            String columnName = rsmd.getColumnName(i);
            if (columnName.equals("Title")){
              String title = inventory;
              inventory = "<button class='btn btn-dark' onclick='setProduct(\" "+title+" \")' > " + title + " </button>";
            }
            // Check if inventory is sold out
            if (inventory.equals("0")) {
              inventory = "<span style='color:red;'>Sold Out</span>";
            }
            html += "<td>" + inventory + "</td>";
          }
          html += "</tr>";
        }
        html += "</tbody></table></div>";
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }

  }
  
  public String addToCart(String id, String title, int quantity){
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT * FROM `cd` WHERE Title='"+title+"'";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        
        String cdID="";
        while (rst.next()){
          cdID = rst.getString("CD_ID");
        }
        
        String sql2 = "SELECT * FROM `cart` WHERE `CD_ID`='"+cdID+"' AND `PersonID`='"+id+"'";
        rst = stm.executeQuery(sql2);
        
        String sql3;
        if (!rst.isBeforeFirst()){
          // This means there is no data aka not in the cart
          sql3 = "INSERT INTO `cart` VALUES (NULL, "+id+","+cdID+","+quantity+")";
        } else {
          // This means it does exist so simply update it data
          int total=0;
          while (rst.next()){
            int currentQ = rst.getInt("Number");
            total = currentQ + quantity;
          }
          sql3 = "UPDATE `cart` SET Number ="+total+" WHERE PersonID="+id+" AND CD_ID="+cdID+"";
        }
        stm.executeUpdate(sql3);
        
        html += "<div class='container'><p>Added to cart successfully!</p></div>";
        

        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
  
  public String createItems(String sql) {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        
        List<Item> items = new ArrayList<>();
        
        while (rst.next()) {
          String artist = rst.getString("Artist");
          String title = rst.getString("Title");
          String genre = rst.getString("Genre");
          String price = rst.getString("Price");
          String image = rst.getString("Picture");
          String quantity = rst.getString("Quantity");
          
          Item temp = new Item(title, artist, genre, price, image, quantity);
          items.add(temp);
        }
        
        for (Item i : items) {
          String x = i.quantity;
          // If it is sold out
          if (x.equals("0")){
            html += "<br><div class='container p-3 my-3 bg-light text-dark'> <img src='"+i.imageURL+"' alt='No Image Available' width='200' height='200'> "
                    + "<br><p><button class='btn btn-dark' onclick='setProduct(\" "+i.title+" \")' > " + i.title + " </button> </p>"
                    + "<h6> " + i.artist + " </h6> "
                    + "<p> " + i.genre + " </p> "
                    + "<p> $" + i.price + "</p> "
                    + "<p style='color:red; text-decoration:underline;'>SOLD OUT</p> "
                    + "</div>";
          } else { // If it is not sold out
            html += "<br><br><div class='container p-3 my-3 bg-light text-dark'> <img src='"+i.imageURL+"' alt='No Image Available' width='200' height='200'> "
                    + "<p><br><button class='btn btn-dark' onclick='setProduct(\" "+i.title+" \")' > " + i.title + " </button></p> "
                    + "<h6> " + i.artist + " </h6> "
                    + "<p> " + i.genre + " </p> "
                    + "<p> $" + i.price + "</p> "
                    + "<p style='color:green; text-decoration:underline;'>In Stock</p> "
                    + "</div>";
          }
        }
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
  
   public String createInfo(String sql) {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        String artist = "";
        String title = "";
        String genre = "";
        String price = "";
        String image = "";
        String quantity = "";
        String date = "";
        int number = 0;
        while (rst.next()){
          artist = rst.getString("Artist");
          title = rst.getString("Title");
          genre = rst.getString("Genre");
          price = rst.getString("Price");
          image = rst.getString("Picture");
          quantity = rst.getString("Quantity");
          number = rst.getInt("Quantity");
          date = rst.getString("Date");
        }
        
        html += "<div class='container'> <img src='"+image+"' alt='No Image Available' width='400' height='400'>"
                + "<h2>"+title+"</h2>"
                + "<h3>"+artist+"</h3>"
                + "<h5>Genre: "+genre+"</h5>"
                + "<br><h6>Released: "+date+"</h6>"
                + "<br><h6>$"+price+"</h6>";
        if (quantity.equals("0")){
          html += "<h4 style='color:red;'> SOLD OUT</h4></div>";
        } else if (quantity.equals("1")) {
          html += "<h5 style='color:yellow;'>"+quantity+" left</h4>"
                  + "<form action='productInfoAction.jsp'>"
                  + "<label for='cd'>Add to Cart: </label>"
                  + "<select name='amount' id='amount'>"
                  + "<option value='1'>1</option></select><input type='hidden' name='title' id='title' value='"+title+"'><br><br>"
                  + "<input type='submit' value-'Submit'> </form></div>";
        }else {
          int counter = 1;
          html += "<h5 style='color:green;'>"+quantity+" left</h4>"
                  + "<form action='productInfoAction.jsp'>"
                  + "<label for='amount'>Add to Cart: </label>"
                  + "<select name='amount' id='amount'>";
          while (counter <= number){
            html += "<option value='"+counter+"'>"+counter+"</option>";
            counter += 1;
          }
          html += "</select> <input type='hidden' name='title' id='title' value='"+title+"'><input type='submit' value-'Submit'> </form></div>";
        }
          
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
   
   private String calculateTax(double amount){
     double added = amount * 0.0625;
     double total = amount + added;
     DecimalFormat df = new DecimalFormat("0.00"); 
     return df.format(total);
   }
   public String createCart(String sql) {
    String html = "<div class='container'><table class='table table-dark table-hover'>";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        html += "<thead><tr>";
        for (int i = 1; i <= count; i++) {
          html += "<td>" + rsmd.getColumnName(i) + "</td>";
        }
        html += "</tr></thead>";

        html += "<tbody>";
        double total=0.00;
        while (rst.next()) {
          html += "<tr>";
          for (int i = 1; i <= count; i++) {
            String columnName = rsmd.getColumnName(i);
            if (columnName.equals("Price")){
              String price = "$" + rst.getString(i);
              html += "<td>" + price + "</td>";
            } else {
              if (columnName.equals("Number")){
                int numb = rst.getInt(i);
                total += ((double)numb * 9.99);
              }
              html += "<td>" + rst.getString(i) + "</td>";
            }
          }
          html += "</tr>";
        }
        String cartTotal = calculateTax(total);
        html += "</tbody></table><br><h4>Your total is: $" + cartTotal + "</h4><form action='checkoutAction.jsp'><button type='btnSubmit' class='btn btn-dark'>Checkout</button></form></div>";
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }

  }
   
   public String search(String sql, String searched) {
    String message = openDB();
    String html = "";
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        if (!rst.isBeforeFirst()){
          // This means there is no data aka not in the cart
          html += "<div class='container'><br><h4>Nothing matched your search of '"+searched+"'!</h4></div>";
        } else {
          html = createCDTable(sql);
        }
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }

  }
   
   public String checkout(String id) {
    String message = openDB();
    String html = "";
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT `CD_ID`, `Number` FROM `cart` WHERE PersonID="+id+"";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        String orderID = "";
        if (!rst.isBeforeFirst()){
          // This means there is no data aka not in the cart
          html += "<div class='container'><br><h4>Nothing was in your cart!</h4></div>";
        } else {
          List<Integer> items = new ArrayList<>(); 
          List<Integer> quant = new ArrayList<>();
          while (rst.next()){
            int temp = rst.getInt("CD_ID");
            int temp2 = rst.getInt("Number");
            items.add(temp);
            System.out.println("Cd_ID is " + temp);
            quant.add(temp2);
            System.out.println("Quanity is " + temp2);
          }
          LocalDate localDate = LocalDate.now();//For reference
          DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
          String formattedString = localDate.format(formatter);
          String sql1 = "INSERT INTO `onlineorder` VALUES (NULL, '"+formattedString+"', 'Recieved', "+id+")";
          stm.executeUpdate(sql1);
          String sql2 = "SELECT OrderID FROM `onlineorder` WHERE Recieved='"+formattedString+"' AND PersonID="+id+" ";
          rst = stm.executeQuery(sql2);
          while (rst.next()){
            orderID = rst.getString("orderID");
            System.out.println("Order ID is " + orderID);
          }
          int i=0;
          while (i < items.size()){       
              String sql4 = "INSERT INTO `itemorder` "
                      + "VALUES (NULL,"+items.get(i)+","+orderID+","+quant.get(i)+")";
              System.out.println(sql4);
              stm.executeUpdate(sql4);
              String sql5 = "DELETE FROM `cart` WHERE `CD_ID`="+items.get(i)+" AND `PersonID`="+id+"";
              stm.executeUpdate(sql5);
              System.out.println(sql5);
              String sql6 = "UPDATE `cd` SET `Quantity`=(Quantity-"+quant.get(i)+") WHERE CD_ID="+items.get(i)+"";
              stm.executeUpdate(sql6);
              System.out.println(sql6);
              i += 1;
          }
          html += "<div class='container'><h4>You have successfully checked out!</h4></div>";
        }
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
   
   public String pastOrders(String id) throws SQLException {
    String message = openDB();
    String html = "<div class='container'>";
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT OrderID FROM `onlineorder` WHERE PersonID="+id+"";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        if (!rst.isBeforeFirst()){
          // This means there is no data aka not in the cart
          html += "<div class='container'><br><h4>You have no previous orders!</h4></div>";
        } else {
          List<String> items = new ArrayList<>(); 
          while (rst.next()){
            String temp = rst.getString("OrderID");
            items.add(temp);
          }
          int x = 1;
          for (String i : items){
            String sql2 = "SELECT `Title`, `Artist`, itemorder.Quantity, `Status`"
              + "FROM ((`onlineorder` "
              + "INNER JOIN `itemOrder` ON onlineorder.OrderID = itemorder.OrderID) "
              + "INNER JOIN `cd` ON cd.CD_ID = itemorder.CD_ID) "
              + "WHERE PersonID="+id+" AND itemorder.OrderID="+i+"";
            String sql3 = "SELECT `Recieved` FROM `onlineorder` WHERE OrderID="+i+"";
            rst = stm.executeQuery(sql3); // Get date
            String time="";
            while (rst.next()){
              time = rst.getString("Recieved");
            }; 
            html += "<br><div class='container'><h4>Order #"+x+": "+time+"</h4>";
            x += 1;
            
            // Table Creation
            
            html += "<table class='table table-dark table-hover'>"; 
            rst1 = stm1.executeQuery(sql2);
            rsmd1 = rst1.getMetaData();
            int count = rsmd1.getColumnCount();
            html += "<thead><tr>";
            for (int j = 1; j <= count; j++) {
              html += "<td>" + rsmd1.getColumnName(j) + "</td>";
            }
            html += "</tr></thead>";

            html += "<tbody>";
            while (rst1.next()) {
              html += "<tr>";
              for (int j = 1; j <= count; j++) {
                html += "<td>" + rst1.getString(j) + "</td>";
              }
              html += "</tr>";
            }
            html += "</tbody></div></table>"; 
            html += "</div>";
          }
          // End table
          html += "</div>"; // End Order div
        }
        closeDB();
        return html;
      } catch (Exception e) {
        return e.getMessage();
      } finally {
        if (rst != null){
          rst.close();
        }
      }
    } else {
      return message;
    }
  }
   
   public String updateStockForm() {
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String html = "<div class='container'><form method='post' action='adminUpdateAction.jsp'>"
            + "<label for='quantity'>Quantity: </label>"
            + "<input type'number' id='quantity' name='quantity' min='1' max='50'>"
            + " <select id='title' name='title' >";
        String sql = "SELECT `Title` FROM `cd`";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        while (rst.next()) {
          html += "<option value='"+rst.getString("Title")+"'>";
          html += rst.getString("Title");
          html += "</option>";
        }
        html += "</select>"
                + "<br><br><button type='btnSubmit' class='btn btn-dark' >Submit</button>"
                + "</form></div>";
        closeDB();
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
   
   public String viewOrders() {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        html += "<br><div class='container'><table class='table table-dark table-hover'>";
        
        String sql = "SELECT `OrderID`, `firstName`, `lastName`, onlineorder.Recieved, onlineorder.Status "
                + "FROM onlineorder "
                + "INNER JOIN person ON person.PersonID = onlineorder.PersonID "
                + "WHERE onlineorder.Status='Recieved'";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        System.out.println("Count is " + count);
        html += "<thead><tr>";
        for (int i = 1; i <= count; i++) {
          html += "<td>" + rsmd.getColumnName(i) + "</td>";
        }
        html += "</tr></thead>";
          
        html += "<tbody>";
        List<String> items = new ArrayList<>();
        while (rst.next()) {
          html += "<tr>";
          for (int i = 1; i <= count; i++) {
            String columnName = rsmd.getColumnName(i);
            if (columnName.equals("OrderID")){
              String temp = rst.getString(i);
              items.add(temp);
            }
            html += "<td>" + rst.getString(i) + "</td>";
          }
          html += "</tr>";
        }
        html += "</tbody> </table></div>"; // All tables of orders
        html +="<br><br><br><div='container'><h4>Would you like to update any of the orders status?<h4><br><br>";
        
        html += "<form action='adminOrderAction.jsp'><select name='orderID'>";
        for (String i : items){
          html += "<option value='"+i+"'>Order #"+i+""
                  + "</option>";
        }
        html += "</select><select name='action'><option value='Fulfilled'>Fulfilled</option>"
                + "<option value='Cancelled'>Cancelled</option>"
                + "</select>"
                + "<button type='btnSubmit' class='btn btn-dark' >Submit</button>"
                + "</form></div><br>";
        
        closeDB();
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
}

