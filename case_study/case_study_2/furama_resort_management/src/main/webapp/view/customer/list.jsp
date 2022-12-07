<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/6/2022
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
</head>
<body>
<div class="container">
    <div class="row bg-light">
        <div class="col-3" style="padding: 10px"><
            <img src="../../img/Logo-FURAMA-RESORT.jpg" height="170" width="200"/>
        </div>

        <div class="col-3" style="padding: 50px">
            <a href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang.html">
                <img src="../../img/widget-tripadvisor-logo123.png" height="50" width="150"/> </a>
        </div>
        <div class="col-3" style="padding: 20px; text-align: center">
            <p><img src="../../img/vi tri.jpg" style="height: 40px;width: 40px"/>
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam </p>
            <p>7,0 km from
                Danang Airport</p>
        </div>
        <div class="col-3" style="padding: 20px">

            <img src="../../img/pngtree-phone-icon-png-image_1757859.jpg" height="20" width="20"/> 84-236-3847 333/888
            <br>
            <img src="../../img/tải xuống.png" height="20" width="20"/> reservation@furamavietnam.com
        </div>
    </div>
</div>
<div class="container">
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="jetbrains://web-storm/navigate/reference?project=HOC TAP&path=module3/case_study/case_study_2/Web/furama/furama_web.html">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="text-align: center">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Customer</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Contract</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<div CLASS="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên dịch vụ</th>
            <th scope="col">Diện tích sử dụng</th>
            <th scope="col">Chi phí thuê (cost)</th>
            <th scope="col">Số lượng người tối đa</th>
            <th scope="col">Kiểu thuê</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Villa</td>
            <td>80m2</td>
            <td>8000000</td>
            <td>4</td>
            <td> 2 days </td>
            <td>
                <button class = "btn btn-sm btn-outline-danger">Edit</button>
            </td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
        <tr>
            <th scope="row">2</th>
            <td>House</td>
            <td>60m2</td>
            <td>4000000</td>
            <td>4</td>
            <td> 2 days </td>
            <td>
                <button class = "btn btn-sm btn-outline-danger">Edit</button>
            </td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td>Room</td>
            <td>40m2</td>
            <td>2500000</td>
            <td>4</td>
            <td> 2 days </td>
            <td>
                <button class = "btn btn-sm btn-outline-danger">Edit</button>
            </td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
        <tr>
            <td>
                <button class="btn btn-sm btn-outline-danger"> Thêm mới</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span class="text-danger">Bạn có chắc chắn muốn xóa không?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script src="../../../../../demo/C0822g1/bootstrap-5.1.3/js/bootstrap.js"></script>
</body>
</html>