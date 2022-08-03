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
        <a class="nav-link" href='<c:url value='/index?id=${sessionScope.sessionUser.id}'></c:url>'>Home <span class="sr-only">(current)</span></a>
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
<div class="container bootstrap snippets bootdey">
<div class="panel-body inf-content">
    <div class="row">
        <div class="col-md-4">
            <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="/Charity_project/registry/images/avatar/${me.imageUrl}"> 
            
            
            
           
        </div>
        <div class="col-md-6">
            <strong>Information</strong><br>
            <div class="table-responsive">
            <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                Identificacion                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                           <c:out value="${sessionScope.sessionUser.id}"></c:out>     
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                Tên                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <c:out value="${me.name}"></c:out>    
                        </td>
                    </tr>
                    

                   


                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                Chức vụ                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <c:out value="${me.role}"></c:out> 
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                Email                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <c:out value="${me.mail}"></c:out> 
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                                Ngày tạo                                                
                            </strong>
                        </td>
                        <td class="text-primary">
                            <c:out value="${sessionScope.sessionUser.dateJoin}"></c:out> 
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                               Số điện thoại                                              
                            </strong>
                        </td>
                        <td class="text-primary">
                        <c:out value="${me.phoneNumber}"></c:out>     
                        </td>
                    </tr>                       
                     <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                               Pass                                               
                            </strong>
                        </td>
                        <td class="text-primary">
                       <a href='<c:url value='/changepass'></c:url>'><button>Change Password</button></a>
                        </td>
                    </tr>
                     <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-calendar text-primary"></span>
                               Ảnh Đại diện                                               
                            </strong>
                        </td>
                        <td class="text-primary">
                        <form action='<c:url value="/info?id=${sessionScope.sessionUser.id}"></c:url>' method="post" id="m-container" enctype= multipart/form-data>
                        <input type="hidden" value="changeAvatar" name="action">
                        <input type="hidden" value="${sessionScope.sessionUser.id}" name="id">
                       <input style="width: 320px " type="file" name = "image" value="${item.imageUrl}"/>
                       <input type="submit" value="OK">
                       </form>
                        </td>
                    </tr>                           
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
</div>                                        
</body>
</html>