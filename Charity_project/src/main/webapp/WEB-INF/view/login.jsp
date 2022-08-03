 <%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/Charity_project/registry/images/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/css/util.css">
	<link rel="stylesheet" type="text/css" href="/Charity_project/registry/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/Charity_project/registry/images/charity_bg.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action='<c:url value='/login'></c:url>' method="post">
				<input type="hidden" name="action" value="ok">
					<span class="login100-form-title p-b-53">
						Đăng nhập
					</span>

					
					
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							Tài khoản
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="username" >
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Mật khẩu
						</span>

						<a href='<c:url value='/forgotpass'/>' class="txt2 bo1 m-l-5">
							Quên?
						</a>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" >
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17 sub">
						<button class="login100-form-btn" type="submit">
							Đăng nhập
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							Không phải thành viên?
						</span>

						<a href='<c:url value='/register'></c:url>' class="txt2 bo1">
							Đăng kí ngay
						</a>
						<div>
						
						<p style="color: red; font-weight: bold "><c:out value="${msg}"></c:out></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/bootstrap/js/popper.js"></script>
	<script src="/Charity_project/registry/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/daterangepicker/moment.min.js"></script>
	<script src="/Charity_project/registry/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/Charity_project/registry/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script>
	$(document).ready(function(){
		  $(".sub").click(function(){
			  var re = /^\w+([-+.'][^\s]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			  var emailFormat = re.test($('[name=username]').val());

			  if (!emailFormat) {
				  alert("Email sai định dạng")
				  return false;
			  }
			  var name  = $('[name=username]').val();
		      if(name==''){alert("Email không được để trống")
		    	  return false;}
		      var id  = $('[name=pass]').val();
		      if(id==''){alert("Password không được để trống")
		    	  return false;}
		  });
		});
	</script>
</body>
</html>