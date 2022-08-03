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
			<div id=container-bg>
			<a  href='<c:url value='/info'></c:url>'>
			<c:choose>
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
				lí chiến dịch</a>
				<a id="a1"
				href='<c:url value="/donatemanage"></c:url>' class="textleft">Quản
				lí quyên góp</a>
		</div>

	</div>
	<div id="rightcolumn">
		<div id="path1">
			<form class="input-group rounded" action='<c:url value="/manage"></c:url>'>
				<input type="hidden" name="action" value="search">
				<input name="search" class="form-control rounded"
					placeholder="Search" aria-label="Search"
					aria-describedby="search-addon" /><span
					class="input-group-text border-0" id="search-addon"><button type="submit" style="border: none;"> <i
					class="fas fa-search"></i></button>
				</span>

			</form>
			

		<a  class="btn1" href='<c:url value='/index'></c:url>'><button type="button" class="btn1 btn-danger">Trang chủ</button></a>
			<a class="btn2"	 href='<c:url value='/logout'></c:url>'><button type="button" class="btn2 btn-info">Đăng xuất</button></a>
		</div>


		<form id="path2" action='<c:url value="/manage"></c:url>'>
			<div class="container2">
				<input type="hidden" name="action" value="delete">
				<h3 id="title">QUẢN LÝ NGƯỜI DÙNG</h3>
				<a href='<c:url value="/adduser"></c:url>'> <img alt=""
					id="icon" src="/Charity_project/registry/images/icons/add-user.png"></a>
				<button type="submit" class="delete btn3 btn-dark">Xóa người
					dùng</button>
			</div>
			<select name="select" class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				style="margin-bottom: 15px; margin-left: 30px">
				<option value="" selected disabled>Số hàng muốn xem</option>
				<option value="1">Xem danh sách với 5 hàng</option>
				<option value="2">Xem danh sách với 10 hàng</option>
				<option value="3">Xem danh sách với 15 hàng</option>
			</select>
				
			<select name="select2" class="form-select form-select-sm"
				aria-label=".form-select-sm example"
				style="margin-bottom: 15px; margin-left: 30px">
				<option value="" selected disabled>Sắp xếp theo</option>
				<option value="1">Sắp xếp theo chức vụ</option>
				<option value="2">Sắp xếp theo trạng thái</option>
			</select>
			<div class="classname">
			<strong  style="color: white;"><c:out value="${mes1}"></c:out></strong></div>
			<table id="mytable">
				<tr>
					<th style="width: 5%"></th>
					<th style="width: 5%">ID</th>
					<th style="width: 20%">Họ và tên</th>
					<th style="width: 25%">Email</th>
					<th style="width: 15%">Ngày gia nhập</th>
					<th style="width: 10%">Chức vụ</th>
					<th style="width: 10%">Trạng thái</th>
					<th style="width: 10%"></th>
				</tr>
				<c:forEach var="o" items="${listA}">
					<tr style="text-align:left;">
						<td><input type="checkbox" name="check" value="${o.id}"></td>
						<td id ="id">${o.id }</td>
						<td> ${o.name} </td>
						<td> ${o.mail}</td>
						<td> ${o.dateJoin}</td>
						<td id="role"><div id="cssRole">${o.role}</div></td>
						<td id="status"><div id="cssStatus">${o.status}</div></td>
						
						<td><a href='<c:url value="/updateuser?id=${o.id}"></c:url>'> <img
								alt="" id="icon2"
								src="/Charity_project/registry/images/icons/gear.png"></a> <a class="delete"
							href='<c:url value="/manage?action=delete&check=${o.id}"></c:url>'> <img alt="" id="icon2"
								src="/Charity_project/registry/images/icons/remove.png"></a></td>
				
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
								href="<c:url value= "/manage?id=${i}&select=${select}&select2=${select2}"></c:url>">${i}</a></li>

						</c:forEach>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</form>
		
	</div>
	</div>
	<div></div>
	<script >
	$(document).ready(function(){
		$('#mytable tr').each(function() {
		    var va = $(this).find('td:eq(5)').text();
		    console.log(va);
		if(va==='User')
	{
			 $(this).find('#cssRole').css("background-color", "yellow");
	}
		});
	});
	$(document).ready(function(){
		$('#mytable tr').each(function() {
		    var va = $(this).find('td:eq(6)').text();
		    console.log(va);
		if(va==='Active')
	{
			 $(this).find('#cssStatus').css("background-color", "green");
	}
		if(va==='Pending')
		{
				 $(this).find('#cssStatus').css("background-color", "yellow");
		}
		if(va==='NoActive')
		{
				 $(this).find('#cssStatus').css("background-color", "darkgray");
		}
		if(va==='Banned')
		{
				 $(this).find('#cssStatus').css("background-color", "violet");
		}
		
		});
	});

	 $(document).ready(function(){
		 $("select").click(function(){
	 		
		 var x=$('[name=select]').val();
		 console.log(typeof x);
		 if(x==='1'){
		$(location).attr('href','<c:url value='/manage?select=1'></c:url>')
		}
		 if(x==='2'){
				$(location).attr('href','<c:url value='/manage?select=2'></c:url>')
				}
		 if(x==='3'){
				$(location).attr('href','<c:url value='/manage?select=3'></c:url>')
				}
		 });
	 });
	 $(document).ready(function(){
		 $("select").click(function(){
	 		
		 var x=$('[name=select2]').val();
		 console.log(typeof x);
		 if(x==='1'){
		$(location).attr('href','<c:url value='/manage?select2=1'></c:url>')
		}
		 if(x==='2'){
				$(location).attr('href','<c:url value='/manage?select2=2'></c:url>')
				}
		 if(x==='3'){
				$(location).attr('href','<c:url value='/manage?select2=3'></c:url>')
				}
		 });
	 });
	</script>
</body>
</html>