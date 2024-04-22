<%@ page import="java.sql.*" %>



<%
//get location, name ,etc
String name=(String)session.getAttribute("Name");
String location=(String)session.getAttribute("city");
String query=request.getParameter("query");

String url = "jdbc:mysql://localhost:3306/thrilltrack";
String user = "root";
String password = "vivek";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Establish database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    
    // SQL query to search for activities by name
    String sql = "SELECT * FROM activities WHERE Title LIKE ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, "%" + query + "%");
    
    // Execute the query
    rs = pstmt.executeQuery();
    
    
    
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} 

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
            
            

     <button id="openPopup">
    <span class="location">Location</span>
</button>

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
        </div>
        <body>
    <div class="agencyhead">
        <p>Search Results for '<%=query %>'</p>
    </div> 
    <main class="obj-width" id="blog-container" >
    <% if(rs!=null)
    {
    while(rs.next()) { %>
        <div class="blog-card">
        	<a href="details.jsp?id=<%=rs.getInt("ActivityID") %>">
            <img src="<%=rs.getString("ThumbnailURL") %>" alt="">
            <h2><%=rs.getString("Title") %></h2>
            <p>Location: <%=rs.getString("Location")%>
            Duration: <%=rs.getString("Duration")%><br>
            Difficulty: <%=rs.getString("DifficultyLevel") %>
            
            </p>
        </div>
    <% } 
    }
    else
    {%>
    <br>
    <h1>No Results found</h1>
    	
    <%}%>
    </main>
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
        <script>
        function search() {
            // Get the value entered by the user in the search input
            var searchQuery = document.getElementById("searchInput").value;

            // Encode the search query to make it URL-safe
            var encodedSearchQuery = encodeURIComponent(searchQuery);

            // Redirect to search.jsp with the search query as a parameter
            window.location.href = 'search.jsp?query=' + encodedSearchQuery;
        }
        </script>
        </html>
        
        
      


        
        
        