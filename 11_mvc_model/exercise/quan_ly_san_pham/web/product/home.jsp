<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 04/11/2020
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid pl-2 pr-2">
<h1 style="text-align: center">Product List</h1>
<table class="table table-hover table-bordered" style="text-align: center">
    <tr>
        <td scope="col">Id Product</td>
        <td scope="col">Name Product</td>
        <td scope="col">Price Product</td>
        <td scope="col">Producer Product</td>
        <td scope="col">Description Product</td>
        <td scope="col">Information Product</td>
        <td scope="col">Edit Product</td>
        <td scope="col">Delete Product</td>
    </tr>
    <c:forEach items='${requestScope.products}' var="product">
        <tr>
            <th scope="col"><a><c:out value="${product.id}"/></a></th>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.producer}"/></td>
            <td><c:out value="${product.description}"/></td>
            <td><a href="/products?action=view&id=${product.id}">
                <button class="btn btn-success" type="button">Information Product</button>
            </a></td>
            <td><a href="/products?action=edit&id=${product.id}">
                <button class="btn btn-warning" type="button">Edit Product</button>
            </a></td>
            <td><a href="/products?action=delete&id=${product.id}">
                <button class="btn btn-danger" type="button">Delete Product</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
    <div class="container">
        <p style="text-align: right" >
            <a href="/products?action=create">
                <button class="btn btn-warning" type="button">Create new Product</button>
            </a>
        </p>
    </div>

</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</html>
