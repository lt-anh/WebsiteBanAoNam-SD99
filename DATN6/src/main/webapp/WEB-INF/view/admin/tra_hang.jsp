<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="../../../resources/css/add_form.css">
    <style>
        .status-container {
            display: flex;
            justify-content: space-between;
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .status {
            width: 20%;
            height: 100px;
            text-align: center;
            line-height: 100px;
            font-size: 22px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .status-1 {
            backgroundColor: #ff8b33;
            background: #ff8b33;
        }

        .status-2 {
            backgroundColor: wheat;
            background: wheat;
        }

        .arrow1 {
            width: 30px;
            height: 30px;
            margin-top: 25px;
            color: green;
            font-size: 40px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        /**/

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease, transform 0.2s ease;
        }

        /* Nút Xác nhận */
        .btn-button-xn {
            margin-left: 20px;
            background-color: #007bff;
            color: #fff;
        }

        .btn-button-xn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Nút Hủy đơn */
        .btn-button-huy {
            margin-left: 10px;
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-huy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .btn-button-xnhuy {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-button-xnhuy:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        /* Nút Chi tiết */
        .btn-button-ct {
            background-color: #ccc;
            color: #333;
        }

        .btn-button-ct:hover {
            background-color: #999;
            color: #fff;
            transform: scale(1.05);
        }

    </style>
    <style>
        #addFormContainer {
            display: none;
            position: absolute;
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

        #addForm {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
            margin-top: 10%;
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
            padding-left: 10px;
            margin-top: 10%;
            width: 100%;
            height: 100%;
            background-color: white; /* Màu nền của biểu mẫu */
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
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
                <a href="/admin/index/1" class="nav-link">Trang chủ</a>
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
                            <img src="/images/test.jpg">
                        </div>

                    </c:when>
                    <c:when test="${adminOrStaff == 2}">
                        <div class="image">
                            <img src="/images/test1.jpg">
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
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
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
                        <a href="/admin/ban-quay/trang-chu" class="nav-link">
                            <i class="nav-icon fas fa-store"></i>
                            <p>
                                Bán Quầy
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Bảng
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
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
                                <a href="/admin/loai_ao/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link active">
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
                                <span style="${allChat==0?"display: none;":""}"
                                      class="right badge badge-danger">${allChat}</span>
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
                        <h1>Trả hàng</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/index/1">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Trả hàng</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <div id="no_1" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Yêu cầu trả hàng
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <div id="no_2" style="display: none">
            <section class="content">
                <div class="container-fluid">
                    <div class="status-container">
                        <div class="status status-1" onclick="showStatus('1')"><i class="fas fa-hourglass-half"></i>
                            Yêu cầu trả hàng
                        </div>
                        <div class="arrow arrow1"><i class="fas fa-arrow-right"></i></div>
                        <div class="status status-2" onclick="showStatus('2')" style="margin-right: 50%"><i
                                class="fas fa-truck"></i> Đã trả hàng
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
        </div>
        <section class="content" style="margin-bottom: 20px">
            <form method="post">
                <input type="hidden" name="maDonHang" value="${hoaDon.ma}">
                <c:choose>
                    <c:when test="${trangThai == 1}">
                        <button class="button btn-button-xn"
                                id="addButton1" onclick="clickHuy()">Xác nhận
                        </button>
                        <button formaction="/admin/tra_hang/delete" name="delete"
                                value="${item.id}" class="button btn-button-huy"><i class="fas fa-trash"></i> Xóa
                        </button>
                        <button class="button btn-button-ct" style="margin-left: 71%;" id="addButton"
                                onclick="clickThem()">Chi tiết
                        </button>
                    </c:when>
                    <c:when test="${trangThai == 2}">
                        <button class="button btn-button-xn" formaction="/admin/don_hang/hoan_thanh">Hoàn thành</button>
                        <button class="button btn-button-ct" style="margin-left: 79%;" id="addButton"
                                onclick="clickThem()">Chi tiết
                        </button>
                    </c:when>
                </c:choose>
            </form>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-header">

                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Hóa đơn</th>
                                            <th>Áo chi tiết</th>
                                            <th>Ngày yêu cầu</th>
                                            <th>Số lượng trả</th>
                                            <th>Đơn giá</th>
                                            <th>Lí do trả</th>
                                            <th>Trạng thái</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listHoaDonTraHangs}" var="list">
                                            <tr>
                                                <td>${list.hoaDon.ma}</td>
                                                <td>${list.aoChiTiet.size.ten}, ${list.aoChiTiet.mau_sac.ten}</td>
                                                <td>
                                                    <c:set var="dateTimeString" value="${list.ngayYeuCau}"/>
                                                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                                                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                                                    pattern="dd-MM-yyyy HH:mm:ss"/>
                                                        ${formattedDate}
                                                </td>
                                                <td>${list.soLuongTra}</td>
                                                <td>${list.donGia}</td>
                                                <td>${list.ghiChu}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${list.trangThai == 1}">Yêu cầu trả hàng</c:when>
                                                        <c:when test="${list.trangThai == 2}">Đã trả hàng</c:when>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <button formaction="/admin/tra_hang/detail" name="detail"
                                                            value="${list.id}"
                                                            class="btn btn-primary me-2"><i class="fas fa-edit"></i> Chi
                                                        Tiết
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Hóa đơn</th>
                                            <th>Áo chi tiết</th>
                                            <th>Ngày yêu cầu</th>
                                            <th>Số lượng trả</th>
                                            <th>Đơn giá</th>
                                            <th>Lí do trả</th>
                                            <th>Trạng thái</th>
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
    <!-- /.content-wrapper -->


    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<div id="addFormContainer" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm">
                <div class="row">
                    <div class="col-11">
                        <h3 style="text-align: center">Hóa đơn: <strong style="font-size: 35px">${hoaDon.ma}</strong>
                        </h3>
                    </div>
                    <div class="col-1 icon-x" onclick="dongIcon()">
                        <i class="fas fa-times"></i>
                    </div>
                </div>
                <div id="chiTietDonHang">
                    <div class="d-flex justify-content-between ">
                        <b><p style="width: 100px">Ảnh</p></b>
                        <b><p style="width: 200px">Tên sản phẩm</p></b>
                        <b><p style="width: 100px">Số lượng</p></b>
                        <b><p style="width: 100px">Tổng tiền</p></b>
                    </div>
                    <c:forEach items="${hoaDonChiTiets}" var="list">
                        <div class="d-flex justify-content-between ">
                            <p><img style="width: 100px; height: 100px; border: 1px solid #6e7881"
                                    src="/images/${list.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                            <div style="width: 200px">
                                <b>
                                    <p>${list.aoChiTiet.ao.ten}</p>
                                    <p>Thông tin: ${list.aoChiTiet.mau_sac.ten}, ${list.aoChiTiet.size.ten}</p>
                                </b>
                            </div>

                            <b><p style="width: 100px">${list.soLuong}</p></b>
                            <b><p style="width: 100px"><fmt:formatNumber value="${list.donGia}" type="currency"
                                                                         currencySymbol="VNĐ"/></p></b>
                        </div>
                    </c:forEach>
                </div>
                <h5 style="padding-top: 10px">Ngày tạo hóa đơn: <c:set var="dateTimeString" value="${hoaDon.ngayTao}"/>
                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                    pattern="dd-MM-yyyy HH:mm:ss"/>
                    ${formattedDate}</h5>
                <h5 style="padding-bottom: 10px; padding-top: 10px;display: <c:if
                        test="${hoaDon.ngayHoanThanh == null}">none</c:if>">
                    Ngày hoàn thành: <c:set var="dateTimeString" value="${hoaDon.ngayHoanThanh}"/>
                    <fmt:parseDate value="${dateTimeString}" var="parsedDate"
                                   pattern="yyyy-MM-dd'T'HH:mm:ss.SSS"/>
                    <fmt:formatDate value="${parsedDate}" var="formattedDate"
                                    pattern="dd-MM-yyyy HH:mm:ss"/>
                    ${formattedDate}
                </h5>
                <div style="display: <c:if test="${hoaDon.khachHang == null}">none</c:if>">
                    <h5 style="padding-bottom: 10px">Tên khách hàng : ${hoaDon.khachHang.ten}</h5>
                    <h5 style="padding-bottom: 10px">Sđt khách hàng : ${hoaDon.khachHang.sdt}</h5>
                    <h5 style="display: <c:if test="${hoaDon.moTa == null}">none</c:if>">Địa chỉ : ${hoaDon.moTa}</h5>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="addFormContainer1" style="display: none;">
    <div class="container-fluid">
        <div class="container">
            <form method="post" id="addForm1">
                <h3 style="text-align: center"><strong style="font-size: 35px">Xác nhận trả hàng</strong></h3>
                <div class="d-flex justify-content-between ">
                    <p style="width: 50px">Ảnh</p>
                    <p style="width: 200px">Tên sản phẩm</p>
                    <p style="width: 100px">Số lượng</p>
                    <p style="width: 100px">Đơn giá</p>
                </div>

                <div class="d-flex justify-content-between ">
                    <p><img style="width: 50px; height: 70px; border: 1px solid #6e7881"
                            src="/images/${item.aoChiTiet.ao.anhs.get(0).ten_url}"></p>
                    <p style="width: 200px">${item.aoChiTiet.ao.ten}</p>
                    <p style="width: 100px">${item.soLuongTra}</p>
                    <p style="width: 100px"><fmt:formatNumber value="${item.donGia}" type="currency"
                                                              currencySymbol="VNĐ"/></p>
                </div>
                <h5>Tên khách hàng : ${item.hoaDon.khachHang.ten}</h5>
                <h5>Sđt khách hàng : ${item.hoaDon.khachHang.sdt}</h5>
                <div style="margin-top: 10px">
                    <label style="font-size: 25px">Lí do cho trả hàng :</label>
                    <br>
                    <textarea style="width: 50%" name="ghiChu"></textarea>
                    <br>
                    <button class="button btn-button-xn" formaction="/admin/tra_hang_admin/xac_nhan"
                            name="idDonHangHoanTra" value="${item.id}">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
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
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
<script>
    window.onload = function () {
        showStatus('${trangThai}');
    };


    function showStatus(status) {
        event.preventDefault();

        var no_1 = document.getElementById("no_1");
        var no_2 = document.getElementById("no_2");

        if (status == 1) {
            no_1.style.display = "block";
            no_2.style.display = "none";
        }
        if (status == 2) {
            no_2.style.display = "block";
            no_1.style.display = "none";
        }

    }
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

    function dongIcon() {
        addFormContainer.style.display = "none";
    }

    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    var addButton1 = document.getElementById("addButton1");
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton1.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });

    function clickHuy() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
</body>
</html>
