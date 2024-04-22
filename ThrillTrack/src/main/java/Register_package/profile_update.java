package Register_package;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class profile_update extends HttpServlet {

    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.print("Exception from init");
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
    	HttpSession session = req.getSession();
        String name = req.getParameter("name");
        int uid = (int) session.getAttribute("uid");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String date = req.getParameter("dob");
        date = date.replaceAll("-", "");
        int date2 = Integer.parseInt(date);
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");

        PrintWriter out = res.getWriter();

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");

            String sql = "UPDATE users SET Email=?, Password=?, Name=?, DateOfBirth=?, Address=?, PhoneNumber=? where UserID=? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setInt(4, date2);
            pstmt.setString(5, city);
            pstmt.setString(6, phone);
            pstmt.setInt(7, uid);
            pstmt.executeUpdate();

            // Redirect before printing anything to the response
            res.sendRedirect("Profile.jsp");
            return;
        } catch (SQLException e) {
            // Handle database errors
            out.println("Error occurred while processing your request. Please try again later.");
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
