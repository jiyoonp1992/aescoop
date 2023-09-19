<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>4조 이숲</title>
	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
	
	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	<!-- style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<!-- 제품 슬라이드 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/FlexSlider/flexslider.css" />
	<!-- 하단 스토어 슬라이드 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ImageSlider/slider2.css" />

	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	
	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	
</head>

<body>
	<header>
	<%@ include file="index_header.jsp" %>
	</header>
    
    
    <!-- 메인이미지, 문구 -->
    <div class="m_img_box clearfix">
    	<div class="m_img"></div>
    	<div class="txt_box m_box clearfix">
    		<h1>나를 위한 선물</h1>
			가장 중요한 자신과의 관계를 위한 특별한 선물. 제약을 두지 않고 선물하세요.  
			<a href="${pageContext.request.contextPath}/product?cateno=4&subcateno=41" class="link_button">향수 보기<span class="pointer pull-right">→</span></a>
    	</div>
	</div>
	
	<!-- 배너01 (1) -->
	<div class="bn_img_01 bn_bg_01_01 mg_top_85"></div>
	<div class="txt_box clearfix">
		<h2>감각의 연대기</h2>
		사랑 받는 제품과 함께 마음과 감각의 자양분이 되어주는 소중한 브랜드 이숲
		<a href="${pageContext.request.contextPath}/read/story" class="link_button">브랜드 스토리 보기<span class="pointer pull-right">→</span></a>
	</div>
	
	<!-- 배너01 (2) -->
	<!-- 이미지 우측 정렬 -->
	<div class="clearfix">
		<div class="txt_box mg_top_85 clearfix">
			<h2>바디 앤 핸드 케어</h2>
			전신에 영양을 공급하고 욕실을 자신을 가꾸는 안식처로 탈바꿈시켜주는 제품 
			<a href="${pageContext.request.contextPath}/product?cateno=3" class="link_button">바디 앤 핸드 케어 보기<span class="pointer pull-right">→</span></a>
		</div>
		<div class="bn_img_01 bn_bg_01_02 mg_top_35 pull-right"></div>
	</div>
	
	<!-- 배너01 (3) -->
	<div class="bn_img_01 bn_bg_01_03 mg_top_95"></div>
	<div class="txt_box clearfix">
		<h2>홈 케어</h2>
		평온함이나 즐거움, 호기심을 불러일으켜 거실에서 사무실과 같은 개인 공간을 보다 아름답게 가꿔주는 섬세하게 제작된 아로마
		<a href="${pageContext.request.contextPath}/product?cateno=5" class="link_button">홈 케어 보기<span class="pointer pull-right">→</span></a>
	</div>
	
	<!-- 배너02 - 슬라이드 배너 (1) -->
	<h2 class="bn_slide_title">즐거움을 드리는 제품</h2>
	<div class="slider clearfix">
        <div class="flexslider carousel">
          <ul class="slides">
            <c:forEach var="item" items="${output}" varStatus="status">
					<li>
		            	<a href="${pageContext.request.contextPath}/product_view?prodno=${item.prodno}" class="slide_pd">
		            		<img src="${item.file}" />
		            		<span class="slide_pd_title">${item.pname}</span>
		            		<span class="slide_pd_con">${item.content}</span>
		            	</a>
		            </li>
				</c:forEach>
          </ul>
        </div>
    </div>
    
    <div class="visible-xs h40"><!-- height40 --></div>
	
	<!-- 배너03 (1) -->
	<div class="bn_box_03">
		<div class="bn_box_03_pd">
			<a href="${pageContext.request.contextPath}/product?cateno=1" class="bn_img_03 bn_bg_03_01 mg_top_45 hidden-xs"></a>
			<a href="${pageContext.request.contextPath}/product?cateno=1" class="visible-xs"><img src="assets/img/main/bn03-1.jpg" width="100%"></a>
			<div class="bn_title_button"><a href="${pageContext.request.contextPath}/product?cateno=1">스킨 케어</a></div>
			건성 피부에서 지성 피부까지 다양한 피부 타입과 종합적인 루틴을 지원하는 효능이 우수한 제품을 만나보세요.
		</div>
	</div>
	
	<div class="visible-xs h40"><!-- height40 --></div>
	
	<!-- 배너03 (2) -->
	<div class="bn_box_03">
		<div class="bn_box_03_pd_2">
			<a href="${pageContext.request.contextPath}/product?cateno=3" class="bn_img_03 bn_bg_03_02 mg_top_45 hidden-xs"></a>
			<a href="${pageContext.request.contextPath}/product?cateno=3" class="visible-xs"><img src="assets/img/main/bn03-2.jpg" width="100%"></a>
			<div class="bn_title_button"><a href="${pageContext.request.contextPath}/product?cateno=3">핸드 앤 바디 케어</a></div>
			전신에 영양을 공급하는 바디 제품으로 사랑하는 사람의 욕실을 자신을 가꾸는 안식처로 탈바꿈시켜주세요.
		</div>
	</div>
	
	<!-- 배너03 (2) -->
	<div class="clearfix"><!-- clearfix --></div>
	
	<!-- 배너04 - 슬라이드 배너 (2) -->
	<h2 class="bn_slide_title">감각에 놀라움을 선사하세요</h2>
	<div class="slider clearfix">
        <div class="flexslider carousel">
          <ul class="slides">
				<c:forEach var="item2" items="${output2}" varStatus="status">
					<li>
		            	<a href="${pageContext.request.contextPath}/product_view?prodno=${item2.prodno}" class="slide_pd">
		            		<img src="${item2.file}" />
		            		<span class="slide_pd_title">${item2.pname}</span>
		            		<span class="slide_pd_con">${item2.content}</span>
		            	</a>
		            </li>
				</c:forEach>
          </ul>
        </div>
    </div>

	<!-- 배너05 - + 슬라이드 배너 (3) -->
	<div class="clearfix">
		<div class="txt_box mg_top_85 clearfix">
			<h2>스토어 로케이터</h2>
			매장에서는 이솝 컨설턴트가 고객 여러분을 따뜻하게 맞이하고 기프트 구매를 위한 맞춤형 컨설팅을 제공해드립니다.  
			<a href="${pageContext.request.contextPath}/search/store_search" class="link_button">가까운 스토어 찾기<span class="pointer pull-right">→</span></a>
		</div>
		<div class="mg_top_45 box_pd">
			<div class="slider2 fullscreen" data-toggle="slider2">
				<div class="slider2-content">
					<div class="bn_bg_05_01"></div>
					<div class="bn_bg_05_02"></div>
					<div class="bn_bg_05_03"></div>
				</div>
				<div class="slider2-prev slider2-disabled">&lsaquo;</div>
				<div class="slider2-next">&rsaquo;</div>
				<div class="slider2-nav">
					 <div class="slider2-active"></div>
					 <div></div>
					 <div></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 배너04 -->
	<div class="bn_box_04">
		<div>‘Whenever you are sincerely pleased you are nourished.’</div>
		Ralph Waldo Emerson
	</div>
	
	
	<footer>
	<%@ include file="index_footer.jsp" %>
	</footer>
	
	
    
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    
    <!-- 하단 스토어 슬라이드 -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ImageSlider/slider2.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/plugins/FlexSlider/jquery.flexslider.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/plugins/FlexSlider/slide.js"></script>
</body>

</html>