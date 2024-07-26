<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LB Nest</title>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<%-- <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/header_styles.css" /> --%>
<style>
/*폰트 불러오기 */
@font-face {
  font-family: 'KoPubDotumProBold';
  src: url('./font/KoPubDotumProBold.otf') format('opentype');
  font-weight: bold;
  font-style: normal;
}

@font-face {
  font-family: 'KoPubDotumProLight';
  src: url('./font/KoPubDotumProLight.otf') format('opentype');
  font-weight: 300;
  font-style: normal;
}

@font-face {
  font-family: 'KoPubDotumProMedium';
  src: url('./font/KoPubDotumProMedium.otf') format('opentype');
  font-weight: 500;
  font-style: normal;
}

#logo {
    flex: 0 0 auto; /* 로고의 크기를 고정 */
    float: left;
}

#logo img {
    height: 60px; /* 필요에 따라 로고 크기 조정 */
    float: left;
}

.login-btn a{
	text-decoration: none;
	font-family: 'KoPubDotumProMedium';
	font-size: 18px;
	color: #FFF;
	margin-right: 50px;
	
}
.login-btn a:hover{
  text-decoration: none; /* 링크 밑줄 제거 */
  color: #0095DA;
	
}
/* 네비게이션 바(gnb) 스타일 */
.gnb {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 96px;
    margin: 0 auto;
}

.gnb #logo {
    float: left;
}

.gnb ul {
    float: right;
    margin: 57px 0 0;
    padding: 0;
    list-style: none;
    text-decoration: none;
}

.gnb ul li {
	font-family: 'KoPubDotumProBold';
	text-decoration: none;
    float: left;
    margin-right: 25px;
    font-size: 25px; /* 메뉴 항목의 글자 크기 */
    color: #fff; /* 글자 색상 */
}
.gnb ul li a {
	font-weight: bold;
	text-decoration: none; /* 링크 밑줄 제거 */
  	color: #fff;
  	margin-left: 20px;
  	margin-right: 35px;
  	text-align: center;
  	display: block; 
}
/* .gnb ul li:hover {
    color: #0095DA; /* 마우스 오버 시 글자 색상 변경 
    text-decoration: none;
} */
.gnb ul li a:hover {
  text-decoration: none; /* 링크 밑줄 제거 */
  color: #0095DA;
}

/* 서브메뉴(snb) 스타일 */
.snb {

    display: none;
    width: 100%;
    border-bottom: 1px solid black;
    background:rgba(0, 0, 0, 0.5);;
    position: relative;
    display: flex;
    justify-content: space-between;
}
.snb > div {
    width: 900px;
    margin: 20px auto;
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
}
.sub-list1{
	margin-top: 20px;
	margin-left: 20%;
}
.sub-list2 {
  display: flex; /* 자식 요소들을 수평 방향으로 정렬 */
  flex-direction: column; /* 자식 요소들을 수직 방향으로 정렬 */
  align-items: center;
  justify-content: center; /* 자식 요소들을 가운데 정렬 */
  text-decoration: none;
}

.sub-list2 li {
  margin-bottom: 10px; /* 아래 여백 */
  font-size: 16px; /* 서브메뉴 항목의 글자 크기 */
  align-items: center; /* 자식 요소들을 수직 중앙 정렬 */
  display: column;
  list-style: none;
  text-decoration: none;
}
.snb ul {
  list-style: none;
  display: flex; /* 수평 방향으로 정렬 */
  flex-wrap: wrap; /* 여러 줄로 나열 */
  justify-content: space-between; /* 양 옆 간격 조정 */
}
.snb ul li {
	font-family: 'KoPubDotumProMedium';
    margin-right: 2px;
    font-size: 16px;
    text-align: center;

	
}

.snb ul li a {
  padding: 10px 0; /* 링크 위아래 여백 추가 */
  text-decoration: none; /* 링크 밑줄 제거 */
  color: #fff;  
}

.snb ul li a:hover {
    color: #0095DA; /* 링크 마우스 오버 시 색상 변경 */
    text-decoration: none;
}

/* 로그인 버튼 스타일 */
.login-button {
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    cursor: pointer;
}

.login-button:hover {
    background-color: #0056b3;
}

</style>

</head>
<body>
    <nav >
        <div class="gnb">
            <div id="logo">
                <a href="${pageContext.request.contextPath}/main_page.jsp"><img src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png" alt="엘비네스트"></a>
            </div>
            <ul>
                <li><a href="#">COMPANY</a></li><!-- 회사소개 -->
                <li><a href="#">CAREERS</a></li><!-- 대출상담사 및 채용안내 -->
                <li><a href="#">LOAN</a></li><!--대출상품안내  -->
                <li><a href="#">BUSINESS</a></li><!--업무자료실  -->
                <li><a href="#">COMMUNITY</a></li><!-- 커뮤니티 -->
            </ul>
            <div class="login-btn">
            <c:choose>
            	<c:when test="${sessionScope.m_id != null}">
            		<a href="${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }">${sessionScope.m_id } 님</a>
            		<a href="${pageContext.request.contextPath}/member/logout.do">LOGOUT</a>
            		
            	</c:when>
            	<c:otherwise>
            		<a href="${pageContext.request.contextPath}/member/login.do">LOGIN</a>
            	</c:otherwise>
            </c:choose>	
            </div>
        </div>
        <div class="snb">
          <ul class = "sub-list1">
              <li>
                  <ul class="sub-list2">
                      <li><a href="#">CEO 인사말</a></li>
                      <li><a href="#">LB WAY</a></li>
                      <li><a href="#">CI</a></li>
                      <li><a href="#">조직도</a></li>
                      <li><a href="#">대출모집인(법인) 등록증</a></li>
                  </ul>
              </li>
              <li>
                  <ul class="sub-list2">
                      <li><a href="#">대출상담사 역할</a></li>
                      <li><a href="#">대출상담사 확인</a></li>
                      <li><a href="#">대출상담사 채용</a></li>
                      <li><a href="#">Top Performer 상담사</a></li>
                  </ul>
              </li>
              <li>
                  <ul class="sub-list2">
                      <li><a href="#">주택담보대출</a></li>
                      <li><a href="#">전세자금대출</a></li>
                      <li><a href="#">신용대출</a></li>
                      <li><a href="#">자동차대출</a></li>
                      <li><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%8C%80%EC%B6%9C%EA%B3%84&qdt=0&ie=utf8&query=%EB%8C%80%EC%B6%9C%EA%B3%84%EC%82%B0%EA%B8%B0" target="_blank">대출계산기</a></li>
                  </ul>
              </li>
              <li>
                  <ul class="sub-list2">
                      <li><a href="#">내부통제</a></li>
                      <li><a href="#">상품 메뉴얼</a></li>
                      <li><a href="#">입사(채용/해지) 양식</a></li>
                      <li><a href="#">서류 양식함</a></li>
                  </ul>
              </li>
              <li>
                  <ul class="sub-list2">
                      <li><a href="#">상담 및 서비스 문의</a></li>
                      <li><a href="#">연락처</a></li>
                      <li><a href="#">찾아오시는 길</a></li>
                      <li><a href="#">사내마당</a></li>
                  </ul>
              </li>
          </ul>
       </div>
        
    </nav>
</body>
</html>
