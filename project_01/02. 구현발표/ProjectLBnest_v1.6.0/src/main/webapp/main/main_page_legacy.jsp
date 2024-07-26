<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<html lang="ko"
	class="js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="/theme/basic/img/img-site.jpg">

<title>LB NEST</title>

<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/css/default.css?ver=171222">
<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/skin/latest/basic/style.css?ver=171222">
<!--[if lte IE 8]>
    <script src="https://www.lbhunet.com/js/html5.js"></script>
    <![endif]-->
<script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "";
        var g5_bbs_url = "https://www.lbhunet.com/bbs";
        var g5_is_member = "<%=session.getAttribute("is_member") != null ? session.getAttribute("is_member") : ""%>";
        var g5_is_admin = "<%=session.getAttribute("is_admin") != null ? session.getAttribute("is_admin") : ""%>";
        var g5_is_mobile = "<%=request.getAttribute("is_mobile") != null ? request.getAttribute("is_mobile") : ""%>";
        var g5_bo_table = "<%=request.getAttribute("bo_table") != null ? request.getAttribute("bo_table") : ""%>";
        var g5_sca = "<%=request.getAttribute("sca") != null ? request.getAttribute("sca") : ""%>";
        var g5_editor = "<%=request.getAttribute("editor") != null ? request.getAttribute("editor") : ""%>";
        var g5_cookie_domain = "<%=request.getAttribute("cookie_domain") != null ? request.getAttribute("cookie_domain") : ""%>";
    </script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.4/gsap.min.js"></script>

<script src="https://www.lbhunet.com/js/common.js?ver=171222"></script>
<script src="https://www.lbhunet.com/js/wrest.js?ver=171222"></script>
<script src="https://www.lbhunet.com/js/placeholders.min.js"></script>
<script src="https://www.lbhunet.com/js/luxy.js"></script>
<script src="https://www.lbhunet.com/js/ui.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet"
	href="https://www.lbhunet.com/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="shortcut icon" href="/theme/basic/img/favicon.ico"
	type="image/x-icon">

<style>
.ft-family .fam-list li a {
	display: block;
	font-size: 15px;
	color: #a4a4a4;
	letter-spacing: 0;
	padding: 3px 0;
}

.ft-family .fam-list li a:hover {
	color: #ddd
}

.login_button {
	position: absolute;
	top: 40px;
	right: 110px;
	background: black;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

* {
	font-family: 'KoPub Dotum_Pro Bold', sans-serif !important;
}

.image-container {
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	opacity: 0;
	transition: opacity 1s ease-out, transform 1s ease-out;
	z-index: 1;
}

.image-container img {
	max-width: 100%;
	height: auto;
}

.image-container.animate {
	opacity: 1;
	transform: translateX(0) translateY(-50%);
}

@media ( max-width : 768px) {
	.image-container {
		position: static;
		transform: none;
		opacity: 1;
		margin-top: 20px;
		z-index: 1;
	}
}

.image-container2 {
	position: absolute;
	right: -500px;
	top: -50%;
	width: auto;
	transform: translateY(-50%);
	transition: opacity 1s ease-out, transform 1s ease-out, border-radius 1s
		ease-out;
	z-index: 2;
	border-radius: 5%;
	overflow: hidden;
	opacity: 0;
	transition: opacity 1s ease-out, transform 1s ease-out;
}

.image-container2 img {
	max-width: 100%;
	width: 100%;
	height: 100%;
	border-radius: 5%;
}

.image-container2.animate {
	transform: translateX(0) translateY(-50%);
	z-index: 2;
	opacity: 1;
}

@media ( max-width : 768px) {
	.image-container2 {
		position: static;
		transform: none;
		margin-top: 20px;
		z-index: 2;
		border-radius: 5%;
	}
}

@
keyframes slideInFromRight {to { transform:translateX(0)translateY(-50%);
	
}

}
.mVisual {
	overflow: hidden;
	text-align: center;
}

.loan-option {
	opacity: 0;
	transform: translateX(-100%);
}

.loan-option.animate {
	animation: slideIn 1s forwards ease-out;
}

@
keyframes slideIn {from { opacity:0;
	transform: translateX(-100%);
}

to {
	opacity: 1;
	transform: translateX(0);
}

}
.loan-container {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 20px;
	justify-content: center;
	margin-bottom: 20px;
}

.loan-container div {
	padding: 10px 20px;
	border: 5px;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
	color: #e6edff;
	background-color: black;
}

.center-text {
	text-align: center;
	margin-top: 20px;
}

.idx-careers {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
	height: 100%;
	color: black;
}

.animated-image-container {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	margin-right: 20px;
	background-color: white;
}

.animated-image {
	opacity: 0;
	transform: translate(150px, -20px);
	transition: opacity 1s ease-in-out, transform 1s ease-in-out;
	width: 100px;
	height: auto;
	border-radius: 5px;
	background-color: #000000;
}

.animated-image.visible {
	opacity: 1;
	transform: translate(150px, -20px);
	background-color: #000000;
}

.car-txt {
	max-width: 600px;
	text-align: right;
	margin-top: 50px;
	background-color: white;
	color: black;
}

.ft-collaboration {
	text-align: center;
	background-color: white;
}

#demo-1 {
	background:
		url('${pageContext.request.contextPath}/resources/main_image/건물_이미지_3.jpg')
		no-repeat center center;
	background-size: cover;
	position: relative;
}
</style>

</head>

<body data-aos-easing="easeOutCubic" data-aos-duration="800"
	data-aos-delay="0" style="width: 1284px; height: 2713px;">

	<!-- 상단 시작 { -->
	<div id="hd" class="header"
		style="z-index: 1000; background-color: rgba(0, 0, 0, 0.3);">
		<h1 id="hd_h1">엘비네스트</h1>

		<div id="skip_to_container">
			<a href="#container">본문 바로가기</a>
		</div>

		<!-- 팝업레이어 시작 { -->
		<div id="hd_pop">
			<h2>팝업레이어 알림</h2>
			<span class="sound_only">팝업레이어 알림이 없습니다.</span>
		</div>

		<script>
            $(function () {
                $(".hd_pops_reject").click(function () {
                    var id = $(this).attr('class').split(' ');
                    var ck_name = id[1];
                    var exp_time = parseInt(id[2]);
                    $("#" + id[1]).css("display", "none");
                    set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
                });
                $('.hd_pops_close').click(function () {
                    var idb = $(this).attr('class').split(' ');
                    $('#' + idb[1]).css('display', 'none');
                });
                $("#hd").css("z-index", 1000);
            });
        </script>
		<!-- } 팝업레이어 끝 -->

		<div id="hd_wrapper">

			<div id="logo">
				<a><img
					src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_2.png"
					alt="엘비네스트"></a>
			</div>

			<!-- 로그인 버튼 추가 -->
			<c:choose>
				<c:when test="${sessionScope.m_id != null}">
					<a href="${pageContext.request.contextPath}/member/logout.do"
						class="login_button">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/member/login.do"
						class="login_button">로그인</a>
				</c:otherwise>
			</c:choose>
			<nav id="gnb">
				<h2>메인메뉴</h2>
				<ul>
					<li style="z-index: 1000"><a href="" target="_self">회사소개</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self">CEO 인사말</a></li>
								<li><a href="" target="_self">LB WAY</a></li>
								<li><a href="" target="_self">CI</a></li>
								<li><a href="" target="_self">조직도</a></li>
								<li><a href="" target="_self">대출모집인(법인) 등록증</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000"><a href="" target="_self">대출상담사
							및 채용안내</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self">대출상담사 역할</a></li>
								<li><a href="" target="_self">대출상담사 확인</a></li>
								<li><a href="" target="_self">대출상담사 채용</a></li>
								<li><a href="" target="_self">Top Performer 상담사</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self">대출상품안내</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self">주택담보대출</a></li>
								<li><a href="" target="_self">전세자금대출</a></li>
								<li><a href="" target="_self">신용대출</a></li>
								<li><a href="" target="_self">자동차대출</a></li>
								<li><a
									href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%8C%80%EC%B6%9C%EA%B3%84&qdt=0&ie=utf8&query=%EB%8C%80%EC%B6%9C%EA%B3%84%EC%82%B0%EA%B8%B0"
									target="_blank">대출계산기</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self">업무자료실</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self">내부통제</a></li>
								<li><a href="" target="_blank">상품 메뉴얼</a></li>
								<li><a href="" target="_self">입사(채용/해지) 양식</a></li>
								<li><a href="" target="_self">서류 양식함</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self">커뮤니티</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="${pageContext.request.contextPath}/getNoticeList.do" target="_self">공지사항</a></li>
								<li><a href="./my_page.jsp" target="_self">마이페이지</a></li>
								<li><a href="" target="_self">찾아오시는 길</a></li>
								<li><a href="" target="_self">사내마당</a></li>
							</ul>
						</div></li>
				</ul>
				<div id="gnb_background" style="position: absolute; display: none;"></div>
			</nav>


			<!-- 모바일메뉴 -->
			<div class="btn_hamburger">
				<span></span> <span></span> <span></span>
			</div>

			<div id="navigation"
				style="display: none; background-color: white; color: black;">
				<div class="deco-symbol">
					<img src="/theme/basic/img/obj-star.svg" alt="">
				</div>
				<div class="mobile-slider-top">
					<div class="mo-logo">
						<a><img
							src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
							alt="엘비네스트"></a>
					</div>
					<i class="material-symbols-rounded close-menu"
						style="color: black; transform: none; transition: none; animation: none;">close</i>
				</div>

				<div class="dBox">
					<div class="d-slogan" style="color: black;">
						Good People, <br>Genuine Trust
					</div>

					<ul id="d-schedule" style="color: black;">
						<li style="z-index: 1000"><a href="" target="_self" asdf="7"
							style="color: black;">회사소개</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- CEO 인사말</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- LB WAY</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- CI</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 조직도</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 대출모집인(법인) 등록증</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="4"
							style="color: black;">대출상담사 및 채용안내</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 대출상담사 역할</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 대출상담사 확인</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 대출상담사 채용</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- Top Performer 상담사</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="5"
							style="color: black;">대출상품안내</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 주택담보대출</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 전세자금대출</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 신용대출</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 자동차대출</a></li>
								<li class=""><a
									href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%8C%80%EC%B6%9C%EA%B3%84&qdt=0&ie=utf8&query=%EB%8C%80%EC%B6%9C%EA%B3%84%EC%82%B0%EA%B8%B0"
									target="_blank" class="" style="color: black;">- 대출계산기</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="3"
							style="color: black;">업무자료실</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 내부통제</a></li>
								<li class=""><a href="" target="_blank" class=""
									style="color: black;">- 상품 메뉴얼</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 입사(채용/해지) 양식</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 서류 양식함</a></li>
							</ul></li>

						<li style="z-index: 1000"><a href="" target="_self" asdf="3"
							style="color: black;">커뮤니티</a>
							<ul>
								<li class=""><a href="/notice/NoticeList.jsp" target="_self" class=""
									style="color: black;">- 공지사항</a></li>
								<li class=""><a href="./my_page.jsp" target="_self" class=""
									style="color: black;">- 마이페이지</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 찾아오시는 길</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black;">- 사내마당</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- // 모바일메뉴 -->
		</div>
	</div>

	<div id="luxy"
		style="width: 100%; position: fixed; transform: translate3d(0px, 0px, 0px);">
		<!-- 콘텐츠 시작 { -->
		<div id="wrapper">
			<div id="container_wr">
				<!-- mVisual -->
				<div id="demo-1" data-zs-overlay="dots" class="overlay-dots">
					<div class="visual-txt luxy-el" data-speed-y="-10"
						style="transform: translate3d(0px, 0px, 0px); background-color: rgba(0, 0, 0, 0.3); border-radius: 5px; padding: 40px;">
						<div class="loan-content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div class="loan-container" style="margin-right: 20px;">
								<div id="loan-1" class="loan-option">주택담보대출</div>
								<div id="loan-2" class="loan-option">전세자금대출</div>
								<div id="loan-3" class="loan-option">신용대출</div>
								<div id="loan-4" class="loan-option">자동차대출</div>
							</div>
							<p class="center-text" data-aos="fade" data-aos-delay="600"
								data-aos-duration="2000" style="margin: 0; padding: 0;">
								LB 네스트는 고객에게 최선을 다하는 대출 서비스를 제공합니다. <br>먼저 고객을 생각하고, 고객을 먼저
								찾아가는 대출모집법인 ㈜ LB Nest
							</p>
						</div>
					</div>

					<script type="text/javascript" src="/js/modernizr-2.6.2.min.js"></script>
					<script type="text/javascript" src="/js/jquery.zoomslider.min.js"></script>
					<script>
                        window.addEventListener('load', function () {
                            const loanOptions = document.querySelectorAll('.loan-option');
                            const imageContainer2 = document.getElementById('image-container2');
                            const observerOptions = {
                                root: null,
                                rootMargin: '0px',
                                threshold: 0.1
                            };

                            const observer = new IntersectionObserver((entries, observer) => {
                                entries.forEach(entry => {
                                    if (entry.isIntersecting) {
                                        entry.target.classList.add('animate');
                                    } else {
                                        entry.target.classList.remove('animate');
                                    }
                                });
                            }, observerOptions);

                            loanOptions.forEach(option => {
                                observer.observe(option);
                            });

                            // Observe the image container2
                            observer.observe(imageContainer2);
                        });

                        document.querySelector('#loan-1').addEventListener('click', function () {
                            alert('주택담보대출 상품설명 구현 예정');
                        });

                        document.querySelector('#loan-2').addEventListener('click', function () {
                            alert('전세자금대출 상품설명 구현 예정');
                        });

                        document.querySelector('#loan-3').addEventListener('click', function () {
                            alert('신용대출 상품설명 구현 예정');
                        });

                        document.querySelector('#loan-4').addEventListener('click', function () {
                            alert('자동차대출 상품설명 구현 예정');
                        });
                    </script>
				</div>
				<!-- // mVisual -->

				<!-- 통합된 섹션 시작 -->
				<section class="st-index" style="background-color: white;">

					<section class="st-index-content"
						style="padding: 20px; margin-bottom: 20px; box-sizing: border-box; width: 100%; overflow: hidden; opacity: 0; transform: scale(0.5); transition: opacity 1s ease-in-out, transform 1s ease-in-out;">
						<div class="inner"
							style="display: flex; justify-content: center; align-items: center; width: 100%;">
							<div style="margin-right: 500px;">
								<a href="" target="_blank"
									style="padding: 10px 20px; background-color: black; color: #fff; text-decoration: none; text-align: center; border-radius: 5px; cursor: default; cursor: pointer;">AI
									챗봇 상담</a>
							</div>
							<div>
								<a href="" target="_blank"> <span class="banner"
									style="padding: 10px 20px; background-color: black; color: #fff; text-decoration: none; text-align: center; border-radius: 5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer;">
										상담신청 </span>
								</a>

							</div>
						</div>
					</section>

					<section class="st-index-careers">
						<div class="bg"></div>
						<div class="idx-careers">
							<div class="animated-image-container">
								<img
									src="C${pageContext.request.contextPath}/resources/main_image/LB_NEST_img2.png"
									alt="Animated Image" class="animated-image">
							</div>

							<div class="car-txt aos-init" data-aos="fade-left"
								data-aos-delay="400" data-aos-duration="800">
								<h3 style="color: black;">VISIONS</h3>
								<p style="color: black; font-weight: 350;">
									신뢰와 투명성을 통해 고객의 꿈과 목표를 도와주고 <br> 최고가 되기 위해 도전하는 ㈜ LB Nest
								</p>
							</div>

						</div>
					</section>
				</section>


				<!-- 통합된 섹션 끝 -->

				<script>
                    document.addEventListener('DOMContentLoaded', function () {
                        let observerOptions = {
                            root: null,
                            rootMargin: '0px 0px -10% 0px',
                            threshold: 0.1
                        };

                        let observer = new IntersectionObserver((entries, observer) => {
                            entries.forEach(entry => {
                                if (entry.isIntersecting) {
                                    entry.target.style.opacity = '1';
                                    entry.target.style.transform = 'scale(1)';
                                } else {
                                    entry.target.style.opacity = '0';
                                    entry.target.style.transform = 'scale(0.5)';
                                }
                            });
                        }, observerOptions);

                        let target = document.querySelector('.st-index-content');
                        if (target) {
                            observer.observe(target);
                        }

                        // Intersection Observer for the animated image
                        let imageObserver = new IntersectionObserver((entries, observer) => {
                            entries.forEach(entry => {
                                if (entry.isIntersecting) {
                                    entry.target.classList.add('visible');
                                }
                            });
                        }, observerOptions);

                        let animatedImage = document.querySelector('.animated-image');
                        if (animatedImage) {
                            imageObserver.observe(animatedImage);
                        }
                    });
                </script>
			</div>
		</div>

		<!-- } 콘텐츠 끝 -->

		<!-- 하단 시작 { -->
		<div id="ft" style="background-color: #000000">
			<div id="ft_wr">
				<div class="ft-group1">
					<div id="ft_catch">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_2.png"
							alt="하단 로고">
					</div>
					<ul id="ft-info">
						<li><span>ADDRESS</span> 서울시 구로구 경인로 661,101동 26층</li>
						<li><span>TEL</span> 02-6941-2990</li>
						<li><span>FAX</span> 02-6941-3988</li>
					</ul>
					<div class="ft-family" style="background-color: black;">
						<p style="background-color: black;" p>
							<a href="#">Family Site <i class="material-symbols-rounded">+</i></a>
						</p>
						<ul class="fam-list" style="background-color: black;">
							<li><a target="_blank" href="http://lbinvestment.com/"
								title="새창 열기">LB Investment</a></li>
							<li><a target="_blank" href="http://lb-amc.com/"
								title="새창 열기">LB AssetManagement</a></li>
							<li><a target="_blank" href="http://www.ucesspartners.com/"
								title="새창 열기">LB Ucess</a></li>
							<li><a target="_blank" href="http://www.lbsemicon.com/"
								title="새창 열기">LB Semicon</a></li>
							<li><a target="_blank" href="http://www.lblusem.com/"
								title="새창 열기">LB Lusem</a></li>
							<li><a target="_blank" href="http://lb-pe.com/"
								title="새창 열기">LB Private Equity</a></li>
							<li><a target="_blank" href="https://www.lbhunet.com/"
								title="새창 열기">LB Hunet</a></li>
						</ul>
					</div>
				</div>

				<div class="ft-group2">
					<div id="ft_copy">© 2024 LB NEST ALL RIGHTS RESERVED</div>
					<div id="ft_copy">(주) LB NEST는 NH농협은행과 KB국민은행과 대출모집위탁계약을 체결한
						대출모집법인 입니다.</div>
					<div id="ft_link">
						<a class="privacy">개인정보처리방침</a> <a class="privacy">영상정보처리기기 운영
							및 관리방침</a>
					</div>
				</div>
			</div>

			<script>
                $(function () {
                    $("#top_btn").on("click", function () {
                        $("html, body").animate({
                            scrollTop: 0
                        }, '500');
                        return false;
                    });
                });
            </script>
		</div>
	</div>

	<!-- Google tag (gtag.js) -->
	<script async=""
		src="https://www.googletagmanager.com/gtag/js?id=G-1N3JBBS1HS"></script>
	<script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-1N3JBBS1HS');
    </script>
	<!-- } 하단 끝 -->



	<script>
        const options = {
            root: null,
            rootMargin: "0px",
            threshold: 0.9
        };

        let revealCallback = (entries, self) => {
            entries.forEach((entry) => {
                let container = entry.target;
                let img = entry.target.querySelector("img");
                const easeInOut = "power3.out";
                const revealAnim = gsap.timeline({
                    ease: easeInOut
                });

                if (entry.isIntersecting) {
                    revealAnim.set(container, {
                        visibility: "visible"
                    });
                    revealAnim.fromTo(
                        container, {
                        clipPath: "polygon(0 0, 0 0, 0 100%, 0% 100%)",
                        webkitClipPath: "polygon(0 0, 0 0, 0 100%, 0% 100%)"
                    }, {
                        clipPath: "polygon(0 0, 100% 0, 100% 100%, 0 100%)",
                        webkitClipPath: "polygon(0 0, 100% 0, 100% 100%, 0 100%)",
                        duration: 1,
                        ease: easeInOut
                    }
                    );
                    revealAnim.from(img, 4, {
                        scale: 1.4,
                        ease: easeInOut,
                        delay: -1
                    });
                    self.unobserve(entry.target);
                }
            });
        };

        let revealObserver = new IntersectionObserver(revealCallback, options);

        document.querySelectorAll(".reveal").forEach((reveal) => {
            revealObserver.observe(reveal);
        });
    </script>

	<script type="text/javascript">
        // Scroll to the desired section on click
        function scrollToSection(event) {
            event.preventDefault();
            var $section = $($(this).attr('href'));
            $('html, body').animate({
                scrollTop: $section.offset().top
            }, 500);
        }
        $('[data-scroll]').on('click', scrollToSection);
    </script>

	<script>
        $(function () {
            // 폰트 리사이즈 쿠키있으면 실행
            font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
        });
    </script>

	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript">
        if (!wcs_add) var wcs_add = {};
        wcs_add["wa"] = "1c00af0038c77a0";
        if (window.wcs) {
            wcs_do();
        }
    </script>

</body>

</html>
