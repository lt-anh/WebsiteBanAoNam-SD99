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
    <style>
        /* Style tab buttons */
        /* Style tab buttons */
        .tab2, .tab3, .tab4, .tab5 {
            display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            border-bottom: none; /* Loại bỏ viền dưới của tab */
            margin-right: 5px;
            border-radius: 5px 5px 0 0;
        }

        .tab1 {
            display: inline-block;
            padding: 10px 20px;
            background-color: #aaa;
            cursor: pointer;
            border: 1px solid #aaa;
            border-bottom: none; /* Loại bỏ viền dưới của tab */
            margin-right: 5px;
            border-radius: 5px 5px 0 0;
        }

        /* Style the content */
        .tab-content {
            display: none;
            padding: 20px;
            border: 1px solid #aaa;
            border-top: none;
        }

        .tab-content1 {
            display: none;
            padding: 20px;
            border: 1px solid #aaa;
            border-top: none;
        }

        .divider {
            border-bottom: 1px dashed #aaa;
            margin: 10px 0;
        }

        /* CSS cho mã hóa đơn */
        .invoice-code {
            font-size: 24px;
            font-weight: bold;
        }

        /* CSS cho thông tin sản phẩm */
        .product-info {
            margin: 10px 0;
        }

        /* CSS cho đơn giá */
        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }

        /* CSS cho nút (button) */
        button {
            background-color: #007bff; /* Màu nền */
            color: #fff; /* Màu chữ */
            border: none; /* Loại bỏ viền */
            padding: 10px 20px; /* Kích thước nút */
            border-radius: 5px; /* Bo góc */
            cursor: pointer; /* Con trỏ khi di chuột qua nút */
        }

        button:hover {
            background-color: #0056b3; /* Màu nền khi hover qua nút */
        }

    </style>
    <style>
        .rating-container {
            display: flex;
            align-items: center;
        }

        .star {
            font-size: 24px;
            cursor: pointer;
            color: #ccc;
        }

        .star.active {
            color: #ffcc00;
        }

        #comment {
            width: 100%;
            height: 100px;
            resize: none;
        }

        #liDoTraHang {
            width: 100%;
            height: 100px;
            resize: none;
        }

        /* Ẩn input radio */
        input[type="radio"] {
            display: none;
        }
    </style>
    <style>
        #addFormContainer1 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }

        #addFormContainer3 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm3 {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }


        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }
    </style>
    <style>
        .custom-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff; /* Màu nền */
            color: #fff; /* Màu chữ */
            text-decoration: none;
            border-radius: 5px; /* Góc bo tròn */
            transition: background-color 0.3s ease; /* Hiệu ứng chuyển đổi màu nền */
        }

        .custom-button:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }
    </style>
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
            animation: slide-out 1s linear; /* Hiệu ứng chạy thời gian 2s */
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
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link">Trang chủ</a>
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
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" style="color: #ffd019"></i>
                                                <span class="badge text-secondary border border-secondary rounded-circle"
                                                      style="padding-bottom: 2px;">${khachHangNow.ten}</span></a>
                                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                                <a href="/user/thong_tin/${idKh}" class="dropdown-item">Thông tin</a>
                                                <a href="/user/don_hang/${idKh}" class="dropdown-item">Đơn hàng</a>
                                                <a href="/logout" class="dropdown-item">Đăng xuất</a>
                                            </div>
                                        </div>
                                        <a href="/user/gio_hang/view/${idKh}" class="nav-item nav-link"><i class="fas fa-shopping-cart text-primary"></i>
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
                <a class="breadcrumb-item text-dark" href="/user/trang_chu/${idKh}">Trang chủ</a>
                <a class="breadcrumb-item text-dark" href="/user/don_hang/${idKh}">Thông tin</a>
                <span class="breadcrumb-item">Đơn hàng</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">

            <div class="col-lg-2 table-responsive mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Tài khoản của tôi</span>
                </h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-wallet" style="width: 20px"></i>
                        <a href="/user/vi_view/${idKh}" style="color: black;">Ví shop</a></li>
                    <li><i class="fas fa-info-circle" style="width: 20px"></i><a href="/user/thong_tin/${idKh}"
                                                                                 style="color: black;">Thông
                        tin</a></li>
                    <li style="display: <c:if test="${khachHangNow.matKhau == null}">none</c:if>"><i class="fas fa-key" style="width: 20px"></i><a href="/user/doi_mat_khau_view/${idKh}"
                                                                         style="color: black;">Đổi mật khẩu</a>
                    </li>
                </ul>

                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Đơn hàng</span>
                </h5>
                <ul class="list-unstyled" style="background-color: #ff8b33">
                    <li><i class="fas fa-shopping-cart" style="width: 20px"></i>
                        <a href="/user/don_hang/${idKh}" style="color: black;">Danh sách đơn hàng</a></li>
                </ul>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Đăng xuất</span>
                </h5>
                <ul class="list-unstyled">
                    <li><i class="fas fa-sign-out-alt" style="width: 20px"></i>
                        <a href="#" style="color: black;" onclick="confirmLogout();">Đăng xuất</a></li>
                </ul>
            </div>
            <div class="col-lg-10">
                <section class="content-header">
                    <div class="container-fluid">
                        <div>
                            <div class="tab1" id="optab1" onclick="openTab1()"><i class="fa fa-clock"></i> Chờ thanh
                                toán
                            </div>
                            <div class="tab2" id="optab2" onclick="openTab2()"><i class="fas fa-hourglass-start"></i>
                                Chờ xác nhận
                            </div>
                            <div class="tab2" id="optab6" onclick="openTab6()"><i class="fas fa-box"></i>
                                Đóng gói
                            </div>
                            <div class="tab3" id="optab3" onclick="openTab3()"><i class="fas fa-truck"></i> Đang giao
                            </div>
                            <div class="tab4" id="optab4" onclick="openTab4()"><i class="fas fa-check-circle"></i> Hoàn
                                thành
                            </div>
                            <div class="tab5" id="optab5" onclick="openTab5()"><i class="fas fa-times"></i> Đã hủy</div>
                        </div>
                        <form method="post">
                            <div id="tab1" class="tab-content1">
                                <c:forEach items="${listHoaDonDTOChuaThanhToan}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.donGia}" type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <p class="total-price">
                                        <a href="/user/hoa_don/chinh_sua/${list.hoaDon.ma}" class="custom-button">Chỉnh
                                            sửa</a>
                                        <a href="/user/hoa_don/view_hoa_don/${list.hoaDon.id}" class="custom-button">Thanh
                                            toán</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab2" class="tab-content">
                                <c:forEach items="${listHoaDonDTOChoXacNhan}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <p class="total-price">
                                        <button formaction="/user/hoa_don/huy" name="idHoaDon" value="${list.hoaDon.id}"
                                                class="custom-button">Hủy
                                        </button>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>
                            <div id="tab6" class="tab-content">
                                <c:forEach items="${listHoaDonDTODongGoi}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab3" class="tab-content">
                                <c:forEach items="${listHoaDonDTODangGiao}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>
                            <div id="tab4" class="tab-content">
                                <c:forEach items="${listHoaDonDTOHoanThanh}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.hoaDon.tongTien}"
                                                                                  type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <p class="total-price">
                                        <a href="/user/danh_gia_view/${list.hoaDon.id}" class="custom-button">Đánh
                                            giá</a>
                                        <a href="/user/hoa_don/mua_lai/${list.hoaDon.id}" class="custom-button">Mua
                                            lại</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>

                            <div id="tab5" class="tab-content">
                                <c:forEach items="${listHoaDonDTOHuy}" var="list">
                                    <p class="invoice-code">${list.hoaDon.ma}</p>
                                    <c:forEach items="${list.hoaDonChiTiets}" var="hdCT">
                                        <div class="product-info">
                                            <a href="/user/san_pham_detail/${idKh}/${hdCT.aoChiTiet.ao.id}"
                                               style="color: black">
                                                <p><img src="/images/${hdCT.aoChiTiet.ao.anhs.get(0).ten_url}"
                                                        style="width: 50px; height: 50px; margin-left: 40px"> ${hdCT.aoChiTiet.ao.ten}
                                                </p></a>
                                            <p style="margin-left: 40px">${hdCT.aoChiTiet.mau_sac.ten}, ${hdCT.aoChiTiet.size.ten}
                                                x ${hdCT.soLuong}</p>
                                        </div>
                                    </c:forEach>
                                    <p class="total-price">Thành tiền: <label
                                            style="color: red"> <fmt:formatNumber value="${list.donGia}" type="currency"
                                                                                  currencySymbol="VNĐ"/></label></p>
                                    <p class="total-price">
                                        <a href="/user/hoa_don/mua_lai/${list.hoaDon.id}" class="custom-button">Mua
                                            lại</a>
                                    </p>
                                    <div class="divider"></div>
                                </c:forEach>
                            </div>
                        </form>
                    </div><!-- /.container-fluid -->
                </section>
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

<div id="addFormContainer1" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm1">

                <h1>Đánh giá sản phẩm</h1>
                <input type="hidden" name="idKh" value="${hoaDon.khachHang.ma}">
                <label>Sản phẩm :</label>
                <select class="form-control" name="aoChiTietId">
                    <c:forEach items="${listHoaDonChiTiets}" var="list">
                        <option value="${list.aoChiTiet.id}">${list.aoChiTiet.ao.ten}, ${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</option>
                    </c:forEach>
                </select>
                <br>
                <label>Chất lượng :</label>
                <div class="rating-container">
                    <label class="star" data-rating="1">
                        ☆
                        <input type="radio" name="rating" value="1">
                    </label>
                    <label class="star" data-rating="2">
                        ☆
                        <input type="radio" name="rating" value="2">
                    </label>
                    <label class="star" data-rating="3">
                        ☆
                        <input type="radio" name="rating" value="3">
                    </label>
                    <label class="star" data-rating="4">
                        ☆
                        <input type="radio" name="rating" value="4">
                    </label>
                    <label class="star" data-rating="5">
                        ☆
                        <input type="radio" name="rating" value="5">
                    </label>
                </div>
                <span id="errorRating" class="text-danger"></span>
                <br>
                <textarea id="comment" placeholder="Nhận xét của bạn" name="binhLuan"></textarea>
                <span id="errorComment" class="text-danger"></span>
                <br>
                <button type="submit" formaction="/user/danh_gia" onclick="validateComment()">Gửi đánh giá</button>

            </form>
        </div>
    </div>
</div>

<div id="addFormContainer3" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm3">

                <h1>Trả hàng</h1>
                <input type="hidden" name="idHoaDonTraHang" value="${hoaDon.id}">
                <label>Sản phẩm :</label>
                <select class="form-control" name="aoChiTietId">
                    <c:forEach items="${listHoaDonChiTiets}" var="list">
                        <option value="${list.aoChiTiet.id}">${list.aoChiTiet.ao.ten}, ${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</option>
                    </c:forEach>
                </select>
                <br>
                <label>Số lượng trả :</label>
                <input type="number" name="soLuongYeuCauTra" id="soLuongYeuCauTra">
                <br>
                <span id="errorSoLuongYeuCauTra" class="text-danger"></span>
                <br>
                <label>Lí do trả hàng :</label>
                <br>
                <textarea id="liDoTraHang" placeholder="Lí do trả hàng" name="liDoTraHang"></textarea>
                <br>
                <span id="errorLiDoTraHang" class="text-danger"></span>
                <br>
                <label style="color: red">Sau khi trả hàng vui lòng liên hệ với shop qua zalo : 0987.654.321 hoặc nhắn với shop qua hỗ trợ chat</label>
                <br>
                <button type="submit" formaction="/user/tra_hang" onclick="validateTraHang()">Yêu cầu trả hàng</button>

            </form>
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
    function validateComment() {
        var comment = document.getElementById("comment").value;
        var rating = document.querySelector('input[name="rating"]:checked');
        var errorComment = document.getElementById('errorComment');
        var errorRating = document.getElementById('errorRating');
        var addFormContainer = document.getElementById("addFormContainer1");
        var forbiddenWords = ["lol", "cc", "dm", "vai", "lon", "du", "me", "concac", "đéo", "con cặc"];
        var foundForbiddenWord = false;

        if (!rating) {
            errorRating.innerText = 'Vui lòng chọn số sao đánh giá.';
            event.preventDefault();
        } else {
            errorRating.innerText = '';
        }

        if (comment.trim() === '') {
            errorComment.innerText = 'Vui lòng nhập bình luận.';
            event.preventDefault();
        } else {
            errorComment.innerText = '';
        }

        forbiddenWords.forEach(function (word) {
            if (comment.toLowerCase().includes(word)) {
                foundForbiddenWord = true;
            }
        });
        if (foundForbiddenWord) {
            addFormContainer.style.display = 'none';
            Swal.fire({
                icon: 'error',
                html: '<div class="swal-text">Xin lỗi, từ ngữ bạn sử dụng không phù hợp</div><div class="progress-bar-container"></div>',
                allowOutsideClick: true

            });

            setTimeout(() => {
                Swal.close();
                addFormContainer.style.display = 'block';
            }, 1000);

            event.preventDefault();
        }
    }

    function validateTraHang() {
        var soLuongYeuCauTra = document.getElementsByName('soLuongYeuCauTra')[0].value;
        var liDoTraHang = document.getElementsByName('liDoTraHang')[0].value;

        var errorSoLuongYeuCauTra = document.getElementById('errorSoLuongYeuCauTra');
        var errorLiDoTraHang = document.getElementById('errorLiDoTraHang');

        if (soLuongYeuCauTra.trim() === '' || parseInt(soLuongYeuCauTra) < 0) {
            errorSoLuongYeuCauTra.innerHTML = 'Số lượng trả không hợp lệ';
            document.getElementById('soLuongYeuCauTra').style.borderColor = 'red';
            event.preventDefault();
        } else {
            document.getElementById('soLuongYeuCauTra').style.borderColor = 'gray';
            errorSoLuongYeuCauTra.innerHTML = '';
        }

        // Kiểm tra Lí do trả hàng
        if (liDoTraHang.trim() === '') {
            document.getElementById('liDoTraHang').style.borderColor = 'red';
            errorLiDoTraHang.innerHTML = 'Lí do trả hàng không được để trống';
            event.preventDefault();
        } else {
            document.getElementById('liDoTraHang').style.borderColor = 'gray';
            errorLiDoTraHang.innerHTML = '';
        }
    }
</script>
<script>
    function openTab1() {
        document.getElementById("tab1").style.display = "block";
        document.getElementById("optab1").style.background = "white";

        document.getElementById("tab2").style.display = "none";
        document.getElementById("optab2").style.background = "#aaa";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";

        document.getElementById("tab6").style.display = "none";
        document.getElementById("optab6").style.background = "#aaa";
    }

    function openTab2() {
        document.getElementById("tab2").style.display = "block";
        document.getElementById("optab2").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";

        document.getElementById("tab6").style.display = "none";
        document.getElementById("optab6").style.background = "#aaa";
    }

    function openTab3() {
        document.getElementById("tab3").style.display = "block";
        document.getElementById("optab3").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";

        document.getElementById("tab2").style.display = "none";
        document.getElementById("optab2").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";

        document.getElementById("tab6").style.display = "none";
        document.getElementById("optab6").style.background = "#aaa";
    }

    function openTab4() {
        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";

        document.getElementById("tab2").style.display = "none";
        document.getElementById("optab2").style.background = "#aaa";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";

        document.getElementById("tab6").style.display = "none";
        document.getElementById("optab6").style.background = "#aaa";
    }

    function openTab5() {
        document.getElementById("tab5").style.display = "block";
        document.getElementById("optab5").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";

        document.getElementById("tab2").style.display = "none";
        document.getElementById("optab2").style.background = "#aaa";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab6").style.display = "none";
        document.getElementById("optab6").style.background = "#aaa";
    }

    function openTab6() {
        document.getElementById("tab6").style.display = "block";
        document.getElementById("optab6").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";

        document.getElementById("tab2").style.display = "none";
        document.getElementById("optab2").style.background = "#aaa";

        document.getElementById("tab3").style.display = "none";
        document.getElementById("optab3").style.background = "#aaa";

        document.getElementById("tab4").style.display = "none";
        document.getElementById("optab4").style.background = "#aaa";

        document.getElementById("tab5").style.display = "none";
        document.getElementById("optab5").style.background = "#aaa";
    }
</script>
<script>
    let currentRating = 0;

    // Xử lý sự kiện khi người dùng chọn số sao
    const stars = document.querySelectorAll('.star');
    stars.forEach(star => {
        star.addEventListener('click', () => {
            const rating = parseInt(star.getAttribute('data-rating'));
            currentRating = rating;
            highlightStars(rating);
            // Đánh dấu nút radio tương ứng
            const radio = star.querySelector('input[type="radio"]');
            if (radio) {
                radio.checked = true;
                console.log("Giá trị radio được chọn: " + radio.value);
            }
        });
    });

    // Tô màu các sao theo đánh giá hiện tại
    function highlightStars(rating) {
        stars.forEach(star => {
            const starRating = parseInt(star.getAttribute('data-rating'));
            if (starRating <= rating) {
                star.classList.add('active');
            } else {
                star.classList.remove('active');
            }
        });
    }

    // Xử lý sự kiện khi người dùng gửi đánh giá
    function submitRating() {
        const comment = document.getElementById('comment').value;
        alert(`Bạn đã đánh giá ${currentRating} sao và để lại bình luận: \n${comment}`);
    }
</script>
<script>
    // Get references to the button and form container

    document.getElementById("tab1").style.display = "block";
    document.getElementById("optab1").style.background = "white";

    var addFormContainer2 = document.getElementById("addFormContainer1");
    var addFormContainer3 = document.getElementById("addFormContainer3");

    var noneOrBlock = "${noneOrBlock}";
    var noneOrBlockTraHang = "${noneOrBlockTraHang}";
    var noneOrBlockLoiTraHang = "${noneOrBlockLoiTraHang}";

    if (noneOrBlock == "block") {
        addFormContainer2.style.display = "block";

        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";
    }

    if (noneOrBlockTraHang == "block") {
        addFormContainer3.style.display = "block";

        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";
    }

    if (noneOrBlockLoiTraHang == "block") {
        addFormContainer3.style.display = 'none';
        document.getElementById("tab4").style.display = "block";
        document.getElementById("optab4").style.background = "white";

        document.getElementById("tab1").style.display = "none";
        document.getElementById("optab1").style.background = "#aaa";
        Swal.fire({
            icon: 'warning',
            html: '<div class="swal-text">Xin lỗi, số lượng bạn muốn trả lớn hơn số lượng bạn mua</div><div class="progress-bar-container"></div>',
            allowOutsideClick: true

        });

        setTimeout(() => {
            Swal.close();
            var errorSoLuongYeuCauTra = document.getElementById('errorSoLuongYeuCauTra');
            errorSoLuongYeuCauTra.innerHTML = 'Số lượng trả không hợp lệ';
            document.getElementById('soLuongYeuCauTra').style.borderColor = 'red';
            addFormContainer3.style.display = "block";
        }, 1000);
    }

    // Add an event listener to the background overlay
    addFormContainer2.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer2) {
            // Hide the form
            addFormContainer2.style.display = "none";
        }
    });

    addFormContainer3.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer3) {
            // Hide the form
            addFormContainer3.style.display = "none";
        }
    });
</script>
<script>
    function confirmLogout() {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn đăng xuất?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng đồng ý đăng xuất, chuyển họ đến trang đăng xuất
                window.location.href = "/logout";
            }
        });
    }
</script>
</body>

</html>