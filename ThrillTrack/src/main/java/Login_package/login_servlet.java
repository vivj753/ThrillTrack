package Login_package;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class login_servlet extends HttpServlet {

    public void init() throws ServletException {
        try {
            // Load the MySQL JDBC driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Error loading MySQL JDBC driver", e);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Connection con = null;
        String uname = req.getParameter("email");
        String pwd = req.getParameter("password");
        PrintWriter out = res.getWriter();
        String name=null;
        int uid = -1; // default value for UserID
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");

            String sql = "SELECT UserID,Name FROM users WHERE Email=? AND Password=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                uid = rs.getInt("UserID");
                name=rs.getString("Name");
            }

            if (uid != -1) {
                // Valid user, set UserID in session and redirect to the next page
                HttpSession session = req.getSession();
                session.setAttribute("uid", uid);
                session.setAttribute("Name",name );
                res.sendRedirect("home.jsp");
            } else {
                // Invalid user, display message on the login page
                out.println("<script>alert('Invalid Details');</script>");
                RequestDispatcher rd = req.getRequestDispatcher("index.html"); // Change login.jsp to your login page
                rd.include(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
