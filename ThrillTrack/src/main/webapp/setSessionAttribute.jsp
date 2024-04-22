<%@ page import="javax.servlet.http.*" %>

<%
double totalPrice = Double.parseDouble(request.getParameter("tp"));
session.setAttribute("tp", totalPrice);
%>
