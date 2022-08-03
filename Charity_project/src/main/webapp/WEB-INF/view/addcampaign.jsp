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
<body style="height: 160vh">
<div id="container-ac">
	<form name ="user" action='<c:url value="/management_campaign"></c:url>' method="post" id="m-container" enctype= multipart/form-data >
				<input type="hidden" name="hi" value="ok"/>
				<h3 id="title" style="text-align: center;padding-top: 5%">Thêm chiến dịch </h3>
		<div class="ac ac1">  
				<div id="ac1a">
				<div class="acc acc1"><p>Tên chiến dịch</p><input type="text" name="name"></div>
				<div class="acc acc2"><p>Mã chiến dịch</p> <input type="text" name="idx"> </div>
				</div>
				<p style="padding-left: 3%">Hình ảnh</p>
				<input style="width: 320px " type="file" name = "image"/>
		</div>
		
		
		<div class="ac ac3">
				<p>Ngày bắt đầu</p><input type="date" name="startday">
				<p style="margin-left: 20%">Ngày kết thúc</p><input type="date" name="endday">
				</div>
		<div class="ac ac4">
				<p>Mục tiêu</p>
				<input type="text" name="target">
		</div>
		<div class="ac ac5">
		<p>Mô tả</p>
		<textarea cols="100" rows="5" name="des"></textarea>
		</div>
		<div class="ac ac6">
		<p>Nội dung</p>
		<textarea cols="100" rows="10" name="content" maxlength="4000"></textarea >
		</div>
		<div class="ac ac7">
				<input type="submit" class="sub btn-danger" value="Xác nhận" style="width: 120px ;border-radius: 25px"/>
				<a href='<c:url value="/management_campaign"></c:url>' style="width: 120px"><button type="button" class="btn2 btn-secondary">Quay lại</button></a>
			</div>
	</form>
		<script>
		$(document).ready(function(){
		  $(".sub").click(function(){
			  var name  = $('[name=name]').val();
		      if(name==''){alert("Tên không được để trống")
		    	  return false;}
		      var id  = $('[name=idx]').val();
		      if(id==''){alert("Mã không được để trống")
		    	  return false;}
		      var sd  = $('[name=startday]').val();
		      if(sd==''){alert("Ngày bắt đầu không được để trống")
		    	  return false;}
		      var ed  = $('[name=endday]').val();
		      if(ed==''){alert("Ngày kết thúc không được để trống")
		    	  return false;}
		      var mt  = $('[name=target]').val();
		      if(mt==''){alert("Mục tiêu không được để trống")
		    	  return false;}
		      if(isNaN(mt)){alert("Mục tiêu là kiểu số")
		    	  return false;}
			  if(confirm("Bạn có muốn thêm chiến dịch này?")){ alert("Thêm thành công !");}
			    else{
			    	alert("Thêm thất bại")
			    	 $(location).attr('href', 'http://localhost:8150/Charity_project/management_campaign')
			    return false;
			    }
		  });
		});
	</script>
</div>
</body>
</html>