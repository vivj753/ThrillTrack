<%@ page import="java.sql.*" %>


<%

Connection con=null;
ResultSet rs=null;


int uid = (int)(session.getAttribute("uid"));
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
String sql="SELECT b.BookingID,b.BookingDate, a.ThumbnailURL, a.Title, a.Location, ao.OccurrenceTime, ao.OccurrenceDate, ao.ActivityID, b.TotalPrice, b.PaymentStatus FROM bookings b JOIN activityoccurrences ao ON b.OccurrenceID = ao.OccurrenceID JOIN activities a ON ao.ActivityID = a.ActivityID WHERE b.UserID = ?;";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, uid);
rs = pstmt.executeQuery();

%>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>Your Order</title>
  <link rel="stylesheet" href="other_res/yourbookings.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<header>
  <div class="navbar">
      <div class="nav-logo border">
          <div class="logo" >
              <a class="anchor" href="#"><h1>ThrillTrack</h1></a> 
          </div>
      </div>


      <div class="nav-search">
          
          </select>
          <input placeholder="   search Trek locations" class="search-input ">
          <div class="search-icon" >
              <i class="fa-solid fa-magnifying-glass"></i>
             
          </div>
      </div>

      <div class="nav-signin border ">
          <a  href="#"><p><span>Hello,sign in<br/>Your profile</span></p>
          <p class="nav-second"></p></a>
      </div>

      <div class="nav-return border">
          <a  href="#"><p><span>Cancellation &<br/>Booking policy</span></p>
          </a>
      </div>
  </div>

  <div class="panel">
      <div class="panel1 border">

      </div>
      <div class="panel-ops">
          <div class="panel1 deals border"><a  href="#">Trending Destinations</a></div>
          <div class="panel1 camp border"><a  href="#">Camping</a></div>
          <div class="panel1 trek border"><a  href="#">Treking </a></div>
          <div class="panel1 trek border"><a  href="#">Scuba Diving</a></div>
          <div class="panel1 trek border"><a  href="#">Rappelling</a></div>
          
          <!-- <div class="panel1 sale border">Sale</p> -->
      </div>
      <!-- <div class="panel-customer border">
          <i class="fa-solid fa-user-tie"></i>
          <p>Customer Service</p>

      </div> -->
  </div>
</header>


<!-- css for header -->


  

<body>
  <section style="width: 100%; background: rgb(229, 229, 229);">
    <div class="w2">
        <a class="c1">Your Orders</a>
        <a class="c2">Profile</a>
        <a href="logout.jsp" class="c2">Logout</a>
    </div>
</section>


<% while(rs.next()) 
{
%>


  <div class="container">
    <div class="order-details">
      <!-- put image here  -->
      <img src="<%=rs.getString("ThumbnailURL") %>" alt="Placeholder Image">
      <div class="text">
      	<h2>Booking ID: <%=rs.getInt("BookingID") %></h2><br>
        <h2><%=rs.getString("Title")%> </h2>
        <br>
        
        <p><%=rs.getString("Location") %></p>
        <br>
        <p><%=rs.getString("OccurrenceTime") %> | <%=rs.getString("OccurrenceDate") %></p>
        <br>
        <div class="final">
          <p>Booking Date & time</p>
          <p><%=rs.getString("BookingDate") %></p>
        </div>
        <div class="amount-show">
        <p>Total Price&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
        <%=rs.getString("TotalPrice") %></p>
      </div>
      </div>
    </div>
    <div class="amount-paid">
      <hr>
      <p>Amount paid&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <%=rs.getString("TotalPrice") %></p>
      <!-- <p>Rs 1000.35</p> -->
    </div>
  </div>
  
  <% 
  }
  %>
  
  
 
  
  <div class="a1">
    <hr/>
  </div>
  
  <script src="script.js"></script>
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
       
   </div>
   <div class="copyright">
       © 1996-2024, Thrilltrack.com, Inc. or its affiliates
   </div>
  </div>
</footer>
</html>


