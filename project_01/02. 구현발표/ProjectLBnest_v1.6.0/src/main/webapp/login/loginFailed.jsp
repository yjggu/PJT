<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

<meta charset="EUC-KR">
<title>LBnest 로그인</title>
</head> 
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1> 로그인 </h1>
</div>
<div class="container">
	<div class="content">
		<h1>로그인 실패</h1>
		<p>관리자 승인 후 로그인이 가능합니다.
		승인 후 이메일이 발송됩니다. </p>
		
			<div class="btn-container">  
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/login/login.jsp'">로그인</button>
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/login/login.jsp'">로그아웃</button>
			    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/home.jsp'">메인화면</button>
			 </div>
 </div>
</div>

</body>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>
</html>