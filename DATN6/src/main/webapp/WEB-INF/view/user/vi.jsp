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
    <link rel="stylesheet" href="../../../resources/css/add_form.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
    <style>
        /* Định dạng giao diện form đổi mật khẩu */
        .container {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 5px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        p#message {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }

        .new-password-fields {
            display: none;
        }

        /* Định dạng màu nền và khoảng cách của footer */
        footer {
            background-color: #333;
            padding: 30px 0;
            color: #fff;
        }

        /* Định dạng link trong footer */
        footer a {
            color: #fff;
        }

        /* Định dạng phần topbar */
        .container-fluid .topbar {
            background-color: #fff;
            padding: 10px 0;
            border-bottom: 1px solid #ccc;
        }

        /* Định dạng input tìm kiếm trong topbar */
        .topbar input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Định dạng button tìm kiếm trong topbar */
        .topbar button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        .navbar-light .navbar-nav .nav-link:hover {
            background: #fff3c6;
            color: red; /* Change this to the desired hover color */
        }

        .active {
            color: blue;
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .pagination button {
            margin: 0 5px;
        }

        .btn-table {
            margin-top: 18px;
            padding-top: 5px;
            text-align: center;
            color: white;
            width: 80px;
            height: 40px;
            background: #0c84ff;
            border-radius: 5px;
        }

        .btn-table:hover {
            background: #0d6efd;
        }
        .btn-nap-rut {
            background: #ff8b33;
            height: 50px;
            padding-top: 10px;
            color: white;
            border-radius: 15px;
            font-size: 20px;
            text-align: center;
            cursor: pointer; /* Đặt loại con trỏ chuột thành bàn tay */
            transition: background 0.3s ease-in-out; /* Thêm hiệu ứng di chuyển mềm mại */
        }

        .btn-nap-rut:hover {
            background: #a1ba48; /* Màu nền thay đổi khi di chuột vào */
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
                <a class="breadcrumb-item text-dark" href="/user/trang_chu/${idKh}">Trang chủ</a>
                <a class="breadcrumb-item text-dark" href="/user/don_hang/${idKh}">Thông tin</a>
                <span class="breadcrumb-item">Thông tin cá nhân</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">

    <div class="row px-xl-5">
        <div class="col-lg-2 table-responsive mb-5">
            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Tài khoản của tôi</span>
            </h5>

            <ul class="list-unstyled">
                <li style="background-color: #ff8b33"><i class="fas fa-wallet" style="width: 20px"></i>
                    <a href="/user/vi_view/${idKh}" style="color: black;">Ví shop</a></li>
                <li><i class="fas fa-info-circle" style="width: 20px"></i>
                    <a href="/user/thong_tin/${idKh}" style="color: black;">Thông tin</a></li>
                <li style="display: <c:if test="${khachHangNow.matKhau == null}">none</c:if>"><i class="fas fa-key"
                                                                                                 style="width: 20px"></i><a
                        href="/user/doi_mat_khau_view/${idKh}" style="color: black;">Đổi mật khẩu</a>
                </li>
            </ul>

            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Đơn hàng</span>
            </h5>
            <ul class="list-unstyled">
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
            <div class="contact-form bg-light p-30">
                <div id="success"></div>
                <div class="row">
                    <div class="col-6">Ví của : <span style="font-size: 20px">${khachHangNow.ten}</span></div>
                    <div class="col-6">
                        <label> Tiền hiện có: <span style="font-size: 20px">
                            <fmt:formatNumber value="${viShop.tongTien}" type="currency"
                                              currencySymbol="VNĐ"/>
                        </span></label>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <div class="col-5 btn-nap-rut" id="addButton" onclick="clickThem()">
                        <i class="fas fa-money-bill"></i> Nạp tiền
                    </div>
                    <div class="col-1"></div>
                    <div class="col-5 btn-nap-rut"><i class="fas fa-money-bill"></i> Rút tiền ( Sắp ra mắt )</div>
                    <div class="col-1"></div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <div class="col-12" style="text-align: center; color: #ffa95b; font-size: 30px">Lịch sử giao dịch
                    </div>
                    <div class="col-12" style="margin-top: 10px">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>Hình thức</th>
                                <th>Ngày</th>
                                <th>Đơn giá</th>
                                <th>Trạng thái</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listGiaoDichVis}" var="list">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${list.hinhThuc == 1}">Nạp tiền</c:when>
                                            <c:when test="${list.hinhThuc == 2}">Thanh toán đơn hàng</c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:set var="dateTimeString" value="${list.ngayGiaoDich}"/>
                                        <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                                       pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                        <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                                            ${formattedDate}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${list.hinhThuc == 1}">
                                                <span style="color: #24c534">+
                                                    <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ"/>
                                                </span>
                                            </c:when>
                                            <c:when test="${list.hinhThuc == 2}">
                                                <span style="color: red">-
                                                    <fmt:formatNumber value="${list.donGia}" type="currency" currencySymbol="VNĐ"/>
                                                </span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${list.trangThai == 1}">Hoàn thành</c:when>
                                            <c:when test="${list.trangThai == 2}">Đang xử lí</c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <thead>
                            <tr>
                                <th>Hình thức</th>
                                <th>Ngày</th>
                                <th>Đơn giá</th>
                                <th>Trạng thái</th>
                            </tr>
                            </thead>
                        </table>
                        <div class="pagination mt-3">
                            <div class="btn-table" id="prev">Trước</div>
                            <div id="pageButtons" class="pagination mt-3"></div>
                            <div class="btn-table" id="next">Sau</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
<div id="addFormContainer" style="display: none;">
    <div class="container-fluid">
        <div class="container">

            <form method="post" id="addForm">
                <h3 style="text-align: center">NẠP TIỀN</h3>
                <div class="form-group">
                    <input type="text" name="soTien" class="form-control"
                           id="soTien" placeholder="Nhập số tiền muốn nạp ">
                    <span id="errorSoTien" class="text-danger"></span>
                </div>
                <button class="btn btn-success" formaction="/user/nap_tien/${idKh}" type="submit"
                        onclick="addProduct()" id="idThem">Nạp tiền
                </button>
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
<script>
    $(document).ready(function () {
        var rowsPerPage = 10; // Số dòng trên mỗi trang
        var totalRows = $('#example1 tbody tr').length;
        var numPages = Math.ceil(totalRows / rowsPerPage);
        var currentPage = 1;
        var maxVisiblePages = 4; // Số trang tối đa hiển thị

        // Ẩn tất cả các dòng ngoại trừ các dòng đầu tiên
        $('#example1 tbody tr').hide();
        $('#example1 tbody tr').slice(0, rowsPerPage).show();

        // Hiển thị số trang và màu xanh cho trang hiện tại
        function showPagination() {
            $('#pageButtons').empty();

            var startPage, endPage;

            if (numPages <= maxVisiblePages) {
                startPage = 1;
                endPage = numPages;
            } else {
                if (currentPage <= Math.floor(maxVisiblePages / 2)) {
                    startPage = 1;
                    endPage = maxVisiblePages;
                } else if (currentPage + Math.floor(maxVisiblePages / 2) >= numPages) {
                    startPage = numPages - maxVisiblePages + 1;
                    endPage = numPages;
                } else {
                    startPage = currentPage - Math.floor(maxVisiblePages / 2);
                    endPage = currentPage + Math.floor(maxVisiblePages / 2) - 1;
                }
            }

            for (var i = startPage; i <= endPage; i++) {
                $('#pageButtons').append('<button class="page-link">' + i + '</button>');
            }

            $('.page-link').removeClass('active');
            $('.page-link').eq(currentPage - startPage).addClass('active');
        }

        showPagination();

        // Xử lý khi click vào trang
        $('#pageButtons').on('click', '.page-link', function () {
            currentPage = parseInt($(this).text());
            var start = (currentPage - 1) * rowsPerPage;
            var end = start + rowsPerPage;

            $('#example1 tbody tr').hide().slice(start, end).show();
            showPagination();
        });

        // Xử lý nút "Previous"
        $('.pagination').on('click', '#prev', function () {
            if (currentPage > 1) {
                currentPage--;
                var start = (currentPage - 1) * rowsPerPage;
                var end = start + rowsPerPage;

                $('#example1 tbody tr').hide().slice(start, end).show();
                showPagination();
            }
        });

        // Xử lý nút "Next"
        $('.pagination').on('click', '#next', function () {
            if (currentPage < numPages) {
                currentPage++;
                var start = (currentPage - 1) * rowsPerPage;
                var end = start + rowsPerPage;

                $('#example1 tbody tr').hide().slice(start, end).show();
                showPagination();
            }
        });
    });
</script>

<script>
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

    function addProduct() {
        var soTienInput = document.getElementById("soTien").value;

        // Kiểm tra xem giá trị có phải là số và là số dương không
        if (!(/^\d*\.?\d+$/.test(soTienInput)) || parseFloat(soTienInput) <= 0) {
            document.getElementById("errorSoTien").innerHTML = "Vui lòng nhập số dương hợp lệ.";
            event.preventDefault();
        } else if (parseFloat(soTienInput) < 50000) {
            document.getElementById("errorSoTien").innerHTML = "Số tiền phải lớn hơn 50,000 VNĐ.";
            event.preventDefault();
        }
    }

</script>
<script>
    var themThanhCong = "${themThanhCong}";
    if (themThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Nạp tiền thành công!',
            icon: 'success',
        });
    }

    var themThatBai = "${themThatBai}";
    if (themThatBai == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Nạp tiền thất bại!',
            icon: 'error',
        });
    }
</script>

</body>

</html>