<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.4/gsap.min.js"></script>
<script src="https://www.lbhunet.com/js/placeholders.min.js"></script>
<script src="https://www.lbhunet.com/js/luxy.js"></script>
<script src="https://www.lbhunet.com/js/ui.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet" href="https://www.lbhunet.com/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="shortcut icon" href="/theme/basic/img/favicon.ico" type="image/x-icon">
<style>
.image-container {
	position: absolute;
	top: 30%;
	left: 0;
	width: 100%;
	transform: translateY(-50%);
	opacity: 1;
	z-index: 1;
	animation: slideLeft 20s linear infinite;
}

.image-container.duplicate {
	left: 100%;
}

@keyframes slideLeft {
	0% {
		transform: translateX(0);
	}
	100% {
		transform: translateX(-100%);
	}
}
</style>
</head>
<body>
	<c:import url="/LB_NEST_HEADER.jsp"></c:import>
	
	
	<div id="luxy" style="width: 100%; position: fixed; transform: translate3d(0px, 0px, 0px);">
        <div id="wrapper">
            <div id="container_wr">
                <div id="container">
                    <section id="registration-card" class="registration-card"
                        style="background-color: white; padding: 40px;">
                        <div class="overlay-text" data-aos="zoom-in" data-aos-delay="200"
                            style="color: black; text-align: center; font-weight:bold; font-size:45px; margin-bottom:40px;">
                            대출모집인 등록증(법인)
                        </div>
                        <div style="position: relative; text-align: center;" data-aos="zoom-in" data-aos-delay="200">
                            <img src="${pageContext.request.contextPath}/resources/images/대출모집법인.gif" alt="조직도 이미지"
                                style="max-width: 100%;">
                        </div>
                    </section>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
            AOS.init({
                easing: 'easeOutCubic',
                duration: 800,
                delay: 0
            });
        </script>
	
	

	<div class="ft-collaboration"
		style="display: flex; justify-content: center; align-items: center; position: relative; height:100px; margin-top: -30px;">
		<img
			src="${pageContext.request.contextPath}/resources/images/combined_image.jpg"
			alt="Collaboration Logos" class="image-container"
			style="max-width: 100%; height: auto;"> 
		<img
			src="${pageContext.request.contextPath}/resources/images/combined_image.jpg"
			alt="Collaboration Logos" class="image-container duplicate"
			style="max-width: 100%; height: auto;">
	</div>

	<c:import url="/LB_NEST_UNDER.jsp"></c:import>
	
</body>
</html>
