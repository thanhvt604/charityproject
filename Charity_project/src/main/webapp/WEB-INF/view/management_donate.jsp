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
<script src="/Charity_project/registry/js/usermanage.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="leftcolumn">
		<div id="lpath1">
			<div class="textleft">Xin chào ${sessionScope.sessionUser.name}</div>
			<c:out value="${xx}"></c:out>
			<div id=container-bg>
				<a href='<c:url value='/info'></c:url>'> <c:choose>
						<c:when test="${sessionScope.sessionUser.imageUrl==null}">
							<img alt="" id="adminbackground"
								src="/Charity_project/registry/images/boy.jpg">
								<c:redirect url="/login"></c:redirect>
						</c:when>
						<c:otherwise>
							<img alt="" id="adminbackground"
								src="/Charity_project/registry/images/avatar/${sessionScope.sessionUser.imageUrl}">

						</c:otherwise>
					</c:choose>
				</a>
			</div>
			<div class="textleft">Danh sách quản lí</div>
			<hr>
		</div>
		<div>
			<a id="a1" href='<c:url value="/manage"></c:url>' class="textleft">Quản
				lí người dùng</a> <a id="a1"
				href='<c:url value="/management_campaign"></c:url>' class="textleft">Quản
				lí chiến dịch</a> <a id="a1"
				href='<c:url value="/donatemanage"></c:url>' class="textleft">Quản
				lí quyên góp</a>
		</div>

	</div>
	<div id="rightcolumn">
		<div id="path1">
			<form class="input-group rounded"
				action='<c:url value="/donatemanage"></c:url>'>
				<input type="hidden" name="action" value="search"> <input
					name="search" class="form-control rounded" placeholder="Search"
					aria-label="Search" aria-describedby="search-addon" /><span
					class="input-group-text border-0" id="search-addon"><button
						type="submit" style="border: none;">
						<i class="fas fa-search"></i>
					</button> </span>

			</form>
			<a class="btn1" href='<c:url value='/index'></c:url>'><button
					type="button" class="btn1 btn-danger">Trang chủ</button></a> <a
				class="btn2" href='<c:url value='/logout'></c:url>'><button
					type="button" class="btn2 btn-info">Đăng xuất</button></a>
		</div>


		<form id="path2" action='<c:url value="/donatemanage"></c:url>'>
			<div class="container2">
				<input type="hidden" name="action" value="delete3">
				<h3 id="title">QUẢN LÝ QUYÊN GÓP</h3>
				
			</div>
			<select name="select" class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				style="margin-bottom: 15px; margin-left: 30px">
				<option selected>Số hàng muốn xem</option>
				<option value="1">Xem danh sách với 5 hàng</option>
				<option value="2">Xem danh sách với 10 hàng</option>
				<option value="3">Xem danh sách với 15 hàng</option>
			</select>
				
			<select name="select2" class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				style="margin-bottom: 15px; margin-left: 30px">
				<option selected>Sắp xếp theo</option>
				<option value="1">Sắp xếp theo số tiền</option>
				<option value="2">Sắp xếp theo ngày quyên góp</option>
			</select>

			<table id="mytable">
				<tr>
					<th style="width: 5%"></th>
					<th style="width: 15%">Id người dùng</th>
					<th style="width: 15%">Id chiến dịch</th>
					<th style="width: 25%">Số tiền</th>
					<th style="width: 25%">Ngày quyên góp</th>
				</tr>
				<c:forEach var="o" items="${listD}">
					<tr style="text-align: left;">

						<td><input type="checkbox" name="check" value="${o.userId}"></td>
						<td id="id">${o.userId}</td>
						<td>${o.campaignId}</td>
						<td>${o.amount}</td>
						<td>${o.date}</td>

						<td>
						</td>
						<td><input name="check2" type="hidden" value="${o.date}"></td>
					</tr>

				</c:forEach>
			</table>
			<div id=n>
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="1" end="${count}" var="i">
							<li class="page-item"><a class="page-link"
								href="<c:url value= "/donatemanage?id=${i}&select=${select}&select2=${select2}"></c:url>">${i}</a></li>

						</c:forEach>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</form>

	</div>
	
	
	<div></div>
	<script>
	 $(document).ready(function(){
		 $("select").click(function(){
	 		
		 var x=$('[name=select]').val();
		 console.log(typeof x);
		 if(x==='1'){
		$(location).attr('href','<c:url value='/donatemanage?select=1'></c:url>')
		}
		 if(x==='2'){
				$(location).attr('href','<c:url value='/donatemanage?select=2'></c:url>')
				}
		 if(x==='3'){
				$(location).attr('href','<c:url value='/donatemanage?select=3'></c:url>')
				}
		 });
	 });
	 $(document).ready(function(){
		 $("select").click(function(){
	 		
		 var x=$('[name=select2]').val();
		 console.log(typeof x);
		 if(x==='1'){
		$(location).attr('href','<c:url value='/donatemanage?select2=1'></c:url>')
		}
		 if(x==='2'){
				$(location).attr('href','<c:url value='/donatemanage?select2=2'></c:url>')
				}
		 if(x==='3'){
				$(location).attr('href','<c:url value='/donatemanage/?select2=3'></c:url>')
				}
		 });
	 });
	</script>
</body>
</html>