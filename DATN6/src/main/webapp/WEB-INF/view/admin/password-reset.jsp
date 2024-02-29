<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Latform - Login and Register Form Templates</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../../../resources/dist/vendor/bootstrap-4.5.3/css/bootstrap.min.css" type="text/css">
    <!-- Material design icons -->
    <link rel="stylesheet" href="../../../resources/dist/icons/material-design-icons/css/mdi.min.css" type="text/css">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
    <!-- Latform styles -->
    <link rel="stylesheet" href="../../../resources/dist/css/latform-style-1.min.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="form-wrapper" style="background-color: white">
    <div class="container">
        <div class="card">
            <div style="background-color:#FF4B2B;border-radius: 15px;box-shadow:0px 0px 7px #0a0e14 " class="card-body">

                <div class="my-5 text-center">
                    <h3 class="font-weight-bold mb-3" style="color: white">Quên Mật Khẩu</h3>
                    <p style="color: white">Nhập và gửi địa chỉ email để đặt lại mật khẩu của bạn.</p>
                </div>

                <c:forEach items="${listTK}" var="list">
                    <input type="hidden" value="${list.email}">
                </c:forEach>
                <form action="/guiemail" method="post">
                    <div class="form-group">
                        <label style="color: white" for="email">Email</label>
                        <div class="form-icon-wrapper">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" autofocus
                                   required name="email">
                            <i class="form-icon-left mdi mdi-email"></i>
                        </div>
                        <label style="color: white;font-size: 17px" id="check123"></label>
                    </div>
                    <div class="form-group">
                        <button style="background-color: white" class="btn btn-block">Gửi</button>
                    </div>
                </form>
                <p style="color: white" class="text-center">Bạn có thể <a
                        style="text-decoration: none;color: white;font-size: large" href="/login"><b>Đăng nhập</b></a> .
                </p>
            </div>
        </div>
    </div>
</div>
<!-- Jquery -->
<script src="../../../resources/dist/vendor/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../resources/dist/vendor/bootstrap-4.5.3/js/bootstrap.min.js"></script>
<!-- Latform scripts -->
<script src="../../../resources/dist/js/latform.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var hiddenEmails = document.querySelectorAll('input[type="hidden"]');
        var emailInput = document.getElementById('email');
        var sendButton = document.querySelector('.btn-block');
        var check = document.getElementById('check123');
        sendButton.addEventListener('click', function (event) {
            var enteredEmail = emailInput.value;
            var emailMatched = false;

            var emailFormat = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailFormat.test(enteredEmail)) {
                // Show warning for invalid email format
                check.innerHTML = "Địa chỉ email không hợp lệ";
                event.preventDefault();
                return;
            }

            hiddenEmails.forEach(function (hiddenEmail) {
                if (hiddenEmail.value === enteredEmail) {
                    emailMatched = true;
                }
            });

            if (!emailMatched) {
                check.innerHTML = "Email không khớp với bất kỳ tài khoản nào đã đăng ký";
                event.preventDefault(); // Ngăn chặn form được gửi đi nếu email không khớp
                return;
            }
        });
    })
</script>
</body>
</html>
