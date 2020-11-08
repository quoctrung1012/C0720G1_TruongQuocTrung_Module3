<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 05/11/2020
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View User</title>
</head>
<body>
<div style="text-align: center">
    <h1>User Management</h1>
    <h2><a href="users?action=users">List All Users</a></h2>
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <td>Id User</td>
                <td>${requestScope.user.id}</td>
            </tr>
            <tr>
                <td>Name User</td>
                <td>${requestScope.user.name}</td>
            </tr>
            <tr>
                <td>Email User</td>
                <td>${requestScope.user.email}</td>
            </tr>
            <tr>
                <td>Country User</td>
                <td>${requestScope.user.country}</td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
