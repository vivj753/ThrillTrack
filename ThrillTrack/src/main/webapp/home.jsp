<%@ page import="java.sql.*" %>

<%
String name=(String)session.getAttribute("Name");
%>

<!DOCTYPE html>
<html>
<head>
    
    <title>Bookmytrek</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="x-icon" href="web-logo.png">
    <link rel="Stylesheet" href="home_res/homestyle.css">

</head>

    <header>
        <div class="navbar">
            <div class="nav-logo border">
                <div class="logo" >
                    <a class="anchor" href="#"><h1>ThrillTrack</h1></a> 
                </div>
            </div>
            
            <%
            String location=(String)session.getAttribute("city");
            %>

     <button id="openPopup">
    <span class="location">Location</span>
</button>

<div id="popup" class="popup" style="display: block;">
    <span class="close" id="closePopup">&times;</span>
    <div class="popup-content">
        <h2 class="select">Select Your City</h2>
        <div class="cities">
            <button id="Nashik">Nashik</button>
            <button id="Mumbai">Mumbai</button>
            <button id="Pune">Pune</button>
            <button id="All">All</button>
        </div>
    </div>
</div>

            
        
            
            
           
            

            <div class="nav-search">
                
                </select>
                <input id="searchInput" placeholder="Search Destinations" class="search-input">
                <div class="search-icon" onclick="search();"; >
                    <i class="fa-solid fa-magnifying-glass"></i>
                
                </div>
            </div>
             <div class="nav-signin border ">
                <a  href="Profile.jsp"><p><span>Hello, <%=name %><br/>Your profile</span></p>
                <p class="nav-second"></p></a>
            </div>

            <div class="nav-return border">
                <a  href="#"><p><span>Cancellation &<br/>Booking policy</span></p>
                </a>
            </div>

         
        </div>
              

         
        </div>

        <div class="panel">
            <div class="panel1 border">
            
            </div>
            <div class="panel-ops">
                <div class="panel1 deals border"><a  href="activities.jsp?act=Trending%20Destinations">Trending Destinations</a></div>
                <div class="panel1 camp border"><a  href="activities.jsp?act=Camping">Camping</a></div>
                <div class="panel1 trek border"><a  href="activities.jsp?act=Trekking">Trekking </a></div>
                <div class="panel1 trek border"><a  href="activities.jsp?act=Scuba%20Diving">Scuba Diving</a></div>
                <div class="panel1 trek border"><a  href="activities.jsp?act=Rappelling">Rappelling</a></div>
                
            
            </div>
            
        </div>
    </header>

    

   <div class="container">
        <div class="wrapper">
            <img src="home_res/image4.jpeg" >
            <img src="home_res/image2.jpeg" >
            <img src="home_res/img6.jpeg"   >
            <img src="home_res/img7.jpeg"   >
            <img src="home_res/img8.jpg"    >
           <img src="home_res/image4.jpeg" >
            <img src="home_res/image2.jpeg" >
            <img src="home_res/img6.jpeg"   >
            <img src="home_res/img7.jpeg"   >
            <img src="home_res/img8.jpg"    >
            <img src="home_res/image4.jpeg" >
            <img src="home_res/image2.jpeg" >
            <img src="home_res/img6.jpeg"   >
            <img src="home_res/img7.jpeg"   >
        </div>


        
        
        
        
        <%
        String ct= (String)session.getAttribute("city");
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        ResultSet rs=null;
        Connection con = null;
        int uid = (int) (session.getAttribute("uid"));
        

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
        
        try {
            String sql;
            PreparedStatement pstmt;
            if(!"All".equals(ct)) {
                sql = "SELECT A.ActivityID, A.Title, A.Location, A.Duration, A.ThumbnailURL, A.DifficultyLevel, AT.Type AS ActivityType FROM Activities A JOIN ActivityTypes AT ON A.ActivityTypeID = AT.ActivityTypeID WHERE A.LCity=?;";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, ct);
            } else {
                sql = "SELECT A.ActivityID, A.Title, A.Location, A.Duration, A.ThumbnailURL, A.DifficultyLevel, AT.Type AS ActivityType FROM Activities A JOIN ActivityTypes AT ON A.ActivityTypeID = AT.ActivityTypeID;";
                pstmt = con.prepareStatement(sql);
            }
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
           
    </div>
<body>
    <div class="agencyhead">
        <p>----- Recommended Locations -----</p>
    </div> 
    <main class="obj-width" id="blog-container" >
    <% while(rs.next()) { %>
        <div class="blog-card">
        	<a href="details.jsp?id=<%=rs.getInt("ActivityID") %>">
            <img src="<%=rs.getString("ThumbnailURL") %>" alt="">
            <h2><%=rs.getString("Title") %></h2>
            <p>Location: <%=rs.getString("Location")%>
            Duration: <%=rs.getString("Duration")%><br>
            Difficulty: <%=rs.getString("DifficultyLevel") %>
            
            </p>
        </div>
    <% } %>
    </main>
</body>
    
    
    <footer>
        <div class="foot-panel1">
            <a href="#">Back to Top</a>
        </div> 
        <div class="foot-panel2">
         <ul>
            <a href="aboutus.jsp"> <p>About Us</p></a>
             
         </ul>
     
         <ul>
            <a href="contact.jsp"> <p>Connect us</p></a>
     
         </ul>
     
         <ul>
            <a href="cancellation.jsp">  <p>Cancellation Policy</p></a>
     
         </ul>
     
         <ul>
            <a href="cancellation.jsp">  <p>Privacy Policy</p></a>
             
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

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        var city = "<%= session.getAttribute("city") %>";
        if (city !== null && city !== "") {
            document.getElementById("openPopup").innerHTML = "<span class='location'>" + city + "</span>";
        }

        // Check if the popup has not been shown and the city is not set
        var popupShown = localStorage.getItem('popupShown');
        if (!popupShown && city === null) {
            document.getElementById("popup").style.display = "block"; // Show the popup
        }
    });

    document.getElementById("closePopup").addEventListener("click", function () {
        document.getElementById("popup").style.display = "none";
    });

    // Add event listener to open the popup
    document.getElementById("openPopup").addEventListener("click", function () {
        document.getElementById("popup").style.display = "block";
    });

    // Add event listeners to each button
    document.getElementById("Nashik").addEventListener("click", function () {
        updateCitySession("Nashik");
    });

    document.getElementById("Mumbai").addEventListener("click", function () {
        updateCitySession("Mumbai");
    });

    document.getElementById("Pune").addEventListener("click", function () {
        updateCitySession("Pune");
    });

    document.getElementById("All").addEventListener("click", function () {
        updateCitySession("All");
    });

    // Function to update session attribute and refresh the page
    function updateCitySession(city) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "updateCitySession.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("openPopup").innerHTML = "<span class='location'>" + city + "</span>";
                document.getElementById("popup").style.display = "none"; // Hide the popup
                localStorage.setItem('popupShown', 'true'); // Set the flag indicating the popup has been shown
                location.reload(); // Refresh the page
            }
        };
        xhr.send("city=" + encodeURIComponent(city));
    }
    
    function search() {
        // Get the value entered by the user in the search input
        var searchQuery = document.getElementById("searchInput").value;

        // Encode the search query to make it URL-safe
        var encodedSearchQuery = encodeURIComponent(searchQuery);

        // Redirect to search.jsp with the search query as a parameter
        window.location.href = 'search.jsp?query=' + encodedSearchQuery;
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</html>
