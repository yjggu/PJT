<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> ajax지원 안함-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<meta charset="UTF-8">
<title>LBnest 아이디/비밀번호 찾기</title>
<script>


document.addEventListener('DOMContentLoaded', function() {
    const emailInput = document.getElementById('emailInput');
    const domainInput = document.getElementById('domainInput');
    const emailAddrSelect = document.getElementById('emailAddrSelect');
    const fullEmail = document.getElementById('fullEmail');

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

    const emailInput2 = document.getElementById('emailInput2');
    const domainInput2 = document.getElementById('domainInput2');
    const emailAddrSelect2 = document.getElementById('emailAddrSelect2');
    const fullEmail2 = document.getElementById('fullEmail2');

    emailAddrSelect2.addEventListener('change', function() {
        const domainSelect2 = emailAddrSelect2.value;
        if (domainSelect2 === 'domain_input') {
            domainInput2.value = '';
            domainInput2.removeAttribute('readonly');
            domainInput2.focus();
        } else {
            domainInput2.value = domainSelect2;
            domainInput2.setAttribute('readonly', 'readonly');
        }
    });
});
function submitForm() {
    // 이메일 입력 관련 요소
    const emailInput = document.getElementById('emailInput').value;
    const domainInput = document.getElementById('domainInput').value;
    const emailAddrSelect = document.getElementById('emailAddrSelect').value;
    const fullEmail = emailInput+"@"+domainInput; 
    
    document.getElementById('fullEmail').value = fullEmail;
    return true;
}
function submitForm2() {
    // 이메일 입력 관련 요소
    const emailInput2 = document.getElementById('emailInput2').value;
    const domainInput2 = document.getElementById('domainInput2').value;
    const emailAddrSelect2 = document.getElementById('emailAddrSelect2').value;
    const fullEmail2 = emailInput2+"@"+domainInput2;
    
    document.getElementById('fullEmail2').value = fullEmail2;
    return true;
}
</script>
<style>
    table {
        width: 1284px;
        border-collapse: separate; /* 기본값은 separate */
        border-spacing: 10px; /* 셀 간의 간격 조정 */
    }

    td {
        padding: 10px; /* 셀 내부의 여백 조정 */
        
    }
</style>		
		
</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1> ID/PWD 찾기 </h1>
</div>
<div class="container">
	<div class="content">
		<h1>ID</h1>
		<hr>
		<form action="${pageContext.request.contextPath}/member/findID.do" method="post" onsubmit="submitForm()">
		<table>
		 <tr>
			<td>이름</td>
			<td><input type="text" name="m_name" id="m_name" required="required" max="20" placeholder="이름을 입력하시오." >
			<span id="checkIdMessage"></span>
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
		 	<td colspan="2">
	 			<c:if test="${param.code == 'nonFind_fail_findID' }">
					<div>일치하는 정보가 없습니다.</div>
				</c:if>
				<div class="btn-container">  
					<button type="submit" class="btn05">아이디 찾기</button>
			  	</div>	
		 	</td>
		 </tr>
		</table>

	
		</form>
		
		<h1>PASSWORD</h1>
		<hr>
		<form action="${pageContext.request.contextPath}/member/findPWD.do" method="post" onsubmit="submitForm2()">
		<table>
		 <tr>
			<td>아이디</td>
			<td><input type="text" name="m_id" id="m_id" required="required" max="20" placeholder="아이디를 입력하시오.">
			<span id="checkIdMessage"></span>
			</td>
		 </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이메일을 입력하시오." aria-describedby="basic-addon2" id="emailInput2">
                        <label class="input-group-text" for="emailInput2">@</label>
                        <input type="text" class="form-control" aria-describedby="basic-addon2" id="domainInput2">
                        <select class="form-select" name="emailAddrSelect" id="emailAddrSelect2" style="width:150px; text-align:center;">
                            <option value="domain_input">직접입력</option>
                            <option value="naver.com" selected>naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="kakao.com">kakao.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </div>
                    <input type="hidden" id="fullEmail2" name="m_email">
                </td>
            </tr>
            <tr>
            	<td colspan="2">
					<c:if test="${param.code == 'nonFind_fail_findPWD' }">
						<div>일치하는 정보가 없습니다.</div>
					</c:if>
					<div class="btn-container">  
						<button type="submit" class="btn05">비밀번호 찾기</button>
				  	</div>
            	</td>
            </tr>
		</table>

		</form>
		</div>
	</div>

</body>
<c:import url="../LB_NEST_UNDER.jsp"></c:import> 
</html>