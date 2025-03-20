<%-- 
    Document   : userList
    Created on : Mar 18, 2025, 6:18:58 AM
    Author     : anhducokok
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>User List</h1>
    <table>
        <tr>
            
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <!--<th>Actions</th>-->
        </tr>
        <c:forEach var="user" items="${requestScope.adata}">
            <tr>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="addUser.jsp">Add New User</a>
</body>
</html>