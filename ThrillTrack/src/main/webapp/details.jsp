<%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = null;
ResultSet rs = null;
int aid = Integer.parseInt(request.getParameter("id"));

try {
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
    String sql = "SELECT * FROM activities WHERE ActivityID=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, aid);
    rs = pstmt.executeQuery();
} catch (SQLException e) {
    e.printStackTrace();
}

String imageurl = null; // Initialize imageurl outside try-catch block

if (rs != null && rs.next()) {
    imageurl = rs.getString("ImageURL");
}
%>

<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrekTrial</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="other_res/details.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<header>
    <div class="navbar">
        <div style="    border: 2px solid transparent;">
            <div class="logo" >
                <a class="anchor" href="#"><h1>ThrillTrack</h1></a> 
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
    <div class="0">
	    <section class="01">
 	<div class="n" style="background-image: linear-gradient(90deg, rgb(26, 26, 26) 24.97%, rgb(26, 26, 26) 38.3%, rgba(26, 26, 26, 0.04) 97.47%, rgb(26, 26, 26) 100%), url(<%=imageurl%>);">
    <div class="a">
        <div class="b">
            <section class="c">
                <div type="vertical" class="d">
                    <div class="e" style="border-radius: 16px 16px 0px; object-fit: cover;">
                        <img src="<%=rs.getString("ThumbnailURL") %>" alt="<%=rs.getString("ThumbnailURL") %>" width="100%" height="100%" class="6" style="border-radius: 16px 16px 0px 0px; object-fit: cover;">
                    <div>
                    
                </div>
            </section>
        </div>
        <div class="f">
            <h1 class="h"><%=rs.getString("Title") %></h1>
            <div style="margin-top: 16px;">
           <div class="g">
                    <h6 class="i"><%=rs.getString("DifficultyLevel") %></h6>
           </div>
           <div class="aa">
            <span class="material-symbols-outlined">
                schedule
                </span>
            <h5 style="padding-right: 15px;"><%=rs.getString("Duration") %></h5>
            <span class="material-symbols-outlined">
                location_on
                </span>
            <h5 class="ac"><%=rs.getString("Location") %></h5>
            <span class="ad">,</span>
            <h5 class="ae"><%=rs.getString("LCity") %></h5>
           </div>
           </div>
           <div class="j">
            <div class="k">
            	
                <button class="l" onclick="window.location.href = 'book1.jsp?id=<%=aid%>';">
                    <div class="m">
                        <span style="font-weight: 500; font-size: 16px; color:black;">Book</span>
                    </div>
                </button>
                
            </div>
           </div>
        </div>


    </div>
    </div>
    </section>
    <div class="o">
        <div class="z">
            <section id="c1">
                <section class="q">
                    <span class="r">
                        <h4 class="s">About the Thrill</h4>
                        <div class="t">
                            <span>
                            <%=rs.getString("Description") %>
                                </span>
                        </div>
                    </span>
                </section>
            </section>
            <section id="c2"></section>
            <section id="c3"></section>
        </div>
    </div>
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


   </html>