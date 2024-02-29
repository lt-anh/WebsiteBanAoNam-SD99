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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .payment-methods {
            padding: 10px 0;
        }

        #ctgg-details,
        #banking-image,
        #cash-details {
            display: none;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .label_check_box{
            cursor: pointer;
            transition: transform 0.3s ease;
        }
    </style>
    <style>
        .close-btn {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }

        #condition-popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-left: 20%;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 999;
            justify-content: center;
            align-items: center;
        }

        .condition-content {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 80%;
        }

        .voucher-list {
            list-style-type: none;
            padding: 0;
        }

        .voucher-details {
            display: flex;
            align-items: center;
            margin-bottom: 10px; /* Điều chỉnh khoảng cách giữa các voucher */
        }

        .radio-label {
            margin-right: 10px; /* Điều chỉnh khoảng cách giữa ô radio và tên voucher */
        }

        .voucher-condition {
            font-size: 12px;
        }

        /* Các quy tắc CSS khác ở đây */

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

${ngayTao}
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
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-6">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Địa chỉ nhận hàng</span>
                </h5>
                <input type="checkbox" name="diaChiChon" value="diaChiCu" id="checkbox1">
                <label for="checkbox1" class="label_check_box">Địa chỉ ban đầu</label>
                <div id="view_dia_chi_cu" style="display:block">
                    <div class="bg-light p-30 mb-5">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Họ tên</label>
                                <input class="form-control" type="text" name="ten" id="ten" value="${khachHang.ten}"
                                       placeholder="${khachHang.ten}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Email</label>
                                <input class="form-control" type="text" name="email" id="email" value="${khachHang.email}"
                                       placeholder="${khachHang.email}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Số điện thoại</label>
                                <input class="form-control" type="text" name="sdt" id="sdt" value="${khachHang.sdt}"
                                       placeholder="${khachHang.sdt}"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Tỉnh</label>
                                <input class="form-control" type="text" name="quocGia"
                                       placeholder="${khachHang.quoc_gia}" value="${khachHang.quoc_gia}" id="tinh"
                                       readonly>

                            </div>
                            <div class="col-md-6 form-group">
                                <label>Huyện : </label>
                                <input class="form-control" type="text" name="thanhPho"
                                       placeholder="${khachHang.thanh_pho}" value="${khachHang.thanh_pho}" id="huyen"
                                       readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Xã :</label>
                                <input class="form-control" type="text" name="diaChi" id="xa"
                                       value="${khachHang.dia_chi}"
                                       placeholder="${khachHang.dia_chi}"
                                       readonly>
                            </div>
                            <div class="col-md-12 form-group">
                                <label>Địa chỉ cụ thể :</label>
                                <input class="form-control" type="text" name="diaChiCuThe" id="diaChiCuThe"
                                       value="${khachHang.diaChiCuThe}"
                                       placeholder="${khachHang.diaChiCuThe}"
                                       readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="checkbox" name="diaChiChon" value="diaChiMoi" id="checkbox2"
                       onclick="toggleView('view_dia_chi_moi')">
                <label for="checkbox2" class="label_check_box">Địa chỉ mới</label>
                <div id="view_dia_chi_moi" style="display:none">
                    <div class="bg-light p-30 mb-5">
                        <div class="bg-light p-30 mb-5">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Họ tên</label>
                                    <input class="form-control" name="ten1" id="ten1" type="text" placeholder="Họ tên">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Email</label>
                                    <input class="form-control" name="email1" id="email1" type="text" placeholder="Email">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Số điện thoại</label>
                                    <input class="form-control" name="sdt1" id="sdt1" type="text" placeholder="Số điện thoại">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="province">Tỉnh:</label>
                                    <select id="province" class="form-control"
                                            onchange="loadDistricts(); checkSelection()">
                                        <option value="">Chọn tỉnh</option>
                                    </select>
                                    <input type="hidden" id="tinh1" name="quocGia1">
                                </div>

                                <div class="col-md-6 form-group">
                                    <label for="district">Huyện:</label>
                                    <select id="district" class="form-control" onchange="loadWards(); checkSelection()"
                                            disabled>
                                        <option value="">Chọn huyện</option>
                                    </select>
                                    <input type="hidden" id="huyen1" name="thanhPho1">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="ward">Xã:</label>
                                    <select id="ward" class="form-control" onchange="checkSelection()" disabled>
                                        <option value="">Chọn xã</option>
                                    </select>
                                    <input type="hidden" id="xa1" name="diaChi1">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label>Địa chỉ cụ thể :</label>
                                    <input class="form-control" type="text" name="diaChiCuThe1" id="diaChiCuThe1"
                                           placeholder="Địa chỉ cụ thể">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-6">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3">Hóa đơn</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <c:forEach items="${listHoaDonChiTietDTOS}" var="list" varStatus="vTri">
                            <div class="d-flex justify-content-between ">
                                <p><img style="width: 50px"
                                        src="/images/${list.hoaDonChiTiet.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                                <p style="width: 200px">${list.hoaDonChiTiet.aoChiTiet.ao.ten}</p>
                                <p><fmt:formatNumber value="${list.gia}" type="currency" currencySymbol="VNĐ"/></p>
                                <p>${list.hoaDonChiTiet.soLuong}</p>
                            </div>
                            <input type="hidden" id="slTon${vTri.index + 1}"
                                   value="${list.hoaDonChiTiet.aoChiTiet.slton}">
                            <input type="hidden" id="sl${vTri.index + 1}" value="${list.hoaDonChiTiet.soLuong}">
                            <input type="hidden" name="idAoCheck" id="idAo${vTri.index + 1}" value="${list.hoaDonChiTiet.aoChiTiet.ao.id}">
                            <input type="hidden" name="mauSacCheck" id="mauSac${vTri.index + 1}"
                                   value="${list.hoaDonChiTiet.aoChiTiet.mau_sac.id}">
                            <input type="hidden" name="sizeCheck" id="size${vTri.index + 1}"
                                   value="${list.hoaDonChiTiet.aoChiTiet.size.id}">
                            <input type="hidden" name="soLuongCheck" id="size${vTri.index + 1}"
                                   value="${list.hoaDonChiTiet.soLuong}">
                        </c:forEach>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="border-bottom pt-3 pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Đơn giá</h6>
                                <h6>
                                    <fmt:formatNumber value="${tongTien}" type="currency" currencySymbol="VNĐ"/>
                                </h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Ship</h6>
                                <h6 class="font-weight-medium">
                                    <p id="shipcode"></p>
                                    <input type="hidden" id="ship" readonly
                                           style="border: none; background: none; text-align: left;padding-left: 50%">
                                </h6>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" style="font-size: 30px">Tổng tiền:</label>
                            <input type="hidden" id="price" value="${tongTien}" readonly>
                            <input type="hidden" id="price1" name="tongTien" readonly>
                            <br>
                            <label id="tongTienString" style="font-size: 20px"></label>
                        </div>
                        <div class="form-group">
                            <div class="payment-methods">
                                <label>
                                    <p style="padding-top: 5px" onclick="toggleView('view_anh2')">Chương trình giảm giá
                                        <i class="fas fa-angle-down"></i></p>
                                </label>
                            </div>
                            <div id="view_anh2" style="display:none">
                                <div class="voucher-list">
                                    <c:if test="${soChuongTrinhGG == 0}"> Hiện tại không có chương trình giảm giá áp dụng cho hóa đơn</c:if>
                                    <c:forEach items="${CTGG}" var="list">
                                        <div class="voucher-details">
                                            <input name="options" type="radio" value="${list.phanTramGiam}"
                                                   onclick="updatePrice(this)"
                                                   <c:if test="${list.soLuongSanPham > slDK || list.soTienHoaDon > tongTienDK}">disabled</c:if>>
                                            <label for="${list.ma}" class="radio-label"></label>
                                            <span class="voucher-name">${list.ten}</span>
                                            <span class="voucher-condition" style="margin-left: 20px;"><a href="#"
                                                                                                          style=" color: #0e84b5"
                                                                                                          onclick="showCondition('Số sản phẩm trên ${list.soLuongSanPham} và tổng tiền hóa đơn trên ${list.soTienHoaDon}')">Xem điều kiện</a></span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <div id="condition-popup" style="display: none;">
                                <div class="condition-content">
                                    <span class="close-btn" onclick="closeCondition()">Đóng</span>
                                    <div id="condition-text"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span
                            class="bg-secondary pr-3">Hình thức thanh toán</span></h5>
                    <div class="bg-light p-30">
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="bank" name="payment"
                                       id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Thanh toán vnpay</label>
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="bank1" name="payment"
                                       id="banktransfer1">
                                <label class="custom-control-label" for="banktransfer1">Thanh toán momo</label>
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="bank2" name="payment"
                                       id="banktransfer2">
                                <label class="custom-control-label" for="banktransfer2">Thanh toán bằng ví</label>
                            </div>
                        </div>
                        <div class="form-group mb-4" id="viInfo" style="display: none;">
                            Ví của bạn còn : <fmt:formatNumber value="${viShop.tongTien}" type="currency"
                                                              currencySymbol="VNĐ"/>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" value="cash" name="payment"
                                       id="directcheck">
                                <label class="custom-control-label" for="directcheck">Thanh toán khi nhận hàng</label>
                            </div>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold py-3"
                                formaction="/user/hoa_don/dat_hang/${idHoaDon}" onclick="kiemTra()">Đặt hàng
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Checkout End -->


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

    var gia = parseFloat(document.getElementById("price").value);
    var gia1 = gia;
    document.getElementById("price1").value = gia1.toFixed(0);

    var gia1Formatted1 = gia.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

    var gia1WithCurrency1 = gia1Formatted1 + " VNĐ";

    document.getElementById("price").value = gia1WithCurrency1;
    document.getElementById("tongTienString").innerText = gia1WithCurrency1;

    function togglePaymentDetails1() {
        var ctggDetails = document.getElementById("ctgg-details");
        var ctggRadio = document.getElementById("ctgg");

        if (ctggRadio.checked) {
            ctggDetails.style.display = "block";
        }
    }

    function updatePrice(radioButton) {
        var priceInput = document.getElementById("price");
        var currentPrice = parseFloat(${tongTien});
        var selectedValue = parseFloat(radioButton.value);
        var newPrice = currentPrice - (currentPrice * selectedValue / 100);

        var gia1Formatted = newPrice.toLocaleString('vi-VN', {minimumFractionDigits: 0, maximumFractionDigits: 3});

        var gia1WithCurrency = gia1Formatted + " VNĐ";

        priceInput.value = gia1WithCurrency;
        document.getElementById("tongTienString").innerText = gia1WithCurrency;
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }

    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
<script>
    function showCondition(condition) {
        document.getElementById("condition-text").innerHTML = condition;
        document.getElementById("condition-popup").style.display = "block";
    }

    function closeCondition() {
        document.getElementById("condition-popup").style.display = "none";
    }
</script>
<script>

    var checkbox1 = document.getElementById("checkbox1");
    var checkbox2 = document.getElementById("checkbox2");
    var view_dia_chi_cu = document.getElementById("view_dia_chi_cu");
    var view_dia_chi_moi = document.getElementById("view_dia_chi_moi");

    var bothUnchecked = true;

    // Thêm sự kiện cho checkbox1 để kiểm tra trạng thái của checkbox2
    checkbox1.addEventListener("change", async function () {
        if (checkbox1.checked) {
            checkbox2.checked = false;
            view_dia_chi_moi.style.display = "none";
            view_dia_chi_cu.style.display = "block";
            document.getElementById("province").selectedIndex = 0;
            document.getElementById("district").selectedIndex = 0;
            document.getElementById("ward").selectedIndex = 0;
            document.getElementById('ten1').style.borderColor = 'gray';
            document.getElementById('email1').style.borderColor = 'gray';
            document.getElementById('sdt1').style.borderColor = 'gray';
            document.getElementById('province').style.borderColor = 'gray';
            document.getElementById('district').style.borderColor = 'gray';
            document.getElementById('ward').style.borderColor = 'gray';
            await findCalculateShipping();
        }
        checkBothUnchecked();
    });

    // Thêm sự kiện cho checkbox2 để kiểm tra trạng thái của checkbox1
    checkbox2.addEventListener("change", function () {
        if (checkbox2.checked) {
            checkbox1.checked = false;
            view_dia_chi_moi.style.display = "block";
            document.getElementById('ten').style.borderColor = 'gray';
            document.getElementById('email').style.borderColor = 'gray';
            document.getElementById('sdt').style.borderColor = 'gray';
            document.getElementById('tinh').style.borderColor = 'gray';
            document.getElementById('huyen').style.borderColor = 'gray';
            document.getElementById('xa').style.borderColor = 'gray';
        }
        checkBothUnchecked();
    });

    function checkBothUnchecked() {
        if (!checkbox1.checked && !checkbox2.checked) {
            const shippingCost = 0;

            var tongSoTien = currentPrice + shippingCost;
            priceInput1.value = tongSoTien;

            var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

            document.getElementById("ship").value = gia1WithCurrency3;
            document.getElementById("shipcode").innerText = gia1WithCurrency3;

            var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

            priceInput.value = gia1WithCurrency2;
            document.getElementById("tongTienString").innerText = gia1WithCurrency2;
            bothUnchecked = true;
            document.getElementById("province").selectedIndex = 0;
            document.getElementById("district").selectedIndex = 0;
            document.getElementById("ward").selectedIndex = 0;
        }
        if (!checkbox1.checked && checkbox2.checked) {
            const shippingCost = 0;

            var tongSoTien = currentPrice + shippingCost;
            priceInput1.value = tongSoTien;
            document.getElementById("tongTienString").innerText = tongSoTien;

            var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

            document.getElementById("ship").value = gia1WithCurrency3;
            document.getElementById("shipcode").innerText = gia1WithCurrency3;

            var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                minimumFractionDigits: 0,
                maximumFractionDigits: 3
            });

            var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

            priceInput.value = gia1WithCurrency2;
            document.getElementById("tongTienString").innerText = gia1WithCurrency2;
            bothUnchecked = true;
        }
    }

    // Thêm sự kiện onchange cho các combobox

    // Hàm để cập nhật giá trị các input dựa trên các combobox đã chọn


    async function findProvinceIdByName(provinceName) {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        for (const province of data.data) {
            if (province.ProvinceName === provinceName) {
                return province.ProvinceID;
            }
        }

        return null;
    }

    async function findProvinceNameById(provinceid) {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        for (const province of data.data) {
            if (province.ProvinceID === provinceid) {
                return province.ProvinceName;
            }
        }

        return null;
    }

    async function findDistrictIdByName(districtName, provinceId) {
        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        for (const district of data.data) {
            if (district.DistrictName === districtName) {
                return district.DistrictID;
            }
        }

        // Trả về null nếu không tìm thấy huyện nào có tên tương ứng
        return null;
    }

    async function findWardIdByName(wardName, districtId) {
        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        for (const ward of data.data) {
            if (ward.WardName === wardName) {
                return ward.WardCode;
            }
        }

        // Trả về null nếu không tìm thấy xã nào có tên tương ứng
        return null;
    }

    async function findCalculateShipping() {
        var tinh = document.getElementById("tinh").value;
        var provinceName = tinh;
        var provinceId = await findProvinceIdByName(provinceName);


        var huyen = document.getElementById("huyen").value;
        var districtName = huyen;
        var districtId = await findDistrictIdByName(districtName, provinceId);

        var xa = document.getElementById("xa").value;
        var wardName = xa;
        var wardId = await findWardIdByName(wardName, districtId);

        const transportationFeeDTO = {
            toDistrictId: districtId,
            toWardCode: wardId,
            quantity: 1,
            insuranceValue: 0
        };

        try {
            const response = await fetch('http://localhost:8080/public/transportationFee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(transportationFeeDTO)
            });

            const data = await response.json();

            if (data && data.code === 200) {
                let shippingCost;
                if (currentPrice >= 5000000){
                    shippingCost = data.data.total * 10;
                }else if (currentPrice >= 50000000){
                    shippingCost = data.data.total * 100;
                }else if (currentPrice >= 500000000){
                    shippingCost = data.data.total * 1000;
                }else {
                    shippingCost = data.data.total;
                }

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;
                document.getElementById("tongTienString").innerText = tongSoTien;


                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;
                document.getElementById("shipcode").innerText = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                document.getElementById("tongTienString").innerText = gia1WithCurrency2;

            } else {
                document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
            }
        } catch (error) {
            console.error('Error:', error);
            document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
        }
    }


    // JavaScript code để kiểm tra địa chỉ cũ

</script>
<script>

    function kiemTra() {

        var box1 = document.getElementById("checkbox1");
        var box2 = document.getElementById("checkbox2");

        var radioBank = document.getElementById("banktransfer");
        var radioMomo = document.getElementById("banktransfer1");
        var radioVi = document.getElementById("banktransfer2");
        var radioCash = document.getElementById("directcheck");

        var ten = document.getElementsByName("ten")[0].value;
        var email = document.getElementsByName("email")[0].value;
        var sdt = document.getElementsByName("sdt")[0].value;
        var quocGia = document.getElementById("tinh").value;
        var thanhPho = document.getElementById("huyen").value;
        var diaChi = document.getElementById("xa").value;
        var diaChiCuThe = document.getElementById("diaChiCuThe").value;


        var ten1 = document.getElementsByName("ten1")[0].value;
        var email1 = document.getElementsByName("email1")[0].value;
        var sdt1 = document.getElementsByName("sdt1")[0].value;
        var tinh1 = document.getElementById("province").value;
        var huyen1 = document.getElementById("district").value;
        var xa1 = document.getElementById("ward").value;
        var diaChiCuThe1 = document.getElementById("diaChiCuThe1").value;


        if (!box1.checked && !box2.checked) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng điền đầy đủ thông tin để nhận hàng</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 1000);
            event.preventDefault();
        }
        if(box1.checked && !box2.checked){
            var hasError = false;
            if (ten.trim() === ''){
                document.getElementById('ten').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('ten').style.borderColor = 'gray';
            }
            if (email.trim() === ''){
                document.getElementById('email').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('email').style.borderColor = 'gray';
            }
            if (sdt.trim() === ''){
                document.getElementById('sdt').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('sdt').style.borderColor = 'gray';
            }
            if (quocGia.trim() === ''){
                document.getElementById('tinh').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('tinh').style.borderColor = 'gray';
            }
            if (thanhPho.trim() === ''){
                document.getElementById('huyen').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('huyen').style.borderColor = 'gray';
            }
            if (diaChi.trim() === ''){
                document.getElementById('xa').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('xa').style.borderColor = 'gray';
            }
            if (diaChiCuThe.trim() === ''){
                document.getElementById('diaChiCuThe').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('diaChiCuThe').style.borderColor = 'gray';
            }

            if (hasError) {
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Vui lòng điền đầy đủ thông tin và đúng định dạng để nhận hàng</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                    allowOutsideClick: true,
                });
                setTimeout(() => {
                    Swal.close();
                }, 1000);
                event.preventDefault();
            }
        }

        if(!box1.checked && box2.checked){
            var hasError = false;

            var validEmailFormat = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/; // Regex kiểm tra định dạng email
            var isEmailValid = validEmailFormat.test(email1);

            // Kiểm tra xem sdt1 có đúng 10 số không và chỉ chứa ký tự số hay không
            var validPhoneNumber = /^\d{10}$/; // Regex kiểm tra 10 ký tự số
            var isPhoneNumberValid = validPhoneNumber.test(sdt1);

            if (ten1.trim() === ''){
                document.getElementById('ten1').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('ten1').style.borderColor = 'gray';
            }
            if (email1.trim() === '' || !isEmailValid){
                document.getElementById('email1').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('email1').style.borderColor = 'gray';
            }
            if (sdt1.trim() === '' || !isPhoneNumberValid){
                document.getElementById('sdt1').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('sdt1').style.borderColor = 'gray';
            }
            if (tinh1.trim() === ''){
                document.getElementById('province').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('province').style.borderColor = 'gray';
            }
            if (huyen1.trim() === ''){
                document.getElementById('district').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('district').style.borderColor = 'gray';
            }
            if (xa1.trim() === ''){
                document.getElementById('ward').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('ward').style.borderColor = 'gray';
            }
            if (diaChiCuThe1.trim() === ''){
                document.getElementById('diaChiCuThe1').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('diaChiCuThe1').style.borderColor = 'gray';
            }

            if (hasError) {
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Vui lòng điền đầy đủ thông tin và đúng định dạng để nhận hàng</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                    allowOutsideClick: true,
                });
                setTimeout(() => {
                    Swal.close();
                }, 1000);
                event.preventDefault();
            }
        }

        if (!radioBank.checked && !radioCash.checked && !radioMomo.checked && !radioVi.checked) {
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng chọn phương thức thanh toán</div><div class="progress-bar-container"></div>', // Ẩn nút "Oke"
                allowOutsideClick: true,
            });
            setTimeout(() => {
                Swal.close();
            }, 1000);
            event.preventDefault();
        }

        for (var i = 0; i < 99; i++) {
            var slTon = parseFloat(document.getElementById("slTon" + (i + 1)).value);
            var sl = parseFloat(document.getElementById("sl" + (i + 1)).value);


            console.log(sl);
            console.log(slTon);

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


        // Kiểm tra các trường trong địa chỉ cũ và trả về true nếu đầy đủ, ngược lại trả về false
        // Ví dụ:



</script>
<script>

    var priceInput = document.getElementById("price");
    var priceInput1 = document.getElementById("price1");
    var currentPrice = parseFloat(${tongTien});

    async function loadProvinces() {
        const response = await fetch(`http://localhost:8080/public/provinces`);
        const data = await response.json();

        const provinceSelect = document.getElementById("province");
        provinceSelect.innerHTML = '<option value="">Chọn tỉnh</option>';

        for (const province of data.data) { // Thay đổi dòng này để lấy dữ liệu từ data.data
            const option = document.createElement("option");
            option.value = province.ProvinceID;
            option.text = province.ProvinceName;
            provinceSelect.appendChild(option);
            console.log(province.ProvinceID, province.ProvinceName);
        }
    }

    async function loadDistricts() {
        const provinceId = document.getElementById("province").value;

        if (!provinceId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/districts?province_id=' + provinceId);
        const data = await response.json();

        const districtSelect = document.getElementById("district");
        districtSelect.innerHTML = '<option value="">Chọn huyện</option>';

        for (const district of data.data) {
            const option = document.createElement("option");
            option.value = district.DistrictID;
            option.text = district.DistrictName;
            districtSelect.appendChild(option);
        }

        districtSelect.disabled = false;
        document.getElementById("ward").disabled = true;
        document.getElementById("message").innerText = "";
    }

    async function loadWards() {
        const districtId = document.getElementById("district").value;

        if (!districtId) {
            return;
        }

        const response = await fetch('http://localhost:8080/public/wards?district_id=' + districtId);
        const data = await response.json();

        const wardSelect = document.getElementById("ward");
        wardSelect.innerHTML = '<option value="">Chọn xã</option>';

        for (const ward of data.data) {
            const option = document.createElement("option");
            option.value = ward.WardCode;
            option.text = ward.WardName;
            wardSelect.appendChild(option);
        }

        wardSelect.disabled = false;
        document.getElementById("message").innerText = "";
    }

    function checkSelection() {
        const provinceSelect = document.getElementById("province");
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");

        const provinceName = provinceSelect.options[provinceSelect.selectedIndex].text;
        const districtName = districtSelect.options[districtSelect.selectedIndex].text;
        const wardName = wardSelect.options[wardSelect.selectedIndex].text;

        if (provinceName) {
            document.getElementById("tinh1").value = provinceName;
        }

        if (districtName) {
            document.getElementById("huyen1").value = districtName;
        }

        if (wardName) {
            document.getElementById("xa1").value = wardName;
        }

        if (provinceName && districtName && wardName) {
            calculateShipping();
        } else {
            document.getElementById("message").innerText = "";
            // Khóa nút tính phí nếu không đủ điều kiện
            document.getElementById("shippingCost").innerText = "";
        }
    }

    async function calculateShipping() {
        const districtSelect = document.getElementById("district");
        const wardSelect = document.getElementById("ward");
        const toDistrictId = districtSelect.value;
        const toWardCode = wardSelect.value;

        const transportationFeeDTO = {
            toDistrictId: toDistrictId,
            toWardCode: toWardCode,
            quantity: 1,
            insuranceValue: 0
        };

        try {
            const response = await fetch('http://localhost:8080/public/transportationFee', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(transportationFeeDTO)
            });

            const data = await response.json();

            if (data && data.code === 200) {
                const shippingCost = data.data.total;

                var tongSoTien = currentPrice + shippingCost;
                priceInput1.value = tongSoTien;
                document.getElementById("tongTienString").innerText = tongSoTien;

                var gia1Formatted3 = shippingCost.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency3 = gia1Formatted3 + " VNĐ";

                document.getElementById("ship").value = gia1WithCurrency3;
                document.getElementById("shipcode").innerText = gia1WithCurrency3;

                var gia1Formatted2 = tongSoTien.toLocaleString('vi-VN', {
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 3
                });

                var gia1WithCurrency2 = gia1Formatted2 + " VNĐ";

                priceInput.value = gia1WithCurrency2;
                document.getElementById("tongTienString").innerText = gia1WithCurrency2;

            } else {
                document.getElementById("shippingCost").innerText = "Không thể tính phí vận chuyển.";
            }
        } catch (error) {
            console.error('Error:', error);
            document.getElementById("shippingCost").innerText = "Lỗi khi tính phí vận chuyển. Chi tiết lỗi: " + error.message;
        }
    }

    loadProvinces();
    document.getElementById("province").addEventListener("change", loadDistricts);
    document.getElementById("district").addEventListener("change", loadWards);
    document.getElementById("ward").addEventListener("change", checkSelection);

</script>
<script>
    var loiHoaDonBySL = "${loiHoaDonBySL}";
    if (loiHoaDonBySL == "2") {
        Swal.fire({
            icon: 'warning',
            html: '<div class="swal-text">Xin lỗi, sản phẩm trong hóa đn của bạn nhiều hơn số lượng tồn</div><div class="progress-bar-container"></div>',
            allowOutsideClick: true

        });
        setTimeout(() => {
            Swal.close();
            addFormContainer.style.display = 'block';
        }, 1000);
    }

    var loiThanhToanThatBai = "${loiThanhToanThatBai}";
    if (loiThanhToanThatBai == "2") {
        Swal.fire({
            icon: 'warning',
            html: '<div class="swal-text">Thanh toán bằng ví thất bại</div><div class="progress-bar-container"></div>',
            allowOutsideClick: true

        });
        setTimeout(() => {
            Swal.close();
            addFormContainer.style.display = 'block';
        }, 1000);
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var radioButtons = document.getElementsByName('payment');
        var viInfoDiv = document.getElementById('viInfo');

        function toggleViInfoVisibility() {
            // If the "bank2" radio button is checked, show the viInfoDiv; otherwise, hide it
            viInfoDiv.style.display = radioButtons[2].checked ? 'block' : 'none';
        }

        // Add change event listeners to all radio buttons in the "payment" group
        radioButtons.forEach(function(radioButton) {
            radioButton.addEventListener('change', toggleViInfoVisibility);
        });

        // Call the function initially to set the initial visibility based on the default checked radio button
        toggleViInfoVisibility();
    });
</script>


</body>

</html>