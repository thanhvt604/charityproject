
$(function() {


	/*  Gallery lightBox
	  ================================================*/

	if ($(".lightbox").length > 0) {

		$(".lightbox").prettyPhoto();

	}

	/*  Owl carousel
	  ================================================*/

	if ($(".owl-carousel").length > 0) {

		$(".owl-carousel").owlCarousel({

			margin: 25,
			stagePadding: 25,
			nav: true,
			navText: [
				"<i class='glyphicon glyphicon-chevron-left'></i>",
				"<i class='glyphicon glyphicon-chevron-right'></i>"
			],
			responsive: {
				0: {
					items: 2
				},
				600: {
					items: 4
				},
				1000: {
					items: 8
				}
			}

		});
	}






	/*
	On scroll animations
	================================================
	*/


	var $elems = $('.animate-onscroll');

	var winheight = $(window).height();
	var fullheight = $(document).height();

	$(window).scroll(function() {
		animate_elems();
	});



	function animate_elems() {

		wintop = $(window).scrollTop(); // calculate distance from top of window

		// loop through each item to check when it animates
		$elems.each(function() {

			$elm = $(this);

			if ($elm.hasClass('animated')) { return true; } // if already animated skip to the next item

			topcoords = $elm.offset().top; // element's distance from top of page in pixels

			if (wintop > (topcoords - (winheight * .75))) {
				// animate when top of the window is 3/4 above the element
				$elm.addClass('animated');
			}

		});

	} // end animate_elems()




	/*  Google map Script
	====================================================*/

	function initMap() {


		var mapLatitude = 31.423308; // Google map latitude 
		var mapLongitude = -8.075145; // Google map Longitude  

		var myLatlng = new google.maps.LatLng(mapLatitude, mapLongitude);

		var mapOptions = {

			center: myLatlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			zoom: 10,
			scrollwheel: false
		};

		var map = new google.maps.Map(document.getElementById("contact-map"), mapOptions);

		var marker = new google.maps.Marker({

			position: myLatlng,
			map: map,

		});

		// To add the marker to the map, call setMap();
		marker.setMap(map);

		// Map Custom style
		var styles = [
			{
				stylers: [
					{ hue: "#1f76bd" },
					{ saturation: 80 }
				]
			}, {
				featureType: "road",
				elementType: "geometry",
				stylers: [
					{ lightness: 80 },
					{ visibility: "simplified" }
				]
			}, {
				featureType: "road",
				elementType: "labels",
				stylers: [
					{ visibility: "off" }
				]
			}
		];

		map.setOptions({ styles: styles });

	};

	if ($("#contact-map").length > 0) {

		initMap();

	}

});


 $(document).ready(function(){
	$(".x").click(function() {
		let yy = $(this).closest(".cause").find(".y").val();
		let xx = $(this).closest(".cause").find(".x").val();
		console.log(xx,yy);
		$('[name=idcp]').val(xx);
		if(yy=='Tạm ngưng')
		{
			alert('Chiến dịch đã tạm ngừng')
			return false;
		}
		if(yy=='Đã hoàn thành')
		{
			alert('Chiến dịch đã hoàn thành')
			return false;
		}
		if(yy=='Đã kết thúc')
		{
			alert('Chiến dịch đã kết thúc')
			return false;
		}
		
		var g=$('[name=session]').val();
		console.log(g);
		if(g==null||g=="")
		{
			alert('Bạn chưa đăng nhập hãy đăng nhập')
			return false;
		}
	});

});






