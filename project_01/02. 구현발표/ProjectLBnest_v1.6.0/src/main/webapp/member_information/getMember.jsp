<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/join_input.js"></script>


<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join_input_sytle.css"> --%>
<meta charset="UTF-8">
<title>LBnest 회원정보</title>

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
    // 이메일 입력 관련 요소
    const emailInput = document.getElementById('emailInput');
    const domainInput = document.getElementById('domainInput');
    const emailAddrSelect = document.getElementById('emailAddrSelect');
    const fullEmail = document.getElementById('fullEmail');
    
    // 전화번호 입력 관련 요소
    const phoneFirstPart = document.getElementById('phoneFirstPart');
    const phoneSecondPart = document.getElementById('phoneSecondPart');
    const phoneThirdPart = document.getElementById('phoneThirdPart');
    const fullPhoneNumber = document.getElementById('fullPhoneNumber');
    
    // 초기 이메일 설정
    const existingEmail = "${memberVO.m_email}";
    const emailParts = existingEmail.split('@');
    
    if (emailParts.length === 2) {
        emailInput.value = emailParts[0];
        domainInput.value = emailParts[1];
    }
    
    // 전화번호 초기 설정
    const existingPhone = "${memberVO.m_phone}";
    const phoneParts = existingPhone.match(/(\d{3})(\d{4})(\d{4})/);
    
    if (phoneParts && phoneParts.length === 4) {
        phoneFirstPart.value = phoneParts[1];
        phoneSecondPart.value = phoneParts[2];
        phoneThirdPart.value = phoneParts[3];
    }
    updateFullPhone();
    
    // 이메일 및 전화번호 업데이트 함수
    function updateFullEmail() {
        fullEmail.value = emailInput.value + '@' + domainInput.value;
    }
    
    function updateFullPhone() {
        fullPhoneNumber.value = phoneFirstPart.value + phoneSecondPart.value + phoneThirdPart.value;
    }
    
    // 이메일 입력 이벤트 리스너 등록
    emailInput.addEventListener('input', updateFullEmail);
    emailAddrSelect.addEventListener('change', updateFullEmail);
});
// 전화번호, 이메일 값 전달 함수
function submitForm() {

    updateFullEmail();
    updateFullPhone();

    return true;
}
function updateFileName(inputId) {
    var input = document.getElementById(inputId);
    var fileName = input.files[0].name;
    var label = input.nextElementSibling;
    label.innerText = fileName;
}	

function editAttachment() {
    // 링크 부분 숨기기
    document.getElementById("linkSection").style.display = "none";
    // 파일 업로드 부분 보이기
    document.getElementById("uploadSection").style.display = "block";
}
function openPdf(fileName) {
    // pdfView.do 경로에 fileName을 파라미터로 전달하여 새 창에서 열기
    var url = 'pdfView.do?fileName=' + encodeURIComponent(fileName);
    window.open(url, '_blank');
}
//수정하기 버튼 눌렀을떄
function redirectToPwdCheck(memberId,memberName) {
    // 비밀번호 확인 페이지로 이동
    //window.location.href = '/loan/member/updatePwdCheck.do?m_id=' + memberId + "&m_name=" + memberName;
	//window.location.href = '/loan/member/updatePwdCheck.do?m_id=' + encodeURIComponent(memberId) + "&m_name=" + encodeURIComponent(memberName);
    var encodedMemberId = encodeURIComponent(memberId);
    var encodedMemberName = encodeURIComponent(memberName);
    var url = '/loan/member/updatePwdCheck.do?m_id=' + encodedMemberId + '&m_name=' + encodedMemberName;
    console.log("Redirecting to URL: " + url);
    window.location.href = url;
}
//회원탈퇴
function deleteMember(){
    var url = "${pageContext.request.contextPath}/member_join/deleteMember.jsp"; 
    window.location.href = url; 
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
	<h1> 마이페이지 </h1>
</div>	 
<div class="container">

	<c:if test="${memberVO.m_grade eq 2}"><h2 class="container-sub-title">대출 상담사 회원</h2></c:if>
	<c:if test="${memberVO.m_grade eq 3}"><h2 class="container-sub-title">부동산 중개 사무소 회원</h2></c:if>
	<c:if test="${memberVO.m_grade eq 4}"><h2 class="container-sub-title">일반회원</h2></c:if>	
	<h4>${memberVO.m_id}님 회원정보 조회</h4>	
	           
	<div class="container-form">
		<form><!--  //method="post" action="updateMember.do" target="_self" onsubmit="submitForm()" -->
		<input name="m_grade" type="hidden" value="${memberVO.m_grade}" />
		<input name="m_id" type="hidden" value="${memberVO.m_id}" />
		<table  border="1">
		 <tr>
			<td>ID</td>
			<td>${memberVO.m_id }</td>
		 </tr>
		  <tr>
			<td>이름</td>
			<td><input type="text" name="m_name" id="m_name" placeholder="이름을 입력하시오." value="${memberVO.m_name }" disabled></td>
		 </tr>
		<c:if test="${memberVO.m_grade eq 2}">
		 <tr>
			<td>상담사 코드</td>
			<td>${memberVO.m_counselor_code }</td>
		 </tr>
		</c:if>
		 <tr>
			<td>비밀번호</td>
			<td><input type="password" name="m_pwd" id="m_pwd" placeholder="회원정보 수정에서 비밀번호를 변경하시기 바랍니다." disabled style="width: 400px"></td>
		 </tr>
		
		 <tr>
			<td>이메일</td>
			<td>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="이메일을 입력하시오." aria-describedby="basic-addon2" id="emailInput" value="${memberVO.m_email }" disabled>
					  <label class="input-group-text" for="emailInput">@</label>
					  <input type="text" class="form-control" aria-describedby="basic-addon2" id="domainInput" value="${memberVO.m_email }" disabled>
		<!-- 			  <select class="form-select" name="emailAddrSelect" id="emailAddrSelect">
						<option value="domain_input" >직접입력</option>
						<option value="naver.com" selected>naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="kakao.com">kakao.com</option>
						<option value="daum.net">daum.net</option>
					  </select> -->
				</div>
				<input type="hidden" id="fullEmail" name="m_email" value="${memberVO.m_email }">
			</td>
		 </tr>
		 
		 <tr>
			<td>전화번호</td>
			<td>
				<div class="input-group mb-3" >
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneFirstPart" disabled>
				  <span class="input-group-text">-</span>
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneSecondPart" disabled>
				  <span class="input-group-text">-</span>
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneThirdPart" disabled>
				</div>
				<input type="hidden" id="fullPhoneNumber" name="m_phone" value="${memberVO.m_phone }">
			</td>
		 </tr>
		<c:if test="${memberVO.m_grade eq 3}">
		  <tr>
			 <td width="200">우편번호</td>
			 <td><input type="text" name="m_zip_code" id="m_zip_code" size="7" readonly value="${memberVO.m_zip_code }" disabled>
			   <button type="button" class="btn01" onclick="kakaopost()">우편번호 찾기</button>
			 </td>
		</tr>
		
		<tr>
			 <td>주소</td>
			 <td><input type="text" name="m_addr1" id="m_addr1" readonly value="${memberVO.m_addr1 }" disabled></td>
		</tr>
		<tr>
		 	 <td>상세주소</td>
			 <td><input type="text" name="m_addr2" id="m_addr2" value="${memberVO.m_addr2 }" disabled></td>
		</tr>
		 
		<tr>
			<td>사업자 등록증</td>
			<td>
			<a href="#" onclick="openPdf('${memberVO.m_file1}')">${memberVO.m_file1}</a>
			</td>
		</tr>
		<tr>
		    <td>중개 등록증</td>
		    <td id="fileSection">
		      <a href="#" onclick="openPdf('${memberVO.m_file2}')">${memberVO.m_file2}</a>
		      <%-- <A href="download.do?fileName=${memberVO.m_file2}">${memberVO.m_file2}</A> --%>
		    </td>
		</tr>
		</c:if>
		<tr style="border: none; ">
			<td>가입일</td>
			<td>${memberVO.m_regdate }</td>
		</tr>
		 </table>
		<button type="button" class="btn03" style="" onclick="location.href='${pageContext.request.contextPath}/member/updatePwdCheck.do'">회원정보 수정</button>
		<button type="button" class="btn04" style="" onclick="location.href='${pageContext.request.contextPath}/member/logout.do'">로그아웃</button>
	 	</form>
 	</div>
	
 </div>

</body>
 <c:import url="../LB_NEST_UNDER.jsp"></c:import>
</html><!-- C:/1kosmosc/sts/work-space/Test_LBnest03/src/main/webapp/resources/pdf/ -->