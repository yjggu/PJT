<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO 인사</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.4/gsap.min.js"></script>
<!-- <script src="https://www.lbhunet.com/js/placeholders.min.js"></script>
<script src="https://www.lbhunet.com/js/luxy.js"></script>
<script src="https://www.lbhunet.com/js/ui.js"></script> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet"
	href="https://www.lbhunet.com/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="shortcut icon" href="/theme/basic/img/favicon.ico"
	type="image/x-icon">
<style>
body {
	background-image: url('./resources/main_image/header_image/sky01.jpg');
	background-repeat: no-repeat; /* 이미지 반복 안함 */
	background-size: cover; /* 이미지가 화면 전체를 덮도록 조정 */
	margin: 0;
	padding: 0;
	position: relative;
	zoom: 1;
}


.main_container{
    width: 100%; /* 전체 너비로 설정 */
    max-width: none; /* 최대 너비 제한 해제 */
    margin: 0; /* 수평 가운데 정렬 제거 */
    padding-top: 100px;
    padding-bottom: 100px;
	background: linear-gradient(to bottom, 
                            rgba(255, 255, 255, 0) 0%, 
                            rgba(255, 255, 255, 0.1) 2%, 
                            rgba(255, 255, 255, 0.2) 4%, 
                            rgba(255, 255, 255, 0.4) 8%, 
                            rgba(255, 255, 255, 0.6) 10%, 
                            rgba(255, 255, 255, 0.8) 12%,  
                            rgba(255, 255, 255, 1) 15%);
                                
    background-size: 100% 100%; /* 그라데이션 크기 조정 */
    background-repeat: no-repeat; /* 반복 없애기 */
    background-position: top; /* 상단에 그라데이션 위치 설정 */
}
.titleBackground {
   /*  padding: 20px; */ /* 내부 여백 추가 */
    margin-top: 2%; /* 위쪽 간격 설정 */
    margin-left: 2%; /* 위쪽 간격 설정 */
    margin-right: 2%; /* 아래쪽 간격 설정 */
}

.titleBackground h1 {
	font-family: 'KoPubDotumProBold';
	color: #fff;
    font-size: 60px;
    font-weight: bold;
    text-align: left; /* 중앙 정렬 */
    
}
#container {
	padding-top: 200px;
	width: 1284px;
	
	margin: 0 auto;
}

#ceo-image {
	/* 	position: relative;
	top: 400px;
	right: 150px;
	margin-top: -100px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); */
	width: 30px;
	height: 30px;
}

#ceoImage {
	
}

#ceo-message {
	position: relative;
	padding-left: 100px;
	text-align: left; /* 텍스트 왼쪽 정렬 */
	display: flex;
	justify-content: center; /* 텍스트를 왼쪽으로 정렬 */
	align-items: flex-start; /* 텍스트를 위쪽으로 정렬 */
	flex-direction: column;
	
	/* margin-top: 50px; */ /* 상단 여백 추가 */
}

#ceo-message h2 {
	color: black;
	font-size: 36px;
	text-align: left; /* 텍스트 왼쪽 정렬 */
	font-weight: bold; /* 글씨 크기 키움 */
	margin-bottom: 20px;
	margin-left: 0;
}

#ceo-message p {
	font-weight: bold;
	color: black;
	font-size: 20px;
	text-align: left; /* 텍스트 왼쪽 정렬 */
	margin-left: 0; /* 글씨 크기 키움 */
	line-height: 1.6;
	max-width: 800px; /* 최대 너비 설정 */
}
</style>

</head>


<body>
	<c:import url="/LB_NEST_HEADER.jsp"></c:import>
	<div class="titleBackground">
		<h1>CEO 인사말</h1>
	</div> 
	<div class="main_container">
	<div id="wrapper">
		<div id="container">
			<%-- <div id="ceo-image">
				<img id="ceoImage"
					src="${pageContext.request.contextPath}/resources/main_image/ceo_hello.png"
					alt="CEO Image">
			</div> --%>

			<div id="ceo-message">
				<h2 data-aos="fade-up">LB NEST를 찾아주셔서 감사합니다.</h2>
				<br>
				<p>
					<!--  data-aos="zoom-in" data-aos-delay="200" -->
					안녕하십니까,<br> <br> LB네스트를 찾아주신 고객 여러분, 진심으로 환영합니다.<br>
					<br> LB네스트는 고객 여러분께 안정적이고 전문적인 금융 서비스를 제공하기 위해<br> 언제나
					여러분 곁에서 최선을 다하고 있습니다. <br> <br> 먼저 고객을 생각하고 고객에게 먼저 찾아가는
					서비스로, 고객의 다양한<br> 금융니즈에 신속 정확한 최적의 솔루션 서비스를 제공하는 것을 최고의 목표로<br>
					삼고 있습니다.<br> <br> 저희 LB네스트는 열정과 전문성을 가진 인재들로 구성되어 있으며,<br>
					고객의 신뢰, 고객 만족을 LB네스트 구성원들은 최고의 가치로 여기며 고객의 성공과<br> 미래를 위해 함께
					노력하고자 합니다.<br> <br> 저희 LB네스트 임직원 일동은 고객과 함께하는 지금 이순간도 감사와
					고마움을<br> 표하며 언제나 여러분의 니즈를 충족하는 금융전문 세일즈 기업이 되고자<br> 합니다.<br>
					<br> 늘 고객님들의 건강과 행복을 기원합니다.<br> <br> 감사합니다.<br>
					<br> -LB네스트 임직원 올림-
				</p>
			</div>
		</div>
	</div>
	</div>
	<c:import url="/LB_NEST_UNDER.jsp"></c:import>


	<script>
		AOS.init({
			easing : 'easeOutCubic',
			duration : 800,
			delay : 0
		});
	</script>
	
</body>
</html>
