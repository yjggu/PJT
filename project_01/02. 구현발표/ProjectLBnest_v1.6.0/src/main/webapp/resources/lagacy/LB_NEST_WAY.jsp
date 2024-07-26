<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LBNEST 역사</title>
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
.company-history {

	padding: 40px 0;
	text-align: center;
	/* 중앙 정렬 */
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
/* 	min-height: 80vh;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.9);
 */
	margin-top: 100px;
	margin-left: auto;
	/* 중앙 정렬 */
	margin-right: auto;
	/* 중앙 정렬 */
}

.company-history h2, .company-history p {
	text-align: center;
	/* 중앙 정렬 */
	animation: fadeIn 1s ease-out;
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
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes slideUp {from { transform:translateY(20px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
body {
	background-image: url('./resources/main_image/header_image/sky01.jpg');
	background-repeat: no-repeat; /* 이미지 반복 안함 */
	background-size: cover; /* 이미지가 화면 전체를 덮도록 조정 */
	margin: 0;
	padding: 0;
	position: relative;
	zoom: 1;
}
</style>
</head>
<body>
	<c:import url="/LB_NEST_HEADER.jsp"></c:import>
	<div class="titleBackground">
		<h1>LB WAY</h1>
	</div> 
	<div class="main_container">
	<div id="wrapper">
		<div id="container_wr">
			<div id="container">
				<section id="company-history" class="company-history"
					style="background-color: white; padding: 40px;">
					<h2
						style="color: black; text-align: center; font-weight: bold; font-size: 45px;"
						data-aos="fade-up">기업 연혁</h2>
					<br>
					<p
						style="color: black; font-size: 25px; line-height: 1.6; text-align: center; font-weight: bold;"
						data-aos="zoom-in" data-aos-delay="200">
						<strong>2024.9</strong><br>
						<br> - 금감원 대출성 상품 금융상품판매대리중개업 등록(예정)<br>
						<br> <strong>2024.7</strong><br>
						<br> - **은행 업무협약 (예정)<br>
						<br> <strong>2024.3</strong><br>
						<br> - LB네스트 출범<br>
						<br>
					</p>
				</section>
			</div>
		</div>
	</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
            AOS.init();
        </script>
	<c:import url="/LB_NEST_UNDER.jsp"></c:import>
</body>
</html>
