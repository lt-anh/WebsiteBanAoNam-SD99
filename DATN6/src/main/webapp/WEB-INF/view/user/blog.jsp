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
        .banner img {
            width: 100%;
            height: 100% s;
            top: 100px;
        }
        .banner_dow img {
            width: 300px;
            padding: 50px 50px;
            margin: 10px 0;
        }

        /* banner dưới */
        .banner_dow1 img {
            width: 70%;
            padding: 0px 200px;
            margin: 50px 10px;
            top: 20px;
            text-align: center;
        }
        .categories {
            margin: 30px 50px;
            list-style-type: none;
            text-align: center;
            font-size: 30px;
        }
        .noidung {
            padding: 20px;
            margin: 20px;
        }

        .noidung p {
            font-size: 20px;
            font-family: Arial, Helvetica, sans-serif;
            letter-spacing: 1px;
        }
        .bosuutap .heading-blog {
            font-size: 40px;
            text-align: center;
            margin-top: 100px;
            margin-bottom: 80px;
            position: relative;
            word-spacing: 6px;
        }

        /* làm đẹp cho h3 (dấu gạch 2 bên) */
        .bosuutap .heading-blog:after {
            position: absolute;
            content: "";
            width: 200px;
            height: 7px;
            background-color: black;
            top: 50px;
            left: 43%;
        }

        .bosuutap h4 {
            font-size: 23px;
        }

        .bosuutap p {
            font-size: 19px;
        }

        /* làm đẹp cho h3 (dấu gạch 2 bên) */
        .bosuutap .heading3:after {
            position: absolute;
            content: "";
            width: 200px;
            height: 7px;
            background-color: black;
            top: 50px;
            left: 43%;
        }

        /* chỉnh bộ sưu tập */
        .bosuutap .list-bst .bst {
            text-align: center;
            width: 30%;
            margin: 20px 15px;
            display: inline-block;
            line-height: 26px;
        }

        .bosuutap .list-bst .bst img {
            width: 100%;
        }

        .bosuutap .list-bst .bst:hover {
            box-shadow: rgb(0 0 0 / 13%) 0px 10px 20px 0px, rgb(0 0 0 / 19%) 0px 3px 9px 0px;
            transition: all .3s liner;
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
                        <a href="/user/trang_chu/${idKh}" class="nav-item nav-link ">Trang chủ</a>
                        <a href="/user/shop/${idKh}" class="nav-item nav-link">Cửa hàng</a>
                        <a href="/user/contact/${idKh}" class="nav-item nav-link">Thông tin cửa hàng</a>
                        <a href="/user/blog/${idKh}" class="nav-item nav-link active">Bài viết</a>
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
                <span class="breadcrumb-item active">Bài viết</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Contact Start -->
<div class="container-fluid">
    <div class="banner">
        <img src="/images/banner4.jpg"/>
    </div>
    <ul class="categories">
        <li class="category"><strong>/Blog/</strong></li>
    </ul>
    <div class="noidung">
        <p>Áo sơ mi nam là một trong những trang phục không thể thiếu trong tủ đồ của mọi quýng. Với sự đa dng về kiểu dáng,
            màu sắc và chất liệu, áo sơ mi mangến cho phái mạnh sự lịch lãm và phong cách.</p><br>
        <p>Một trong những kiểu áo sơ mi nam phổ biến nhất là áo sơ mi cổ điển. Với cổ áo bẻ, nút cài phía trước và tay dài,
            áo sơ mi cổ điển tạo nên vẻ trang nhã và thanh lịch cho người mặc. Chúngích hợp để diện trong các buổi làm việc
            chuyên nghiệp hoặc các dịp trang trọng.</p><br>
        <p>Ngoài ra, áo sơ mi nam còn có nhiều kiểu dáng khác nhau như áo sơ mi dài tay, áo sơ mi ngắn tay, áo sơ mi caro,
            áo sơ mi kẻ sọc và nhiều hơn nữa. Mỗi kiểu áo mang đến một cái nhìn riêng biệt và phù hợp với các hoàn cảnh khác
            nhau.</p><br>
        <p>Khi phối áo sơ mi nam, bạn có thể kết hợp với quần jeans để tạo nên phong cách cá nhân và thoải mái. Nếu muốn
            trông lịch sự hơn, bạn có thể chọn quần âu hoặc quần kaki để tạo nên bộ trang phục công việc hoặc dạo phố.</p>
        <p>Để áo sơ mi nam luôn mới và bền, hãy chú đến cách chăm sóc. Hầu hết các loại áo sơ đều yêu cầu giặt nhiệt độ nhẹ
            và
            ở nhiệt độ thích hợp để tránh làm hỏng chất liệu và hình dáng của áo.</p><br>
        <p>Với sự đa dạng về kiểu dáng và cách phối đồ, áo sơ mi nam là một lựa chọn tuyệt vời để thể hiện phong cách và cá
            nhân hóa trang phục. Hãy khámá thêm v áo sơ nam trên blog của chúng tôi để tìm kim những gợi ý và thông tin hữu
            ích cho phong cách của bạn.</p><br>
    </div>
    <div class="bosuutap">
        <h3 class="heading-blog">Báo<i class='bx bxs-hot'></i></h3>
        <div class="list-bst">
            <div class="bst">
                <img src="/images/bst1.webp" alt="">
                <h4>Vest trắng cho chú rể: Cách phối màu và phụ kiện để không nhàm chán</h4>
            </div>
            <div class="bst">
                <img src="/images/bst3.webp" alt="">
                <h4>BILUXURY RA MẮT BỘ SƯU TẬP HÈ 2022 - MUA SẮM TRÚNG QUÀ TO LÊN ĐẾN 1 TỶ ĐỒNG</h4>
            </div>
            <div class="bst">
                <img src="/images/bst2.webp" alt="">
                <h4>BILUXURY RA MẮT BST THÁNG 6 MỚI - ƯU ĐÃI MUA 2 TẶNG 1</h4>
            </div>
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
</body>

</html>