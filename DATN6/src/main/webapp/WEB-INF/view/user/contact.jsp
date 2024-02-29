<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SD-99</title>
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
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <style>
        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }
        .conTroChuot{
            cursor: default;
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
                        <a href="/user/shop/${idKh}" class="nav-item nav-link">Cửa hàng</a>
                        <a href="/user/contact/${idKh}" class="nav-item nav-link active">Thông tin cửa hàng</a>
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
                <span class="breadcrumb-item active">Thông tin cửa hàng</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Contact Start -->
<div class="container-fluid">
    <div style="padding-left: 25%;padding-top: 20px;padding-bottom: 20px; color: #0a0e14">
        <p>
            <span style="display: inline-block;"><b>BILUXURY CẦU GIẤY</b></span>
            <span style="display: inline-block; padding-left: 500px" onclick="toggleView('view_anh')" class="conTroChuot">Xem showroom<i
                    class="bx bx-chevron-down"></i></span>
        </p>
        <p style="margin-top: 10px">Địa chỉ: 337 Cầu Giấy, P.Dịch Vọng, Q.Cầu Giấy, TP.Hà Nội</p>
        <p>Thời gian hot động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
        <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
        <p style="padding-top: 5px" onclick="toggleView('view_ban_do')" class="conTroChuot">Xem bản đồ</p>
        <div id="view_anh" style="display:none">
            <img src="/images/cua_hang_1.jpg">
        </div>
        <div id="view_ban_do" style="display:none">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.9762349427897!2d105.78904797492916!3d21.033636880616914!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab4859fca08b%3A0xf2dd26df24102f!2zNi81Mi8zMzcgxJAuIEPhuqd1IEdp4bqleSwgVOG7lSAyMiwgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1690245710226!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
    <hr style="border-style: dashed; margin-left: 25%; margin-right: 20%;background-color: #0a0e14">
    <div style="padding-left: 25%;padding-top: 20px;padding-bottom: 20px; color: #0a0e14">
        <p>
            <span style="display: inline-block;"><b>BILUXURY PHỐ HUẾ</b></span>
            <span style="display: inline-block; padding-left: 508px" onclick="toggleView('view_anh1')" class="conTroChuot">Xem showroom<i
                    class="bx bx-chevron-down"></i></span>
        </p>
        <p style="margin-top: 10px">Địa chỉ: 353 Phố Huế, P.Phố Huế, Q.Hai Bà Trưng, TP.Hà Nội</p>
        <p>Thời gian hoạt động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
        <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
        <p style="padding-top: 5px" onclick="toggleView('view_ban_do1')" class="conTroChuot">Xem bản đồ</p>
        <div id="view_anh1" style="display:none">
            <img src="/images/cua_hang_2.jpg">
        </div>
        <div id="view_ban_do1" style="display:none">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.592239288326!2d105.84910337492842!3d21.008976280635366!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab8ac64ad877%3A0x4d037d359123a296!2zMzUzIFAuIEh14bq_LCBQaOG7kSBIdeG6vywgSGFpIELDoCBUcsawbmcsIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1690246078294!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
    <hr style="border-style: dashed;margin-left: 25%;margin-right: 20%;background-color: #0a0e14">
    <div style="padding-left: 25%;padding-top: 20px; color: #0a0e14">
        <p>
            <span style="display: inline-block;"><b>BILUXURY 505 NGUYỄN TRÃI</b></span>
            <span style="display: inline-block; padding-left: 440px" onclick="toggleView('view_anh2')" class="conTroChuot">Xem showroom<i
                    class="bx bx-chevron-down"></i></span>
        </p>
        <p style="margin-top: 10px">Địa chỉ: 505 Nguyễn Trãi, P.Thanh Xuân Nam, Q.Thanh Xuân, TP.Hà Nội</p>
        <p>Thời gian hot động: 8 giờ 30 - 22 giờ 00 (kể cả CN và ngày lễ)</p>
        <p><i class="bx bx-phone"></i>Điện thoại : 0987 654 321</p>
        <p style="padding-top: 5px" onclick="toggleView('view_ban_do2')" class="conTroChuot">Xem bản đồ</p>
        <div id="view_anh2" style="display:none">
            <img src="/images/cua_hang_3.jpg">
        </div>
        <div id="view_ban_do2" style="display:none">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.134615851906!2d105.79279387852336!3d20.987240330763495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acc710f79043%3A0x9c4f7dd368a69f93!2zNTA1IMSQLiBOZ3V54buFbiBUcsOjaSwgVGhhbmggWHXDom4gTmFtLCBUaGFuaCBYdcOibiwgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1690246115056!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</div>
<!-- Contact End -->


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
    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
</body>

</html>