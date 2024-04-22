<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%
int uid = (int)(session.getAttribute("uid"));
int orid = Integer.parseInt(request.getParameter("orid"));
int ocid = Integer.parseInt(request.getParameter("ocid"));
int seats = Integer.parseInt(request.getParameter("seats"));
double totalPrice=Double.parseDouble(request.getParameter("totalPrice"));
String PaymentStatus="Pending";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
sdf.setTimeZone(TimeZone.getTimeZone("Your_Time_Zone"));
int bi=0;
//Get the current date and time
Date currentDate = new Date();

//Format the current date and time
String bookingDate = sdf.format(currentDate);




try {
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
    // Prepare the SQL statement with auto-generated keys
    String sql = "INSERT INTO bookings (UserID, OccurrenceID, BookingDate, TotalPrice, PaymentStatus) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

    // Set values for parameters
    statement.setInt(1, uid);
    statement.setInt(2, ocid);
    statement.setString(3, bookingDate);
    statement.setDouble(4, totalPrice);
    statement.setString(5, PaymentStatus);

    // Execute the SQL statement
    int affectedRows = statement.executeUpdate();

    if (affectedRows == 1) {
        // Retrieve the generated keys
        ResultSet generatedKeys = statement.getGeneratedKeys();
        if (generatedKeys.next()) {
            bi = generatedKeys.getInt(1);
            
        } else {
            System.err.println("Failed to retrieve BookingID.");
        }
    } else {
        System.err.println("Failed to insert booking record.");
    }

    String sql2 = "SELECT AvailableCapacity FROM activityoccurrences WHERE OccurrenceID=?";
    PreparedStatement pstmt2 = conn.prepareStatement(sql2);
    pstmt2.setInt(1, ocid);
    ResultSet rs2 = pstmt2.executeQuery();

    int ac = 0;
    if (rs2.next()) {
        ac = rs2.getInt("AvailableCapacity"); // Assuming the column name is AvailableCapacity
    }
    ac = ac - seats;

    String sql3 = "UPDATE activityoccurrences SET AvailableCapacity=? WHERE OccurrenceID=?";
    PreparedStatement pstmt3 = conn.prepareStatement(sql3);
    pstmt3.setInt(1, ac);
    pstmt3.setInt(2, ocid);
    int updatedRows = pstmt3.executeUpdate(); // Use executeUpdate for UPDATE queries

    
    // Close resources
    statement.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}

session.setAttribute("bookid", bi);
session.setAttribute("seats", seats);



%>






<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Participant Details</title>
  <link rel="stylesheet" href="other_res/book3.css">
</head>
<header>
    +
  <div class="navbar">
      <div class="nav-logo border">
          <div class="logo" >
              <h2>ThrillTrek</h2>
          </div>
      </div>

      <div class="nav-search">
          
          </select>
          <input placeholder="   search Trek locations" class="search-input ">
          <div class="search-icon" >
              <i class="fa-solid fa-magnifying-glass-location"></i>
          </div>
      </div>

      <div class="nav-signin border">
          <p><span>Hello,sign in</span>
          <p class="nav-second">Your profile</p>
      </div>

      <div class="nav-return border">
          <p><span>Cancellation &</span></p>
          <p class="nav-second">Booking policy</p>
      </div>

      <div class="nav-cart border">
          <i class="fa-solid fa-person-hiking"></i>
          <p>Cart</p>
      </div>
  </div>

  <div class="panel">
      <div class="panel1 border">
      </div>
      <div class="panel-ops">
          <div class="panel1 deals border">Trending Destinations</div>
          <div class="panel1 camp border">Camping<%=bi %></div>
          <div class="panel1 trek border">Treking </div>
          <div class="panel1 trek border">Scuba Diving</div>
          <div class="panel1 trek border">Rappelling</div>
       </div>
  </div>

</header>
<body>
  <div class="container">
    <h2>Participant details</h2>
    <form action="book4.jsp" method="post">
        <div id="participants">
            <% for(int i = 1; i <= seats; i++) { %>
                <h3>Participant <%= i %> details</h3>
                <br>
                <div class="form-group">
                    <label for="gender<%= i %>">Gender </label>
                    <select id="gender<%= i %>" name="gender<%= i %>">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="fullName<%= i %>">Full name </label>
                    <input type="text" id="fullName<%= i %>" placeholder="Name" name="fullName<%= i %>">
                </div>
                <div class="form-group">
                    <label for="dob<%= i %>">Date of Birth </label>
                    <input type="date" id="dob<%= i %>" name="dob<%= i %>">
                </div>
                <div class="form-group">
                    <label for="phone<%= i %>">Phone </label>
                    <input type="tel" id="phone<%= i %>" placeholder="Phone number" name="phone<%= i %>">
                </div>
                <br><br>
            <% } %>
        </div>
        <button id="submitBtn" type="submit">Submit</button>
    </form>
</div>


  <!-- <script src="script.js"></script> -->
</body>
<footer>
  <div class="foot-panel1">
      <a href="#">Back to Top</a>
  </div> 
  <div class="foot-panel2">
   <ul>
      <a href="#"> <p>About Us</p></a>
       
   </ul>

   <ul>
      <a href="#"> <p>Connect us</p></a>

   </ul>

   <ul>
      <a href="#">  <p>Cancellation Policy</p></a>

   </ul>

   <ul>
      <a href="#">  <p>Privacy Policy</p></a>
       
   </ul>
   
  </div>
  


  <div class="foot-panel4">
   <div class="pages">
       <p>Thrilltrack</p>
       <br/>
   </div>
   <div class="copyright">
       © 1996-2024, Thrilltrack.com, Inc. or its affiliates
   </div>
  </div>
</footer>

  

</html>

