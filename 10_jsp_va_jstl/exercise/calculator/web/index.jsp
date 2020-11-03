<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 03/11/2020
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form method="post" action="/calculate">
  <fieldset style="width: 350px">
    <h2>Calculate</h2>
    <table>
      <tr>
        <td>First operand:</td>
        <td><input type="text" name="firstOperand"></td>
      </tr>
      <tr>
        <td>Operator:</td>
        <td>
          <select name="operator">
            <option value="+">Addition(+)</option>
            <option value="-">Subtraction(-)</option>
            <option value="*">Multiplication(*)</option>
            <option value="/">Division(/)</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>Second operand:</td>
        <td><input type="text" name="secondOperand"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Calculate"></td>
      </tr>
    </table>
  </fieldset>

</form>
  </body>
</html>
