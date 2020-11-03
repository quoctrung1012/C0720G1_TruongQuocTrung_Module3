<%@ page import="java.util.List" %>
<%@ page import="models.Customers" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CustomerDao" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03/11/2020
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Customer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<table class="table table-striped">
    <thead>
    <h2 style="text-align: center">Danh sách khách hàng</h2>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Address</th>
        <th scope="col">Avatar</th>
    </tr>
    </thead>
    <tbody>
    <% List<Customers> customersList = CustomerDao.readAllCustomer();
        request.setAttribute("listCustomer", customersList);
    %>
    <c:forEach var="customer" items="${requestScope.listCustomer}">
        <tr>
            <th><c:out value="${customer.name}"/></th>
            <td><c:out value="${customer.birthday}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td>
                <img style="width: 100px" src="<c:out value="${customer.imageAvatar}"/>">
            </td>
        </tr>
    </c:forEach>
    </tr>
    </tbody>
</table>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

</html>
