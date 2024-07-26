<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LBNEST CI</title>
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
.ci-section {
	
	padding: 40px 20px;
	/* 패딩 조정 */
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	min-height: 80vh;
	margin-top: 200px;
	margin-bottom: -40px;
	margin-left: -180px;
	margin-right: -180px;
	/* max-width: 1200px; */
	/* 최대 너비 조정 */
}

.section-title {
	text-align: left;
	font-weight: bold;
	font-size: 45px;
	color: black;
	margin-bottom: 20px;
	width: 100%;
}

.section-content {
	text-align: left;
	margin-top: 30px;
	margin-bottom: 30px;
	width: 80%;
	/* 섹션의 너비를 80%로 설정 */
	margin-left: auto;
	margin-right: auto;
}

.section-content h3 {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 10px;
}

.section-content p {
	margin: 10px 0;
	line-height: 1.6;
}

.color-box {
	background-color: #0095DA;
	width: 400px;
	padding: 10px;
	color: white;
	margin-right: 20px;
	box-sizing: border-box;
	border-radius: 10px;
}

.color-box.gray {
	background-color: #77787B;
}

.color-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.signature-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.signature-container img {
	max-width: 40%;
	margin: 0 10px;
}

.menu ul {
	text-align: center;
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
#ci_container_wr {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	min-height: 100vh;
	padding: 20px;
	/* 추가된 패딩 */
}

#ci_container {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
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
		<h1>LBnest CI</h1>
	</div> 
	<div class="main_container">
	<div id="wrapper">
		<div id="ci_container_wr">
			<div id="ci_container">
				<section id="ci-section" class="ci-section"
					style="background-color: white; padding: 40px;">
					<div style="text-align: center;" data-aos="zoom-in"
						data-aos-delay="200">
						
						<img
							src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
							alt="CI 이미지" style="max-width: 40%;" data-aos="zoom-in"
							data-aos-delay="200">
					</div>
					<div class="section-content">
						<h3>CI 의미</h3>
						<p>
							사람, 별(Star)의 이미지를 모티프로 하나의 unit가 다양한 크기로 반복되면서 커다란 원의 형태로 표현되어
							LB가 원하고 도전하는<br> 새로운 세상 <span
								style="font-size: 20px; font-weight: bold; color: #0095DA;">'Look
								Beyond'</span>의 모습을 시각화 하였습니다.
						</p>
						<p>
							또한 최고가 되기 위해 끊임없이 도전하는 LB그룹의 한 사람 한 사람이 모두 다 <span
								style="font-size: 20px; font-weight: bold; color: #0095DA;">'STAR'</span>라는
							의미를 함축하고 있습니다.<br> 별 21개의 의미는 힘과 권위의 상징입니다.
						</p>
					</div>
					<div class="section-content">
						<h3>디자인 특징</h3>
						<p>
							창조와 혁신을 상징하는 LB의 심벌마크는 전통적인 마크의 개념을 탈피하여 그래픽 패턴의 개념을 도입하여 다양한 매체의
							대외환경에 따라 전략적으로<br> 변화할 수 있어 flexible한 아이덴티티 시스템 구현이 가능합니다.
						</p>
						<p>
							LB의 대표 색상인 <span
								style="font-size: 20px; font-weight: bold; color: #0095DA;">'LB
								BLUE'</span>는 드넓은 하늘과 젊음을 패키, 정직과 신뢰를 상징하여 널리 퍼져 나갈 LB의 무한한 영토를 상징하고
							있습니다.
						</p>
					</div>
					<div class="section-content">
						<h3>시그니처</h3>
						<p>
							시그니처 조합은 심벌마크가 로고타입 등과 함께 일정한 규칙에 의해 조합된 것을 말하며, 각각의 요소들을 임의로<br>
							다르게 조합하여 사용하는 안됩니다. 적용하는 매체에 따라 적절한 시그니처를 선택하여 사용합니다.
						</p>
						<div class="signature-container">
							<img
								src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
								alt="시그니처 이미지" data-aos="zoom-in" data-aos-delay="200"> <img
								src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_3.png"
								alt="시그니처 이미지" data-aos="zoom-in" data-aos-delay="200">
						</div>
					</div>
					<div class="section-content">
						<h3>적용색상</h3>
						<p>
							적용색상은 심벌마크, 로고타입과 더불어 LB의 아이덴티티를 형성하는데 3대요소 중 하나이다. 각종 시각매체에<br>
							적용하여 LB의 이미지를 전달하는 중요한 기능을 한다. 전용색상의 효과적인 사용을 위해서는 인쇄방법, 잉크의 농도,<br>
							종이의 질 등을 검토하여 아래 예시된 표준색상을 유지한다.<br> 색상 재현 시 최적의 표준색상을 얻기
							위해서는 최대한 PANTONE Solid Coated Chips와 비교하여 정확하게<br> 표현해야 한다.
						</p>
						<div class="color-container">
							<div class="color-box">
								<p style="margin: 0; font-weight: bold; color: white;">LB
									Blue</p>
								<p style="margin: 0; color: white;">#0095DA</p>
								<p style="margin: 0; color: white;">CMYK C 100 M 20 Y 0 K 0</p>
								<p style="margin: 0; color: white;">RGB R 0 G 149 B 218</p>
							</div>
							<div class="color-box gray">
								<p style="margin: 0; font-weight: bold; color: white;">LB
									Gray</p>
								<p style="margin: 0; color: white;">#77787B</p>
								<p style="margin: 0; color: white;">CMYK C 0 M 0 Y 0 K 65</p>
								<p style="margin: 0; color: white;">RGB R 119 G 120 B 123</p>
							</div>
						</div>
					</div>
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
