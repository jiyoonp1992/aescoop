$(function() {
    /* 플러그인의 기본 설정 옵션 추가 */
    jQuery.validator.setDefaults({
        onkeyup: false,
        onclick: false,
        onfocusout: false,
        showErrors: function(errorMap, errorList) {
            if (this.numberOfInvalids()) {
                //0번째 에러 메시지에 대한 javascript 기본 alert함수 사용
                alert(errorList[0].message);
                //0번째 에러 발생 항목에 포커스 지정
                $(errorList[0].element).focus();
            }
        }
    });

    

    /* form 태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */

    $("#join_form").validate({
        /* 입력검사 규칙 */
        rules: {
            //[아이디] 필수 + 알파벳, 숫자 조합만 허용
            user_id: { required: true, alphanumeric: true },
            //[비밀번호] 필수 + 글자수 길이 제한
            user_pw: { required: true, minlength: 4, maxlength: 20 },
            //[비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
            user_pw_re: { required: true, equalTo: "#user_pw" },
            //[이름] 필수
            user_name: { required: true, kor: true },
            //[이메일] 필수 + 이메일 형식 일치 필요
            email: { required: true, email: true },
            //[연락처] 필수
            tel: { required: true, phone: true },
            //[생년월일] 필수 + 날짜 형식 일치 필요
            birthdate: { required: true, date: true }

        },
        /*규칙이 맞지 않을 경우의 메시지 */
        messages: {
            user_id: {
                required: "아이디를 입력하세요.",
                alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
            },
            user_pw: {
                required: "비밀번호를 입력하세요.",
                minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
                maxlength: "비밀번호는 최대 20자까지 가능합니다."
            },
            user_pw_re: {
                required: "비밀번호 확인값을 입력하세요.",
                equalTo: "비밀번호 확인이 잘못되었습니다."
            },
            user_name: {
                required: "이름을 입력하세요.",
                kor: "이름은 한글만 입력 가능합니다."
            },
            email: {
                required: "이메일을 입력하세요.",
                email: "이메일 형식이 잘못되었습니다."
            },
            tel: {
                required: "연락처를 입력하세요.",
                phone: "연락처 형식이 잘못되었습니다."

            },
            birthdate: {
                required: "생년월일을 입력하세요.",
                date: "생년월일의 형식이 잘못되었습니다."

            },
            gender: "성별을 선택해 주세요.",
            subject: {
                required: "수강과목을 선택하세요.",
                minlength: "수상과목은 최소 2개 이상 선택하셔야 합니다.",
                maxlength: "수강과목은 최대 4개 까지 선택 가능합니다."

            }
        }

    }); //end validate()
});