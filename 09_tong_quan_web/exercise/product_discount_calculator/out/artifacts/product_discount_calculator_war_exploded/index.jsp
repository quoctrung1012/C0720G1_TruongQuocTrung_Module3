<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02/11/2020
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/discount" method="post">
<label>Price</label><br>
    <input type="text" name="price" placeholder="price" ><br>
<label>Discount</label><br>
    <input type="text" name="discount" placeholder="discount"><br>
<input type="submit" name="submit" value="Converter">
  </form>
  </body>
</html>
