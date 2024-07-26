var pwd_check_flag = 0; //비밀번호 확인을 눌렀으면 1 안눌렀으면 0

 function checkPassword() {
	 const m_pwd = document.getElementById("m_pwd").value;
	 const m_pwdck = document.getElementById("m_pwdck").value;
	 const messageElement = document.getElementById("password-confirm-message");
	 const submitButton = document.querySelector(".submit-join-button");
	 
	 
	 	  if(m_pwd === null || m_pwd === "" || m_pwdck === null || m_pwdck === ""){
	 		messageElement.textContent = "비밀번호를 입력하세요.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; // Set font size
		    submitButton.disabled = true;
	 	  } else if (m_pwd != m_pwdck) {
			//alert("비밀번호가 일치하지 않습니다.");
			messageElement.textContent = "비밀번호가 일치하지 않습니다.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; 
		    submitButton.disabled = true;
		  } else {
			messageElement.textContent = "비밀번호가 일치합니다.";
		    messageElement.style.color = "blue";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px";
		    submitButton.disabled = false;
		    pwd_check_flag = 1;
		  }
		}

//비밀번호 자릿수, 입력문자 제한 함수
 function validatePhoneNumber(event) {
	
	 const phoneFirstPart = document.getElementById("phoneFirstPart");
	 const phoneSecondPart = document.getElementById("phoneSecondPart");
	 const phoneThirdPart = document.getElementById("phoneThirdPart");
	  // 입력된 문자 추출
	  const char = event.key; //event.key는 키보드 이벤트가 발생했을 때 사용자가 누른 키를 문자열로 반환

	  // 숫자 및 백스페이스/삭제만 허용
	  if (!/^\d$|Backspace|Delete/.test(char)) { //test 메서드는 정규 표현식과 일치하는지 확인하고, 일치하면 true, 일치하지 않으면 false를 반환
	    event.preventDefault(); // 유효하지 않은 문자 입력 방지
	  }

	  // 각 필드의 최대 길이 제한
	  if (phoneFirstPart.value.length === 3 && event.target === phoneFirstPart) {
	    event.preventDefault(); // 첫 번째 필드에서 3자 이상 입력 방지
	  } else if (phoneSecondPart.value.length === 4 && event.target === phoneSecondPart) {
	    event.preventDefault(); // 두 번째 필드에서 4자 이상 입력 방지
	  } else if (phoneThirdPart.value.length === 4 && event.target === phoneThirdPart) {
	    event.preventDefault(); // 세 번째 필드에서 4자 이상 입력 방지
	  }
	  

	}
	 phoneFirstPart.addEventListener("keypress", validatePhoneNumber);
	 phoneSecondPart.addEventListener("keypress", validatePhoneNumber);
	 phoneThirdPart.addEventListener("keypress", validatePhoneNumber);

// 이메일 함수 (이메일 직접입력) //수정하기

function submitForm() {
	
    var phoneFirstPart = document.getElementById('phoneFirstPart').value;
    var phoneSecondPart = document.getElementById('phoneSecondPart').value;
    var phoneThirdPart = document.getElementById('phoneThirdPart').value;

    var fullPhoneNumber = phoneFirstPart + phoneSecondPart + phoneThirdPart;
    
    var emailInput = document.getElementById('emailInput').value;
    var emailAddrSelect = document.getElementById('emailAddrSelect').value;
    
    var fullEmail = emailInput + "@" + emailAddrSelect;

    document.getElementById('fullPhoneNumber').value = fullPhoneNumber;
    document.getElementById('fullEmail').value = fullEmail;

    console.log('Full Phone Number: ' + fullPhoneNumber);
    console.log('Full Email: ' + fullEmail);
    
    // 비밀번호 확인 필드 값 확인
    var m_pwd = document.getElementById("m_pwd").value;
    var m_pwdck = document.getElementById("m_pwdck").value;
    
    if (pwd_check_flag === 0){
        alert("비밀번호 확인 버튼을 통해 비밀번호를 확인하세요.");
        return false;
    }

    return true;
}

//부동산 중개 사무소 주소찾기
function kakaopost() {
	  new daum.Postcode({
	    oncomplete: function (data) {
	      document.querySelector("#m_zip_code").value = data.zonecode;
	      document.querySelector("#m_addr1").value = data.address
	    }
	  }).open();
	}
