<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<body>


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
							<a
								href='<c:url value="/info?id=${sessionScope.sessionUser.id}"></c:url>'>
								<img alt="" id="icon"
								src="/Charity_project/registry/images/icons/user.png">
							</a>


						</c:if>
					</div>

					<div id="navbar" class="navbar-collapse collapse pull-right">

						<ul class="nav navbar-nav">

							<li><a class="is-active" href="index.html">TRANG CHỦ</a></li>

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




	<!-- Carousel
    ================================================== -->
	<div id="homeCarousel" class="carousel slide carousel-home"
		data-ride="carousel">

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#homeCarousel" data-slide-to="1"></li>
			<li data-target="#homeCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner" role="listbox">

			<div class="item active">

				<img src="/Charity_project/registry/images/banner/banner1.jpg"
					alt="">

				<div class="container">

					<div class="carousel-caption">

						<h2 class="carousel-title bounceInDown animated slow">Bởi vì
							họ cần chúng ta</h2>
						<h4 class="carousel-subtitle bounceInUp animated slow ">Làm
							đừng để họ thất vọng</h4>


					</div>
					<!-- /.carousel-caption -->

				</div>

			</div>
			<!-- /.item -->


			<div class="item ">

				<img src="/Charity_project/registry/images/banner/banner4.jpg"
					alt="">

				<div class="container">

					<div class="carousel-caption">

						<h2 class="carousel-title bounceInDown animated slow">Chúng
							ta có thể cải thiên cuộc sống của họ</h2>

						<h4 class="carousel-subtitle bounceInUp animated slow">Làm
							ngay đi !</h4>


					</div>
					<!-- /.carousel-caption -->

				</div>

			</div>
			<!-- /.item -->




			<div class="item ">

				<img src="/Charity_project/registry/images/banner/banner3.jpg"
					alt="">

				<div class="container">

					<div class="carousel-caption">

						<h2 class="carousel-title bounceInDown animated slow">Một xu
							là rất nhiều tiền, nếu bạn không có một xu.</h2>
						<h4 class="carousel-subtitle bounceInUp animated slow">Bạn có
							thể làm điều khác biệt !</h4>


					</div>
					<!-- /.carousel-caption -->

				</div>

			</div>
			<!-- /.item -->

		</div>

		<a class="left carousel-control" href="#homeCarousel" role="button"
			data-slide="prev"> <span class="fa fa-angle-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#homeCarousel" role="button"
			data-slide="next"> <span class="fa fa-angle-right"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a> <input type="hidden" value="${sessionScope.sessionUser}"
			name="session" />
	</div>

	<!-- /.home-reasons -->

	<div class="section-home our-causes animate-onscroll fadeIn">

		<div class="container">

			<h2 class="title-style-1">
				CHIẾN DỊCH <span class="title-under"></span>
			</h2>

			<div class="row">
				<c:forEach var="o" items="${list}">
					<div class="col-md-3 col-sm-6 x2">

						<div class="cause" style="height: 550px">

							<img
								src="/Charity_project/registry/images/campaign_image/${o.imageUrl}"
								alt="" class="cause-img">

							<div class="progress cause-progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="30"
									aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
									${o.donate} VNĐ / ${o.target} VNĐ</div>
							</div>

							<h4 class="cause-title">
								<a href='<c:url value='/cpdetail?id=${o.id}'></c:url>'>${o.name}
								</a>
							</h4>

							<div class="cause-details">${o.des}.</div>
							<input type="hidden" name="ss" class="y" value="${o.status}">
							<div class="btn-holder text-center">

								<button class="btn btn-primary x" data-toggle="modal" id="x"
									data-target="#donateModal" value="${o.id}">QUYÊN GÓP</button>

							</div>



						</div>
						<!-- /.cause -->

					</div>
				</c:forEach>


			</div>

		</div>

	</div>
	<!-- /.our-causes -->

	<!-- page -->

	<div class="pagination-wrapper">
		<div class="pagination">
			<a class="prev page-numbers" href="javascript:;">Trước</a>

			<c:forEach begin="1" end="${count}" var="i">
				<a class="page-numbers"
					href="<c:url value= "/index?num=${i}"></c:url>"> ${i}</a>
			</c:forEach>
			<a class="next page-numbers" href="javascript:;">Sau</a>
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
								Vể chúng tôi <span class="title-under"></span>
							</h4>

							<div class="footer-content">

								<p>Charity Project là tính năng gây từ thiện . Các dự án
									được đăng tải trong Charity Project đều là những dự án đã được
									lựa chọn cẩn trọng , và được bảo trợ bởi các tổ chức uy tín.
							</div>

						</div>

					</div>

					<div class="col-md-4">

						<div class="footer-col">

							<h4 class="footer-title">
								CHĂM SÓC KHÁCH HÀNG <span class="title-under"></span>
							</h4>

							<div class="footer-content">
								<ul class="tweets list-unstyled">
									<li class="tweet">Địa chỉ: Tầng M, Tòa nhà Petroland, Số
										12 Tân Trào, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh</li>

									<li class="tweet">Hotline : 1900 5454 41 (1000 đ/phút)</li>

									<li class="tweet">Email : hotro@gmail.vn</li>

								</ul>
							</div>

						</div>

					</div>


					<div class="col-md-4">

						<div class="footer-col">

							<h4 class="footer-title">
								LIÊN LẠC VỚI CHÚNG TÔI <span class="title-under"></span>
							</h4>

							<div class="footer-content">

								<div class="footer-form">

									<div class="footer-form">

										<form action='<c:url value ='/index'></c:url>'
											class="ajax-form" method="get">
											<input type="hidden" name="action" value="mes">
											<div class="form-group">
												<input type="text" name="name" class="form-control"
													placeholder="Tên" value="${sessionScope.sessionUser.name}" required>
											</div>

											<div class="form-group">
												<input type="email" name="email" class="form-control"
													placeholder="E-mail" value="${sessionScope.sessionUser.mail}" required>
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
												<button type="submit" class="btn btn-submit pull-right">Gửi
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
	<!-- main-footer -->




	<!-- Donate Modal -->
	<div class="modal fade" id="donateModal" tabindex="-1" role="dialog"
		aria-labelledby="donateModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="donateModalLabel">QUYÊN GÓP NGAY
						BÂY GIỜ</h4>
				</div>
				<!--  Form donate -->
				<div class="modal-body">

					<form method="post" class="form-donation"
						action='<c:url value="/pay"></c:url>'>

						<h3 class="title-style-1 text-center">
							Cảm ơn bạn đã tham gia quyên góp <span class="title-under"></span>
						</h3>
						<input type="checkbox" id="vnpay" name="vnpay" value="">
						<label for="vnpay"> VNPay</label><br> <input
							type="checkbox" id="PayPal" name="PayPal" value="">
						<label for="PayPal"> PayPal</label><br> <input
							type="checkbox" id="bank" name="bank" value="">
						<label for="bank"> Thẻ ngân hàng</label><br>
						<br> <input type="hidden" name="action" value="ok"> <input
							type="hidden" name="iduser"
							value="${sessionScope.sessionUser.id}" /> <input type="hidden"
							name="idcp" value="" />
						<div class="row">

							<div class="form-group col-md-12 ">

								<input type="text" class="form-control" id="amount" name="price"
									max="200000000" required="required" placeholder="Số tiền">
							</div>

						</div>


						<div class="row">

							<div class="form-group col-md-12">
								<textarea cols="30" rows="4" class="form-control" name="note"
									placeholder="Lời nhắn của bạn"></textarea>
							</div>

						</div>

						<div class="row">

							<div class="form-group col-md-12">
								<button type="submit" class="btn btn-primary pull-right"
									name="donateNow">Quyên góp</button>
							</div>

						</div>





					</form>

				</div>
			</div>
		</div>

	</div>
	<!-- /.modal -->





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
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</body>
</html>