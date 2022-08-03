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
<body style="height: 120vh">

	<form id="u-container" action='<c:url value="/manage"/>'
		enctype=multipart/form-data method="post">
		<div>
			<h3 id="title" style="text-align: center; margin-top: 5%">Cập
				nhập người dùng</h3>
			<input type="hidden" name="action" value="upu"> <input
				type="hidden" name="id" value="${item.id}"> <input
				type="hidden" name="pass" value="${item.pass}"> <input
				type="hidden" name="repass" value="${item.pass}"> <input
				type="hidden" name="rolex" value="${item.role}">
			<h3 id="title" style="text-align: center;"></h3>
			<div class="u-in u-in1">
				<p>Họ và tên</p>

				<input type="text" name="name" value="${item.name}">
			</div>
			<div class="u-in u-in2">
				<p>Email</p>
				<input type="text" name="email" value="${item.mail}" id="email"
					readonly="readonly">
			</div>
			<div class="u-in u-in6">
				<p>Status</p>
				<select id="select-u2" name="status">
					<option value="${item.status}" selected disabled>Choose
						here</option>
					<option value="Active">Active</option>
					<option value="NoActive">NoActive</option>
					<option value="Pending">Pending</option>
					<option value="Banned">Banned</option>
				</select>
				<p style="width: 280px; padding-left: 18%">Phone number</p>
				<input type="text" name="phone" value="${item.phoneNumber} ">
			</div>
			<div class="u-in u-in3">
				<p>Password</p>
				<input type="password" name="pass" readonly="readonly"
					value="${item.pass}">
				<p style="width: 150px; padding-left: 5%">
			</div>
			<div class="u-in u-in4">
				<p>Role</p>
				<select id="select-u" name="role">
					<option value="${item.role}" selected disabled>Choose here</option>
					<option value="Admin">Admin</option>
					<option value="User">User</option>
				</select>
				<p style="padding-left: 20%; width: 300px;">Ảnh đại diện</p>
				<input style="width: 320px" type="file" name="image" />

			</div>
			<div style="padding-bottom: 15px;">
				<input type="checkbox" name="check" value="ok"> Tạo mật khẩu
				ngẫu nhiên
			</div>
			<div class="u-in u-in5">
				<a href='<c:url value="/manage"></c:url>'><button type="submit"
						class="btn1 btn-danger sub">Xác nhận</button></a> <a
					href='<c:url value="/manage"></c:url>'><button type="button"
						class="btn2 btn-secondary">Quay lại</button></a>
			</div>
		</div>
		
	</form>
	<script>
		$(document).ready(function() {
			var x="<c:out value="${item.role}"></c:out>";
			console.log(x);
			if(x==="Admin")
			{
				$("div.u-in4 #select-u option[value='Admin']").attr('selected','selected');}
			if(x==="User")
			{
				$("div.u-in4 #select-u option[value='User']").attr('selected','selected');}
			var y="<c:out value="${item.status}"></c:out>";
			console.log(y);
			if(y==="Active")
			{	
			$("div.u-in6 #select-u2 option[value='Active']").attr('selected','selected');}
			if(y==="NoActive")
			{
				$("div.u-in6 #select-u2 option[value='NoActive']").attr('selected','selected');}
			if(y==="Pending")
			{
				$("div.u-in6 #select-u2 option[value='Pending']").attr('selected','selected');}
			if(y==="Banned")
			{
				$("div.u-in6 #select-u2 option[value='Banned']").attr('selected','selected');}
		});

		$(document)
				.ready(
						function() {

							$(".sub").click(
											function() {
												var rolex = $('[name=rolex]')
														.val();

												if (rolex == 'Admin')

												{
													if ($('[name=role]').val() == 'User') {
														alert("Thành viên này là Admin không thể chuyển thành User")
														return false;
													}
												}

												var re = /^\w+([-+.'][^\s]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
												var emailFormat = re.test($(
														"#email").val()); // This return result in Boolean type
												if (!emailFormat) {
													alert("Email sai định dạng")
													return false;
												}
												var name = $('[name=name]')
														.val();
												if (name == '') {
													alert("Tên không được để trống")
													return false;
												}
												var id = $('[name=email]')
														.val();
												if (id == '') {
													alert("Email không được để trống")
													return false;
												}

												var ed = $('[name=phone]')
														.val();
												if (ed == '') {
													alert("Số điện thoại không được để trống")
													return false;
												}
												var xx = $('[name=role]').val();
												if (xx == '') {
													alert("Cấp bậc không được để trống")
													return false;
												}
												if (confirm("Bạn có muốn sửa thành viên?")) {
													alert("thành công !");
												} else {
													alert("thất bại")
													$(location)
															.attr('href',
																	'http://localhost:8150/Charity_project/manage')
													return false;
												}
											});
						});
	</script>
</body>
</html>