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
<body style="height: 180vh">
<div id="container-ac">
	<form action='<c:url value="/management_campaign"></c:url>' method="post" id="m-container" enctype= multipart/form-data>
				<input type="hidden" name="hi" value="ok2"/>
				<input type="hidden" name="st" value="${item.startDay}"/>
				<input type="hidden" name="st2" value="${item.endDay}"/>
				<h3 id="title" style="text-align: center;padding-top: 5%">Cập nhập chiến dịch </h3>
		<div class="ac ac1">  
				<div id="ac1a">
				<div class="acc acc1"><p>Tên chiến dịch</p><input type="text" name="name" value="${item.name}"></div>
				<div class="acc acc2"><p>Mã chiến dịch</p> <input type="text" name="idx" value="${item.id}" readonly="readonly"> </div>
				</div>
				<p style="padding-left: 3%">Hình ảnh</p>
				<input style="width: 320px " type="file" name = "image" value="${item.imageUrl}"/>
		</div>
		<div class="ac ac2">
				<p>Trạng thái</p>
				
				<select name="status" >
				<option value="" selected disabled>Choose here</option>
					<option>Tạm ngưng</option>
				</select>
		</div>
		<div class="ac ac3">
				<p>Ngày bắt đầu</p><input type="date" name="startday" readonly="readonly">
				<p style="margin-left: 20%">Ngày kết thúc</p><input type="date" name="endday" value="${item.endDay}">
				</div>
		<div class="ac ac3">
				<p>Số tiền</p><input type="text" name="donate" value="${item.donate}" readonly="readonly">
				<p style="margin-left: 20%">Số lượt</p><input type="text" name="donation" value="${item.donation}" readonly="readonly">
				</div>		
		<div class="ac ac4">
				<p>Mục tiêu</p>
				<input type="text" name="target" value="${item.target}">
		</div>
		<div class="ac ac5">
		<p>Mô tả</p>
		<textarea cols="100" rows="5" name="des"> ${item.des}</textarea>
		</div>
		<div class="ac ac6">
		<p>Nội dung</p>
		<textarea cols="100" rows="10" name="content" maxlength="3950">${item.content}</textarea >
		</div>
		<div class="ac ac7">
				<input type="submit" value="Xác nhận" class="sub btn-danger" style="width: 120px ;border-radius: 25px"/>
				<a href='<c:url value="/management_campaign"></c:url>' style="width: 120px"><button type="button" class="btn2 btn-secondary ">Quay lại</button></a>
			</div>
	</form>
	<script>
		$(document).ready(function(){
		  $(".sub").click(function(){
			  if(confirm("Bạn có muốn thay đổi?")){ alert("thay đổi thành công !");}
			    else{
			    	alert("Thay đổi thất bại")
			    	 $(location).attr('href', 'http://localhost:7598/Charity_project/management_campaign')
			    return false;
			    }
			 
		  });
		});
		$(document).ready(function(){
			 var edate=$('[name=st]').val();
			 var bdate=$('[name=st2]').val();
			 var newdate = edate.split("-").reverse().join("-");
			 var newdate2 = bdate.split("-").reverse().join("-");
			 console.log(newdate);
			  $("[name=startday]").val(newdate);
			  $("[name=endday]").val(newdate2);
		});
	</script>		

</div>
</body>
</html>