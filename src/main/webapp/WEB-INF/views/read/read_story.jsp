<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>4조 이숲</title>
	<!-- 모바일 웹 페이지 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

	<!-- 공통 style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

	<!-- style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/read_story.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/FlexSlider/flexslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/ImageSlider/slider2.css" />


	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

	<!-- 웹 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	
	<style type="text/css">
		.carousel-inner > .carousel-item > img {
		width: 100%;
		} 
	</style>
</head>
<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>
	
	<div id="p-container">
		<div class="title-wrapper">
			<h1 class="title">브랜드 스토리</h1>
		</div>
		
		<div class="image-story"><img src="${pageContext.request.contextPath}/assets/img/story_1.jpg"></div>
		
		<h2 class="leftcopy-title pd_title">이숲은 세심하게 고안된 효과적이면서도, 감각적인 즐거움을 선사하는 스킨, 헤어, 바디 케어 제품을 제공합니다.</h2>		
		
		<!-- 이미지2, 내용 -->
		<div class="bodycopy-wrapper-2">		
			<div class="bodycopy-2">
				<div class="leftcopy-wrapper">
					<h2 class="leftcopy-title">이숲은 2020년에 설립되었고 신논현에 본사를 두고 있으며<br class="mobile_none">
					세계 다수 지역에 사무실과 스토어를 보유하고 있습니다.</h2>
				</div>
				<p class="bodycopy-copy">
					최고 품질의 스켄, 헤어 그리고 바디케어 제훔을 만들어 내는 것이 변함없는 이숲의 목표입니다. 우리는 식물성 재료와 
					연구실에서 제조된 성분들을 공급하기 위해 폭넓은 조사를 하며, 반드시 효능과 안정성이 입증된 성분만을 사용합니다. 
					전문적인 지식을 가진 컨설턴트들은 하나하나 개성적인 이숲 매장에서 제품라인을 소개하고, 고객이 적합한 제품을 고를 수 
					있도록 안내해 드릴 수 있어 매우 기쁩니다.
				<br/>
				<br/>					
				<a href="${pageContext.request.contextPath}/read/prod" class="link-text">이숲의 제품 철학</a>
				</p>
				
			</div>			
		</div>
		
		<div class="image-wrapper-2">
			<div class="image-story-2"></div>
		</div>
		
		<div class="clearfix"></div>

		<div class="bodycopy-wrapper-3">		
			<div class="bodycopy-3">
				<div class="leftcopy-wrapper-2">
					<h2 class="leftcopy-title-2 text-center">이숲은 지적이고 지속가능한 디자인에 대하여<br class="mobile_none"> 진정성 있는 관심을 가지고 있으며 이는 이숲의 모든 분야로 이어집니다.</h2>
				</div>
				<div class="text-center">
				<a href="${pageContext.request.contextPath}/read/design" class="link-text">이숲의 디자인 철학</a>
				</div>
			</div>			
		</div>
		
		<!-- 이미지3, 내용 -->
		<div class="image-wrapper-3">
			<div class="image-story-3"></div>
		</div>
		
		<div class="bodycopy-wrapper-2">		
			<div class="bodycopy-3">
				<div class="leftcopy-wrapper">
					<h2 class="leftcopy-title">새로운 지역을 고려할 때 이 지역과 어울리지 않는 공간이 되기보다는 그 지역의<br class="mobile_none"> 
					거리에 어울리는 한 구성원으로 조화롭게 가치를 더하는 것이 우리의 진정한 의의입니다.</h2>
				</div>
				<p class="bodycopy-copy">
					이숲은 2020년 신논현 이젠 아카데미 3층에서 최초의 고객을 맞이했습니다. 이곳은 학원 강의실 내에 위치한 
					작은 스토어였지만, 현재는 이숲 건축과 디자인의 기준점이 되었습니다. 이숲은 새로운 매장 오픈을 준비할 
					때 이미 그 장소에 있는 것을 어떻게 활용하고 협력할지를 가장 먼저 염두에 둡니다. 또한 과거, 현재, 
					미래에 대한 고민을 함께 하며 조심스럽게 스토어 오픈을 계획합니다.
				</p>
				
			</div>			
		</div>
		
		
		<div class="clearfix"></div>


		<div class="quote-wrapper">
			<div class="quote-paragraph">
				<p class="eng_text">'Do not wish to be anything but what you are, and try to be that perfectly'</p>
			</div>
			<div class="quote-author">
				Saint Francis de Sales
			</div>
		</div>
	</div>
	



	<footer>
		<%@ include file="../index_footer.jsp" %>
	</footer>
	



	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

</body>
</html>