<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LB Nest</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
body {
	background-image: url('./resources/main_image/header_image/sky01.jpg');
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: top;
	background-color: #fff;
	position: relative;
	zoom: 1;
}

#hd_wrapper {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.box {
	width: 100%;
	hight: 50px;
	background-color: rgba(0, 0, 0, 0.5);
	/*           margin: 30px;
          padding: 5px; */
	padding: 90px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

/* 상단 메뉴바 스타일 */
#gnb ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-grow: 1;
}

#gnb ul li {
	position: relative;
}

#gnb ul li a {
	text-decoration: none;
	padding: 40px 40px;
	display: block;
	font-weight: bold;
	color: #FFF;
	font-size: 25px;
}

#gnb ul li div {
	
}

ul.custom-list li {
	line-height: 0.6; /* 줄 간격을 조정합니다 */
	margin-bottom: 10px; /* 각 항목 사이의 여백을 추가합니다 */
	margin-top:5px;
}
/* #gnb ul li  */
.menu {
	position: absolute !important;
	top: 100% !important;
	left: 0 !important;
	/* background-color: rgba(0, 0, 0, 0.5) !important; */
	width: 100% !important;
	z-index: 1000 !important;
	color: white !important;
	justify-content: space-around !important;
}

.menu ul {
	list-style: none !important;
	margin: 0 !important;
	padding: 0 !important;
	display: block !important;
	/*           display: flex;
          justify-content: center; */
}

.menu ul li {
	text-align: center !important;
}

.menu ul li a {
	text-decoration: none !important;
	padding: 5px !important;
	display: block !important;
	color: white !important;
	text-decoration: none !important;
	font-size: 16px !important;
	font-weight: normal !important;
	/* position: relative !important; */
	/*style="position: relative; display: none;"  */
}

/* #gnb ul li  */
.menu ul li a:hover {
	text-decoration: none !important;
	color: #0095DA !important;
}
/*로그인 버튼*/
.login_button {
	font-size: 20px;
	margin-right: -150px;
	color: white;
}

.login_button:hover {
	font-size: 20px;
	margin-right: -150px;
	text-decoration: none;
	color: #0095DA;
}
/* 모바일 메뉴 햄버거 스타일 */
.btn_hamburger {
	margin-right: 50px;
	flex-direction: column;
	cursor: pointer;
}

.btn_hamburger span {
	display: block;
	width: 40px;
	height: 3px;
	margin: 5px auto;
	background-color: white;
	transition: all 0.3s ease-in-out;
	border-radius: 2px;
}

/* 모바일 메뉴 스타일 */
#navigation {
	position: fixed;
	top: 0;
	right: -100%;
	width: 100%;
	height: 100%;
	background-color: white;
	color: black;
	z-index: 9999;
	transition: right 0.8s ease-in-out;
}

.mobile-slider-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.mo-logo img {
	height: 100px;
}

.close-menu {
	font-size: 50px;
	cursor: pointer;
	position: absolute;
	top: 20px;
	right: 20px;
}

.dBox {
	padding-top: 30px;
}

.d-slogan {
	position: absolute;
	left: 50px;
	top: 600px;
	margin-bottom: 20px;
	font-size: 100px;
	color: #0095DA;
}

.hd-img {
	width: 100px;
	position: absolute;
	left: 50px;
	top: 300px;
}

#d-schedule {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: center;
	position: absolute;
	left: 1200px;
	top: 150px;
}

#d-schedule li {
	margin-bottom: 10px;
	cursor: pointer;
	font-size: 40px;
}

#d-schedule li a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

#d-schedule li ul {
	margin-left: 25%;
	text-align: left;
	list-style: none;
	/* margin-top: 10px; */
	display: none;
}

#d-schedule li ul li {
	/* margin-bottom: 5px; */
	
}

#d-schedule li ul li a {
	font-weight: normal;
	font-size: 20px;
}

.deco-bar {
	width: 10px;
	height: 0;
	margin-right: 5px;
	background-color: #0095DA;
	display: inline-block;
	vertical-align: middle;
	transition: height 0.3s;
}

#d-schedule li.active .deco-bar {
	height: 20px;
}

#d-schedule li.active ul {
	display: block;
}
/* 미디어 쿼리 */
@media ( max-width : 768px) {
	.btn_hamburger {
		display: flex;
	}
	#gnb {
		display: none;
	}
}
</style>
</head>
<body>
	<div id="hd" class="header" style="position: relative;">
		<div id="hd_wrapper">
			<div id="logo">
				<a href="http://localhost:8081/loan/main_page.jsp"><img
					src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
					alt="엘비네스트" style="height: 60px"></a>
			</div>
			<nav id="gnb">
				<ul>
					<li style="z-index: 1000"><a href="" target="_self"
						style="font-weight: bold; color: #FFF;">COMPANY</a>
						<div class="menu">
							<ul class="custom-list">
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ceoMessage" target="_self" style="font-weight: bold; color: black;">CEO 인사말</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#secondPage" target="_self" style="font-weight: bold; color: black;">LB WAY</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ciPage" target="_self" style="font-weight: bold; color: black;">CI</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#valuePage" target="_self" style="font-weight: bold; color: black;">핵심가치</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#orgPage" target="_self" style="font-weight: bold; color: black;">조직도</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#regisPage" target="_self"	style="font-weight: bold; color: black;">대출모집인(법인) 등록증</a></li>
							</ul>

						</div></li>
					<li style="z-index: 1000"><a href="javascript:void(0);"
						onclick="showAlert();" target="_self"
						style="font-weight: bold; color: #FFF;">CAREERS</a>
						<div class="menu">
							<ul >
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사
										역할</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사
										확인</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사
										채용</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">Top
										Performer 상담사</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: #FFF;">&nbsp;&nbsp;LOAN&nbsp;&nbsp;</a>
						<div class="menu">
							<ul>
								<li><a href="http://localhost:8081/loan/conpro/iMortgage.jsp" target="_self"
									style="font-weight: bold; color: black;">주택담보대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iLease.jsp" target="_self"
									style="font-weight: bold; color: black;">전세자금대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iCredit.jsp" target="_self"
									style="font-weight: bold; color: black;">신용대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iCar.jsp" target="_self"
									style="font-weight: bold; color: black;">자동차대출</a></li>
								<li><a
									href="https://omoney.kbstar.com/quics?page=C042003#loading"
									target="_blank" style="font-weight: bold; color: black;">대출계산기</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: #FFF;">BUSINESS</a>
						<div class="menu">
							<ul>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">내부통제</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_blank" style="font-weight: bold; color: black;">상품
										메뉴얼</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">입사
										양식<br />(채용/해지)
								</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">서류
										양식함</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a
						href="javascript:void(0);" onclick="showAlert();" target="_self"
						style="font-weight: bold; color: #FFF;">COMMUNITY</a>
						<div class="menu">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self" style="font-weight: bold; color: black;">공지사항</a></li>
								<c:if test="${sessionScope.m_id != null }">
									<li><a
										href="${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }"
										target="_self" style="font-weight: bold; color: black;">마이페이지</a></li>
								</c:if>
								<li><a href="/loan/conpro/direction.jsp" target="_self"
									style="font-weight: bold; color: black;">오시는 길</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">사내마당</a></li>
							</ul>
						</div></li>
				</ul>

			</nav>



			<!-- 로그인 버튼 추가 -->
			<c:choose>
				<c:when test="${sessionScope.m_id != null}">
					<a href="${pageContext.request.contextPath}/member/logout.do"
						class="login_button">LOGOUT</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/member/login.do"
						class="login_button">LOGIN</a>
				</c:otherwise>
			</c:choose>


			<!-- 모바일메뉴 -->
			<div class="btn_hamburger">
				<span></span> <span></span> <span></span>
			</div>

			<div id="navigation">
				<div class="mobile-slider-top">
					<div class="mo-logo">
						<a><img
							src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
							alt="엘비네스트"></a>
					</div>
					<i class="material-symbols-rounded close-menu">close</i>
				</div>
				<div id="hd-img">
					<a><img
						src="${pageContext.request.contextPath}/resources/images/LB_NEST_img2.png"
						alt="엘비네스트"></a>
				</div>
				<div class="dBox">
					<div class="d-slogan">Look Beyond</div>

					<ul id="d-schedule">
						<li><div class="deco-bar"></div> <a>COMPANY</a>
							<ul>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ceoMessage" target="_self">- CEO 인사말</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#secondPage" target="_self">- LB WAY</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ciPage" target="_self">- CI</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#valuePage" target="_self">- 핵심가치</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#orgPage" target="_self">- 조직도</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#regisPage" target="_self">- 대출모집인(법인) 등록증</a></li>
							</ul></li>
						<li><div class="deco-bar"></div> <a>CAREERS</a>
							<ul>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 대출상담사 역할</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 대출상담사 확인</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 대출상담사 채용</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- Top Performer 상담사</a></li>
							</ul></li>
						<li><div class="deco-bar"></div> <a>LOAN</a>
							<ul>
								<li><a href="http://localhost:8081/loan/conpro/iMortgage.jsp" target="_self">-
										주택담보대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iLease.jsp" target="_self">-
										전세자금대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iCredit.jsp" target="_self">-
										신용대출</a></li>
								<li><a href="http://localhost:8081/loan/conpro/iCar.jsp" target="_self">-
										자동차대출</a></li>
								<li><a
									href="https://omoney.kbstar.com/quics?page=C042003#loading"
									target="_blank">대출계산기</a></li>
							</ul></li>
						<li><div class="deco-bar"></div> <a>BUSINESS</a>
							<ul>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 내부통제</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_blank">- 상품 메뉴얼</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 입사(채용/해지) 양식</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self">- 서류 양식함</a></li>
							</ul></li>
						<li><div class="deco-bar"></div> <a>COMMUNITY</a>
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self">- 공지사항</a></li>
								<c:if test="${sessionScope.m_id != null }">
									<li><a
										href="${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }"
										target="_self">- 마이페이지</a></li>
								</c:if>
								<li><a href="http://localhost:8081/loan/conpro/direction.jsp" target="_self">-
										오시는 길</a></li>
								<li><a href="" target="_self">- 사내마당</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="box"></div>
	</div>

	<script>
		$(document).ready(
				function() {

					// 햄버거 메뉴 토글
					$('.btn_hamburger').click(function() {
						$('#navigation').css('right', '0');
					});

					// 메뉴 닫기
					$('.close-menu').click(function() {
						$('#navigation').css('right', '-100%');
					});
					// 서브메뉴 슬라이드
					$('#gnb ul li').hover(function() {
						$(this).find('.menu').css('display', 'block');
						$('.menu').stop().slideDown();
						$(this).find('.box').css('display', 'block');
						$('.box').stop().slideDown();
					}, function() {
						$('.menu').stop().slideUp();
						$(this).find('.menu').css('display', 'none');
						$('.box').stop().slideUp();
						$(this).find('.box').css('display', 'none');
					});
					//햄버거 메뉴바 내부 
					$('#d-schedule li > a').click(
							function() {
								var parentLi = $(this).parent();

								if (parentLi.hasClass('active')) {
									parentLi.removeClass('active');
									parentLi.find('ul').slideUp();
									parentLi.find('.deco-bar').css('height',
											'0');
								} else {
									$('#d-schedule li.active').removeClass(
											'active').find('ul').slideUp();
									$('#d-schedule li .deco-bar').css('height',
											'0');

									parentLi.addClass('active');
									parentLi.find('ul').slideDown();
									parentLi.find('.deco-bar').css('height',
											'50px');
								}
							});

				});

		function showAlert() {
			alert("준비중입니다");
		}
	</script>
</body>
</html>