package Register_package;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;
public class register_servlet extends HttpServlet
{
	public void init()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.print("Exception from init");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String name= req.getParameter("name");
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        String date=req.getParameter("dob");
        date=date.replaceAll("-","");
        int date2=Integer.parseInt(date);
        String phone = req.getParameter("phone");
        String city=req.getParameter("city");
        
      

        PrintWriter out = res.getWriter();
        

        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrilltrack", "root", "vivek");

           String sql ="INSERT INTO users (Email,Password,Name,DateOfBirth,Address,PhoneNumber) VALUES (?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setInt(4, date2);
            pstmt.setString(5, city);
            pstmt.setString(6, phone);
            pstmt.executeUpdate();

            out.println("registration successful");
   
           res.sendRedirect("index.html");
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
