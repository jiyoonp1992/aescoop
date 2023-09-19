<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/my_address_withdrawal.css" />
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</head>

<body>
	<header>
	<%@ include file="../index_header.jsp" %>
	</header>
	
    <form id="out-form" method="post" action="${pageContext.request.contextPath}/out_ok">
    	<!-- 탈퇴 메인 -->
    <div id="withdrawal">
        <div id="withdrawal_hd" class="clearfix">
            <h1>회원탈퇴</h1>
        </div>
    </div>
    <div id="withdrawal_body" class="clearfix">
        <div id="delete">
            <div class="delete_hd">
                회원 정보 및 구매 내역 삭제
            </div>
            <div class="delete_body">
                회원 탈퇴 즉시, 회원 정보는 모두 삭제되고 재가입시에도 복원되지 않으며, 이숲에서 모든 회원 정보가 삭제 됩니다. 이점 꼭 양지해 주시기 바랍니다.
                <!-- 동의 체크 -->
                <div class="checkbox">
                   <label><input type="checkbox" name="checkbox1" id="checkbox1" >동의 합니다.</label>
                </div>
                <!-- 동의 체크 끝 -->
            </div>
        </div>
        <hr />
        <div id="info_guid">
            <div class="info_guid_hd">
                탈퇴 후 정보보관에 대한 안내
            </div>
            <div class="info_guid_body">
                전자상거래 등에서의 소비자보호에 관한 법률 제6조에 의거 성명, 주소, 주민등록번호 등 거래의 주체를 식별할 수 있는 정보에 한하여 서비스 이용에 관한 동의를 철회한 경우에도 이를 보전할 수 있으며, 동법 시행령 제6조에 의거 다음과 같이 거래기록을 보관합니다.
            </div>
            <div class="info_guid_date">
                <ul>
                    <li>광고에 대한 기록 : 6개월</li>
                    <li>계약 또는 청약철회 등 관한 기록 : 1년</li>
                    <li>소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
                </ul>
                <!-- 동의 체크 -->
                <div class="checkbox">
                    <label><input type="checkbox" name="checkbox2" id="checkbox2" >동의 합니다.</label>
                </div>
                <!-- 동의 체크 끝 -->
            </div>
        </div>
        <hr />
        <!-- 동의 라디오 -->
        <div id="withdrawal_radio">
            <div class="form-group">
                <div class="radio_hd">
                    <label for="optionsRadios1" class="control-label">탈퇴 사유를 정해주세요. 더 좋은 서비스를 제공하기 위해 노력하겠습니다.</label>
                </div>
                <div class="radio_body">
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios1" value="사이트 사용 빈도 낮음">
                            사이트 사용 빈도 낮음
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios2" value="원하는 상품 부족">
                            원하는 상품 부족
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios3" value="사이트 오류로 인한 불만족">
                            사이트 오류로 인한 불만족
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios4" value="개인정보 유출 우려">
                            개인정보 유출 우려
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios5" value="asd">
                            상품에 대한 가격 부담
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios6" value="고객센터 불만족">
                            고객센터 불만족
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="reason" id="reasonRadios7">
                            기타
                            <input type="text" name="reason2" id="input" disabled>
                        </label>
                    </div>
                    
                
                </div>
                
            </div>
            <button type="submit" class="btn btn-success pull-right">제출하기</button>
        </div>
        <!-- 동의 라디오 끝 -->
    </div>
    </form>
        
    <footer>
	<%@ include file="../index_footer.jsp" %>
	</footer>
	
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#reasonRadios7").change(function() {
    			var now = $("#input").prop("disabled");
    			$("#input").prop('disabled', !now);
    			if ($("#input").prop('disabled') == false) {
    				$("#input").focus();	
    			}
    		})
    	})
    </script>
</body>

</html>