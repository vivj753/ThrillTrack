<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = null;
ResultSet rs = null;
int orid = Integer.parseInt(request.getParameter("orid"));
int ocid = Integer.parseInt(request.getParameter("ocid"));


int availableTickets = 0;
double price = 0.0;

try {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
    String sql="SELECT AvailableCapacity, Price from activityoccurrences where OccurrenceID=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, ocid);
    rs = pstmt.executeQuery();
    
    // Check if there are any results
    if (rs.next()) {
        // Fetch available ticket count and price from the result set
        availableTickets = rs.getInt("AvailableCapacity");
        price = rs.getDouble("Price");
    } else {
        // Handle the case where no results were found
        // For example, redirect the user to an error page
        response.sendRedirect("error.jsp");
    }

} catch (SQLException e) {
    e.printStackTrace();
}


%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Select Seats</title>
<link rel="stylesheet" href="other_res/book2.css">
</head>
<header>
    
  <div class="navbar">
      <div class="nav-logo border">
          <div class="logo" >
              <h2>ThrillTrek</h2>
          </div>
      </div>

      <!-- <div class="nav-address border ">
     
          <div class="add-icon">
              <i class="fa-solid fa-location-dot"></i>
              <p class="add-second">India</p>
          </div>
      </div> -->

      <div class="nav-search">
          
          </select>
          <input placeholder="   search Trek locations" class="search-input ">
          <div class="search-icon" >
              <i class="fa-solid fa-magnifying-glass-location"></i>
          </div>
      </div>

      <div class="nav-signin border">
          <p><span>Hello,sign in</span></p>
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
          <div class="panel1 camp border">Camping</div>
          <div class="panel1 trek border">Treking </div>
          <div class="panel1 trek border">Scuba Diving</div>
          <div class="panel1 trek border">Rappelling</div>
       </div>
  </div>

</header>
  <div class="container">
    <h2>How Many participant?</h2>
    <br>
    <div class="seat-selection">
      <!-- <div class="seat-icon">
        <img src="bike-icon.png" alt="Bike Icon">
      </div> -->
      <div class="seat-quantity">

        <input type="number" id="seat-count" value="1" min="1" max="<%= availableTickets %>">

      </div>
    </div>
    <div class="ticket-types">
      <div class="ticket-type">
        <div class="ticket-type-info">
          <p>Price: <span id="ticket-price">Rs. <%= price %></span></p>
        </div>
      </div>
    </div>
    <button onclick="linkappend();"id="select-seats-btn" >Select Participant</button>
  </div>

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
  

  <!-- <div class="foot-panel3">
   
      <h2 class="logo">ThrillTrek</h2>
   
  </div> -->
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

<script>
  // Function to update the ticket price based on the number of participants
  function updatePrice() {
    var seatCount = parseInt(document.getElementById('seat-count').value);
    var basePrice = <%= price %>; // Your base price
    var totalPrice = basePrice * seatCount;
    document.getElementById('ticket-price').innerHTML = '<p>Rs. ' + totalPrice.toFixed(2) + '</p>';
  }

  // Function to prevent selecting more tickets than available
  function preventExceedingMax() {
    var seatCount = parseInt(document.getElementById('seat-count').value);
    var availableTickets = <%= availableTickets %>;
    if (seatCount > availableTickets) {
      alert("You can't book more seats than available.");
      document.getElementById('seat-count').value = availableTickets;
      updatePrice(); // Update the price if the value was changed
    }
  }

  // Add event listener to the input field to detect changes in value
  document.getElementById('seat-count').addEventListener('input', preventExceedingMax);

  // Call the updatePrice function initially to set the default price
  updatePrice();
</script>
<script>
  // Function to update the ticket price based on the number of participants
  function updatePrice() {
    var seatCount = parseInt(document.getElementById('seat-count').value);
    var basePrice = <%= price %>; // Your base price
    var totalPrice = basePrice * seatCount;
    document.getElementById('ticket-price').innerHTML = '<p>Rs. ' + totalPrice.toFixed(2) + '</p>';

    // Make an AJAX request to set the session attribute
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "setSessionAttribute.jsp", true); // Replace "setSessionAttribute.jsp" with your server-side endpoint
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Session attribute has been set successfully
                console.log("Session attribute 'tp' has been set to: " + totalPrice);
            } else {
                // Handle errors if any
                console.error("Failed to set session attribute: " + xhr.statusText);
            }
        }
    };
    xhr.send("tp=" + totalPrice); // Send the total price as a parameter to the server-side endpoint
}


  // Add event listener to the input field to detect changes in value
  document.getElementById('seat-count').addEventListener('input', updatePrice);

  // Call the updatePrice function initially to set the default price
  updatePrice();
  
  function linkappend() {
	    var nos = document.getElementById('seat-count').value;
	    // Retrieve the innerHTML of the ticket-price element
	    var totalPriceText = document.getElementById('ticket-price').innerHTML;
	    // Extract the numerical part of the totalPriceText by removing non-numeric characters
	    var totalPrice = parseFloat(totalPriceText.replace(/[^\d.]/g, ''));
	    // Ensure totalPrice is a valid number
	    if (isNaN(totalPrice)) {
	        console.error("Total price is not a valid number.");
	        return; // Exit function if totalPrice is not valid
	    }
	    totalPrice=totalPrice*10000;
	    // Redirect to the desired URL with the calculated totalPrice
	    window.location.href = 'book3.jsp?orid=<%= orid %>&ocid=<%= ocid %>&seats=' + nos + '&totalPrice=' + totalPrice;
	}


  
  
</script>


</html>
