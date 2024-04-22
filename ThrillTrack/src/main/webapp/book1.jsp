<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = null;
ResultSet rs = null;
int aid = Integer.parseInt(request.getParameter("id"));

try {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
    String sql = "SELECT o.OrganizerID,o.OrganizerName, ao.OccurrenceDate, ao.OccurrenceTime, ao.MaximumCapacity, ao.AvailableCapacity,ao.OccurrenceID FROM ActivityOccurrences ao INNER JOIN Organizers o ON ao.OrganizerID = o.OrganizerID WHERE ao.ActivityID=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, aid);
    rs = pstmt.executeQuery();
} catch (SQLException e) {
    e.printStackTrace();
}


%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="other_res/book1.css">
  <title>Organizer Detail Tables</title>
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
          <div class="panel1 deals border"><a  href="#">Trending Destinations<a> </div>
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
  <!-- second div for Your Orders and profile  -->
  <!-- <div class="secondpanel">
    <div class="secondpanelops">
    </div>
    <div class="second-panel-ops">
        <div class="panel1 deals border"><a  href="#">Your Orders</a></div>
        <div class="panel1 camp border"><a  href="#">Profile</a></div>
    </div>
</div> -->
</header>
<body>
<div class="filter">

</div>
<table>
  <tr>
    <th>Organizer Name</th>
    <th>Date</th>
    <th>Time</th>
    <th>Total tickets</th>
    <th>Available Tickets</th>
    <th>Action</th>
  </tr>
  <%
  while(rs.next())
  {
  %>
  <tr>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td><%=rs.getString(6) %></td>
    <td><button onclick="window.location.href ='book2.jsp?orid=<%= rs.getInt(1) %>&ocid=<%= rs.getInt(7) %>';">Book</button></td>
 </tr>
  <%} %>
  
  
</table>
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
