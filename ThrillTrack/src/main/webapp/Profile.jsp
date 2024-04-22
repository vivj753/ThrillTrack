<%@ page import="java.sql.*"
 %>

<!DOCTYPE html>
<html lang="en">

<%
    // Declare variables
    String name = "";
    String dob = "";
    String ucity = "";
    String email = "";
    String phone = "";
    String pwd="";

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Get uid from session attribute
        int uid = (int) session.getAttribute("uid");

        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");

        // Prepare and execute SQL query
        String sql = "SELECT * FROM users WHERE UserID=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, uid);
        rs = pstmt.executeQuery();

        // Check if result set has data
        if (rs.next()) {
            // Retrieve data from result set
            name = rs.getString("Name");
            dob = rs.getString("DateOfBirth");
            ucity = rs.getString("Address");
            email = rs.getString("Email");
            phone = rs.getString("PhoneNumber");
            pwd=rs.getString("Password");
        }
    } catch (Exception e) {
        // Handle exceptions
        out.println("Error: " + e.getMessage());
    } finally {
        // Close JDBC resources in finally block
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
        }
        if (con != null) {
            try { con.close(); } catch (SQLException e) { /* ignored */ }
        }
    }
%>

    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrekTrial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="other_res/profile.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<header>
    <div class="navbar">
        <div style="    border: 2px solid transparent;">
            <div class="logo" >
                <a class="anchor" href="home.jsp"><h1>ThrillTrack</h1></a> 
            </div>
        </div>

        <div class="nav-address border ">
            <!-- <p class="add-first">My Location</p> -->
            <div class="add-icon">
                <i class="fa-solid fa-location-dot"></i>
                <p class="add-second">&nbsp;Pune</p>
            </div>
        </div>

        <div class="nav-search">
            
            </select>
            <input placeholder="   search Trek locations" class="search-input ">
            <div class="search-icon" >
                <i class="fa-solid fa-magnifying-glass"></i>
                <!-- <i class="fa-solid fa-magnifying-glass-location"></i> -->
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

        <!-- <div class="nav-cart border">
            <i class="fa-solid fa-person-hiking"></i>
            <p>Cart</p>
        </div> -->
    </div>

    <div class="panel">
        <div class="panel1 border">
            <!-- <i class="fa-solid fa-bars"></i>
            All -->
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

   <body>
        <section style="width: 100%; background: rgb(229, 229, 229);">
            <div class="w2">
                <a href="yourbookings.jsp" class="c1">Your Orders</a>
                <a class="c2">Profile</a>
                <a href="logout.jsp"class="c1">Log Out</a>
            </div>
        </section>
        <form action="profile_update" method="post" style="background-color: rgb(242, 245, 249); margin: 0px;">
            <section class="w1">
                <section class="w3">
                    <div class="c3">
                        
                        <div class="c6">
                            Hi,
                            <%=name %>
                        </div>
                    </div>
                </section>
                <div>
                    <section class="w7">
                        <div class="c13">Personal Details</div>
                        <div class="c14">
                            <div class="c15">Name</div>
                            <div class="c16">
                                <input type="text" placeholder="<%=name %>" name="name" value="<%=name %>" class="w8">
                            </div>
                        </div>
                        <div class="a1">
                            <div class="a2">Date of Birth</div>
                            <div class="a3">
                                <input type="date" placeholder="<%=dob %>" name="dob" value="<%=dob %>" class="w9">
                            </div>
                        </div>
                        <div class="a1">
                            <div class="a2">City</div>
                            <div class="a3">
                                <input type="text" placeholder="<%=ucity%>" name="city" value="<%=ucity%>" class="w9">
                            </div>
                        </div>
                        <div class="a1">
                            <div class="a2">Email Address</div>
                            <div class="a3">
                                <input type="text" placeholder="<%=email %>" name="email" value="<%=email %>" class="w9">
                            </div>
                        </div>
                        <div class="a1">
                            <div class="a2">Mobile Number</div>
                            <div class="a3">
                                <input type="text" placeholder="<%=phone %>" name="phone" value="<%=phone %>" class="w9">
                                
                            </div>
                        </div>
                        <div class="a1">
                            <div class="a2">Password</div>
                            <div class="a3">
                                <input type="password" placeholder="<%=pwd %>" name="password" value="<%=pwd %>" class="w9">
                                
                            </div>
                        </div>
                        <br><br>
                        <div class="button-container">
                            <input type="submit" value="Save Changes" class="save-button">
                        </div>
                        

                    </section>
                </div>
            </section>
            
        </form>
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


   </html>