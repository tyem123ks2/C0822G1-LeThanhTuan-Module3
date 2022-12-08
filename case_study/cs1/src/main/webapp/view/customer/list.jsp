<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/8/2022
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<svg style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path fill-rule="evenodd" clip-rule="evenodd"
              d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>
</svg>
<%--<%@include file="../include/header.jsp" %>--%>
<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <img src="https://sohanews.sohacdn.com/2017/2-mobile-1509544156750.jpg" alt="Logo" width="150" height="45"
                 class="d-inline-block align-text-top">
            <span class="fs-4">FURAMA RESORT</span>
        </a>

        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <img src="https://png.pngtree.com/png-vector/20191118/ourlarge/pngtree-location-icon-creative-design-template-png-image_1998518.jpg"
                 alt="Logo" width="30" height="30"
                 class="d-inline-block align-text-top">
            <span class="fs-6">103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ
            <br> Quận Ngũ Hành Sơn, TP. Đà Nẵng, Việt Nam</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="http://localhost:8080/home.jsp;jsessionid=74BE18140F2E886FA6CD2BC60F7E0FCC"
                                    class="nav-link active" aria-current="page">Home</a></li>
            <li class="nav-item"><a href="/customer" class="nav-link">Customer</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Employee</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Facility</a></li>
            <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        </ul>
    </header>
</div>

<div class="row">
    <nav class="navbar navbar-light" style="background-color: teal">
        <div class="container-fluid" style="position: relative">
            <a class="navbar-brand"
               href="http://localhost:8080/home.jsp;jsessionid=74BE18140F2E886FA6CD2BC60F7E0FCC">Home</a>

            <button class="btn btn-light" style="position: absolute;left: 100px" data-bs-toggle="modal"
                    data-bs-target="#addmodal">Thêm Khách Hàng
            </button>
            <form action="/customer?action=find" method="post" style="position:absolute ;top: 1px;right: 30px"
                  class="d-flex">
                <input class="form-control me-2" type="search" name="name" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Tìm</button>
            </form>
        </div>
    </nav>
</div>
<c:if test="${list.size() == 0}">
    <br> <br>
    <center>
        <h3>Không tìm thấy khách hàng tên: " ${find} " <i class="fa-sharp fa-solid fa-magnifying-glass"></i></h3>
    </center>

</c:if>
<c:if test="${list.size() != 0}">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Họ Tên</th>
            <th scope="col">Ngày Sinh</th>
            <th scope="col">Giới Tính</th>
            <th scope="col">CMND</th>
            <th scope="col">Số Điện Thoại</th>
            <th scope="col">Email</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Kiểu Khách</th>
            <th scope="col">Sửa</th>
            <th scope="col">Xóa</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${list}" varStatus="status">
            <tr scope="row">
                <td>${status.count}</td>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <c:if test="${customer.gender}">
                    <td>Nam</td>
                </c:if>
                <c:if test="${!customer.gender}">
                    <td>Nữ</td>
                </c:if>
                <td>${customer.iDCard}</td>
                <td>${customer.phoneNumber}</td>
                <td>${customer.email}</td>
                <td>${customer.address}</td>
                <td>${customer.customerType.name}</td>
                <td>
                        <%--                                                             id,name,birthday,idCard,phoneNumber,email,address--%>
                    <button class="btn btn-success"
                            onclick="update('${customer.id}','${customer.name}','${customer.dateOfBirth}','${customer.iDCard}','${customer.phoneNumber}','${customer.email}','${customer.address}')"
                            data-bs-toggle="modal" data-bs-target="#editmodal"><i class="fa-sharp fa-solid fa-pen"></i>
                    </button>
                </td>
                <td>
                    <button class="btn btn-success " onclick="deleteCustomer('${customer.id}','${customer.name}')"
                            data-bs-toggle="modal" data-bs-target="#deletemodal"><i
                            class="fa-sharp fa-solid fa-user-slash"></i></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<div class="container">
    <footer class="py-5">
        <div class="row">
            <div class="col-2">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="http://localhost:8080/home.jsp;jsessionid=74BE18140F2E886FA6CD2BC60F7E0FCC" class="nav-link p-0 text-muted">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
                </ul>
            </div>

            <div class="col-2">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
                </ul>
            </div>

            <div class="col-2">
                <h5>Section</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
                </ul>
            </div>

            <div class="col-4 offset-1">
                <form>
                    <h5>Subscribe to our newsletter</h5>
                    <p>Monthly digest of whats new and exciting from us.</p>
                    <div class="d-flex w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                        <button class="btn btn-primary" type="button">Subscribe</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="d-flex justify-content-between py-4 my-4 border-top">
            <p>&copy; 2021 Company, Inc. All rights reserved.</p>
            <ul class="list-unstyled d-flex">
                <li class="ms-3"><a class="link-dark" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#twitter"/>
                    </svg>
                </a></li>
                <li class="ms-3"><a class="link-dark" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#instagram"/>
                    </svg>
                </a></li>
                <li class="ms-3"><a class="link-dark" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#facebook"/>
                    </svg>
                </a></li>
            </ul>
        </div>
    </footer>
</div>
<div class="modal" tabindex="-1" id="addmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm mới khách hàng <i class="fa-sharp fa-solid fa-user"></i></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=add" method="post">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Nhập Tên</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" name="birthday">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới Tính</label>
                        <div class="col-sm-10">
                            <input type="radio" class="radio" checked name="gender" value="true"> Nam &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="radio" name="gender" value="false"> Nữ
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã CMND</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="idcard">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Số Điện Thoại</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="phonenumber">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Địa Chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="address">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Chọn Kiểu</label>
                        <div class="col-sm-10">
                            <select class="form-select" name="typeid">
                                <c:forEach var="type" items="${typeList}">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Xác Nhận</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="editmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa thông tin khách hàng <span id="nameForm"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=edit" method="post">
                    <div class="mb-3 row">
                        <input type="hidden" name="id" id="idEdit">
                        <label class="col-sm-2 col-form-label">Họ Tên</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nameEdit" name="name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="birthdayEdit" name="birthday">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới Tính</label>
                        <div class="col-sm-10">
                            <input type="radio" class="radio" checked name="gender" value="true"> Nam &nbsp;&nbsp;&nbsp;
                            <input type="radio" class="radio" name="gender" value="false"> Nữ
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã CMND</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="idcardEdit" name="idcard">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Số Điện Thoại</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="phoneNumberEdit" name="phonenumber">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="emailEdit" name="email">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Địa Chỉ</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addressEdit" name="address">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Chọn Kiểu</label>
                        <div class="col-sm-10">
                            <select class="form-select" name="typeid">
                                <c:forEach var="type" items="${typeList}">
                                    <option value="${type.id}">${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Xác Nhận</button>
                    </div>
                </form>
            </div>
            <%--            <div class="modal-footer">--%>
            <%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quit</button>--%>
            <%--                <button type="button" class="btn btn-primary">Change</button>--%>
            <%--            </div>--%>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="deletemodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác Nhận Xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa <span id="nameDelete"></span> ?</p>
                </div>
                <input type="hidden" name="id" id="idDelete">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
<script>
    function update(id, name, birthday, idCard, phoneNumber, email, address) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("birthdayEdit").value = birthday;
        document.getElementById("idcardEdit").value = idCard;
        document.getElementById("phoneNumberEdit").value = phoneNumber;
        document.getElementById("emailEdit").value = email;
        document.getElementById("addressEdit").value = address;
        document.getElementById("nameForm").innerText = name;
    }

    function deleteCustomer(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</html>