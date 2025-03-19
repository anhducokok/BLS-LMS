<%-- 
    Document   : welcome
    Created on : Mar 18, 2025, 10:16:48 PM
    Author     : anhducokok
--%>

<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ page import="com.example.bean.UserBean" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .welcome-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
            margin-bottom: 20px;
        }
        .logout-btn {
            padding: 10px 15px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <% 
        // Check if user is logged in
        User user = (User) session.getAttribute("user");
        if(user == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("login.jsp");
        } else {
    %>
    <div class="welcome-container">
        <h1>Welcome, <%= user.getName() %>!</h1>
        <p>You have successfully logged in.</p>
        <a href="LogoutServlet" class="logout-btn">Logout</a>
    </div>
    <% } %>
</body>
</html>
