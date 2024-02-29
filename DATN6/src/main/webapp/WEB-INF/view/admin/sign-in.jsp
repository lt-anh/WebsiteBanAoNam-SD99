<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

        * {
            box-sizing: border-box;
        }

        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }

        h1 {
            font-weight: bold;
            margin: 0;
        }

        h2 {
            text-align: center;
        }

        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        span {
            font-size: 12px;
        }

        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }

        button {
            border-radius: 20px;
            border: 1px solid #FF4B2B;
            background-color: #FF4B2B;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        button:active {
            transform: scale(0.95);
        }

        button:focus {
            outline: none;
        }

        button.ghost {
            background-color: transparent;
            border-color: #FFFFFF;
        }

        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
            0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {

            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }

        .overlay {
            background: #FF416C;
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
            background: linear-gradient(to right, #FF4B2B, #FF416C);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #FFFFFF;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }

        .social-container {
            margin: 20px 0;
        }

        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

        footer {
            background-color: #222;
            color: #fff;
            font-size: 14px;
            bottom: 0;
            position: fixed;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 999;
        }

        footer p {
            margin: 10px 0;
        }

        footer i {
            color: red;
        }

        footer a {
            color: #3c97bf;
            text-decoration: none;
        }

        .trang_chu {
            /* Thiết lập màu chữ mặc định */
            color: white;
            /* Thiết lập thời gian và kiểu chuyển động */
            transition: color 0.3s ease-in-out;
        }

        .trang_chu:hover {
            /* Màu chữ khi hover */
            color: springgreen;
        }

    </style>
</head>

<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <c:forEach items="${listTK}" var="list">
            <input type="hidden" value="${list.email}">
        </c:forEach>
        <form action="/dangky-done" method="post">
            <h1>Tạo tài khoản</h1>
            <input type="text" placeholder="Tên" id="fullname" name="Ten" required/>
            <input id="check" type="hidden" value="${tb}">
            <input type="email" placeholder="Email" id="email" name="Email" required/>
            <span id="errorEmail" class="text-danger"></span>
            <input type="password" id="password" placeholder="Nhập mật khẩu" name="MatKhau"/>
            <input type="password" id="password-repeat" placeholder="Nhập lại mật khẩu" name="MatKhau1"/>
            <button type="submit" onclick="validateForm()">Đăng ký</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/login" method="post">
            <h1>Đăng nhập</h1>
            <div class="social-container">
                <a href="http://localhost:4200" class="social"><i class="fab fa-google-plus-g"></i></a>
            </div>
            <span>hoặc sử dụng tài khoản của bạn</span>
            <input type="email" name="taiKhoan" placeholder="Email" required/>
            <input type="password" name="matKhau" placeholder="Password" required/>
            <label style="color: red">${tb==1?"Tài khoản hoặc mật khẩu không chính xác!":""}</label>
            <a href="/quenmk">Quên mật khẩu?</a>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Chào mừng trở lại!</h1>
                <p>Để duy trì kết nối với chúng tôi vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                <p>Tiếp tục với <a href="/user/trang_chu/2" class="trang_chu"><b>Trang chủ</b></a></p>
                <button class="ghost" id="signIn">Đăng nhập</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Chào bạn!</h1>
                <p>Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi</p>
                <p>Tiếp tục với <a href="/user/trang_chu/2" class="trang_chu"><b>Trang chủ</b></a></p>
                <button class="ghost" id="signUp">Đăng ký</button>
            </div>
        </div>
    </div>
</div>

<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>
<script>
    function validateForm() {
        var fullname = document.getElementById('fullname').value;
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var passwordRepeat = document.getElementById('password-repeat').value;

        var Email = document.getElementsByName('Email')[0].value;

        var errorEmail = document.getElementById('errorEmail');

        var hasError = false;

        if (fullname === '' || email === '' || password === '' || passwordRepeat === '') {
            document.getElementById('container').style.display = 'none';
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Vui lòng điền đầy đủ thông tin</div>',
                allowOutsideClick: true
            });
            setTimeout(() => {
                Swal.close();
                document.getElementById('container').style.display = 'block';
            }, 1000);
            hasError = true;
        } else if (password != passwordRepeat) {
            document.getElementById('container').style.display = 'none';
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Mật khẩu không giống nhau</div>',
                allowOutsideClick: true
            });
            setTimeout(() => {
                Swal.close();
                document.getElementById('container').style.display = 'block';
            }, 1000);
            hasError = true;
        }

        <c:forEach var="list" items="${listUsers}">
        if ("${list.email}".trim() === Email.trim()) {
            document.getElementById('container').style.display = 'none';
            Swal.fire({
                icon: 'warning',
                html: '<div class="swal-text">Email đã đăng ký.</div>',
                allowOutsideClick: true
            });
            setTimeout(() => {
                Swal.close();
                document.getElementById('container').style.display = 'block';
            }, 1000);
            hasError = true;
        } else {
            errorEmail.innerText = '';
        }
        </c:forEach>

        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }

    var themThanhCong = "${themThanhCong}";
    if (themThanhCong == "2") {
        Swal.fire({
            position: 'top-end', // Vị trí của thông báo
            toast: true, // Thiết lập kiểu thông báo là "toast"
            showConfirmButton: false, // Không hiển thị nút xác nhận
            timer: 2000, // Thời gian hiển thị (đơn vị là milliseconds)
            width: '300px', // Đặt chiều rộng của thông báo
            text: 'Đăng ký thành công!',
            icon: 'success',
        });
    }
</script>
</body>

</html>
