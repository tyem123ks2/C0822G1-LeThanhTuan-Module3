<%--
  Created by IntelliJ IDEA.
  User: LEGION
  Date: 12/5/2022
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="../css/style/style.css">
</head>
<body>
<div class="container">
  <div class="row bg-light">
    <div class="col-3" style="padding: 10px"><
      <img src="../img/Logo-FURAMA-RESORT.jpg" height="170" width="200"/>
    </div>

    <div class="col-3" style="padding: 50px">
      <a href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang.html">
        <img src="../img/widget-tripadvisor-logo123.png" height="50" width="150"/> </a>
    </div>
    <div class="col-3" style="padding: 20px; text-align: center">
      <p> <img src="../img/vi tri.jpg" style="height: 40px;width: 40px"/>
        103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam </p>
      <p>7,0 km from
        Danang Airport</p>
    </div>
    <div class="col-3" style="padding: 20px">

      <img src="../img/pngtree-phone-icon-png-image_1757859.jpg" height="20" width="20"/>  84-236-3847 333/888
      <br>
      <img src="../img/tải xuống.png" height="20" width="20"/>  reservation@furamavietnam.com

    </div>
  </div>
  <div class="container">
    <nav class="navbar navbar-expand-lg bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Home</a>
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
  <div class="container">
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="../img/62371531.jpg" height="400" width="1200" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>FURAMA</h5>
            <p>Some representative placeholder content for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="../img/c8e3109938a1f85c3b1e91a3d856d177.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="../img/furama%20resort%20(2).jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
              data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
              data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</div>
<div class="container">
  <div class="row" style="height: 0px">
    <div class="card" style="width: 18rem;">
      <img src="../img/New folder/siute huong bien.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">PHÒNG SUITE HƯỚNG BIỂN</h5>
        <p class="card-text">Diện tích phòng: 85.8m2</p>
      </div>
      <div class="card-body">
        <a href="#" class="card-link">Card link</a>
        <a href="#" class="card-link">Xem thêm</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>