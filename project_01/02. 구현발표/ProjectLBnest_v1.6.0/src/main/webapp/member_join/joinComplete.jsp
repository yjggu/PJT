<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
    String m_grade = request.getParameter("m_grade");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<meta charset="UTF-8">
<title>LBnest 회원가입</title>

</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1>LBnest 회원가입</h1>
</div>
<div class="container">
	<div class="content">
		<h2  class="container-sub-title">회원가입 완료</h2>
        <div class="step-indicator">
            <img src="${pageContext.request.contextPath}/resources/member/img/memberjoin03.png" alt="회원가입 단계">
        </div>
		<!-- 회원가입 완료 박스 -->
		<div class="member-complete-box">
			<img style="width:200px; margin-bottom: 40px;" src="${pageContext.request.contextPath}/resources/member/img/member_complete.png"/>
			<div>${m_name }(${m_id })님 회원가입이 완료되었습니다.</div>
			<div>로그인 후 이용이 가능합니다.</div>
			<%if ("2".equals(m_grade)) { %>
			<div>관리자 승인 후 이용이 가능합니다.</div> <!-- 대출상담사일 경우에만 grade==2 -->
			
		
				
		  <div class="btn-container">  
			    <button type="submit" class="btn03" onclick="">메인화면</button>
		  </div>
		  <%} else { %>
			<div class="btn-container">  
				<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/login.do'">로그인</button>
			    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/main_page.jsp'">메인화면</button>
		  </div>
		  <%} %>
		</div>
	</div>	
</div>

</body>
 <c:import url="../LB_NEST_UNDER.jsp"></c:import>   
</html>