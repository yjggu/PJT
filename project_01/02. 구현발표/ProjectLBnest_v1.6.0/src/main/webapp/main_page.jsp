
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko"
	class="js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">

<head>

<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="/theme/basic/img/img-site.jpg">

<title>LB NEST</title>

<script>
	   function encodeAndRedirect(classification) {
	      const encodedClassification = encodeURIComponent(classification);
	      /* encodeURIComponent */
	      window.open('conpro/getProductList.do?classification=' + encodedClassification, '_blank');
	      /* window.open : 새창 열기
			classification = "encodedClassification"인 것만 새창 열기 */
	   }
</script>
<!-- 라이브러리 -->
<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/css/default.css?ver=171222">
<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/skin/latest/basic/style.css?ver=171222">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">

<script>
	        // 자바스크립트에서 사용하는 전역변수 선언
	        var g5_url = "";
	        var g5_bbs_url = "https://www.lbhunet.com/bbs";
	        var g5_is_member = "";
	        var g5_is_admin = "";
	        var g5_is_mobile = "";
	        var g5_bo_table = "";
	        var g5_sca = "";
	        var g5_editor = "";
	        var g5_cookie_domain = "";
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpageStyles.css">
<style>
#demo-1 {
	background:
		url('${pageContext.request.contextPath}/resources/main_image/mainImg.jpg')
		no-repeat center center;
	background-size: cover;
	position: relative;
	heiht: 90%;
	margin-top: auto;
}
</style>

<!-- top버튼 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
    $(function() {
        // 스크롤 위치를 확인하는 함수
        function checkScroll() {
            // 스크롤 위치가 창 높이의 1/3을 넘으면
            if ($(window).scrollTop() > $(window).height() / 3) { 
                $("#Quick_button").fadeIn(); // 버튼을 나타냄
            } else {
                $("#Quick_button").fadeOut(); // 버튼을 숨김
            }
        }
        $("#Quick_button").hide();
        // 페이지 로드 시 스크롤 위치 확인
        checkScroll();

        // 스크롤 이벤트
        $(window).on("scroll", function() {
            checkScroll();
        });

        // TOP 버튼 클릭 이벤트
        $("#top_btn").on("click", function() {
            $("html, body").animate({scrollTop:0}, '500'); // 상단으로 스크롤
            return false;
        });
    });
</script>


</head>


<body data-aos-easing="easeOutCubic" data-aos-duration="800"
	data-aos-delay="0" style="height: 2713px;">

	<!-- 상단 시작 { -->
	<div id="hd" class="header"
		style="position: fixed; top: 0; left: 0; z-index: 1000; background-color: white;">
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
				<a href="http://localhost:8081/loan/main_page.jsp">
				<img src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
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
					<li style="z-index: 1000"><a href="" target="_self"
						style="font-weight: bold; color: black;">회사소개</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ceoMessage" target="_self"
									style="font-weight: bold; color: black;">CEO 인사말</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#secondPage" target="_self"
									style="font-weight: bold; color: black;">LB WAY</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#ciPage" target="_self"
									style="font-weight: bold; color: black;">CI</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#valuePage" target="_self"
									style="font-weight: bold; color: black;">핵심가치</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#orgPage.jsp" target="_self" 
									style="font-weight: bold; color: black;">조직도</a></li>
								<li><a href="http://localhost:8081/loan/CompanyIntro.jsp#regisPage" target="_self"
									style="font-weight: bold; color: black;">대출모집인(법인) 등록증</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000"><a href="" target="_self"
						style="font-weight: bold; color: black;">대출상담사 및 채용안내</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사 역할</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사 확인</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">대출상담사 채용</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();"
									target="_self" style="font-weight: bold; color: black;">Top Performer 상담사</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: black;">&nbsp;&nbsp;대출안내&nbsp;&nbsp;</a>
						<div class="menu" style="position: absolute; display: none;">
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
						style="font-weight: bold; color: black;">업무자료실</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self"
									style="font-weight: bold; color: black;">내부통제</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self"
									style="font-weight: bold; color: black;">상품 메뉴얼</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self"
									style="font-weight: bold; color: black;">입사(채용/해지) 양식</a></li>
								<li><a href="javascript:void(0);" onclick="showAlert();" target="_self"
									style="font-weight: bold; color: black;">서류 양식함</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: black;">커뮤니티</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self" style="font-weight: bold; color: black;">공지사항</a></li>
								<c:if test="${sessionScope.m_id != null }">
									<li><a
										href="${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }"
										target="_self" style="font-weight: bold; color: black;">마이페이지</a></li>
								</c:if>
								<li><a href="http://localhost:8081/loan/conpro/direction.jsp" target="_self"
									style="font-weight: bold; color: black;">오시는 길</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">사내마당</a></li>
							</ul>
						</div></li>
				</ul>
				<div id="gnb_background" style="position: absolute; display: none;"></div>
			</nav>

			<!-- 모바일메뉴 -->
			<div class="btn_hamburger">
				<span style="background-color: black;"></span> <span
					style="background-color: black;"></span> <span
					style="background-color: black;"></span>
			</div>

			<div id="navigation"
				style="display: none; background-color: white; color: black;">
				<div class="mobile-slider-top">
					<div class="mo-logo">
						<a><img
							src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_1.png"
							alt="엘비네스트"></a>
					</div>
					<i class="material-symbols-rounded close-menu"
						style="color: black; font-weight: bold; transform: none; transition: none; animation: none;">close</i>
				</div>

				<div class="dBox">
					<div class="d-slogan" style="color: black; font-weight: bold;">
						Good People, <br>Genuine Trust
					</div>

					<ul id="d-schedule" style="color: black;">
						<li style="z-index: 1000"><a href="" target="_self"
							style="color: black; font-weight: bold;">회사소개</a>
							<ul>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#ceoMessage" target="_self"
									class="" style="color: black; font-weight: bold;">- CEO 인사말</a></li>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#secondPage" target="_self"
									class="" style="color: black; font-weight: bold;">- LB WAY</a></li>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#ciPage" target="_self"
									class="" style="color: black; font-weight: bold;">- CI</a></li>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#valuePage" target="_self"
									class="" style="color: black; font-weight: bold;">- 핵심가치</a></li>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#orgPage.jsp" target="_self"
									class="" style="color: black; font-weight: bold;">- 조직도</a></li>
								<li class=""><a href="http://localhost:8081/loan/CompanyIntro.jsp#regisPage" target="_self"
									class="" style="color: black; font-weight: bold;">- 대출모집인(법인) 등록증</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self"
							style="color: black; font-weight: bold;">대출상담사 및 채용안내</a>
							<ul>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 대출상담사 역할</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 대출상담사 확인</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 대출상담사 채용</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- Top Performer
										상담사</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self"
							style="color: black; font-weight: bold;">대출안내</a>
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
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self"
							style="color: black; font-weight: bold;">업무자료실</a>
							<ul>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 내부통제</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_blank" class=""
									style="color: black; font-weight: bold;">- 상품 메뉴얼</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 입사(채용/해지) 양식</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 서류 양식함</a></li>
							</ul></li>

						<li style="z-index: 1000"><a href="javascript:void(0);" onclick="showAlert();" target="_self"
							style="color: black; font-weight: bold;">커뮤니티</a>
							<ul>
								<li class=""><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self" class=""
									style="color: black; font-weight: bold;">- 공지사항</a></li>
								<c:if test="${sessionScope.m_id != null }">
									<li><a
										href="${pageContext.request.contextPath}/member/getMember.do?m_id=${sessionScope.m_id }&m_grade=${sessionScope.m_grade }"
										target="_self" style="font-weight: bold; color: black;">-
											마이페이지</a></li>
								</c:if>
								<li class=""><a href="http://localhost:8081/loan/conpro/direction.jsp" target="_self" class=""
									style="color: black; font-weight: bold;">- 오시는 길</a></li>
								<li class=""><a href="javascript:void(0);" onclick="showAlert();" target="_self" class=""
									style="color: black; font-weight: bold;">- 사내마당</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="luxy"
		style="width: 100%; position: fixed; transform: translate3d(0px, 0px, 0px);">
		<!-- 콘텐츠 시작 { -->
		<div id="wrapper">
			<div id="container_wr">
				<!--  메인 이미지 -->
				<br> <br>
				<div id="demo-1" data-zs-overlay="dots" class="overlay-dots">
					<div class="loan-content"
						style="display: flex; align-items: center; justify-content: space-between;">

						<p class="center-text" data-aos="fade" data-aos-delay="600"
							data-aos-duration="2000"
							style="margin: 0; padding: 0; text-align: left; line-height: 1.8;">
							LB 네스트는 고객에게 최선을 다하는 대출 서비스를 제공합니다. <br>먼저 고객을 생각하고, 고객을 먼저
							찾아가는 대출모집법인<br /> <strong>㈜ LB Nest</strong> <br> <br>
					</div>
					<!-- <script type="text/javascript" src="/js/modernizr-2.6.2.min.js"></script>
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
	                    </script> -->
				</div>



				<!-- 대출상품 안내 보기 버튼 -->
				<br> <br>
				<div class="mainpageContainer">
					<div class="mainpageLoan home">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/apartment.PNG"
							alt="주택담보" style="margin-top: 30px;" />
						<h1 style="margin-bottom: 30px;">
							주택담보대출<br>상품 보기
						</h1>
						<a href="javascript:encodeAndRedirect('mortgage');" target="_self"
							id="loan-1" class="loan-option">상품보기 클릭 </a>
					</div>
					<div class="mainpageLoan lease">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/home.PNG"
							alt="전세대출" style="margin-top: 30px;" />
						<h1 style="margin-bottom: 30px;">
							전세자금대출<br>상품 보기
						</h1>
						<a href="javascript:encodeAndRedirect('lease');" target="_self"
							id="loan-2" class="loan-option">상품보기 클릭 </a>
					</div>
					<div class="mainpageLoan credit">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/money.PNG"
							alt="신용대출" style="margin-top: 30px;" />
						<h1 style="margin-bottom: 30px;">
							신용대출<br>상품 보기
						</h1>
						<a href="javascript:encodeAndRedirect('credit');" target="_self"
							id="loan-3" class="loan-option">상품보기 클릭 </a>
					</div>
					<div class="mainpageLoan car">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/car.PNG"
							alt="자동차대출" style="margin-top: 30px;" />
						<h1 style="margin-bottom: 30px;">
							자동차대출<br>상품 보기
						</h1>
						<a href="javascript:encodeAndRedirect('car');" target="_self"
							id="loan-4" class="loan-option">상품보기 클릭 </a>
					</div>
				</div>

				<!-- 1, 2번쨰 상자(상담버튼, 비전)-->
				<section class="st-index" style="background-color: white;">
					<div class="content-container" id="content-container">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/mainNest.jpg"
							alt="Animated Image" class="animated-image">
						<div class="text" data-aos="fade-left" data-aos-delay="400"
							data-aos-duration="800">
							<h3>CONSULT</h3>
							<p>
								대출 서비스에 대한 내용을 상세히 알려 드립니다<br> 상담을 신청해보세요
							</p>
						</div>
						<p class="mainCunsel">
							<a href="/loan/conpro/consult.jsp" class="mainCunseLlink">상담신청하기 </a> <img
								src="${pageContext.request.contextPath}/resources/main_image/arrow.PNG"
								alt="화살표"
								style="width: 20px; height: 20px; display: inline-block;" />
						</p>
					</div>
				</section>

				<section class="st-index2" style="background-color: white;">
					<div class="content-container2" id="content-container-2">
						<img
							src="${pageContext.request.contextPath}/resources/main_image/메인하단사진.jpg"
							alt="Animated Image 2" class="animated-image">
						<div class="text" data-aos="fade-left" data-aos-delay="400"
							data-aos-duration="800">
							<h3>VISIONS</h3>
							<p>
								새로운 비전을 제시하며 <br> 고객의 성공을 위해 함께하는<br> ㈜ LB Nest
							</p>
						</div>
					</div>
				</section>

				<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
				<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
				<script>
    document.addEventListener('DOMContentLoaded', function () {
        let contentContainers = document.querySelectorAll('.content-container, .content-container2');

        if (contentContainers) {
            let observerOptions = {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            };

            let observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    } else {
                        entry.target.classList.remove('visible');
                    }
                });
            }, observerOptions);

            contentContainers.forEach(container => observer.observe(container));
        }

        AOS.init();
    });
    </script>

				<!-- CI -->
				<section id="ci-section1" class="ci-section1" style="background-color: white; padding: 40px;">
    <div style="text-align: center;" data-aos="zoom-in" data-aos-delay="200" id="ci-content">
        <img src="${pageContext.request.contextPath}/resources/main_image/엘비로고.png" alt="CI 이미지" style="max-width: 40%;" data-aos="zoom-in" data-aos-delay="200">
        <h1 style="font-size: 100px; text-align: center;">
            <strong>Look Beyond, Look People</strong>
        </h1>
        <br> <br>
        <p style="font-size: 40px;">
            <strong>LB</strong>의 상징은 사람, 별의 이미지를 모티프로 <br> 다양한 크기의 별이 모여<br>
            커다란 원을 이루고 <span style="color: #0095DA;"><strong>새로운 세상(Look Beyond)</strong></span>을 <br> 바라보며 도전한다는 정신을 가지고 있습니다
        </p>
    </div>
</section>
<!-- 
<script>
document.addEventListener('DOMContentLoaded', function () {
    AOS.init({
        once: false // 애니메이션이 스크롤을 지날 때마다 반복되도록 설정
    });

    let content = document.getElementById('ci-content');

    if (content) {
        let observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        };

        let observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.remove('aos-animate'); // 애니메이션 초기화
                    void entry.target.offsetWidth; // 강제 리플로우(reflow)를 트리거
                    entry.target.classList.add('aos-animate'); // 애니메이션 재적용
                }
            });
        }, observerOptions);

        observer.observe(content);
    }
});
</script> -->
				<br> <br>
				<!-- 엘비네스트 간단 소개글 -->
				<section class="st-index" style="background-color: white;">
					<div class="content-container3">
						<div class="text" data-aos="fade-left" data-aos-delay="400"
							data-aos-duration="800">
							<p>
								<strong>LB NEST</strong>는 <br> LB의 상징과 같은 모든 고객 분들 <br>하나
								하나 소중한 별의 가치로 여기며<br> NEST(둥지)와 같은 편안한 보금자리를 제공받을 수 있도록 <br>도움을
								주고자 합니다
							</p>
							<p class="mainCunsel">
								<a href="" class="mainCunseLlink">LB NEST에 대해 알아보기</a> <img
									src="${pageContext.request.contextPath}/resources/main_image/arrow.PNG"
									alt="화살표"
									style="width: 20px; height: 20px; display: inline-block;" />
							</p>
						</div>
						<img
							src="${pageContext.request.contextPath}/resources/main_image/mainNest2.jpg"
							alt="Animated Image3" style="width: 400px; height: 600px;">
					</div>
				</section>

				<script>
    document.addEventListener('DOMContentLoaded', function () {
        let contentContainers = document.querySelectorAll('.content-container, .content-container2, .content-container3');

        if (contentContainers) {
            let observerOptions = {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            };

            let observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    } else {
                        entry.target.classList.remove('visible');
                    }
                });
            }, observerOptions);

            contentContainers.forEach(container => observer.observe(container));
        }

        AOS.init();
    });
    </script>


				<!-- 협력사 애니메이션 -->
				<div class="ft-collaboration"
					style="display: flex; justify-content: center; align-items: center; gap: 10px; position: relative; height: 200px; overflow: hidden;">
					<img
						src="${pageContext.request.contextPath}/resources/main_image/combined_image.jpg"
						alt="Collaboration Logos" class="collaboration-container"
						style="max-width: 100%; height: auto;"> <img
						src="${pageContext.request.contextPath}/resources/main_image/combined_image.jpg"
						alt="Collaboration Logos"
						class="collaboration-container duplicate"
						style="max-width: 100%; height: auto;">
				</div>

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
							alt="lbneset_logo">
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
					<div id="ft_copy">2024 LB NEST ALL RIGHTS RESERVED</div>
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
	<!--  하단 끝 -->
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
    
   <!--  준비중입니다 알림팝 -->
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
    
    
    
	<!-- top버튼 -->
	<div style="height: 1500px;"></div>

	<div id="Quick_button" class="quick_button">
		<ul>
			<li><a href="javascript:void(0)" id="top_btn"><span>▲<br>TOP
				</span></a></li>
		</ul>
	</div>
</body>
</html>