<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%



int seats = (int)(session.getAttribute("seats"));
int bookid = (int)(session.getAttribute("bookid"));



Connection conn = null;
PreparedStatement stmt = null;
PreparedStatement stmt2=null;
try {
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");
	    

    // Iterate through participant details and insert into database
    for (int i = 1; i <= seats; i++) {
        String gender = request.getParameter("gender" + i);
        String fullName = request.getParameter("fullName" + i);
        String dob = request.getParameter("dob" + i);
        String phone = request.getParameter("phone" + i);

        // Prepare SQL statement
        String sql = "INSERT INTO participants (BookingID,Gender, ParticipantName, DateOfBirth, ContactInformation) VALUES (?, ?, ?, ?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1,bookid);
        stmt.setString(2, gender);
        stmt.setString(3, fullName);
        stmt.setString(4, dob);
        stmt.setString(5, phone);

        // Execute SQL statement
        stmt.executeUpdate();
        
        
        String sql2 = "UPDATE bookings SET PaymentStatus='Completed' WHERE BookingID=?";
        stmt2 = conn.prepareStatement(sql2);
        stmt2.setInt(1,bookid);
        

        // Execute SQL statement
        stmt2.executeUpdate();
        
    }

    // Redirect to a success page
    response.sendRedirect("success.jsp");
} catch (Exception e) {
    e.printStackTrace();
    // Redirect to an error page or handle the error appropriately
    response.sendRedirect("error.jsp");
} finally {
    // Close resources
    if (stmt != null) {
        stmt.close();
    }
    if (conn != null) {
        conn.close();
    }
}
%>
