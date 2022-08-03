<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/Charity_project/registry/css/repass.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="containerplus" style="display: flex;justify-content: center;align-items: center;height: 100vh">
<div class="container">
	<div class="row">
		<form action='<c:url value='/info'></c:url>' class="col-sm-4 display">
		    <input type="hidden" name="id" value="${sessionScope.sessionUser.id}">
		    <input type="hidden" name="action" value="repass">
		    <input type="hidden" name="mail" value="${sessionScope.sessionUser.mail}">
		    <label>Mật khẩu hiện tại</label>
		    <div class="form-group pass_show"> 
                <input type="password"  name ="oldpass"class="form-control" placeholder="Current Password"> 
            </div> 
		       <label>Mật khẩu mới</label>
            <div class="form-group pass_show"> 
                <input type="password"  name="newpass" class="form-control" placeholder="New Password"> 
            </div> 
		       <label>Nhập lại</label>
            <div class="form-group pass_show"> 
                <input type="password" name="renewpass" class="form-control" placeholder="Confirm Password"> 
            </div> 
            <input type="submit">
            <p style="color: red;font-weight: bold;"><c:out value="${msg}"></c:out></p>
             <span class="message success">Valid Password!</span>
  			<span class="message error">Invalid Password!</span>
		</form>  
	</div>
</div>
</div>
<script>
$(function(){
  var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

  $('[name="newpass"]').on('keyup', function() {
    $('.message').hide();
    regExp.test( $(this).val() ) ? $('.message.success').show() : $('.message.error').show();
  });

});
</script>
</body>
</html>