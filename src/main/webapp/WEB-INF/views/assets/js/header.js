// 스크롤 배경색 유무, 최상단에서 메뉴 밀기
$(document).ready(function() {
	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		if (scroll > 1) {
			$("#header").css("background", "#fffef2");
			$("#header").css("border-bottom", "1px solid rgba(51,51,51,.2)");
			$("#header").css("top", "0px");
		} else {
			$("#header").css("background", "none");
			$("#header").css("border-bottom", "none");
			$("#header").css("top", "35px");
		}
	});
});

$(function() {
	// 무료배송 -----------------------------------------------------------------------------------
	$(".page_top_free").on("click", function(event) {
		event.preventDefault();
		$(".overlay_delivery").addClass("visible");

		// 1,2단 메뉴 스크롤 막기
		$('.overlay_delivery').on('scroll touchmove mousewheel',
			function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 무료배송 나가기 -----------------------------------------------------------------------------------
	$(".exit-button").on("click", function(event) {
		event.preventDefault();
		$(".overlay_delivery").removeClass("visible");
	});

	// 햄버거 버튼 -----------------------------------------------------------------------------------
	$(".hamburger-button").on("click", function(event) {
		event.preventDefault();
		$(this).addClass("active");
		$(".overlay").toggleClass("visible");
		$("#header").toggleClass("top_height");

		// 1,2단 메뉴 스크롤 막기
		$('.overlay').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});
	
	// 검색 햄버거 버튼 나가기 -----------------------------------------------------------------------------------
	$(".overlay_prod_search .hamburger-button-exit").on("click", function(event) {
		event.preventDefault();
		$(".overlay").removeClass("visible");
		$(".overlay1").removeClass("visible1");
		$(".overlay2").removeClass("visible2");
		$(".overlay3").removeClass("visible3");
		$(".overlay5").removeClass("visible5");
		$(".overlay6").removeClass("visible6");
		$(".overlay7").removeClass("visible7");
		$(".overlay_prod_search").removeClass("visible_prod_search");
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');
	});
	
	// 햄버거 버튼 나가기 -----------------------------------------------------------------------------------
	$(".hamburger-button-exit").on("click", function(event) {
		event.preventDefault();
		$(".overlay").removeClass("visible");
		$(".overlay1").removeClass("visible1");
		$(".overlay2").removeClass("visible2");
		$(".overlay3").removeClass("visible3");
		$(".overlay5").removeClass("visible5");
		$(".overlay6").removeClass("visible6");
		$(".overlay7").removeClass("visible7");
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');
	});
	
	// 로그인 나가기 -----------------------------------------------------------------------------------
	$(".login").on("click", function(event) {
		event.preventDefault();
		$(".overlay").removeClass("visible");
	});

	// 2단메뉴 (1) -----------------------------------------------------------------------------------
	$(".menu ul li:nth-child(1)").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay1").toggleClass("visible1");

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay1").removeClass("visible1");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');

		});

		// 1,2단 메뉴 스크롤 막기
		$('.overlay1').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 2단메뉴 (2) -----------------------------------------------------------------------------------
	$(".menu ul li:nth-child(2)").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay2").toggleClass("visible2");

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay2").removeClass("visible2");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');

		});

		// 1,2단 메뉴 스크롤 막기
		$('.overlay2').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 2단메뉴 (3) -----------------------------------------------------------------------------------
	$(".menu ul li:nth-child(3)").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay3").toggleClass("visible3");

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay3").removeClass("visible3");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');

		});

		// 1,2단 메뉴 스크롤 막기
		$('.overlay3').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 2단메뉴 (5) -----------------------------------------------------------------------------------
	$(".menu ul li:nth-child(5)").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay5").toggleClass("visible5");

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay5").removeClass("visible5");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');

		});

		// 1,2단 메뉴 스크롤 막기
		$('.overlay5').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 2단메뉴 (6) -----------------------------------------------------------------------------------
	$(".menu ul li:nth-child(6)").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay6").toggleClass("visible6");

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay6").removeClass("visible6");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');

		});

		// 1,2단 메뉴 스크롤 막기
		$('.overlay6').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});
	
	// 검색 -----------------------------------------------------------------------------------
	$(".search").on("click", function(event) {
		event.preventDefault();
		$(".hamburger-button").addClass("active");
		$(".overlay_prod_search").toggleClass("visible_prod_search");
		

		// 뒤로가기 버튼
		$(".menu_logo_img2").attr('src', '/aesoop/assets/img/back.png');
		
		$("#prod_search").focus();

		$(".menu_logo_img2").on("click", function(event) {
			event.preventDefault();
			$(".overlay").addClass("visible");
			$(".overlay_prod_search").removeClass("visible_prod_search");
			$(".menu_logo_img2").attr('src', '/aesoop/assets/img/logo.png');
			
		});
		
		// 1,2단 메뉴 스크롤 막기
		$('.overlay_prod_search').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
	});

	// 스크롤 감지 메뉴 노출/비노출 -----------------------------------------------------------------------------------

	var lastScrollTop = 0;
	var delta = 5;
	var fixBox = document.querySelector('#header');
	var fixBox2 = document.querySelector('.hamburger_logo');
	var fixBoxHeight = fixBox.offsetHeight;
	var didScroll;

	// 스크롤 이벤트

	window.onscroll = function(e) {
		didScroll = true;
	};

	// 0.25초마다 스크롤 여부 체크하여 스크롤 중이면 hasScrolled() 호출

	setInterval(function() {
		if (didScroll) {
			hasScrolled();
			didScroll = false;
		}
	}, 250);

	function hasScrolled() {
		var nowScrollTop = window.scrollY;
		if (Math.abs(lastScrollTop - nowScrollTop) <= delta) {
			return;
		}
		if (nowScrollTop > lastScrollTop && nowScrollTop > fixBoxHeight) {
			// Scroll down
			fixBox.classList.remove('show');
			fixBox2.classList.remove('show');
		} else {
			if (nowScrollTop + window.innerHeight < document.body.offsetHeight) {
				// Scroll up
				fixBox.classList.add('show');
				fixBox2.classList.add('show');
			}
		}
		lastScrollTop = nowScrollTop;
	}
});