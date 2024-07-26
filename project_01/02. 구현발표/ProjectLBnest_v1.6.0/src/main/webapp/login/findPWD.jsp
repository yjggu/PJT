<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<meta charset="EUC-KR">
<title>LBnest 아이디/비밀번호 찾기</title>

</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>


<div class="titleBackground">
	<h1> ID/PWD 찾기 </h1>
</div>
    <div class="container">
    <div class="content">
        <h1>LBnest 아이디/비밀번호 찾기</h1>
	<!-- 회원가입 완료 박스 -->
	<div class="member-complete-box">
		<img style="width:200px;" src="${pageContext.request.contextPath}/resources/member/img/member_complete.png"/>
		<div>${m_email}으로 임시 비밀번호를 전송하였습니다. <br>로그인 후 회원정보에서 비밀번호를 변경해주세요.</div>

		<div class="btn-container">  
			<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/login.do'">로그인</button>
		    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/home.jsp'">메인화면</button>
	  </div>
	</div>
	</div>
</div>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>    
</body>
</html>