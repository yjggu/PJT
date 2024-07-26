<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<meta charset="UTF-8">
<title>LBnest 아이디/비밀번호 찾기</title>

</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1> ID/PWD 찾기 </h1>
</div>
<div class="container">
	<div class="content">
		<h1>아이디 찾기</h1>

		<!-- 회원가입 완료 박스 -->
		<div class="member-complete-box">
			
			<div>${m_name }님의 아이디는 ${m_id } 입니다.</div>
			
		  
	
			<div class="btn-container">  
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/login/loginFind.jsp'">아이디/비밀번호 찾기</button>
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/login.do'">로그인</button>
			    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/home.jsp'">메인화면</button>
		  </div>

	</div>
</div>
</div>

</body>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>   
</html>