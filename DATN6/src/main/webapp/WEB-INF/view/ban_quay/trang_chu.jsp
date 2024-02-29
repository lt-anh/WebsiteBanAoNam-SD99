<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="../../../resources/css/add_form.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
    <style>
        .image {
            width: 80px;
            height: 80px;
            overflow: hidden;
            border-radius: 50%;
        }

        .image img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/admin/ban-quay/trang-chu" class="nav-link">Trang chủ bán quầy</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->

            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" role="button" href="/admin/logout">
                    <i class="fas fa-sign-out-alt" style="width: 20px"></i> Đăng xuất
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <c:choose>
                    <c:when test="${adminOrStaff == 1}">
                        <div class="image">
                            <img src="/images/test.jpg" >
                        </div>

                    </c:when>
                    <c:when test="${adminOrStaff == 2}">
                        <div class="image">
                            <img src="/images/test1.jpg" >
                        </div>
                    </c:when>
                </c:choose>
                <div class="info">
                    <a href="#" class="d-block">${nameUser}</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Bảng điều khiển
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/index/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Trang chủ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/thong_ke/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thống kê</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/ban-quay/trang-chu" class="nav-link active">
                            <i class="nav-icon fas fa-store"></i>
                            <p>
                                Bán Quầy
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>

                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Bảng
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/ao/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thêm áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/hang/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hãng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/loai_ao/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Chất vải</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/form/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Form áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/huong_dan_bao_quan/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hướng dẫn bảo quản</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/mau_sac/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Màu sắc</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/size/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Size</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Quản Lý Tài Khoản
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/nhanvien/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Nhân Viên</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/khachhang/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Khách Hàng</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thêm chương trình</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá sản phẩm
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_sp/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/admin/ap-dung" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Áp dụng</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá hóa đơn
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_hd/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link">
                            <i class="nav-icon fas fa-money-bill-alt"></i>
                            <p>
                                Quản lí hóa đơn
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/chat" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>
                                Chat hỗ trợ
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Bán quầy</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/ban-quay/trang-chu">Trang chủ bán quầy</a></li>
                            <li class="breadcrumb-item active">Bán quầy</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <form action="/admin/ban-quay/addHD" method="post"  id="invoiceForm">
                            <div class="card">

                                <div class="card-header d-flex justify-content-between align-items-center" >
                                    <div id="errorDiv" class="alert alert-danger" style="display: none;">
                                        Chỉ được tạo tối đa 5 hóa đơn.
                                    </div>
                                    <div class="col-5"></div>
                                    <button type="submit" class="btn btn-primary col-2" id="addButton" onclick="taoKhachHangNhanh()"><i class="fas fa-plus"></i> Tạo tài khoản nhanh</button>
                                    <button type="submit" class="btn btn-primary col-2" id="createHoaDonButton" onclick="createHoaDon()"><i class="fas fa-plus"></i> Tạo Đơn Hàng</button>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped" style="text-align: center">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã hóa đơn</th>
                                            <th>Người tạo</th>
                                            <%--                                            <th>Số sản phẩm</th>--%>
                                            <%--                                            <th>Tổng tiền</th>--%>
                                            <th>Ngày tạo</th>
                                            <th>Trạng thái</th>
                                            <th>Ghi chú</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listHD}" var="list" varStatus="loop">
                                            <tr>
                                                <td>${loop.index+1}</td>
                                                <td>${list.ma}</td>
                                                <td>${list.nhanVien.ten}</td>

                                                    <%--                                                <td>${soSanPham}</td>--%>
                                                    <%--                                                <td>${list.tongTien}</td>--%>
                                                <td>
                                                        ${list.ngayTao.format(DateTimeFormatter.ofPattern('dd/MM/yyyy HH:mm:ss'))}
                                                </td>
                                                    <%--                                                <td>${list.ngayTao}</td>--%>
                                                    <%--                                                <td >${list.trangThai==5?"Đang Chờ":"Hoàn thành"}</td>--%>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.trangThai ==5}"><p
                                                                style="background: #ff8b33;border-radius: 15px;text-align: center">
                                                            Đang chờ</p></c:when>
                                                    </c:choose>
                                                </td>
                                                <td style="width: 30%">${list.ghiChu}</td>
                                                <td>
                                                    <a href="/admin/ban-quay/view-cart/${list.id}"
                                                       class="btn btn-primary me-2 "><i class="fas fa-edit" ></i>
                                                    </a>
                                                    <a href="/admin/ban-quay/delete/${list.id}" onclick="xoaHoaDonBanQuay('${list.id}')"
                                                       class="btn btn-sm btn-danger ml-2 me-2"><i class="fa fa-times" style="font-size: 22px;"></i>
                                                    </a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã hóa đơn</th>
                                            <th>Người tạo</th>

                                            <%--                                            <th>Số sản phẩm</th>--%>
                                            <%--                                            <th>Tổng tiền</th>--%>
                                            <th>Ngày tạo</th>
                                            <th>Trạng thái</th>
                                            <th>Ghi chú</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- /.content -->
    </div>
    <div id="addFormContainer" style="display: none;">
        <div class="container-fluid">
            <div class="container">
                <form method="post" id="addForm">
                    <h3 style="text-align: center">TẠO TÀI KHOẢN NHANH</h3>
                    <div class="form-group">
                        <label for="ten">Tên <span class="text-danger">(*)</span> :</label>
                        <input type="text" name="ten" class="form-control"
                               id="ten" placeholder="Tên ">
                        <span id="errorTen" class="text-danger"></span>
                    </div>
                    <div class="form-group">
                        <label for="ten">Email <span class="text-danger">(*)</span> :</label>
                        <input type="text" name="email"  class="form-control"
                               id="email" placeholder="Email ">
                        <span id="errorEmail" class="text-danger"></span>
                    </div>
                    <div class="form-group">
                        <label for="ten">Số điện thoại <span class="text-danger">(*)</span> :</label>
                        <input type="text" name="sdt"  class="form-control"
                               id="sdt" placeholder="Tên ">
                        <span id="errorSdt" class="text-danger"></span>
                    </div>
                    <button class="btn btn-primary" formaction="/admin/ban-quay/tao_nhanh_tk" type="submit"
                            onclick="addProduct()"><i class="fas fa-plus"></i> Thêm Mới
                    </button>
                </form>
            </div>
        </div>
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../resources/dist/js/demo.js"></script>
<!-- Page specific script -->
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#example1").DataTable({--%>
<%--            "responsive": true, "lengthChange": false, "autoWidth": false,--%>
<%--            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]--%>
<%--        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');--%>
<%--        $('#example2').DataTable({--%>
<%--            "paging": true,--%>
<%--            "lengthChange": false,--%>
<%--            "searching": false,--%>
<%--            "ordering": true,--%>
<%--            "info": true,--%>
<%--            "autoWidth": false,--%>
<%--            "responsive": true,--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("invoiceForm");
        const table = document.getElementById("example1");
        const maxRows = 5;
        const errorDiv = document.getElementById("errorDiv");

        form.addEventListener("submit", function(e) {
            const rows = table.getElementsByTagName("tr");
            // Trừ 1 để bỏ qua hàng tiêu đề
            if (rows.length - 1 > maxRows) {
                e.preventDefault(); // Ngăn chặn việc submit
                errorDiv.style.display = "block"; // Hiển thị thông báo lỗi
            }
        });

        // Sử dụng một sự kiện click để ẩn thông báo lỗi
        errorDiv.addEventListener("click", function() {
            errorDiv.style.display = "none";
        });
    });
</script>
<script>

    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

    function taoKhachHangNhanh(){
        addFormContainer.style.display = "block";
        event.preventDefault();
    }

    function addProduct() {
        var ten = document.getElementsByName('ten')[0].value;
        var email = document.getElementsByName('email')[0].value;
        var sdt = document.getElementsByName('sdt')[0].value;
        var errorTen = document.getElementById('errorTen');
        var errorEmail = document.getElementById('errorEmail');
        var errorSdt = document.getElementById('errorSdt');
        var hasError = false;

        // Kiểm tra tên
        if (ten.trim() === '') {
            errorTen.innerText = 'Vui lòng nhập tên.';
            document.getElementById('ten').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('ten').style.borderColor = 'gray';
            errorTen.innerText = '';
        }

        // Kiểm tra định dạng email
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            errorEmail.innerText = 'Vui lòng nhập đúng định dạng email.';
            document.getElementById('email').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('email').style.borderColor = 'gray';
            errorEmail.innerText = '';
        }

        <c:forEach var="list" items="${listKH}">
        if ("${list.email}".trim() === email.trim()) {
            errorEmail.innerText = 'Email này đã được đăng kí.';
            document.getElementById('email').style.borderColor = 'red';
            hasError = true;
        }
        </c:forEach>

        // Kiểm tra định dạng số điện thoại
        var phoneRegex = /^\d{10}$/;
        if (!phoneRegex.test(sdt)) {
            errorSdt.innerText = 'Vui lòng nhập số điện thoại đúng định dạng (10 số).';
            document.getElementById('sdt').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('sdt').style.borderColor = 'gray';
            errorSdt.innerText = '';
        }

        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }

</script>
<script>
    var themKhachHangNhanhThanhCong = "${themKhachHangNhanhThanhCong}";
    if (themKhachHangNhanhThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Thêm khách hàng nhanh thành công!',
            icon: 'success',
        });
    }

    var themGhiChuThanhCong = "${themGhiChuThanhCong}";
    if (themGhiChuThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Thêm ghi chú thành công!',
            icon: 'success',
        });
    }

    var quayThanhToanThanhCongStr = "${quayThanhToanThanhCongStr}";
    if (quayThanhToanThanhCongStr == "2") {

        window.location.href = "/export-pdf-ban-quay";

        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Thanh toán thành công!',
            icon: 'success',
        });
    }
</script>
<script>
    function xoaHoaDonBanQuay(xoaId) {
        Swal.fire({
            icon: 'warning',
            text: 'Bạn có chắc chắn muốn xóa hóa đơn chờ?',
            showCancelButton: true,
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = "/admin/ban-quay/delete/"+xoaId;
            }
        });
        event.preventDefault();
    }
</script>
</body>
</html>
