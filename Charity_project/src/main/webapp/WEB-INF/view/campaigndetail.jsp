<%@page import="com.myproject.entity.Donate"%>
<%@page import="com.myproject.service.AccountService"%>
<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myproject.entity.Campaign"%>
<%@ page import="com.myproject.entity.Account"%>
<%@ page import="com.myproject.DAO.AccountDao"%>
<%@ page import="com.myproject.service.AccountService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<title>Charity Project</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Dosis:400,700'
	rel='stylesheet' type='text/css'>

<!-- Bootsrap -->
<link rel="stylesheet"
	href="/Charity_project/registry/assets/css/bootstrap.min.css">

<!-- Font awesome -->
<link rel="stylesheet"
	href="/Charity_project/registry/assets/css/font-awesome.min.css">

<!-- Owl carousel -->
<link rel="stylesheet"
	href="/Charity_project/registry/assets/css/owl.carousel.css">

<!-- Template main Css -->
<link rel="stylesheet"
	href="/Charity_project/registry/assets/css/style.css">

<!-- Modernizr -->
<script src="/Charity_project/registry/assets/js/modernizr-2.6.2.min.js"></script>


</head>

<body style="color: black;">
	<header class="main-header">


		<nav class="navbar navbar-static-top">

			<div class="navbar-top">

				<div class="container">
					<div class="row">

						<div class="col-sm-6 col-xs-12">

							<ul class="list-unstyled list-inline header-contact">
								<li><i class="fa fa-phone"></i> <a href="tel:">0394887135
								</a></li>
								<li><i class="fa fa-envelope"></i> <a href="#">charityproject@gmail.com</a>
								</li>
							</ul>
							<!-- /.header-contact  -->

						</div>




					</div>
				</div>

			</div>

			<div class="navbar-main">

				<div class="container">

					<div class="navbar-header">
						<c:if test="${sessionScope.sessionUser!=null}">
							<a href='<c:url value="/info?id=${sessionScope.sessionUser.id}"></c:url>'> <img alt=""
								id="icon" src="/Charity_project/registry/images/icons/user.png"></a>
						</c:if>
					</div>

					<div id="navbar" class="navbar-collapse collapse pull-right">

						<ul class="nav navbar-nav">

							<li><a class="is-active" href="index.html">TRANG CH???</a></li>

						</ul>
						<c:if test="${sessionScope.sessionUser==null}">
							<a href='<c:url value="/login"></c:url>'> <img alt=""
								id="icon" src="/Charity_project/registry/images/icons/login.png"></a>
						</c:if>
						<c:if test="${sessionScope.sessionUser!=null}">
							<a href='<c:url value="/logout"></c:url>'> <img alt=""
								id="icon"
								src="/Charity_project/registry/images/icons/logout.png"></a>
						</c:if>

					</div>
					<!-- /#navbar -->

				</div>
				<!-- /.container -->

			</div>
			<!-- /.navbar-main -->


		</nav>

	</header>
	<!-- /. main-header -->
	<input type="hidden" value="${Campaign.status}" name="stas"/>
	<input type="hidden" value="${sessionScope.sessionUser}" name="session" />
	<c:set var="x" value="${Campaign.target}"></c:set>
	<div id="containx">



		<div id="div1">
			<h2 style="text-align: center; font-weight: bold;">
				<c:out value="${Campaign.name}"></c:out>
			</h2>
			<p>
				<c:out value="${Campaign.des}"></c:out>
			</p>
			<%
			Campaign cp = (Campaign) request.getAttribute("Campaign");
			%>
			<%=cp.getContent()%>

		</div>
		<div id="div2">

			<div id="div2-1">
				<div>
					<div>
						<p class="ch x1">Th??ng tin quy??n g??p</p>
					</div>
					<div class="ch">
						<h4 style="font-weight: bold; padding-right: 20px;">${Campaign.donate}</h4>
						<p class="text1">Quy??n g??p/${Campaign.target}</p>
					</div>
					<div class="ch">
						<table class="t1">
							<tr>
								<th>L?????t quy??n g??p</th>
								<th>?????t ???????c</th>
								<th>Ng??y k???t th??c</th>

							</tr>
							<tr>
								<td><b>${Campaign.donation}</b></td>
								<td><b id="per"></b><b>%</b></td>

								<td><b>${Campaign.endDay}</b></td>
							</tr>

						</table>


					</div>
					<div class="btn-holder text-center ch">

						<button class="btn btn-primary x" data-toggle="modal"
							data-target="#donateModal" type="submit">QUY??N G??P</button>

					</div>

				</div>

			</div>

			<h3>Danh s??ch nh?? h???o t??m</h3>
			<div id="div2-2">

				<c:forEach var="o" items="${Donate}">


					<c:forEach var="i" items="${Acc}">

						<c:if test="${o.userId==i.id}">
							<c:set var="name" value="${i.name}"></c:set>
							<c:set var="pnum" value="${i.phoneNumber}"></c:set>
							<c:set var="statush" value="${i.historystatus}"></c:set>

						</c:if>


					</c:forEach>
					<div id="divcontain2">
						<div id="div2-2-1">
							<p style="font-weight: bold;">

								<c:if test="${statush=='ON'}">
									<p style="font-weight: bold;">${name}</p>
								</c:if>

								<c:if test="${statush=='OFF'}">
									<p style="font-weight: bold;">M???t nh?? h???o t??m gi???u t??n</p>
								</c:if>
							</p>
							<p>${o.amount}</p>


						</div>
						<p class="text1">*******${fn:substring(pnum,7,10)}</p>


					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<footer class="main-footer">

		<div class="footer-top"></div>


		<div class="footer-main">
			<div class="container">

				<div class="row">
					<div class="col-md-4">

						<div class="footer-col">

							<h4 class="footer-title">
								V??? ch??ng t??i <span class="title-under"></span>
							</h4>

							<div class="footer-content">

								<p>Charity Project l?? t??nh n??ng g??y t??? thi???n . C??c d??? ??n
									???????c ????ng t???i trong Charity Project ?????u l?? nh???ng d??? ??n ???? ???????c
									l???a ch???n c???n tr???ng , v?? ???????c b???o tr??? b???i c??c t??? ch???c uy t??n.
							</div>

						</div>

					</div>

					<div class="col-md-4">

						<div class="footer-col">

							<h4 class="footer-title">
								CH??M S??C KH??CH H??NG <span class="title-under"></span>
							</h4>

							<div class="footer-content">
								<ul class="tweets list-unstyled">
									<li class="tweet">?????a ch???: T???ng M, T??a nh?? Petroland, S???
										12 T??n Tr??o, Ph?????ng T??n Ph??, Qu???n 7, Th??nh ph??? H??? Ch?? Minh</li>

									<li class="tweet">Hotline : 1900 5454 41 (1000 ??/ph??t)</li>

									<li class="tweet">Email : hotro@gmail.vn</li>

								</ul>
							</div>

						</div>

					</div>


					<div class="col-md-4">

						<div class="footer-col">

							<h4 class="footer-title">
								LI??N L???C V???I CH??NG T??I <span class="title-under"></span>
							</h4>

							<div class="footer-content">

								<div class="footer-form">

									<div class="footer-form">

										<form action="php/mail.php" class="ajax-form">

											<div class="form-group">
												<input type="text" name="name" class="form-control"
													placeholder="T??n" required>
											</div>

											<div class="form-group">
												<input type="email" name="email" class="form-control"
													placeholder="E-mail" required>
											</div>

											<div class="form-group">
												<textarea name="message" class="form-control"
													placeholder="Message" required></textarea>
											</div>

											<div class="form-group alerts">

												<div class="alert alert-success" role="alert"></div>

												<div class="alert alert-danger" role="alert"></div>

											</div>

											<div class="form-group">
												<button type="submit" class="btn btn-submit pull-right">G???i
													Tin</button>
											</div>

										</form>

									</div>

								</div>
							</div>

						</div>

					</div>
					<div class="clearfix"></div>



				</div>


			</div>


		</div>

		<div class="footer-bottom">

			<div class="container text-right"></div>
		</div>
		
		

	</footer>
	<!--  Form donate -->
	<div class="modal fade" id="donateModal" tabindex="-1" role="dialog"
			aria-labelledby="donateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="donateModalLabel">QUY??N G??P NGAY
							B??Y GI???</h4>
					</div>
						
					<div class="modal-body">
							
						<form method="post" class="form-donation"
							action='<c:url value="/pay"></c:url>'>

							<h3 class="title-style-1 text-center">
								C???m ??n b???n ???? tham gia quy??n g??p <span class="title-under"></span>
							</h3>
							<input type="hidden" name="action" value="ok" /> <input
								type="hidden" name="iduser"
								value="${sessionScope.sessionUser.id}" />

							<div class="row">
							
								<div class="form-group col-md-12 ">
									<input type="checkbox" id="vnpay" name="vnpay" value="">
						<label for="vnpay"> VNPay</label><br> <input
							type="checkbox" id="PayPal" name="PayPal" value="">
						<label for="PayPal"> PayPal</label><br> <input
							type="checkbox" id="bank" name="bank" value="">
						<label for="bank"> Th??? ng??n h??ng</label><br>
									<input type="text" class="form-control" id="amount"
										name="price" max="20000000" required="required"
										placeholder="S??? ti???n">
								</div>
								<input type="hidden" name="idcps" value="${Campaign.id}" />
							</div>


							<div class="row">

								<div class="form-group col-md-12">
									<textarea cols="30" rows="4" class="form-control" name="note"
										placeholder="L???i nh???n c???a b???n"></textarea>
								</div>

							</div>

							<div class="row">

								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-primary pull-right"
										name="donateNow">Quy??n g??p</button>
								</div>

							</div>








						</form>

					</div>
				</div>
			</div>
		</div>
	<!-- main-footer -->
	<!--  Scripts
    ================================================== -->

	<!-- jQuery -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/jquery-1.11.1.min.js"><\/script>')
	</script>

	<!-- Bootsrap javascript file -->
	<script src="/Charity_project/registry/assets/js/bootstrap.min.js"></script>

	<!-- owl carouseljavascript file -->
	<script src="/Charity_project/registry/assets/js/owl.carousel.min.js"></script>

	<!-- Template main javascript -->
	<script src="/Charity_project/registry/assets/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var xx = ("${x}").replaceAll(".", "");
			var gg = '<c:out value='${Campaign.donate}'></c:out>';
			console.log(typeof (gg));
			var yy = gg.replaceAll(".", "");
			console.log(xx, yy);
			var z = (parseInt(yy) / parseInt(xx)) * 100;
			z = z.toFixed(2);
			console.log(z);
			$("#per").text(z);
		});
		$(document).ready(function(){
			$(".x").click(function() {
				let yy = '<c:out value='${Campaign.status}'></c:out>';
				
				console.log(yy);
				
				if(yy=='T???m ng??ng')
				{
					alert('Chi???n d???ch ???? t???m ng???ng')
					return false;
				}
				if(yy=='???? ho??n th??nh')
				{
					alert('Chi???n d???ch ???? ho??n th??nh')
					return false;
				}
				if(yy=='???? k???t th??c')
				{
					alert('Chi???n d???ch ???? k???t th??c')
					return false;
				}
				
				var g=$('[name=session]').val();
				console.log(g);
				if(g==null||g=="")
				{
					alert('B???n ch??a ????ng nh???p h??y ????ng nh???p')
					return false;
				}
			});

		});
	</script>

</body>
</html>










