<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../../../resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../../resources/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
    <style>
        /* CSS cho hiệu ứng chạy thời gian 2s */
        .swal2-popup {
            position: relative;
        }

        .swal2-popup .progress-bar-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #007bff; /* Màu của thanh thời gian */
            animation: slide-out 2s linear; /* Hiệu ứng chạy thời gian 2s */
        }

        @keyframes slide-out {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }

        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }
        .btn-them-sp {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #4CAF50; /* Màu xanh lá cây */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-them-sp:hover {
            background-color: #45a049; /* Màu xanh lá cây nhạt khi hover */
        }

    </style>
    <style>
        #addFormContainer {

            position: fixed;
            top: 0;
            left: 0;
            /*padding-top: 15%;*/
            padding-left: 3%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white;
            height: 85%;
            /* Màu nền của biểu mẫu */
            /*padding: 20px;*/
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        #addFormContainer1 {
            position: fixed;
            top: 0;
            left: 0;
            /*padding-top: 15%;*/
            padding-left: 12%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            background-color: white;
            width: 70%;
            height: 300px;
            /* Màu nền của biểu mẫu */
            /*padding: 20px;*/
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm1 button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm1 button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        #addFormContainer2 {

            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-left: 3%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm2 {
            width: 80%;
            height: 300px;
            background-color: white;
            /* Màu nền của biểu mẫu */
            /*padding: 20px;*/
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm2 button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm2 button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }

        .gia {
            color: red;
            font-weight: bold;
            font-size: larger;
        }

        .gia del {
            color: gray;
        }

        input[type="radio"] {
            display: none;
        }

        /* Tạo hình vuông tùy chỉnh và tạo một hình vuông giả bằng cách sử dụng một phần tử div */
        label.radio-label {
            display: inline-flex;
            align-items: center; /* Căn giữa theo chiều dọc */
            position: relative;
            cursor: pointer;
        }

        label.radio-label::before {
            content: " ";
            display: inline-block;
            width: 130%; /* Độ rộng hình vuông */
            height: 130%; /* Chiều cao hình vuông */
            border: 0.5px solid #6e7881; /* Viền */
            background-color: transparent; /* Màu nền */
            position: absolute; /* Điều chỉnh khoảng cách giữa hình vuông và label */
            top: 0;
            border-radius: 4px; /* Độ cong viền */
        }

        /* Điều khiển màu nền của hình vuông khi được chọn */
        input[type="radio"]:checked + label.radio-label::before {
            border: 2px solid #ffa500; /* Đổi màu border thành màu cam */
        }

        /* Tạo góc bên dưới bên phải màu cam */
        input[type="radio"]:checked + label.radio-label::after {
            content: "";
            position: absolute;
            bottom: 58%; /* Điều chỉnh vị trí theo chiều dọc */
            right: -30%; /* Điều chỉnh vị trí theo chiều ngang */
            width: 20px; /* Độ rộng của góc cam */
            height: 12px; /* Chiều cao của góc cam */
            background-color: #ffa500; /* Màu cam */
            clip-path: polygon(100% 0, 0 0, 100% 100%);
        }
    </style>
</head>

<body>

<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/user/trang_chu/${idKh}" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">SD</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">99</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form method="post">
                <div class="input-group">
                    <input type="text" class="form-control" name="timKiem" placeholder="Search for products">
                    <div class="input-group-append">
                        <button class="input-group-text bg-transparent text-primary"
                                formaction="/user/tim_kiem/${idKh}">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+84 987 654 321</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Thể loại</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${listLoaiAos}" var="list">
                        <a href="/user/loc_theo_loai_ao/${idKh}/${list.ma}" class="nav-item nav-link">${list.ten}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link active">Trang chủ</a>
                        <a href="/user/shop/${idKh}" class="nav-item nav-link">Cửa hàng</a>
                        <a href="/user/contact/${idKh}" class="nav-item nav-link">Thông tin cửa hàng</a>
                        <a href="/user/blog/${idKh}" class="nav-item nav-link">Bài viết</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <c:choose>
                            <c:when test="${idKh != 2}">
                                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                    <div class="navbar-nav mr-auto py-0">
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i
                                                    class="fa fa-user" style="color: #ffd019"></i>
                                                <span class="badge text-secondary border border-secondary rounded-circle"
                                                      style="padding-bottom: 2px;">${khachHangNow.ten}</span></a>
                                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                                <a href="/user/thong_tin/${idKh}" class="dropdown-item">Thông tin</a>
                                                <a href="/user/don_hang/${idKh}" class="dropdown-item">Đơn hàng</a>
                                                <a href="/logout" class="dropdown-item">Đăng xuất</a>
                                            </div>
                                        </div>
                                        <a href="/user/gio_hang/view/${idKh}" class="nav-item nav-link"><i
                                                class="fas fa-shopping-cart text-primary"></i>
                                            <span class="badge text-secondary border border-secondary rounded-circle"
                                                  style="padding-bottom: 2px;">${soLuongSanPham}</span></a>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${idKh == 2}">
                                <a href="/login" class="btn px-0 ml-3">
                                    <i class="fas fa-user text-primary"></i><span style="color: white">Đăng nhập</span>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <c:if test="${checkGH == 1}">
                    <button class="btn-them-sp" onclick="themSp()">Thêm sản phẩm</button>
                </c:if>
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>STT</th>
                        <th>Ảnh</th>
                        <th>Sản phẩm</th>
                        <th>Thông tin</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach items="${listGioHangChiTiets}" var="list" varStatus="vTri">
                        <tr>
                            <td class="align-middle"><input type="checkbox" name="chon" value="${vTri.index}">
                            <td class="align-middle">${vTri.index + 1}
                            <td class="align-middle"><a href="/user/san_pham_detail/${idKh}/${list.aoChiTiet.ao.id}">
                                <img
                                        src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}" alt=""
                                        style="width: 50px;"></a>
                            </td>

                            <input type="hidden" name="idAoChiTiet" value="${list.aoChiTiet.id}">
                            <input type="hidden" id="slTon${vTri.index + 1}" value="${list.aoChiTiet.slton}">

                            <td class="align-middle" style="text-align: left"> ${list.aoChiTiet.ao.ten}</td>
                            <td class="align-middle">${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</td>
                            <td class="align-middle" id="gia${vTri.index + 1}">
                                <fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <input type="number" name="soLuong" min="0" max="100" step="1"
                                               value="${list.gioHangChiTiet.soLuong}"
                                               oninput="updateSL(${vTri.index + 1})" id="sl${vTri.index + 1}">
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <input type="number" name="soLuong" min="0" max="100" step="1"
                                               value="${list.hoaDonChiTiet.soLuong}"
                                               oninput="updateSL(${vTri.index + 1})" id="sl${vTri.index + 1}">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <input type="hidden" name="donGia" readonly id="donGia1${vTri.index + 1}"
                                               value="${ list.gia * list.gioHangChiTiet.soLuong}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="text" id="abc${vTri.index + 1}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="hidden" id="vTri" value="${vTri.index + 1}">
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <input type="hidden" name="donGia" readonly id="donGia1${vTri.index + 1}"
                                               value="${ list.gia * list.hoaDonChiTiet.soLuong}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="text" id="abc${vTri.index + 1}"
                                               style="border: none; background: none; text-align: center;">
                                        <input type="hidden" id="vTri" value="${vTri.index + 1}">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="align-middle">
                                <c:choose>
                                    <c:when test="${checkGH == 0}">
                                        <button class="btn btn-sm btn-danger"
                                                onclick="xoaGioHang('${list.gioHangChiTiet.id}')"><i
                                                class="fa fa-times"></i></button>
                                    </c:when>
                                    <c:when test="${checkGH == 1}">
                                        <button class="btn btn-sm btn-danger"
                                                onclick="xoaHoaDonChinhSua('${list.hoaDonChiTiet.id}')"><i
                                                class="fa fa-times"></i></button>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TÓM TẮT GIỎ HÀNG</span>
                </h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Đơn giá</h6>
                            <h5 id="total1"></h5>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng giá</h5>
                            <h5 id="total"></h5>
                        </div>
                        <c:choose>
                            <c:when test="${checkGH == 0}">
                                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3"
                                        formaction="/user/hoa_don/add/${idKh}" onclick="kiemTra()">Xuất hóa đơn
                                </button>
                            </c:when>
                            <c:when test="${checkGH == 1}">
                                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3"
                                        formaction="/user/hoa_don_chinh_sua/update/${maHoaDon}" onclick="kiemTra()">Cập
                                    nhật
                                </button>
                            </c:when>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Cart End -->


<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">LIÊN LẠC</h5>
            <p class="mb-4">Số 19, Ngõ 204, Lê Thanh Nghị, Hai Bà Trưng, Hà Nội</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Nhóm SD-99</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>bang0392887284@gmail.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+084 987 654 321</p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-6 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Cửa hàng nhanh chóng</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="/user/trang_chu/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                        <a class="text-secondary mb-2" href="/user/view_tim_kiem/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Cửa Hàng</a>
                        <a class="text-secondary mb-2" href="/user/contact/${idKh}"><i
                                class="fa fa-angle-right mr-2"></i>Thông tin cửa hàng</a>
                        <a class="text-secondary mb-2" href="/user/blog/${idKh}"><i class="fa fa-angle-right mr-2"></i>Bài
                            viết</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5 class="text-secondary text-uppercase mb-4">Vị trí cửa hàng</h5>
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.75784392943!2d105.84125167479552!3d21.002341888686352!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac70d567c7d1%3A0x5b99cce1def5a9a9!2zMTkgTmcuIDIwNCBQLiBMw6ogVGhhbmggTmdo4buLLCDEkOG7k25nIFTDom0sIEhhaSBCw6AgVHLGsG5nLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1700558341011!5m2!1svi!2s"
                                width="400" height="200" style="border:0;" allowfullscreen="" loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </p>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->

<section class="content">
    <div id="addFormContainer" style="display: ${noneOrBlock};">
        <div class="container-fluid mt-3" style="width: 1300px; max-height: 700px; ">
            <div class="row">
                <div class="col-12">
                    <form id="addForm" method="post" class="mt-3" style="max-height: 700px; overflow-y: auto;">
                        <div class="card">
                            <div class="card-header">
                                <h3 style="text-align: center"> Danh sách sản phẩm</h3>
                                <input type="hidden" value="${idHoaDon}" name="idHoaDon">
                            </div>
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="form-group col-3"></div>
                                            <div class="form-group col-3">
                                                <label for="searchText2">Tìm theo tên</label>
                                                <input id="inputSP" style="width: 250px; height: 40px">
                                            </div>
                                            <div class="form-group col-3">
                                                <label for="searchText2">Lọc theo hãng</label>
                                                <select class="form-control" name="loai_ao_id" id="searchText2">
                                                    <c:forEach items="${listHangs}" var="list">
                                                        <option value="${list.ten}">${list.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-3">
                                                <label for="searchText3">Lọc theo loại</label>
                                                <select class="form-control" name="loai_ao_id" id="searchText3">
                                                    <c:forEach items="${listLoaiAos}" var="list">
                                                        <option value="${list.ten}">${list.ten}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Loại</th>
                                        <th>Chất vải</th>
                                        <th>Form</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listAos}" var="list">
                                        <tr>
                                            <td>${list.ten}</td>
                                            <td style="width: 100px">
                                                <img style="width: 100px; border: 1px solid #3bac8b; padding: 5px;"
                                                     src="/images/${list.anhs.get(0).ten_url}" alt="">
                                            </td>
                                            <td>${list.hang.ten}</td>
                                            <td>${list.loaiAo.ten}</td>
                                            <td>${list.chatVai.ten}</td>
                                            <td>${list.form.ten}</td>

                                            <td>
                                                <button class="btn btn-warning" type="submit"
                                                        id="addButton1" formaction="/user/hoa_don/chinh_sua/view_sp/${maHoaDon}"
                                                        name="idSp" value="${list.id}">Chọn
                                                </button>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Ảnh</th>
                                        <th>Hãng</th>
                                        <th>Loại</th>
                                        <th>Chất vải</th>
                                        <th>Form</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<div id="addFormContainer1" style="display: ${noneOrBlock};border: 2px">
    <div class="container-fluid " style="margin-top: 80px; ">
        <div class="card " style="width: 1200px; height: 500px">
            <div class="row px-xl-5 m-3 ">
                <div class="col-lg-5 mb-30 border">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner bg-light">
                            <c:forEach items="${anhs}" var="list" varStatus="status">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                    <img class="" style="width: 100%; height: 400px"
                                         src="/images/${list.ten_url}" alt="Image">
                                </div>
                            </c:forEach>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 h-auto mb-30 border">
                    <div class="h-100 bg-light p-30">
                        <h3 class="ml-2">${ao.ten}</h3>
                        <c:choose>
                            <c:when test="${giamgia != 2}">
                                <div class="gia">
                                    <p class="ml-2">
                                        <del><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                               currencySymbol="VNĐ"/></del>
                                        <strong><fmt:formatNumber value="${ao.giaBan * (100 - giamgia) / 100}"
                                                                  type="currency"
                                                                  currencySymbol="VNĐ"/></strong>
                                    </p>
                                </div>
                            </c:when>
                            <c:when test="${giamgia == 2}">
                                <div class="gia">
                                    <p class="ml-2">
                                        <strong><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                                  currencySymbol="VNĐ"/></strong>
                                    </p>
                                </div>
                            </c:when>
                        </c:choose>
                        <div><h6 class="ml-2"><strong>${slAoDaBan}</strong> sản phẩm đã bán</h6></div>
                        <div id="soLuongTonStr" class="ml-2"></div>
                        <input type="hidden" id="soLuongTon">
                        <form method="post">
                            <input type="hidden" name="idAo" value="${ao.id}" id="idAo">
                            <div class=" mb-4 mt-4">
                                <strong class="text-dark mr-3 ml-2">Colors:</strong>
                                <c:forEach items="${mauSacs}" var="list" varStatus="vTri">
                                    <div class="custom-control custom-radio custom-control-inline"
                                         style="margin-left: 10px; padding-top: 8px; padding-left: 5px">
                                        <input type="radio" id="radio${vTri.index + 1}" name="mauSac"
                                               value="${list.id}">
                                        <label class="radio-label" for="radio${vTri.index + 1}"><span
                                                style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                            <%--                                <input type="radio" class="custom-control-input" id="color-${vTri.index + 1}" name="mauSac" value="${list.id}">--%>
                                            <%--                                <label class="custom-control-label" for="color-${vTri.index + 1}">${list.ten}</label>--%>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class=" mb-3">
                                <strong class="text-dark mr-3 ml-2">Sizes:</strong>
                                <c:forEach items="${sizes}" var="list" varStatus="vTri">
                                    <div class="custom-control custom-radio custom-control-inline"
                                         style="margin-left: 2px; padding-top: 8px; padding-left: 5px">
                                        <input type="radio" id="size${vTri.index + 1}" name="size"
                                               value="${list.id}">
                                        <label class="radio-label" for="size${vTri.index + 1}"><span
                                                style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                            <%--                                <input type="radio" class="custom-control-input" id="size-${vTri.index + 1}" name="size" value="${list.id}">--%>
                                            <%--                                <label class="custom-control-label" for="size-${vTri.index + 1}">${list.ten}</label>--%>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="d-flex align-items-center mb-4 pt-2 ml-2">
                                <div class="input-group quantity mr-3" style="width: 130px;" id="mauSacAndSize">
                                    <div class="input-group-append">
                                        <button class="btn btn-warning btn-minus" type="button"
                                                onclick="decreaseQuantity()">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                        <input type="text" class="form-control bg-light border-0 text-center"
                                               value="1"
                                               name="sl" id="quantityInput">
                                        <button class="btn btn-warning btn-plus" type="button"
                                                onclick="increaseQuantity()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <input type="hidden" value="${idHoaDon}" name="idHoaDon">
                                <button class="btn btn-warning px-3 ml-2"
                                        formaction="/user/hoa_don/chinh_sua/them_sp/${maHoaDon}"
                                        onclick="addProduct()"><i class="fa fa-shopping-cart mr-1"></i> Thêm vào hóa đơn
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../../../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../../../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../../../resources/js/main.js"></script>
<script>
    var vTriStr = document.getElementById("vTri").value;

    var vTri = parseFloat(vTriStr);


    for (vTri = 1; vTri < 99; vTri++) {
        var gia = parseFloat(document.getElementById("donGia1" + vTri).value);

        var gia1 = gia;
        var gia1Formatted = gia1.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        document.getElementById("abc" + vTri).value = gia1WithCurrency;
    }

    function updateSL(vTri) {

        var slStr = document.getElementById("sl" + vTri).value;

        var sl;

        if (slStr.trim() === '') {
            sl = 0;
        } else {
            sl = parseFloat(slStr);
        }

        var giaStr = document.getElementById("gia" + vTri).textContent;

        var gia = parseFloat(giaStr);

        var tongTien = sl * gia * 1000;

        document.getElementById("donGia1" + vTri).value = tongTien.toFixed(0);

        var gia1Formatted1 = tongTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

        document.getElementById("abc" + vTri).value = gia1WithCurrency1;

    }

</script>
<script>
    function kiemTra() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
        var coCheckboxDuocChon = false;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                coCheckboxDuocChon = true;
                var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value); // Sửa lỗi ở đây
                var sl = parseFloat(document.getElementById("sl" + (i + 1)).value); // Sửa lỗi ở đây
                var input = document.getElementById("sl" + (i + 1)).value;

                console.log(sl);
                console.log(slTon);
                if (input === '' || isNaN(input)) {
                    Swal.fire({
                        icon: 'warning',
                        html: '<div class="swal-text">Bạn chưa nhập số lượng</div><div class="progress-bar-container"></div>',
                        allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
                    });
                    setTimeout(() => {
                        Swal.close();
                    }, 2000);
                    event.preventDefault();
                }

                if (sl <= 0) {
                    Swal.fire({
                        icon: 'warning',
                        html: '<div class="swal-text">Số lượng chọn nhỏ hơn 0 là không hợp lệ</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                        allowOutsideClick: true,
                    });
                    setTimeout(() => {
                        Swal.close();
                    }, 2000);
                    event.preventDefault();
                }

                if (sl > slTon) {
                    Swal.fire({
                        icon: 'warning',
                        html: '<div class="swal-text">Số lượng chọn quá lớn cho sản phẩm</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                        allowOutsideClick: true,
                    });
                    setTimeout(() => {
                        Swal.close();
                    }, 2000);
                    event.preventDefault();
                }
            }
        }

        if (!coCheckboxDuocChon) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Bạn chưa chọn bất kỳ mặt hàng nào.</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 2000);
            event.preventDefault();
        }
    }
</script>

<script>
    // Hàm tính tổng giá trị khi checkbox được chọn hoặc giá trị đơn giá thay đổi
    function calculateTotal() {
        var checkboxes = document.getElementsByName("chon");
        var total = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                var rowIndex = checkboxes[i].getAttribute("data-index");
                var giaElement = document.getElementById("donGia1" + rowIndex);
                var gia = parseFloat(giaElement.value);
                if (!isNaN(gia)) {
                    total += gia;
                }
            }
        }

        var thanhTien = total;

        var totalElement = document.getElementById("total");
        var totalElement1 = document.getElementById("total1");

        var gia1Formatted2 = thanhTien.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

        totalElement.textContent = gia1WithCurrency2;
        totalElement1.textContent = gia1WithCurrency2;
    }

    // Bắt sự kiện click checkbox
    var checkboxes = document.getElementsByName("chon");
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("change", calculateTotal);
        checkboxes[i].setAttribute("data-index", i + 1); // Lưu trữ index để có thể tìm các phần tử liên quan
    }

    // Bắt sự kiện thay đổi giá trị số lượng
    var soLuongInputs = document.getElementsByName("soLuong");
    for (var i = 0; i < soLuongInputs.length; i++) {
        soLuongInputs[i].addEventListener("input", function (event) {
            var rowIndex = event.target.getAttribute("data-index");
            var sl = parseFloat(event.target.value);
            var giaElement = document.getElementById("gia" + rowIndex);
            var gia = parseFloat(giaElement.textContent);
            var donGiaElement = document.getElementById("donGia1" + rowIndex);
            var tongTien = sl * gia * 1000;
            donGiaElement.value = tongTien.toFixed(0);
            calculateTotal();
        });
        soLuongInputs[i].setAttribute("data-index", i + 1); // Lưu trữ index để có thể tìm các phần tử liên quan
    }
</script>
<script>
    function xoaGioHang(gioHangChiTietId) {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/user/gio_hang/delete/${idKh}/" + gioHangChiTietId;
            }
        });
        event.preventDefault();
    }

    function xoaHoaDonChinhSua(hoaDonChinhSuaId) {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn xóa sản phẩm khỏi hóa đơn chờ thanh toán?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/user/hoa_don_chinh_sua/delete/" + hoaDonChinhSuaId;
            }
        });
        event.preventDefault();
    }
</script>
<script>
    var themThanhCong = "${themThanhCong}";
    var xoaThanhCong = "${xoaThanhCong}";
    if (themThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Thêm thành công!',
            icon: 'success',
        });
    }
    if (xoaThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Xóa thành công!',
            icon: 'success',
        });
    }
</script>
<script>
    function themSp(){
        addFormContainer.style.display = "block";
        event.preventDefault();
    }
    var addFormContainer = document.getElementById("addFormContainer");
    var addFormContainer1 = document.getElementById("addFormContainer1");
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });
</script>
<script>

    var input1 = document.getElementById("quantityInput");

    // Thêm sự kiện "input" để kiểm tra mỗi khi người dùng nhập
    input1.addEventListener("input", function () {
        // Lấy giá trị hiện tại của input
        var value = this.value;

        // Sử dụng biểu thức chính quy để kiểm tra nếu giá trị chứa dấu trừ hoặc chữ cái
        if (/[-a-zA-Z]/.test(value)) {
            // Nếu có, loại bỏ chúng và cập nhật giá trị
            value = value.replace(/[-a-zA-Z]/g, "");
            this.value = value;
        }
    });

    function increaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var soLuongTon = document.getElementById("soLuongTon").value;

        var value = parseFloat(input);
        var sl = parseFloat(soLuongTon);

        if (value < sl - 1) {
            var min = value++;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = sl - 1;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function decreaseQuantity() {
        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        if (value > 0) {
            var min = value--;
            document.getElementById("quantityInput").value = min.toFixed(0);
        } else {
            var max = 0;
            document.getElementById("quantityInput").value = max.toFixed(0);
        }
    }

    function addProduct() {

        var input = document.getElementById("quantityInput").value;
        var value = parseFloat(input);

        var soLuongTon = document.getElementById("soLuongTon").value;
        var sl = parseFloat(soLuongTon);

        var selectedMauSac = document.querySelector('input[name="mauSac"]:checked');
        var selectedSize = document.querySelector('input[name="size"]:checked');

        var hasError = false;

        if (input === '' || isNaN(input)) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Bạn chưa nhập số lượng</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }

        if (!selectedMauSac || !selectedSize) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn cả màu sắc và kích thước áo</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (sl == 0) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Sản phẩm đã hết, bạn vui lòng chọn sản phẩm khác</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (value > sl) {
            addFormContainer.style.display = "none";
            addFormContainer1.style.display = "none";
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Số lượng tồn không đủ</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
            });
            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = "block";
                addFormContainer1.style.display = "block";
            }, 1000);
            hasError = true;
        }
        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }

</script>
<script>

    var mauSacAndSizeDiv = document.getElementById("mauSacAndSize");

    // Ẩn div mauSacAndSize ban đầu
    mauSacAndSizeDiv.style.display = "none";

    function updateProductAvailability() {
        var selectedColor = document.querySelector("input[name='mauSac']:checked");
        var selectedSize = document.querySelector("input[name='size']:checked");

        if (selectedColor && selectedSize) {
            var colorId = selectedColor.value;
            var sizeId = selectedSize.value;
            var idAo = document.getElementById("idAo").value;

            // Tạo đối tượng XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/find/" + idAo + "/" + colorId + "/" + sizeId, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response > 0) {
                        // Cập nhật nội dung của phần tử div
                        document.getElementById("soLuongTonStr").textContent = "Số lượng sản phẩm còn lại: " + response;
                        document.getElementById("soLuongTon").value = response;

                    } else {
                        document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                        document.getElementById("soLuongTon").value = 0;
                    }
                } else {
                    document.getElementById("soLuongTonStr").textContent = "Đã hết sản phẩm";
                    document.getElementById("soLuongTon").value = 0;
                }
            };

            xhr.send();

            // Hiển thị div mauSacAndSize
            mauSacAndSizeDiv.style.display = "block";
        }
    }

    // Thêm sự kiện change cho các input radio
    var colorInputs = document.querySelectorAll("input[name='mauSac']");
    var sizeInputs = document.querySelectorAll("input[name='size']");

    colorInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });

    sizeInputs.forEach(function (input) {
        input.addEventListener("change", updateProductAvailability);
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText2').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText3').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Get references to the input and table elements
        var inputSP = document.getElementById("inputSP");
        var table1 = document.querySelectorAll("#example1 tbody tr");

        // Add an input event listener to the filter input
        inputSP.addEventListener("input", function () {
            var filterValue1 = inputSP.value.toLowerCase().trim();

            // Loop through each table row and hide/show based on the filter value
            table1.forEach(function (row) {
                var tenSP = row.querySelector("td:nth-child(1)").textContent.toLowerCase();

                if ( tenSP.startsWith(filterValue1)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        });
    });
</script>

</body>

</html>