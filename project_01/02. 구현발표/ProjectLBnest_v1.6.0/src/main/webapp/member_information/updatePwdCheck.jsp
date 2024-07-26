<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<meta charset="UTF-8">
<title>LBnest 회원정보</title>
<script type="text/javascript">
let confirm = 0; // 비밀번호 확인 여부 //나중에 바깥으로 빼서 완성시키기

function pwdCheck() {
	var pwd = document.getElementById("m_pwd").value; // 입력된 ID 가져오기
		
        $.ajax({
            type: 'POST',
            url: '/loan/member/pwdCheck.do',
            data: { m_pwd: pwd },
            success: function(response) {
	            var json = JSON.parse(response); // JSON 문자열을 객체로 변환
	            var flag = 0; //비밀번호 확인 누르고 확인되면 confirm = 1
	            var messageElement = document.getElementById("checkPwdMessage");

	            flag = json.pwd_check; //id 존재하면 1 아니면 0
	            
	            if (flag === 0) {
	                //alert("이미 사용 중인 ID입니다.");
	    			messageElement.textContent = "비밀번호가 틀렸습니다.";
	    		    messageElement.style.color = "red"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    //submitButton.disabled = true;
	    		    confirm = 0;
	            } else if (flag > 0) {
	                //alert("사용 가능한 ID입니다.");
	    			messageElement.textContent = "비밀번호 확인이 완료되었습니다.";
	    		    messageElement.style.color = "blue"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    //submitButton.disabled = false;
	    		    confirm = 1;
	            } else {
	                alert("서버에서 오류가 발생했습니다.");
	                alert(flag);
	            }
            },
            error: function(xhr, status, error) {
                console.error('요청 실패: ', error);
            }
        });
    }
function submitUpdate(memberId,memberGrade){
	var messageElement = document.getElementById("checkPwdMessage");

    if (confirm === 0) {
		messageElement.textContent = "비밀번호를 확인해주세요.";
	    messageElement.style.color = "red";
	    messageElement.style.fontWeight = "bold";
	    messageElement.style.fontSize = "16px";
	    confirm = 0;
	   
	    
    } else if (confirm > 0) {
        //alert("사용 가능한 ID입니다.");
		messageElement.textContent = "비밀번호 확인이 완료되었습니다.";
	    messageElement.style.color = "blue"; 
	    messageElement.style.fontWeight = "bold";
	    messageElement.style.fontSize = "16px";
	    confirm = 1;
	    //document.getElementById('pwdCheckForm').submit();
	    var encodedMemberId = encodeURIComponent(memberId);
	    var encodedMemberGrade = encodeURIComponent(memberGrade);
	    var url = '/loan/member/updateMember.do?m_id=' + encodedMemberId + '&m_grade=' + encodedMemberGrade;
	    console.log("Redirecting to URL: " + url);
	    window.location.href = url;
	    
    } 
}


    // 비밀번호 확인 페이지로 이동
    //window.location.href = '/loan/member/updatePwdCheck.do?m_id=' + memberId + "&m_name=" + memberName;
	//window.location.href = '/loan/member/updatePwdCheck.do?m_id=' + encodeURIComponent(memberId) + "&m_name=" + encodeURIComponent(memberName);


//onclick="submitUpdate('${memberVO.m_id}', '${memberVO.m_name}')"
</script>
</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1> 마이페이지 </h1>
</div>
<div class="container">
	<div class="content">
	<div class="member-complete-box">
		<img style="width:200px;" src="${pageContext.request.contextPath}/resources/member/img/delete-member.png"/>
		<div>${m_name}(${m_id})님, 회원정보 수정 페이지입니다.</div>
		<p>수정 전 비밀번호 확인이 필요합니다. 비밀번호를 입력해주세요.</p>
		<form id="pwdCheckForm" method="get" action="http://localhost:9098/loan/member/updateMember.do">
			<input type="hidden" id="m_id" name="m_id" value="${m_id }">
			<div>비밀번호 입력</div>
			<input type="password" name="m_pwd" id="m_pwd" placeholder="비밀번호를 입력하시오."><br>
			<span id="checkPwdMessage"></span>	
			<div style="margin-top: 20px;">  
				<button type="button" class="btn04" onclick="pwdCheck()">비밀번호 확인</button>	
		    </div>
		
			<div>  
				<button type="button" class="btn03" onclick="submitUpdate('${m_id}', '${m_grade}')">회원정보 수정하기</button>
		    </div>
		</form>
     </div>  
     </div>
 </div>    

</body>
 <c:import url="../LB_NEST_UNDER.jsp"></c:import> 
</html>