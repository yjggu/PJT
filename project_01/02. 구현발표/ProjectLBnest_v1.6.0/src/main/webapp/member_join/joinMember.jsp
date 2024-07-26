<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%
    String m_grade = request.getParameter("m_grade");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" type="text/css" />
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/joinMember.js"></script> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="EUC-KR">
<title>LBnest 회원가입</title>

<script>

let m_grade = "<%= m_grade %>"; 
let idConfirm = 0;
let codeConfirm = 0; 
let pwdConfirm = 0; //비밀번호 확인을 눌렀으면 1 안눌렀으면 

document.addEventListener('DOMContentLoaded', function() {
	// 전화번호 입력 관련 요소
    const phoneFirstPart = document.getElementById('phoneFirstPart');
    const phoneSecondPart = document.getElementById('phoneSecondPart');
    const phoneThirdPart = document.getElementById('phoneThirdPart');
    // 이메일 입력 관련 요소
    const emailInput = document.getElementById('emailInput');
    const domainInput = document.getElementById('domainInput');
    const emailAddrSelect = document.getElementById('emailAddrSelect');
    const fullEmail = document.getElementById('fullEmail');

    // 이메일 도메인 선택 변경 시 처리
    emailAddrSelect.addEventListener('change', function() {
        const domainSelect = emailAddrSelect.value;
        if (domainSelect === 'domain_input') {
            domainInput.value = '';
            domainInput.removeAttribute('readonly');
            domainInput.focus();
        } else {
            domainInput.value = domainSelect;
            domainInput.setAttribute('readonly', 'readonly');
        }
    });
    //입력 제한 
    phoneFirstPart.addEventListener('input', function(event) {
        validateNumberInput(event, 3);
    });
    phoneSecondPart.addEventListener('input', function(event) {
        validateNumberInput(event, 4);
    });
    phoneThirdPart.addEventListener('input', function(event) {
        validateNumberInput(event, 4);
    });
    
    if(m_grade == 2){
	    const codeInput = document.getElementById('m_counselor_code');
	    codeInput.addEventListener('input', function(event) {
	        validateCodeInput(event, 11);
	    });
    }    

  //============메시지 뜬 후 필드 선택하면 메시지 초기화===================================

 // 함수로 메시지 초기화 및 스타일 초기화
 function resetMessage(messageElement) {
     messageElement.textContent = "";
     messageElement.style.color = "";
     messageElement.style.fontWeight = "";
     messageElement.style.fontSize = "";
 }

 // 각 입력란 포커스 이벤트 리스너 추가
 document.getElementById('m_name').addEventListener('focus', function() {
     resetMessage(nameMessage);
 });
 document.getElementById('emailInput').addEventListener('focus', function() {
     resetMessage(emailMessage);
 });
 document.getElementById('phoneFirstPart').addEventListener('focus', function() {
     resetMessage(phoneMessage);
 });
 
 
});


// 숫자만 입력 제한 함수
function validateNumberInput(event, maxLength) {
    const input = event.target;
    const value = input.value;

    const filteredValue = value.replace(/[^0-9]/g, '');

    if (filteredValue.length > maxLength) {
        input.value = filteredValue.slice(0, maxLength);
    } else {
        input.value = filteredValue;
    }
}
//숫자, - 만 입력가능
function validateCodeInput(event, maxLength) {
    const input = event.target;
    const value = input.value;

    const filteredValue = value.replace(/[^0-9-]/g, '');

    if (filteredValue.length > maxLength) {
        input.value = filteredValue.slice(0, maxLength);
    } else {
        input.value = filteredValue;
    }
}

        


function submitForm() {
	const id = document.getElementById("m_id").value;
	const name = document.getElementById('m_name').value;
    // 이메일 입력 관련 요소
    const emailInput = document.getElementById('emailInput').value;
    const domainInput = document.getElementById('domainInput').value;
    const emailAddrSelect = document.getElementById('emailAddrSelect').value;
    const fullEmail = emailInput+"@"+domainInput;
    
    // 전화번호 입력 관련 요소
    const phoneFirstPart = document.getElementById('phoneFirstPart').value;
    const phoneSecondPart = document.getElementById('phoneSecondPart').value;
    const phoneThirdPart = document.getElementById('phoneThirdPart').value;
	const fullPhone = phoneFirstPart+phoneSecondPart+phoneThirdPart;
	
	// 비밀번호 입력 요소
 	const m_pwd = document.getElementById("m_pwd").value;
 	const m_pwdck = document.getElementById("m_pwdck").value;
 		
	//메시지 띄우기
	const idMessage = document.getElementById("checkIdMessage");
	const codeMessage = document.getElementById("checkCodeMessage");
	const PwdMessage = document.getElementById("password-confirm-message");
	const zipMessage = document.getElementById("zipMessage");
	const file1Message = document.getElementById("file1Message"); 
	const file2Message = document.getElementById("file2Message");
	const addrMessage = document.getElementById("addrMessage");
	const nameMessage = document.getElementById("nameMessage");
	const emailMessage = document.getElementById("emailMessage");
	const phoneMessage = document.getElementById("phoneMessage");
	// 전화번호, 이메일 합쳐서 전송
    document.getElementById('fullPhoneNumber').value = fullPhone;
    document.getElementById('fullEmail').value = fullEmail;

    if (id === "" || !id|| id == null||$.trim(id).length == 0) { // $.trim(id) : 문자열 좌우의 공백 제거, length : 문자열 길이, id를 입력받지 않은 경우
    	idMessage.textContent = "ID를 입력해주세요.";
    	idMessage.style.color = "red";
    	idMessage.style.fontWeight = "bold";
    	idMessage.style.fontSize = "16px";
        return false;  // 회원 가입 진행 중지
      }
    if(idConfirm === 0 ){
    	idMessage.textContent = "아이디 중복 여부를 확인해 주세요.";
    	idMessage.style.color = "red"; // Set red color
    	idMessage.style.fontWeight = "bold"; // Set bold font weight
    	idMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
    if(m_name == null || m_name === ""||!m_name || $.trim(m_name).length == 0){
    	nameMessage.textContent = "이름을 입력해주세요.";
    	nameMessage.style.color = "red"; // Set red color
    	nameMessage.style.fontWeight = "bold"; // Set bold font weight
    	nameMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
    if(fullEmail == null || fullEmail === ""||!fullEmail||$.trim(fullEmail).length == 0 ){
    	emailMessage.textContent = "이메일을 입력해주세요";
    	emailMessage.style.color = "red"; // Set red color
    	emailMessage.style.fontWeight = "bold"; // Set bold font weight
    	emailMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
    if(fullPhone == null || fullPhone === ""){
    	phoneMessage.textContent = "핸드폰 번호를 입력해주세요.";
    	phoneMessage.style.color = "red"; // Set red color
    	phoneMessage.style.fontWeight = "bold"; // Set bold font weight
    	phoneMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
    if(m_grade == 2 && codeConfirm === 0){
    	codeMessage.textContent = "상담사 코드 중복 여부를 확인해 주세요.";
    	codeMessage.style.color = "red"; // Set red color
    	codeMessage.style.fontWeight = "bold"; // Set bold font weight
    	codeMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
    if(pwdConfirm === 0){
    	PwdMessage.textContent = "비밀번호와 비밀번호 확인이 일치하는지 확인해 주세요.";
    	PwdMessage.style.color = "red"; // Set red color
    	PwdMessage.style.fontWeight = "bold"; // Set bold font weight
    	PwdMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
    if(m_grade == 3){
     	//부동산 중개 사무소 필수 입력값 요소 (주소, 첨부파일)
     	const zip = document.getElementById("m_zip_code").value;
     	const m_addr1 = document.getElementById("m_addr1").value;
     	const m_addr2 = document.getElementById("m_addr2").value;
     	const m_uploadFile1 = document.getElementById("m_uploadFile1").value;
     	const m_uploadFile2 = document.getElementById("m_uploadFile2").value;
     
    	if(!zip || zip == null || zip === ""){
    		zipMessage.textContent = "우편번호를 입력해 주세요.";
    		zipMessage.style.color = "red"; // Set red color
    		zipMessage.style.fontWeight = "bold"; // Set bold font weight
    		zipMessage.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_addr2 || m_addr2 == null || m_addr2 === ""){
    		addrMessage.textContent = "상세주소를 입력해 주세요.";
    		addrMessage.style.color = "red"; // Set red color
    		addrMessage.style.fontWeight = "bold"; // Set bold font weight
    		addrMessage.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_uploadFile1 || m_uploadFile1 == null ||$.trim(m_uploadFile1).length == 0){
    		file1Message.textContent = "사업자 등록증을 첨부해 주세요.";
    		file1Message.style.color = "red"; // Set red color
    		file1Message.style.fontWeight = "bold"; // Set bold font weight
    		file1Message.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_uploadFile2 || m_uploadFile2 == null ||$.trim(m_uploadFile2).length == 0){
    		file2Message.textContent = "사업자 등록증을 첨부해 주세요.";
    		file2Message.style.color = "red"; // Set red color
    		file2Message.style.fontWeight = "bold"; // Set bold font weight
    		file2Message.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	
    }
    //return true;
    document.getElementById('join_frm').submit();
}

/* //	var m_grade = sessionStorage.getItem('m_grade');
    function submitGrade(m_grade) {
    	// m_grade 값을 hidden input에 설정
        document.getElementById('m_grade').value = m_grade;
    } */
 //아이디 중복 확인 누르고 중복이 없으면 confirm = 1
function checkId() {
    var id = document.getElementById("m_id").value; // 입력된 ID 가져오기
    var messageElement = document.getElementById("checkIdMessage");

	 //id 입력 안했을 때 제출 방지
      if (id === "" || !id|| id == null||$.trim(id).length == 0) { // $.trim(id) : 문자열 좌우의 공백 제거, length : 문자열 길이, id를 입력받지 않은 경우
 		messageElement.textContent = "ID를 입력해주세요.";
	    messageElement.style.color = "red";
	    messageElement.style.fontWeight = "bold";
	    messageElement.style.fontSize = "16px";
        return false;  // 회원 가입 진행 중지
      }else {
	    // id중복확인 
	    $.ajax({
	        url: "/loan/member/checkId.do",
	        type: "GET",
	        async: true,
	        data: {m_id: id},
	        success: function(response) {
	            var json = JSON.parse(response);// JSON 문자열을 객체로 변환
	            var idFlag = 0;
	           
	            idFlag = json.id_duplication_check; //id 존재하면 1 아니면 0
				
	            console.log('flag : '+idFlag);
				console.log('json : '+json);
	            if (idFlag > 0) {
	                //alert("이미 사용 중인 ID입니다.");
	    			messageElement.textContent = "이미 사용 중인 ID입니다.";
	    		    messageElement.style.color = "red"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    idConfirm =0;
	            } else if (idFlag === 0) {
	                //alert("사용 가능한 ID입니다.");
	    			messageElement.textContent = "사용 가능한 ID입니다.";
	    		    messageElement.style.color = "blue"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    idConfirm = 1;
	            } else {
	                alert("서버에서 오류가 발생했습니다.");
	                console.error(error);
	            }
	        },
	        error: function(xhr, status, error) {
	            alert("서버 요청 중 오류가 발생했습니다.");
	            console.error("Status: " + status);
	            console.error("Error: " + error);
	        }
	    });
	}
}


function checkCode(){
    var counselor_code = document.getElementById("m_counselor_code").value;
    var messageElement = document.getElementById("checkCodeMessage");
    var codeFlag = 0;

    if ($.trim(counselor_code).length == 0) { // $.trim(id) : 문자열 좌우의 공백 제거, length : 문자열 길이, id를 입력받지 않은 경우
	messageElement.textContent = "상담사 코드를 입력해주세요.";
    messageElement.style.color = "red"; // Set red color
    messageElement.style.fontWeight = "bold"; // Set bold font weight
    messageElement.style.fontSize = "16px"; // Set font size
    return false;  // 회원 가입 진행 중지
  }
    
    $.ajax({
        url: "/loan/member/checkCode.do",
        type: "GET",
        data: {m_counselor_code: counselor_code},
        success: function(response) {
            var json = JSON.parse(response); // JSON 문자열을 객체로 변환
            var messageElement = document.getElementById("checkCodeMessage");
            var codeFlag = 0;

            codeFlag = json.code_check; //id 존재하면 1 아니면 0
            //var messageElement = document.getElementById("checkIdMessage");
			console.log('flag : '+codeFlag);
			console.log('json : '+json);
            if (codeFlag === 1) {
                //alert("이미 사용 중인 ID입니다.");
    			messageElement.textContent = "이미 등록된 상담사 코드 입니다.";
    		    messageElement.style.color = "red"; // Set red color
    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
    		    messageElement.style.fontSize = "16px"; // Set font size
    		    //submitButton.disabled = true;
            } else if (codeFlag === 0) {
                //alert("사용 가능한 ID입니다.");
    			messageElement.textContent = "등록 가능한 상담사 코드 입니다.";
    		    messageElement.style.color = "blue"; // Set red color
    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
    		    messageElement.style.fontSize = "16px"; // Set font size
    		    //submitButton.disabled = false;
    		    codeConfirm = 1;
            } else {
                alert("서버에서 오류가 발생했습니다.");
                console.error(error);
            }
        },
        error: function(xhr, status, error) {
            alert("서버 요청 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
	
}	


 function checkPassword() {
	 var m_pwd = document.getElementById("m_pwd").value;
	 var m_pwdck = document.getElementById("m_pwdck").value;
	 var messageElement = document.getElementById("password-confirm-message");
	 var submitButton = document.querySelector(".submit-join-button");
	 
	 let passwordRegex = /^(?=.*?[A-Z].*?[a-z]|.*?[A-Z].*?\d|.*?[A-Z].*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]|.*?[a-z].*?\d|.*?[a-z].*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]|.*?\d.*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]).{10,16}$/;

	 	  if(m_pwd === null || m_pwd === "" || m_pwdck === null || m_pwdck === ""){
	 		messageElement.textContent = "비밀번호를 입력하세요.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; // Set font size
	 	  }else if(!passwordRegex.test(m_pwd)){
	 		messageElement.textContent = "영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자";
	 		messageElement.style.color = "red";
	 		messageElement.style.fontWeight = "bold";
    	  	messageElement.style.fontSize = "16px";
	 	  } 
	 	  else if (m_pwd != m_pwdck) {
			//alert("비밀번호가 일치하지 않습니다.");
			messageElement.textContent = "비밀번호가 일치하지 않습니다.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; 
		  } else {
			messageElement.textContent = "비밀번호가 일치합니다.";
		    messageElement.style.color = "blue";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px";
		    pwdConfirm = 1;
		  }
		}
//업로드 파일 이름 보이기. 없으면 파일 첨부할때 파일명이 안보임.
 function updateFileName(inputId) {
     var input = document.getElementById(inputId);
     var fileName = input.files[0].name;
     var label = input.nextElementSibling;
     label.innerText = fileName;
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
	

</script>
<style>
.container{
    width: 100%; /* 전체 너비로 설정 */
    max-width: none; /* 최대 너비 제한 해제 */

    padding-top: 100px;
    padding-bottom: 100px;
	background: linear-gradient(to bottom, 
                            rgba(255, 255, 255, 0) 0%, 
                            rgba(255, 255, 255, 0.1) 2%, 
                            rgba(255, 255, 255, 0.2) 4%, 
                            rgba(255, 255, 255, 0.4) 8%, 
                            rgba(255, 255, 255, 0.6) 10%, 
                            rgba(255, 255, 255, 0.8) 12%,  
                            rgba(255, 255, 255, 1) 15%);
                                
    background-size: cover; /* 그라데이션 크기 조정 */
    background-repeat: no-repeat; /* 반복 없애기 */
    background-position: top; /* 상단에 그라데이션 위치 설정 */
}
</style>
</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1>LBnest 회원가입</h1>
</div>
<div class="container">      
		<%if ("2".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">대출 상담사 회원</h2>
		<%}else if ("3".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">부동산 중개 사무소 회원</h2>
		<%}else if ("4".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">일반회원</h2>
		<%} %>
		
        <div class="step-indicator">
            <img src="${pageContext.request.contextPath}/resources/member/img/memberjoin02.png" alt="회원가입 단계">
        </div>
    
	<div class="container-form">
	<form method="post" action="../member/joinMember.do" target="_self" id="join_frm" enctype="multipart/form-data">
	<input type="hidden" id="m_grade" name="m_grade" value="<%= m_grade %>">
	<table border="1">	
	 <tr>
		<td>ID</td>
		<td><input type="text" name="m_id" id="m_id" max="20" placeholder="아이디를 입력하시오.">
		<button type="button" class="btn01" onclick="checkId()">중복확인</button>
		<span id="checkIdMessage"></span>
		</td>
	 </tr>
	  <tr>
		<td>이름</td>
		<td><input type="text" name="m_name" id="m_name" placeholder="이름을 입력하시오.">
		<span id="nameMessage"></span></td>
	 </tr>
	  <%if ("2".equals(m_grade)) { %>
	 <tr>
		<td>상담사 코드</td>
		<td><input type="text" name="m_counselor_code" id="m_counselor_code" placeholder="코드를 입력하시오.">
		<button type="button" class="btn01" onclick="checkCode()">중복확인</button>
		<span id="checkCodeMessage"></span>
		</td>
	 </tr>
	 <% } %>
	 <tr>
		<td>비밀번호</td>
		<td><input type="password" name="m_pwd" id="m_pwd" placeholder="비밀번호를 입력하시오."></td>
	 </tr>
	 <tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="m_pwdck" id="m_pwdck" placeholder="비밀번호를 입력하시오."> 
		<button type="button" class="btn01" onclick="checkPassword()">확인</button>
		<span id="password-confirm-message">영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자</span>
		</td>
	 </tr>
	 <tr>
		<td>이메일</td>
		<td>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="이메일을 입력하시오." aria-describedby="basic-addon2" id="emailInput">
				  <label class="input-group-text" for="emailInput">@</label>
				  <input type="text" class="form-control" aria-describedby="basic-addon2" id="domainInput">
				  <select class="form-select" name="emailAddrSelect" id="emailAddrSelect" style="width:150px; text-align:center;">
					<option value="domain_input">직접입력</option>
					<option value="naver.com" selected>naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="daum.net">daum.net</option>
				  </select>
			</div>
			<span id="emailMessage"></span>
			<input type="hidden" id="fullEmail" name="m_email">
		</td>
	 </tr>
	 
	 <tr>
		<td>전화번호</td>
		<td>
			<div class="input-group mb-3" >
			  <input type="text" class="form-control" placeholder="010" aria-label="Server" id="phoneFirstPart">
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" placeholder="1234" aria-label="Server" id="phoneSecondPart">
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" placeholder="1234" aria-label="Server" id="phoneThirdPart">
			</div>
			<input type="hidden" id="fullPhoneNumber" name="m_phone">
			<span id="phoneMessage"></span>
		</td>
	 </tr>
	<%if ("3".equals(m_grade)) { %>
	  <tr>
		 <td width="200">우편번호</td>
		 <td><input type="text" name="m_zip_code" id="m_zip_code" size="7" readonly>
		   <button type="button" class="btn01" onclick="kakaopost()">우편번호 찾기</button>
		   <span id="zipMessage"></span>
		 </td>
	</tr>
	
	<tr>
		 <td>주소</td>
		 <td><input type="text" name="m_addr1" id="m_addr1" value="" placeholder=""></td>
	</tr>
	<tr>
	 	 <td>상세주소</td>
		 <td><input type="text" name="m_addr2" id="m_addr2" value="" placeholder="상세주소를 입력하시오.">
		 <span id="addrMessage"></span>
		 </td>
		 
	</tr>
	 
	<tr>
		<td>사업자 등록증</td>
		<td>
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="m_uploadFile1" name="m_uploadFile1" aria-describedby="inputGroupFileAddon03" onchange="updateFileName('m_uploadFile1')">
		    <label class="custom-file-label" for="m_uploadFile1">파일 선택</label>
		    <span id="file1Message"></span>
		  </div>
		</div>
		</td>
	</tr>
	<tr>
		<td>중개 등록증</td>
		<td>
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="m_uploadFile2" name="m_uploadFile2" aria-describedby="inputGroupFileAddon03" onchange="updateFileName('m_uploadFile2')">
		    <label class="custom-file-label" for="m_uploadFile2">파일 선택</label>
		    <span id="file2Message"></span>
		  </div>
		</div>
		</td>
	</tr>
	<% } %>
	 </table>
	 <div><button type="button" onclick="submitForm()" class="btn02">가입하기</button></div>
	 </form>
	</div>
 </div>

</body>
 <c:import url="../LB_NEST_UNDER.jsp"></c:import>  
</html>