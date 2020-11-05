<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 04/11/2020
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<style>
    .message {
        color: green;
    }
</style>
<body>
<div class="container pl-2 pr-2">
    <h1 style="text-align: center">Create new Product</h1>

    <p style="text-align: right">
        <a href="/products">
            <button class="btn btn-warning" type="button">Back to Product list</button>
        </a>
    </p>
    <form method="post">
        <table class=" table table-hover table-bordered">
            <tr>
                <td scope="col">Name Product:</td>
                <td><input type="text" name="name" id="name" class="form-control" aria-label="Default"
                           aria-describedby="inputGroup-sizing-default"></td>
            </tr>
            <tr>
                <td scope="col">Price Product:</td>
                <td><input type="text" name="price" id="price" class="form-control" aria-label="Default"
                           aria-describedby="inputGroup-sizing-default"></td>
            </tr>
            <tr>
                <td scope="col">Producer Product:</td>
                <td><input type="text" name="producer" id="producer" class="form-control" aria-label="Default"
                           aria-describedby="inputGroup-sizing-default"></td>
            </tr>
            <tr>
                <td scope="col">Description Product:</td>
                <td><input type="text" name="description" id="description" class="form-control" aria-label="Default"
                           aria-describedby="inputGroup-sizing-default"></td>
            </tr>
            <tr>
                <td>
                    <button class="btn btn-secondary" type="reset">Reset</button>
                </td>
                <td style="text-align: right">
                    <button class="btn btn-secondary" type="submit">Create new</button>
                </td>
            </tr>
        </table>
        <p style="text-align: right">
            <c:if test="${requestScope.message != null}">
                <span class="message">${requestScope.message}</span>
            </c:if>
        </p>
    </form>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

</html>
