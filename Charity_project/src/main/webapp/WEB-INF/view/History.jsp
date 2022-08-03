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
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
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
        <a class="nav-link" href='<c:url value='/changeinfo?id=${sessionScope.sessionUser.id}'></c:url>' > Infor</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='<c:url value='/info?id=${sessionScope.sessionUser.id}'></c:url>'>Thay đổi thông tin</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href='<c:url value='/history?id=${sessionScope.sessionUser.id}'></c:url>'>Lịch sử quyên góp</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container bootstrap snippets bootdey">
<div style="display: flex; padding-bottom: 10px">

<p style="padding-right: 15px">Bật tắt chế độ ẩn danh : </p>
<form action='<c:url value='/history'></c:url>' method="get">
	<input type="hidden" name="action" value="changestatush">
	<input type="hidden" name="id" value='${sessionScope.sessionUser.id}'>
	<c:if test="${ac.historystatus=='ON'}"><input type="hidden" name="status" value="ON"></c:if>
	<c:if test="${ac.historystatus=='OFF'}"><input type="hidden" name="status" value="OFF"></c:if>
	<c:if test="${ac.historystatus=='ON'}"><button type="submit" >ON</button></c:if>
	<c:if test="${ac.historystatus=='OFF'}"><button type="submit">OFF</button></c:if>
	
</form>
<%
   response.setHeader( "Pragma", "no-cache" );
   response.setHeader( "Cache-Control", "no-cache" );
   response.setDateHeader( "Expires", 0 );
%>
</div>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Tên chiến dịch</th>
      <th scope="col"> Số tiền(VND)</th>
      <th scope="col">Thời gian quyên góp</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="o" items="${list}" >
  <c:forEach var="y" items="${list2}">
  	<c:if test="${o.campaignId==y.id}">
  	
  	<c:set var="n" value="${y.name}"></c:set></c:if>
  </c:forEach> 
    <tr>
      <th scope="row"></th>
      <td>${n}</td>
      <td>${o.amount}</td>
      <td>${o.date}</td>
    </tr>
   </c:forEach>
    
  </tbody>
</table>


</div>                                        
</body>
</html>