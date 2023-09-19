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
	$("#prod_add_form").validate({
		/** 입력검사 규칙 */
		rules : {
			// [상품분류] 필수
			child : {
				required : true
			},
			// [상품명] 필수
			prod_name : {
				required : true
			},
			
			// [판매가] 필수
			prod_price : {
				required : true,
				number : true
			},
			
			// [용량] 필수
			prod_ml : {
				required : true,
				number : true
			},
						
			// [노출여부] 필수 체크
			prod_view : "required",
			
			// 허용할 확장자 명시
			list_img: { 
				required : true,
				extension: "jpg|gif|png"
			}

		},
		/** 규칙이 맞지 않을 경우의 메시지 */
		messages : {
			child : {
				required : "상품분류를 선택해 주세요.",
			},
			prod_name : {
				required : "상품명을 입력하세요.",
				kor : "이름은 한글만 입력 가능합니다."
			},
			prod_price : {
				required : "판매가를 입력하세요.",
				number : "판매가는 숫자만 입력 가능합니다."
			},
			prod_ml : {
				required : "용량을 입력하세요.",
				number : "용량은 숫자만 입력 가능합니다."
			},
			prod_view : "노출여부를 선택해 주세요.",
			list_img : {
				required : "목록이미지를 첨부해주세요.",
				extension: "목록이미지는 jpg,png,gif 형식만 가능합니다."
			}			
		}
	}); // end validate()

});