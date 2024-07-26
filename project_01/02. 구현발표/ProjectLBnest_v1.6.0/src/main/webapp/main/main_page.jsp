<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko"
	class="js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
<!-- <meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes"> -->
<meta name="HandheldFriendly" content="true">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="/theme/basic/img/img-site.jpg">

<title>LB NEST</title>

<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/css/default.css?ver=171222">
<link rel="stylesheet"
	href="https://www.lbhunet.com/theme/basic/skin/latest/basic/style.css?ver=171222">

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


</head>


<body data-aos-easing="easeOutCubic" data-aos-duration="800"
	data-aos-delay="0" style="height: 2713px;">
<c:import url="LB_NEST_HEADER.jsp"></c:import>
	<div id="luxy"
		style="width: 100%; position: fixed; transform: translate3d(0px, 0px, 0px);">
		<!-- 콘텐츠 시작 { -->
		<div id="wrapper">
			<div id="container_wr">
				<!-- mVisual -->
				<div id="demo-1" data-zs-overlay="dots" class="overlay-dots">
					<div class="visual-txt luxy-el" data-speed-y="-10"
						style="transform: translate3d(0px, 0px, 0px); background-color: rgba(0, 0, 0, 0.5); border-radius: 5px; padding: 40px;">
						<div class="loan-content"
							style="display: flex; align-items: center; justify-content: space-between;">
							<div class="loan-container" style="margin-right: 20px;">
								<a href="" target="_self" id="loan-1" class="loan-option"
									style="font-weight: bold; text-decoration: none; color: inherit;">주택담보대출</a>
								<a href="" target="_self" id="loan-2" class="loan-option"
									style="font-weight: bold; text-decoration: none; color: inherit;">전세자금대출</a>
								<a href="" target="_self" id="loan-3" class="loan-option"
									style="font-weight: bold; text-decoration: none; color: inherit;">신용대출</a>
								<a href="" target="_self" id="loan-4" class="loan-option"
									style="font-weight: bold; text-decoration: none; color: inherit;">자동차대출</a>
							</div>
							<p class="center-text" data-aos="fade" data-aos-delay="600"
								data-aos-duration="2000"
								style="margin: 0; padding: 0; font-weight: bold;">
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
                    </script>
				</div>

				<!-- // mVisual -->

				<!-- 통합된 섹션 시작 -->
				<section class="st-index" style="background-color: white;">

					<section class="st-index-careers">
						<div class="bg"></div>
						<div class="idx-careers">
							<div class="animated-image-container">
								<img
									src="${pageContext.request.contextPath}/resources/main_image/메인하단사진.jpg"
									alt="Animated Image" class="animated-image">
							</div>

							<div class="car-txt aos-init" data-aos="fade-left"
								data-aos-delay="400" data-aos-duration="800">
								<h3 style="color: black; font-weight: bold;">VISIONS</h3>
								<p style="color: black; font-weight: 350; font-weight: bold;">
									신뢰와 투명성을 통해 <br> 고객의 꿈과 목표를 도와주고<br> 최고가 되기 위해 도전하는 ㈜
									LB Nest
								</p>
							</div>
						</div>
					</section>

					<!-- st-index-content 클래스를 여기에 추가 -->
					<section class="st-index-content"
						style="padding: 20px; margin-bottom: 20px; box-sizing: border-box; width: 100%; overflow: hidden; opacity: 0; transition: opacity 1s ease-in-out, transform 1s ease-in-out;">
						<div class="inner"
							style="display: flex; justify-content: flex-end; align-items: center; width: 100%;">
							<div style="margin-right: 200px;">
								<a href="" target="_blank"
									style="padding: 10px 20px; background-color: black; color: #fff; font-weight: bold; text-decoration: none; text-align: center; border-radius: 5px; cursor: default; cursor: pointer;">AI
									챗봇 상담</a>
							</div>
							<div style="margin-right: 50px;">
								<a href="" target="_blank"> <span class="banner"
									style="padding: 10px 20px; background-color: black; color: #fff; font-weight: bold; text-decoration: none; text-align: center; border-radius: 5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer;">
										상담신청 </span>
								</a>

							</div>
						</div>
					</section>

					<div class="ft-collaboration"
						style="display: flex; justify-content: center; align-items: center; gap: 10px; position: relative; height: 200px; overflow: hidden;">
						<img
							src="${pageContext.request.contextPath}/resources/main_image//협업기업체.jpg"
							alt="Collaboration Logos" class="image-container"
							style="max-width: 100%; height: auto;"> <img
							src="${pageContext.request.contextPath}/resources/main_image//협업기업체.jpg"
							alt="Collaboration Logos" class="image-container duplicate"
							style="max-width: 100%; height: auto;">
					</div>
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

@
keyframes slideLeft { 0% {
	transform: translateX(0);
}
100








%
{
transform








:








translateX






(








-100






%
)






;
}
}
</style>
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