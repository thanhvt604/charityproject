<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tạo tài khoản </title>
    <!-- Main css -->
    <link rel="stylesheet" type="text/css" href="/Charity_project/registry/css/style.css">

    <!-- Font Icon -->
    <link rel="stylesheet" href="/Charity_project/registry/fonts/material-icon/css/material-design-iconic-font.min.css">

    
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="GET" id="signup-form" class="signup-form" action='<c:url value='/login'></c:url>'>
                        <h2 class="form-title">Tạo tài khoản</h2>
                        <input type="hidden" name="action" value="createAccount">
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Họ Tên"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="phone" id="phone" placeholder="Số điện thoại"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Email"/>
                        </div>
                 
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>Tôi đồng ý với tất cả các quy định  <a href="#" class="term-service">điểu khoản dịch vụ</a></label>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Tạo tài khoản"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Bạn đã có tài khoản ? <a href='<c:url value='/login'></c:url>' class="loginhere-link">Đăng nhập ở đây</a>
                    </p>
                    <p style="color: red;font-weight: bold;"><c:out value="${x}"></c:out></p>
                </div>
                
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="/Charity_project/registry/js/main_regis.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>