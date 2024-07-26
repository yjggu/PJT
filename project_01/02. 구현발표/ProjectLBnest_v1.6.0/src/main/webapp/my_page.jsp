<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join_input_sytle.css">

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<meta charset="UTF-8">
<title>메인페이지</title>

<script>

</script>
</head>
<body>
    <div class="container">
        <h1>임시 메인페이지</h1>
        <c:choose>
	        <c:when test="${sessionScope.m_id != null}">
				<p>${sessionScope.m_name }(${sessionScope.m_id })님 로그인 중입니다.</p>
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }'">${sessionScope.m_id }님 회원정보 조회</button>
			</c:when>
			<c:otherwise>
				<p>로그인이 필요합니다.</p>
			</c:otherwise>
		</c:choose>
		<div class="btn-container">  
			<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/login.do'">로그인</button>
			<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/logout.do'">로그아웃</button>
		    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/main_page.jsp'">메인화면</button>
	  </div>

</div>
</body>
</html>