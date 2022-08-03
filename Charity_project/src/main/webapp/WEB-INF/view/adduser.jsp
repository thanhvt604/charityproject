<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Charity_project/registry/css/manage.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a8c8b85e20.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form id="u-container" action='<c:url value="/manage"/>' enctype= multipart/form-data method="post">
		<div>
		<h3 id="title" style="text-align: center; margin-top: 5%">Thêm người dùng</h3>
		<input type="hidden" name ="action" value="addu">
			<div class="u-in u-in1">
				<p>Họ và tên</p>
				
				<input type="text" name="name">
			</div>
			<div class="u-in u-in2">
				<p>Email</p>
				<input type="text" name="email" id="email">
			</div>
			
			<div class="u-in u-in6">
				<p>Status</p>
				<select id="select-u" name="status">
					<option value="" selected disabled>Choose here</option>
					<option>Active</option>
					<option>NoActive</option>
					<option>Pending</option>
					<option>Banned</option>
				</select>
				<p style="width: 250px; padding-left: 14%">Phone number</p>
				<input type="text" name="phone">
			</div>
			<div class="u-in u-in4">
				<p>Role</p>
				<select id="select-u" name="role">
				<option value="" selected disabled>Choose here</option>
					<option>Admin</option>
					<option>User</option>
				</select>
				<p style="padding-left: 20%; width: 300px;">Ảnh đại diện</p>
				<input style="width: 320px " type="file" name = "image"/>

			</div>
			<input type="hidden" name="check" value="ok">
			<div class="u-in u-in5">
				<a href='<c:url value="/manage"></c:url>'><button type="submit" class="btn1 btn-danger sub">Xác nhận</button></a>
				<a href='<c:url value="/manage"></c:url>'><button type="button" class="btn2 btn-secondary">Quay lại</button></a>
			</div>
		</div>
		
	</form>
			<script>
			
			
		$(document).ready(function(){
		  $(".sub").click(function(){
			  var re = /^\w+([-+.'][^\s]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			  var emailFormat = re.test($("#email").val()); // This return result in Boolean type

			  if (!emailFormat) {
				  alert("Email sai định dạng")
				  return false;
			  }
			  var name  = $('[name=name]').val();
		      if(name==''){alert("Tên không được để trống")
		    	  return false;}
		      var id  = $('[name=email]').val();
		      if(id==''){alert("Email không được để trống")
		    	  return false;}
		      var sd  = $('[name=pass]').val();
		      if(sd==''){alert("Mật khẩu không được để trống")
		    	  return false;}
		      var ed  = $('[name=phone]').val();
		      if(ed==''){alert("Số điện thoại không được để trống")
		    	  return false;}
		      var xx  = $('[name=role]').val();
		      if(xx==''){alert("Cấp bậc không được để trống")
		    	  return false;}
			  if(confirm("Bạn có muốn thêm thành viên?")){alert("Thêm thành công !");}
			    else{
			    	alert("Thêm thất bại")
			    	 $(location).attr('href', 'http://localhost:8150/Charity_project/manage')
			    return false;
			    }
		  });
		});
	</script>
</body>
</html>