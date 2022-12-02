<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/1/2022
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>DANH SÁCH SẢN PHẨM</h1>
<tbody>
    <thead>
    <tr>
        <td scope="col">id</td>
        <td scope="col">Name</td>
        <td scope="col">Price</td>
        <td scope="col">Description</td>
        <td scope="col">Producer</td>
        <td scope="col">Delete</td>
        <td scope="col">Edit</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="nc">
        <tr>
            <th scope="row"${nc.count}></th>
            <td> ${product.name}</td>
            <td> ${product.price}</td>
            <td> ${product.description}</td>
            <td> ${product.producer}</td>
            <td> </td>
            <td> </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
