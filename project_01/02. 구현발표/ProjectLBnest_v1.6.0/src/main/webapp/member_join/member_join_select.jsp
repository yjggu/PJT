<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
    	<h2 class="container-sub-title" style="text-align: left;">회원가입 유형 선택</h2>
        <div class="step-indicator">
            <img src="${pageContext.request.contextPath}/resources/member/img/memberjoin01.png" alt="회원가입 단계">
        </div>
        
            <div class="user-type-selection">
                <button class="user-type" onclick="location.href='${pageContext.request.contextPath}/member_join/member_join_agree.jsp?m_grade=4'">
                    <img src="${pageContext.request.contextPath}/resources/member/img/noun-member.png" alt="일반회원">
                    <p class="user-type-name">일반회원</p>
                </button>
                <button class="user-type" onclick="location.href='${pageContext.request.contextPath}/member_join/member_join_agree.jsp?m_grade=2'"> 
                    <img src="${pageContext.request.contextPath}/resources/member/img/noun-consultant.png" alt="대출 상담사">
                    <p class="user-type-name">대출 상담사</p>
                </button>
                <button class="user-type" onclick="location.href='${pageContext.request.contextPath}/member_join/member_join_agree.jsp?m_grade=3'"> 
                    <img src="${pageContext.request.contextPath}/resources/member/img/noun-company.png" alt="부동산 중개 사무소">
                    <p class="user-type-name">부동산 중개 사무소</p>
                </button>
            </div>
   		</div>
    </div>

    
</body>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>
</html>