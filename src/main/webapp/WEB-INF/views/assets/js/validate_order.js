$(function() {

	/** 플러그인의 기본 설정 옵션 추가 */
	jQuery.validator.setDefaults({
		onkeyup : false, // 키보드입력시 검사 안함
		onclick : false, // <input>태그 클릭시 검사 안함
		onfocusout : false, // 포커스가 빠져나올 때 검사 안함
		showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
			// 에러가 있을 때만..
			if (this.numberOfInvalids()) {
				// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
				//alert(errorList[0].message);
				// 0번째 에러 발생 항목에 포커스 지정
				//$(errorList[0].element).focus();

				swal({
					title : "에러",
					text : errorList[0].message,
					type : "error"
				}).then(function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					setTimeout(function() {
						$(errorList[0].element).val('');
						$(errorList[0].element).focus();
					}, 100);
				});
			}		
		}
	});


	/** 유효성 검사 추가 함수 */
	$.validator.addMethod("kor", function(value, element) {
		return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
	});

	$.validator.addMethod("phone", function(value, element) {
		return this.optional(element)
				|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value)
				|| /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
	});

	/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
	$("#order_form").validate({
		/** 입력검사 규칙 */
		rules : {
			// [이름] 필수
			user_name : {
				required : true,
				kor : true
			},
			// [연락처] 필수
			tel : {
				required : true,
				phone : true
			},
			
			// [우편번호] 필수
			sample6_postcode : {
				required : true
			},
			
			// [주소] 필수
			sample6_address : {
				required : true
			},
						
			// [동의] 필수 체크
			order_check : "required"

		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages : {
			user_name : {
				required : "이름을 입력하세요.",
				kor : "이름은 한글만 입력 가능합니다."
			},
			tel : {
				required : "연락처를 입력하세요.",
				phone : "연락처 형식이 잘못되었습니다."
			},
			sample6_postcode : {
				required : "우편번호를 입력하세요.",
				digits : "우편번호는 숫자만 입력 가능합니다."
			},
			sample6_address : {
				required : "주소를 입력하세요.",
			},
			order_check : "동의를 체크하세요."
		}
	}); // end validate()

});