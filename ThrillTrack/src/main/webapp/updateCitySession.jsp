<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.PrintWriter" %>
<%
    String city = request.getParameter("city");
    session.setAttribute("city", city);
    out.print("Session attribute updated successfully!");
%>