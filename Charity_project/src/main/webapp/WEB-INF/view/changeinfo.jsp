<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/Charity_project/registry/css/information.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Dashboard</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href='<c:url value='/index'></c:url>'>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='<c:url value='/info?id=${sessionScope.sessionUser.id}'></c:url>' > Infor</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='<c:url value='/changeinfo?id=${sessionScope.sessionUser.id}'></c:url>'>Thay đổi thông tin</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href='<c:url value='/history?id=${sessionScope.sessionUser.id}'></c:url>'>Lịch sử quyên góp</a>
      </li>
    </ul>
  </div>
</nav>
<form class="container bootstrap snippets bootdey" action='<c:url value='/changeinfo'/>' method="get">

<div class="form-group">
  <label for="usr">Tên:</label>
  <input type="hidden" value="ok" name="action">
  <input type="hidden" value="${sessionScope.sessionUser.id}" name="id">  
  <input type="text" class="form-control" id="usr" name="user" value="${me.name}">
</div>
<div class="form-group">
  <label for="pwd">Số điện thoại</label>
  <input type="text" class="form-control" id="" name="sdt" value="${me.phoneNumber}">
</div>
<input type="submit" value="Xác nhận">
    </form>

                                       
</body>
</html>