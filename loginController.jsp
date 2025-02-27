<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.lang.*" %>
<%@ page import="KTEL.*" %>

<%
    String username = request.getParameter("username");
    String passw = request.getParameter("password");

    /*
    * If page is called directly (from url) and not via login.jsp then all parameters will be null.
    * (In that case error.jsp will respond)
    */
    if (username == null && passw == null) {

        throw new Exception("You have not logged in yet, please visit <a href='login.jsp'>login page</a>.");

    }

    AccountsDAO aDAO = new AccountsDAO();
    Accounts account = null;

    try {
        account = aDAO.authenticate(username, passw);

        session.setAttribute("userObj2024", account);  
        response.sendRedirect("Search1.jsp");
        
    } catch (Exception e) {
        request.setAttribute("errorMessage", "Wrong username or password.");
%>
        <jsp:forward page="login.jsp"/>
<%
    }
%>
