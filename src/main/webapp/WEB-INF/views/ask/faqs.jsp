<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<title>4조 이숲</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 공통 style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header_ask.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

<!-- style -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ask.css" />

<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>





</head>




<body>



	<!-- 헤더 영역 시작 -->
	<header>
		<%@ include file= "../index_header.jsp" %>
	</header>
	<!-- 헤더 영역 끝 -->







	<!------------------------ 이숲에게 묻는다 시작 -------------------------------->

	<div class="ask_box">
		<div class="ask_box_pd">
			<h1>이숲에게 묻는다</h1>
		</div>
	</div>

	<!------------------------ 이숲에게 묻는다 끝 -------------------------------->









	<!------------------------ 자주 묻는 질문 시작 -------------------------------->

	<div class="content">

		<div class="main_box clearfix">
			<h1>자주 묻는 질문</h1>


			<!-- 아코디언 영역(자주 묻는 질문 내용) 시작 -->

			<!-- [공통] 아코디언 영역 - 메뉴 (admin_common.css) -->
			<div class="panel-group" id="accordion">
				<!-- 선물 포장, 샘플, 주문 및 배송에 관련된 정보 찾기 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading acc-active">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSend"> 선물 포장, 샘플, 주문,
								및 배송에 관련된 정보 찾기 </a>
						</h4>
					</div>
					<div id="collapseSend"
						class="panel-collapse collapse in acc-active-panel">
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>배송사</th>
										<th>배송일</th>
										<th>배송비</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>우체국 택배</td>
										<td>1~3영업일 소요</td>
										<td>무료 배송</td>
									</tr>
								</tbody>
							</table>

							<i>전 제품 서울에서 배송</i>

							<div class="question">
								<b>물품 추적</b>
							</div>
							<div class="answer">주문하신 제품이 출고되면 고객님께 배송 송장 번호를 이메일로 보내
								드립니다.</div>

							<div class="question">
								<b>국제 배송 서비스를 제공합니까?</b>
							</div>
							<div class="answer">이숲 코리아 웹사이트를 통해 주문하신 제품은 한국 내에서만 배송됩니다.
								주문하신 제품을 다른 국가로 배송하고자 하신다면 웹사이트 하단의 푸터 섹션에서 목적지 메뉴를 열고 배송하고자 하는
								국가를 선택해 주세요.</div>
							
							<div class="question">
								<b>운송 중 제품이 손상된 경우 어떻게 해야 합니까?</b>
							</div>
							<div class="answer">운송 중 제품이 손상된 경우, 이솝에서 교환이나 전액 환불해 드립니다. 주문 정보와 손상된 제품의
							사진을 함께 이숲 고객센터로 연락해 주시기 바랍니다.</div>
							
							<div class="question">
								<b>위험물</b>
							</div>
							<div class="answer">당사의 일부 제품은 운송을 위한 경우는 제3급 인화성 액체류로 분류됩니다. 이러한 제품을 포함해 배송되는 모든 물품은
							위험물 안전 규정에 따라 적합하게 포장하고 라벨을 부착합니다.</div>
							
							<div class="question">
								<b>선물 포장 및 개인 메시지</b>
							</div>
							<div class="answer"> 선물 포장 및 개인 메시지 모든 온라인
							주문에 대해 무료 선물 포장 서비스와 선물 메시지 옵션을 제공하고 있습니다. 선물 포장을 원하시면
							주문 시 배송 옵션을 선택한 다음 “선물할 제품입니다” 항목을 선택해 주세요. 여기에서 개인 선물 메시지를 추가할 수
							있습니다. 선물 주문의 경우 결제 정보가 기재되지 않는 선물 영수증이 포함됩니다. 개별 제품을 선물 포장하시려면, 개별 주문을 부탁드립니다.</div>
							
							<div class="question">
								<b>주문한 제품을 매장에서 수령할 수 있습니까?</b>
							</div>
							<div class="answer">현재 온라인으로 주문하신 제품은 매장에서
							수령하실 수 없습니다.</div>
						</div>
					</div>
				</div>
				<!-- 선물 포장, 샘플, 주문 및 배송에 관련된 정보 찾기 끝 -->
				
				
				<!-- 반품 및 환불 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseRefund"> 반품 및 환불 </a>
						</h4>
					</div>
					<div id="collapseRefund" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="question">
								<b>반품 및 환불</b>
							</div>
							<div class="answer">이숲 시그니처 스토어와 백화점에서 제품을 구매 후
								30일 이내에 개봉하지 않고 원상태 그대로 반품하실 경우, 환불해드립니다. 온라인으로 구매하신 제품을 반품하고자 할
								경우에는 이숲 고객센터로 연락 부탁드립니다. 이숲 시그니처 스토어, 백화점 매장 등에서 구매하신
								제품은 온라인으로 반품하실 수 없습니다. 모든 환불은 원래 사용하신 결제 방식으로 처리됩니다.
							</div>
							
							<div class="question">
								<b>주문을 취소하거나 수정할 수 있습니까?</b>
							</div>
							<div class="answer">주문을 취소하거나 수정하고 싶으시면 이숲 고객센터로 문의 바랍니다. 문의 시점 상품이 배송 처리 전의 경우, 바로
								취소가 할 수 있으며, 이미 배송된 제품에 한해서는 반품 처리를 도와드릴 수 있습니다.
							</div>
						</div>
					</div>
				</div>
				<!-- 반품 및 환불 끝 -->
				
				
				
				
				<!-- 제품 샘플 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSample"> 제품 샘플 </a>
						</h4>
					</div>
					<div id="collapseSample" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="question">
								<b>제품 샘플</b>
							</div>
							<div class="answer">
							모든 온라인 주문 시 무료 샘플을 함께 보내드립니다.
							</div>
						</div>
					</div>
				</div>
				<!-- 제품 샘플 끝 -->
				
				
				
				
				
				
				<!-- 이숲 홉페이지, 스토키스트, 미디어, 채용과 관련된 질문 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseHomepage"> 이숲 홉페이지,
									스토키스트, 미디어, 채용과 관련된 질문 </a>
						</h4>
					</div>
					<div id="collapseHomepage" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="question">
								<b>온라인 쇼핑시 보안을 강화하는 방법은 무엇이 있나요?</b>
							</div>
							<div class="answer">
								이숲은 온라인쇼핑 고객님의 개인 정보 보호를 위해 많은 노력을 기울이고 있습니다. 하지만 추가적으로 보안강화를 원하시는
								고객님께서는 다음과 같은 조치를 취하실 수 있습니다. 인터넷 브라우저 최신 버전으로 업데이트
								하기. 도용 가능성이 적은 고유한 비밀번호를 설정하고, 이를 공유하지 말고, 주기적으로 비밀번호를 변경하기.
								신뢰가능한 안티바이러스 소프트웨어 프로그램을 다운받고 모든 업데이트 설치하기. 온라인상 사기
								행위에 피해를 보셨다고 판단되신 경우 은행에 연락을 취하여 모든 신용카드를 정지시키시기 바랍니다.
							</div>
							<div class="question">
								<b>비밀번호 재설정은 어떻게 하나요?</b>
							</div>
							<div class="answer">
								로그인 화면에서 “비밀번호를 잊으셨나요?”를 클릭하시면 비밀번호 재설정이 가능합니다
							</div>
							<div class="question">
								<b>이숲 뉴스레터를 구독하면 무엇을 받아볼 수 있나요??</b>
							</div>
							<div class="answer">
								이숲의 월간 뉴스레터에는 우리에게 영감을 주는 장소, 인물, 음식, 글, 디자인 등 다양한 주제에 대한 정보가 실려
								있습니다. 뉴스테러 정기구독을 신청하시면서 기입하신 고객님의 개인정보는 이숲 차원에서 고객님과 연락을 취하는
								용도로만 사용되며 절대 제 3자에게 제공하지 않습니다. 하지만 가입과 함께 고객님의 정보가 고객
								데이터베이스에 추가가 되시기 때문에 이벤트 초대나 이숲이 함께하는 새로운 계획에 관한 정보 또한 수신하실 수 있다는
								것을 알리는 바입니다. 신청을 원하시면 이숲 웹사이트의 하단에 뉴스레터 신청을 클릭하시면 됩니다.
							</div>
							<div class="question">
								<b>제품 주문을 위해서 이숲 계정이 필요한가요?</b>
							</div>
							<div class="answer">
								온라인 주문을 위해서 꼭 계정이 필요하지 않으며, 비회원(guest)으로 주문이 가능합니다. 하지만 계정을 만드시면
								더 빠르게 구매절차를 진행하실 수 있습니다. 개인정보, 배송지 주소, 주문내역 등을 손쉽게 저장하실 수 있고,
								정기구독 관련 사항도 업데이트 가능하며, 이숲의 특별 고객 이벤트 초대나 신상품 정보도 얻으실 수 있습니다. 
								계정 만들기는 몇 분이면 완료됩니다. 페이지 상단에 로그인을 클릭하여 이숲 계정을 만들어주세요. *
							</div>
						</div>
					</div>
				</div>
				<!-- 이숲 홉페이지, 스토키스트, 미디어, 채용과 관련된 질문 끝 -->
				
				
				
				
				<!-- 제품 패키지, 애니멀 테스팅, 그리고 환경에 관한 이숲의 접근 방식 알아보기 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseProdpackage"> 제품 패키지, 애니멀
									테스팅, 그리고 환경에 관한 이숲의 접근 방식 알아보기 </a>
						</h4>
					</div>
					<div id="collapseProdpackage" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="question">
								<b>이숲은 어떻게 포장용기의 지속가능성을 개선하고 있습니까?</b>
							</div>
							<div class="answer">
								이숲의 포장용기가 여전히 환경에 영향을 미치고 있다는 점을 인지하며, 포장용기의 지속가능성을 향상하기 위해 다음과 같은
								주요 이니셔티브를 시행했습니다.
							</div>
							<div class="question">
								<b>이숲은 어떻게 포장용기의 지속가능성을 개선하고 있습니까?</b>
							</div>
							<div class="answer">
								이숲의 포장용기가 여전히 환경에 영향을 미치고 있다는 점을 인지하며, 포장용기의 지속가능성을 향상하기 위해 다음과 같은
								주요 이니셔티브를 시행했습니다.
								
									<li>플라스틱을 10~40% 적게 사용할 수 있도록 PET 용기의 중량을 줄입니다.</li>
									<li>2017년 온라인 배송 상자와 기프트 박스를 재디자인해서 사용후 100% 재활용이 가능하게 합니다.</li>
									<li>2019년 내 이숲이 생산한 80%의 PET 용기를 99.7%의 사용후 재활용
									폴리에틸렌테레프탈레이트(rPET)로 전환합니다.</li>
									<li>2018년 말 홍콩에서 시작된 포장용기 회수 정책과 같이 환경에 긍정적인 이익을 창출할 수 있는
									유사한 제도를 다른 시장에도 도입하는 것을 고려할 예정입니다.</li>
								
								이숲은 지속가능한 패키징을 추구하는 호주 포장규약(Australian Packaging Covenant)에 가입했습니다.
							</div>
							<div class="question">
								<b>이숲은 포장용기로 어떤 재료를 사용합니까?</b>
							</div>
							<div class="answer">
								용기는 기능적이고미니멀하고 단정해야 한다는 것이 포장에 대한 우리 접근 방식입니다. 가능하면 외부 카턴 상자를 사용하지 않고,
								재활용이 가능한 유리, 알루미늄, 폴리에틸렌테레프탈레이트(PET)를 사용합니다.
							</div>
							<div class="question">
								<b>이숲은 재활용 플라스틱 포장용기를 사용합니까?</b>
							</div>
							<div class="answer">
								이숲은 플라스틱 포장용기로 폴리에틸렌테레프탈레이트(PET)를 사용합니다. 향후 2019년 내로
								이숲이 생산한 80%의 PET 용기를 99.7%의 사용후 재활용 폴리에틸렌테레프탈레이트(rPET)로 전환할
								예정입니다. 해당 rPET는 호주 현지에서 조달합니다. 모든 PET 용기를 rPET로 전환하는 것을 목표로 하고
								있습니다. <br> 2019년 초에 rPET에 담긴 이숲 제품이 공급망에 유입될 예정이며, 세계적으로 전면
								시행되기까지는 시간이 걸릴 것입니다.
							</div>
							<div class="question">
								<b>이숲 용기를 다른 용도로 사용할 수 있습니까?</b>
							</div>
							<div class="answer">
								이숲의 단지 용기는 종이 클립, 스테이플러 심, 헤어핀 등 다양한 소품을 보관하는 용기로 사용하기 적합합니다. 이숲 마우스워시 용기는 실용적이고 매력적이며, 오일을 담아
								주방 찬장에 놓아도 좋습니다.
							</div>
							<div class="question">
								<b>이숲은 포장용기 회수 제도를 실시하고 있습니까?</b>
							</div>
							<div class="answer">
								2018년 10월 홍콩에서 처음으로 포장용기 회수 정책을 시행했습니다. 시범 사업은 홍콩에서 시작되었고, 환경에 긍정적인 이익을 창출할 수 있는 다른 시장에서도
								유사한 제도의 도입을 고려할 예정입니다.
							</div>
							<div class="question">
								<b>온라인 패키징</b>
							</div>
							<div class="answer">
								주문하신 제품은 재활용 골판지 상자에 포장되며, 브랜드 표시가 없는 평범한 택배 봉투에 담겨 배송됩니다. 이는 습기나 기타 표면 손상으로부터 물품을 보호하기 위해서입니다. 내부에는
								운송 중 발생할 수 있는 손상으로부터 제품을 보호할 수 있도록 재활용이 가능한 재료를 선택해 사용합니다.
							</div>
							<div class="question">
								<b>이숲 제품은 동물실험을 합니까?</b>
							</div>
							<div class="answer">
								이숲 제품이나 성분에 대해 동물실험을 하지 않습니다. 새로운 성분은 모두 사용하기 전에 연구개발팀(Research and
								Development Team)에서 검토합니다. 세계 시장에 이들 성분의 등록 여부를 조사하고 이전 실험 결과에
								주의합니다. EU는 2009년 3월 11일부터 화장품 제조에 사용되는 성분에 대한 동물실험을 금지했으며 이숲의
								공급업체는 이미 오래 전부터 동물실험을 중단했습니다. 새로운 시장으로의 진출을 고려하기 전에 규제 요건에 대한 광범위한 검토를 실시해서, 이숲 제품에 대한 의무적인 동물실험이 필요하지 않도록 합니다.
							</div>
							<div class="question">
								<b>이숲은 팜유를 사용합니까?</b>
							</div>
							<div class="answer">
								바디클렌징 슬랩에는 지속가능성 (물질수지) 인증을 받은 소듐팜커넬레이트(Sodium Palm Kernelate)와
								소듐팔메이트(Sodium Palmate)를, 세이지 앤 징크 페이셜 하이드레이팅 크림에는
								하이드로제네이티드팜글리세라이즈(Hydrogenated Palm Glycerides)를 사용합니다. 
								이숲 연구개발팀(Research and Development Team)은 팜유에서 유래한 성분을
								사용해야 할 경우, 지속가능팜유인증(CSPO)을 받은 성분만을 사용하기 위해 적극 노력하고 있습니다. 
								이숲은 팜유 유래 성분 사용의 100%를 지속가능한 팜유 라운드테이블(RSPO)이 시행하는
								팜트레스(PalmTrace)의 예약청구(Book and Claim)방식으로 전환했습니다. 이러한 인증제도는
								지속가능한 팜유 생산자에게 지불함으로써 그들의 노력을 보상하고 장려하는 제도입니다. 이솝도 지속가능 인증 팜유의
								생산을 지원하기 위한 임시 조치로 분리된 공급망을 통해 조달한 인증받은 지속가능한 재료만을 사용하기 위해
								노력합니다.
							</div>
							<div class="answer">
							자주 묻는 질문(FAQs)에서 다루지 않는 다른 문의 사항이 있으시면, 주저하지 마시고 Aesoop4@gmail.com으로 연락해 주시기 바랍니다.
							</div>
							<div class="image">
								<img src="${pageContext.request.contextPath}/assets/img/Aesoop_Sustainability_Page_Icon_Cruelty_Free_International.png" />
							</div>
						</div>
					</div>
				</div>
				<!-- 제품 패키지, 애니멀 테스팅, 그리고 환경에 관한 이숲의 접근 방식 알아보기 끝 -->
				
				
				
				
				
				
				<!-- 제품 시작 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseProdsample"> 제품 샘플 </a>
						</h4>
					</div>
					<div id="collapseProdsample" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="question">
								<b>제품에 대한 맞춤형 조언을 받으려면 어떻게 해야 합니까?</b>
							</div>
							<div class="answer">
								제품 상담을 원하시면 이숲 시그니처 스토어나 카운터, 스타키스트 등을 직접 방문해 주시기 바랍니다. 
								스토어로 전화 주시면 전화 상담을 받으실 수 있으며, 상담을 통해 자신의 피부에 적합한 제품을 선택할 수 있습니다.
								또한 웹사이트를 통해 각 제품에 대한 풍부한 정보를 제공하기 위해 노력하고 있습니다. 웹사이트에서 피부 타입별 추천
								제품, 사용법, 함께 사용하면 좋은 추천 제품 리스트 등 구체적인 정보를 안내받으실 수 있습니다.
							</div>
							<div class="question">
								<b>이숲 제품은 어떻게 보관해야 합니까?</b>
							</div>
							<div class="answer">
								제품은 직사광선이 피해 서늘한 곳에 보관하시는 것이 좋으며, 더 좋은 방법은 냉장 보관하는 것입니다. 이 보관법은
								제품이 유리나 플라스틱, 알루미늄 등 어떤 용기에 담겨있는지 상관없이 모든 이숲 제품에 해당됩니다. 이숲 제품 라벨의 배치번호 옆에 위치한 아이콘은 제품의 품질유지기한을 개월 수로 나타냅니다.
								단지형 제품을 손가락으로 떠서 사용하실 때에는 손을 깨끗이 해야 합니다. 아니면 티스푼이나 작은 스패츌러를 사용하는
								것이 바람직합니다.
							</div>
							<div class="question">
								<b>이숲 제품에 대한 부작용이 나타나면 어떻게 해야 합니까?</b>
							</div>
							<div class="answer">
								모든 화장품 성분은 함량 또는 사용 방법에
								상관없이 민감한 피부를 자극할 수 있습니다. 심지어 제품을 수년 동안 문제없이 잘 사용해온 경우라도 일상적인
								사용에서 때때로 자극을 느낄 수 있습니다. 규칙적인 일상 생활 중에 자극을 일으킬 만한 변화가 있었는지 살펴볼 것을
								권합니다 (식생활이나 가정용 세제 등 알레르기 유발 물질과의 접촉 등). 화장품에 대한 부작용을 경험했다면, 사용을 중단하는 것이 최선의 조치입니다. 필요한 경우는 의사와의 상담을
								권합니다. 반응이 있었던 제품은 구매하신 매장을 방문하여 반품을 요청하고 피부 상태에 대해 자세하게 알려주시기
								바랍니다.
							</div>
							<div class="question">
								<b>이숲 제품에는 유통기한이 있습니까?</b>
							</div>
							<div class="answer">
								이숲 제품의 ‘품질유지기한’은 제품의 개봉 시점에 따라 결정됩니다. 라벨에 표시된 용기 아이콘은
								제품을 개봉한 후 품질이 유지되는 개월 수를 나타냅니다. 가령, 12M은 개봉일로부터 1년을, 9M은 개봉일로부터
								9개월을 의미합니다.
							</div>
						</div>
					</div>
				</div>
				<!-- 제품 끝 -->
				
				
			</div>
			<!--// 아코디언 영역 -->


		</div>
		<br> <br>


	</div>
	<!------------------------ 자주 묻는 질문 끝 -------------------------------->





	<!-- 풋터 영역 시작 -->
	<footer>
	<%@ include file= "../index_footer.jsp" %>
	</footer>
	<!-- 풋터 영역 끝 -->





	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


</body>
</html>