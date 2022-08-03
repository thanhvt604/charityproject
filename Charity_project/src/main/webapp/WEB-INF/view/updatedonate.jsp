
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
	<form id="u-container" action='<c:url value="/donatemanage"/>' enctype= multipart/form-data method="get">
		<div>
		<h3 id="title" style="text-align: center; margin-top: 5%">Cập nhập đợt quyên góp</h3>
		<input type="hidden" name ="action" value="upt">
		<input type="hidden" name ="date" value="${item.date}">

			<div class="u-in u-in4">
				<p>IdUser</p>
				<input type="text" name="iduser" value="${item.userId}" readonly="readonly">
				<p style="padding-left: 20%; width: 300px;">Id chiến dịch</p>
				<input type="text" name="idcampaign" value="${item.campaignId}" readonly="readonly">
				
			</div>
			 
			<div class="u-in u-in4">
				<p>Số tiền</p>
				<input type="text" name="amount" value="${item.amount}">
				

			</div>	 
				
			
			<div class="u-in u-in5">
				<a href='<c:url value="/donatemanage"></c:url>'><button type="submit" class="btn1 btn-danger sub">Xác nhận</button></a>
				<a href='<c:url value="/donatemanage"></c:url>'><button type="button" class="btn2 btn-secondary">Quay lại</button></a>
			</div>
		</div>
			<p style="color: red;font-weight: bold;"><c:out value="${error}"></c:out></p>	
	</form>
		
</body>
</html>