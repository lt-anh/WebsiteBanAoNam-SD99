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
    <style>
        .label1 {
            position: absolute;
            top: -10px;
            right: -8px;
            color: red;
            padding: 5px;
            padding-left: 278px;
            transform: rotate(0deg);
            transform-origin: top right;
            animation: blink 1s infinite alternate;
            white-space: nowrap;
        }

        @keyframes blink {
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }
    </style>
    <style>
        #showMore1, #showLess1, #showMore2, #showLess2, #showMore3, #showLess3, #showMore4, #showLess4, #showMore5, #showLess5, .class-radio-b {
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        #showMore1:hover,
        #showLess1:hover,
        #showMore2:hover,
        #showLess2:hover,
        #showMore3:hover,
        #showLess3:hover,
        #showMore4:hover,
        #showLess4:hover,
        #showMore5:hover,
        #showLess5:hover{
            transform: translateY(-5px);
        }
        .class-radio-b:hover{
            color: red;
        }
        .button-loc-b{
            position: fixed;
            width: 21.6%;
            margin-left: 4%;
            top: 88%;
            left: 0;
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
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link ">Trang chủ</a>
                        <a href="/user/shop/${idKh}" class="nav-item nav-link active">Cửa hàng</a>
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
                <span class="breadcrumb-item active">Cửa hàng</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-4">
            <!-- Price Start -->
            <form method="post">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Giá </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh2')"></i></span>
                </h5>
                <div id="view_anh2" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <div class="custom-control custom-combobox d-flex align-items-center justify-content-between mb-3">
                            <select class="custom-select mr-2" id="minPrice" name="minPrice">
                                <option value="">Min</option>
                                <option value="10000" ${minPriceInt == "10000"?'selected':''}>10.000</option>
                                <option value="30000" ${minPriceInt == "30000"?'selected':''}>30.000</option>
                                <option value="50000" ${minPriceInt == "50000"?'selected':''}>50.000</option>
                                <option value="70000" ${minPriceInt == "70000"?'selected':''}>70.000</option>
                                <!-- Thêm các tùy chọn giá khác tùy theo nhu cầu của bạn -->
                            </select>

                            <!-- Combobox Max Giá -->
                            <select class="custom-select ml-2" id="maxPrice" name="maxPrice">
                                <option value="">Max</option>
                                <option value="150000" ${maxPriceInt == "150000"?'selected':''}>150.000</option>
                                <option value="200000" ${maxPriceInt == "200000"?'selected':''}>200.000</option>
                                <option value="250000" ${maxPriceInt == "250000"?'selected':''}>250.000</option>
                                <option value="300000" ${maxPriceInt == "300000"?'selected':''}>300.000</option>
                                <!-- Thêm các tùy chọn giá khác tùy theo nhu cầu của bạn -->
                            </select>
                        </div>
                    </div>
                </div>
                <!-- Price End -->

                <!-- Color Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Form </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh3')"></i></span>
                </h5>
                <div id="view_anh3" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listForm}" var="list" varStatus="status">
                            <div class="custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio"
                                       class="control-input <c:if test="${status.index >1}">hidden_Form</c:if> "
                                       id="form-${status.index}"
                                       name="idForm" value="${list.id}" ${idFormS == list.id?'checked':''}>
                                <label class="<c:if test="${status.index >1}">hidden_Form</c:if> "
                                       for="form-${status.index}"
                                       style="width: 200px; padding-top: 8px"><span class="class-radio-b">${list.ten}</span> </label>
                            </div>
                        </c:forEach>
                        <div style="margin-left: 30%; width: 40%">
                            <p onclick="showMore1()" id="showMore1">Xem Thêm <i class="fas fa-angle-down"></i></p>
                            <p onclick="showLess1()" id="showLess1" style="display: none">Rút gọn <i
                                    class="fas fa-angle-up"></i></p>
                        </div>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Hãng </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh4')"></i></span>
                </h5>
                <div id="view_anh4" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listHang}" var="list" varStatus="status">
                            <div class="custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio"
                                       class="control-input <c:if test="${status.index >1}">hidden_Hang</c:if> "
                                       id="hang-${status.index}"
                                       name="idHang" value="${list.id}" ${idHangS == list.id?'checked':''}>
                                <label class="<c:if test="${status.index >1}">hidden_Hang</c:if> "
                                       style="width: 200px; padding-top: 8px"
                                       for="hang-${status.index}"><span class="class-radio-b">${list.ten}</span></label>
                            </div>
                        </c:forEach>
                        <div style="margin-left: 30%; width: 40%">
                            <p onclick="showMore2()" id="showMore2">Xem Thêm <i class="fas fa-angle-down"></i></p>
                            <p onclick="showLess2()" id="showLess2" style="display: none">Rút gọn <i
                                    class="fas fa-angle-up"></i></p>
                        </div>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Loại áo </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh5')"></i></span>
                </h5>
                <div id="view_anh5" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listLoaiAo}" var="list" varStatus="status">
                            <div class="custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio"
                                       class="control-input <c:if test="${status.index >1}">hidden_LoaiAo</c:if> "
                                       id="loaiAo-${status.index}"
                                       name="idLoaiAo" value="${list.id}" ${idLoaiAoS == list.id?'checked':''}>
                                <label class="<c:if test="${status.index >1}">hidden_LoaiAo</c:if> "
                                       style="width: 200px; padding-top: 8px"
                                       for="loaiAo-${status.index}"><span class="class-radio-b">${list.ten}</span></label>
                            </div>
                        </c:forEach>
                        <div style="margin-left: 30%; width: 40%">
                            <p onclick="showMore3()" id="showMore3">Xem Thêm <i class="fas fa-angle-down"></i></p>
                            <p onclick="showLess3()" id="showLess3" style="display: none">Rút gọn <i
                                    class="fas fa-angle-up"></i></p>
                        </div>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Chất vải </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh6')"></i></span>
                </h5>
                <div id="view_anh6" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listChatVai}" var="list" varStatus="status">
                            <div class="custom-radio d-flex align-items-center justify-content-between">
                                <input type="radio"
                                       class="control-input <c:if test="${status.index >1}">hidden_ChatVai</c:if> "
                                       id="cv-${status.index}"
                                       name="idChatVai" value="${list.id}" ${idChatVaiS == list.id?'checked':''}>
                                <label class="<c:if test="${status.index >1}">hidden_ChatVai</c:if> "
                                       style="width: 200px; padding-top: 8px"
                                       for="cv-${status.index}"><span class="class-radio-b">${list.ten}</span></label>
                            </div>
                        </c:forEach>
                        <div style="margin-left: 30%; width: 40%">
                            <p onclick="showMore4()" id="showMore4">Xem Thêm <i class="fas fa-angle-down"></i></p>
                            <p onclick="showLess4()" id="showLess4" style="display: none">Rút gọn <i
                                    class="fas fa-angle-up"></i></p>
                        </div>
                    </div>
                </div>
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"><p style="display: inline-block;width: 100px">Màu sắc </p><i
                        style="display: inline-block" class="fas fa-angle-down"
                        onclick="toggleView('view_anh7')"></i></span>
                </h5>
                <div id="view_anh7" style="display:block">
                    <div class="bg-light p-4 mb-30">
                        <c:forEach items="${listMauSac}" var="list" varStatus="status">
                            <div class="custom-radio d-flex align-items-center justify-content-between">
                                <input type="checkbox"
                                       class="control-input <c:if test="${status.index >1}">hidden_MauSac</c:if> "
                                       id="ms-${status.index}"
                                       name="mauSacIds" value="${list.id}" ${mauSacIdsS.contains(list.id)?'checked':''}>
                                <label class="<c:if test="${status.index >1}">hidden_MauSac</c:if>"
                                       style="width: 200px; padding-top: 8px"
                                       for="ms-${status.index}"> <span class="class-radio-b">${list.ten}</span></label>
                            </div>
                        </c:forEach>
                        <div style="margin-left: 30%; width: 40%">
                            <p onclick="showMore5()" id="showMore5">Xem Thêm <i class="fas fa-angle-down"></i></p>
                            <p onclick="showLess5()" id="showLess5" style="display: none">Rút gọn <i
                                    class="fas fa-angle-up"></i></p>
                        </div>
                    </div>
                </div>
                <button class="btn btn-block btn-primary font-weight-bold my-3 py-3 button-loc-b"
                        formaction="/user/tim_kiem_nang_cao/${idKh}">Lọc
                </button>

            </form>
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-8">
            <div class="row pb-3" id="product-list">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div>
                            Số sản phẩm tìm kiếm ra : ${soLuongTimKiemRa}
                        </div>
                    </div>
                </div>
                <c:forEach items="${items}" var="list">
                    <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid" style="width: 100%; height: 350px"
                                     src="/images/${list.ao.anhs.get(0).ten_url}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square"
                                       href="/user/san_pham_detail/${idKh}/${list.ao.id}"><i
                                            class="fa fa-search"></i></a>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${icon == 1}">
                                    <div class="label1"><img src="/images/best_seller.png" style="width: 100%"></div>
                                </c:when>
                                <c:when test="${icon == 2}">
                                    <div class="label1"><img src="/images/new_no_phong.png" style="width: 80%"></div>
                                </c:when>
                            </c:choose>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate"
                                   href="/user/san_pham_detail/${idKh}/${list.ao.id}"
                                   style="display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.ao.ten}</a>
                                <c:choose>
                                    <c:when test="${list.giaBan == list.ao.giaBan}">
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h5 style="color: red;"><fmt:formatNumber value="${list.ao.giaBan}"
                                                                                      type="currency"
                                                                                      currencySymbol="VNĐ"/></h5>
                                        </div>
                                        <p>Sản phẩm đã bán ${list.slBan}</p>
                                    </c:when>
                                    <c:when test="${list.giaBan < list.ao.giaBan}">
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h6 class="text-muted ml-2">
                                                <del><fmt:formatNumber value="${list.ao.giaBan}" type="currency"
                                                                       currencySymbol="VNĐ"/></del>
                                            </h6>
                                            <h5 style="color: red;"><fmt:formatNumber value="${list.giaBan}"
                                                                                      type="currency"
                                                                                      currencySymbol="VNĐ"/></h5>
                                        </div>
                                        <p>Sản phẩm đã bán ${list.slBan}</p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="col-12" style="display: <c:if test="${soLuongTimKiemRa == 0}">none</c:if>">
                    <nav>
                        <div class="row">
                            <div class="col-3">

                            </div>
                            <div class="col-1">
                                <button onclick="previousPage()"
                                        style="width: 80px; background: #0c84ff; border-radius: 5px;color: white">Trước
                                </button>
                            </div>
                            <div class="col-4 d-flex justify-content-center">
                                <ul id="pagination" class="pagination justify-content-center">
                                    <li class="page-item">
                                <span id="currentPage" onclick="previousPage()" class="page-link"
                                      style="background: #0c84ff; color: white;">1</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-1">
                                <button onclick="nextPage()"
                                        style="width: 80px; background: #0c84ff; border-radius: 5px;color: white">Sau
                                </button>
                            </div>
                            <div class="col-3">

                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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
    // Danh sách sản phẩm
    const productList = document.getElementById("product-list");
    const pagination = document.getElementById("pagination");
    const previousPageButton = document.getElementById("currentPage");
    const itemsPerPage = 9;
    const allProducts = productList.querySelectorAll(".col-lg-4");
    let currentPage = 1;

    function displayCurrentPage() {
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        allProducts.forEach((product) => {
            product.style.display = "none";
        });

        for (let i = startIndex; i < endIndex; i++) {
            if (allProducts[i]) {
                allProducts[i].style.display = "block";
            }
        }
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            displayCurrentPage();
            updatePagination();
        }
    }

    function nextPage() {
        const totalPages = Math.ceil(allProducts.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayCurrentPage();
            updatePagination();
        }
    }

    function goToPage(page) {
        currentPage = page;
        displayCurrentPage();
        updatePagination();
    }

    const MAX_VISIBLE_PAGES = 3; // Số lượng trang được hiển thị trung tâm
    const ELLIPSIS = '...'; // Ký hiệu để hiển thị khi có nhiều trang

    function updatePagination() {
        pagination.innerHTML = '';

        const totalPages = Math.ceil(allProducts.length / itemsPerPage);
        let startPage = 1;
        let endPage = totalPages;

        if (totalPages > MAX_VISIBLE_PAGES) {
            const half = Math.floor(MAX_VISIBLE_PAGES / 2);
            const leftOffset = currentPage - half;
            const rightOffset = currentPage + half;

            if (leftOffset > 1) {
                pagination.appendChild(createPageButton(1));
                if (leftOffset > 2) {
                    pagination.appendChild(createEllipsis());
                }
                startPage = leftOffset;
            }

            if (rightOffset < totalPages) {
                if (currentPage === 1) {
                    endPage = 2;
                } else if (currentPage === 2) {
                    endPage = 3;
                } else {
                    endPage = rightOffset;
                    if (rightOffset < totalPages - 1) {
                        pagination.appendChild(createEllipsis());
                    }
                }
            }
        }

        for (let i = startPage; i <= endPage; i++) {
            pagination.appendChild(createPageButton(i));
        }

        displayCurrentPage();
    }


    function createPageButton(page) {
        const li = document.createElement("li");
        const button = document.createElement("button");
        button.classList.add("page-link");
        button.textContent = page;
        button.style.background = currentPage === page ? "#0c84ff" : "";
        button.style.color = currentPage === page ? "white" : "";
        button.onclick = () => goToPage(page);

        li.appendChild(button);
        return li;
    }

    function createEllipsis() {
        const li = document.createElement("li");
        li.textContent = ELLIPSIS;
        return li;
    }


    updatePagination();
    displayCurrentPage();

</script>
<script>
    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>

<script>

    var fLayout = "${fLayout}";
    var hiddenRowsF = document.querySelectorAll('.hidden_Form');

    if (fLayout == "none") {
        for (var i = 0; i < hiddenRowsF.length; i++) {
            hiddenRowsF[i].style.display = "none";
        }
        document.getElementById("showMore1").style.display = "block";
        document.getElementById("showLess1").style.display = "none";
    } else {
        for (var i = 0; i < hiddenRowsF.length; i++) {
            hiddenRowsF[i].style.display = "block";
        }
        document.getElementById("showMore1").style.display = "none";
        document.getElementById("showLess1").style.display = "block";
    }

    function showMore1() {
        // Hiển thị các dòng ẩn
        for (var i = 0; i < hiddenRowsF.length; i++) {
            hiddenRowsF[i].style.display = 'flex';
        }
        document.getElementById("showMore1").style.display = "none";
        document.getElementById("showLess1").style.display = "block";
    }

    function showLess1() {
        // Ẩn các dòng từ dòng thứ 4 trở đi
        for (var i = 0; i < hiddenRowsF.length; i++) {
            hiddenRowsF[i].style.display = 'none';
        }
        document.getElementById("showMore1").style.display = "block";
        document.getElementById("showLess1").style.display = "none";
    }

    /*-------------------------------------------------------*/

    var hLayout = "${hLayout}";
    var hiddenRowsH = document.querySelectorAll('.hidden_Hang');

    if (hLayout == "none") {
        for (var i = 0; i < hiddenRowsH.length; i++) {
            hiddenRowsH[i].style.display = "none";
        }
        document.getElementById("showMore2").style.display = "block";
        document.getElementById("showLess2").style.display = "none";
    } else {
        for (var i = 0; i < hiddenRowsH.length; i++) {
            hiddenRowsH[i].style.display = "block";
        }
        document.getElementById("showMore2").style.display = "none";
        document.getElementById("showLess2").style.display = "block";
    }

    function showMore2() {
        // Hiển thị các dòng ẩn
        for (var i = 0; i < hiddenRowsH.length; i++) {
            hiddenRowsH[i].style.display = 'flex';
        }
        document.getElementById("showMore2").style.display = "none";
        document.getElementById("showLess2").style.display = "block";
    }

    function showLess2() {
        // Ẩn các dòng từ dòng thứ 4 trở đi
        for (var i = 0; i < hiddenRowsH.length; i++) {
            hiddenRowsH[i].style.display = 'none';
        }
        document.getElementById("showMore2").style.display = "block";
        document.getElementById("showLess2").style.display = "none";
    }

    /*-------------------------------------------------------*/

    var laLayout = "${laLayout}";
    var hiddenRowsLA = document.querySelectorAll('.hidden_LoaiAo');

    if (laLayout == "none") {
        for (var i = 0; i < hiddenRowsLA.length; i++) {
            hiddenRowsLA[i].style.display = "none";
        }
        document.getElementById("showMore3").style.display = "block";
        document.getElementById("showLess3").style.display = "none";
    } else {
        for (var i = 0; i < hiddenRowsLA.length; i++) {
            hiddenRowsLA[i].style.display = "block";
        }
        document.getElementById("showMore3").style.display = "none";
        document.getElementById("showLess3").style.display = "block";
    }

    function showMore3() {
        // Hiển thị các dòng ẩn

        for (var i = 0; i < hiddenRowsLA.length; i++) {
            hiddenRowsLA[i].style.display = 'flex';
        }
        document.getElementById("showMore3").style.display = "none";
        document.getElementById("showLess3").style.display = "block";
    }

    function showLess3() {
        // Ẩn các dòng từ dòng thứ 4 trở đi
        for (var i = 0; i < hiddenRowsLA.length; i++) {
            hiddenRowsLA[i].style.display = 'none';
        }
        document.getElementById("showMore3").style.display = "block";
        document.getElementById("showLess3").style.display = "none";
    }

    /*-------------------------------------------------------*/

    var cvLayout = "${cvLayout}";
    var hiddenRowsCV = document.querySelectorAll('.hidden_ChatVai');

    if (cvLayout == "none") {
        for (var i = 0; i < hiddenRowsCV.length; i++) {
            hiddenRowsCV[i].style.display = "none";
        }
        document.getElementById("showMore4").style.display = "block";
        document.getElementById("showLess4").style.display = "none";
    } else {
        for (var i = 0; i < hiddenRowsCV.length; i++) {
            hiddenRowsCV[i].style.display = "block";
        }
        document.getElementById("showMore4").style.display = "none";
        document.getElementById("showLess4").style.display = "block";
    }

    function showMore4() {
        // Hiển thị các dòng ẩn

        for (var i = 0; i < hiddenRowsCV.length; i++) {
            hiddenRowsCV[i].style.display = 'flex';
        }
        document.getElementById("showMore4").style.display = "none";
        document.getElementById("showLess4").style.display = "block";
    }

    function showLess4() {
        // Ẩn các dòng từ dòng thứ 4 trở đi
        for (var i = 0; i < hiddenRowsCV.length; i++) {
            hiddenRowsCV[i].style.display = 'none';
        }
        document.getElementById("showMore4").style.display = "block";
        document.getElementById("showLess4").style.display = "none";
    }

    /*-------------------------------------------------------*/

    var msLayout = "${msLayout}";
    var hiddenRowsMS = document.querySelectorAll('.hidden_MauSac');

    if (msLayout == "none") {
        for (var i = 0; i < hiddenRowsMS.length; i++) {
            hiddenRowsMS[i].style.display = "none";
        }
        document.getElementById("showMore5").style.display = "block";
        document.getElementById("showLess5").style.display = "none";
    } else {
        for (var i = 0; i < hiddenRowsMS.length; i++) {
            hiddenRowsMS[i].style.display = "block";
        }
        document.getElementById("showMore5").style.display = "none";
        document.getElementById("showLess5").style.display = "block";
    }

    function showMore5() {
        // Hiển thị các dòng ẩn

        for (var i = 0; i < hiddenRowsMS.length; i++) {
            hiddenRowsMS[i].style.display = 'flex';
        }
        document.getElementById("showMore5").style.display = "none";
        document.getElementById("showLess5").style.display = "block";
    }

    function showLess5() {
        // Ẩn các dòng từ dòng thứ 4 trở đi
        for (var i = 0; i < hiddenRowsMS.length; i++) {
            hiddenRowsMS[i].style.display = 'none';
        }
        document.getElementById("showMore5").style.display = "block";
        document.getElementById("showLess5").style.display = "none";
    }
</script>

</body>

</html>