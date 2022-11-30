<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 11/30/2022
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> AGENT LIST </h1>
<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var ="customer" items="${customerList}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.date}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.image}" width="60px" height="60px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
