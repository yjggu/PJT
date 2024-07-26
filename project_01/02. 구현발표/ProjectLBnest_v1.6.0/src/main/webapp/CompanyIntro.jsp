<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COMPANY INTRODUCTION</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/CompanyIntro.css" />

<script>
window.onload = () => {
  const Slider = function(pages, pagination) {
    let slides = [],
        btns = [],
        count = 0,
        current = 0,
        touchstart = 0,
        animation_state = false;

    const init = () => {
      slides = pages.children;
      count = slides.length;
      for(let i = 0; i < count; i++) {
        slides[i].style.bottom = -(i * 100) + '%';
        let btn = document.createElement('li');
        btn.dataset.slide = i;
        btn.addEventListener('click', btnClick);
        btns.push(btn);
        pagination.appendChild(btn);
      }
      btns[0].classList.add('active');
      adjustPagesHeight();
    }

    const gotoNum = (index) => {
      if((index != current) && !animation_state) {
        animation_state = true;
        setTimeout(() => animation_state = false, 500);
        btns[current].classList.remove('active');
        current = index;
        btns[current].classList.add('active');
        for(let i = 0; i < count; i++) {
          slides[i].style.bottom = (current - i) * 100 + '%';
        }
      }
    }

    const gotoNext = () => current < count - 1 ? gotoNum(current + 1) : false;
    const gotoPrev = () => current > 0 ? gotoNum(current - 1) : false;
    const btnClick = (e) => gotoNum(parseInt(e.target.dataset.slide));
    pages.ontouchstart = (e) => touchstart = e.touches[0].screenY;
    pages.ontouchend = (e) => touchstart < e.changedTouches[0].screenY ? gotoPrev() : gotoNext();
    pages.onmousewheel = pages.onwheel = (e) => e.deltaY < 0 ? gotoPrev() : gotoNext();

    init();
  }

  let pages = document.querySelector('.pages');
  let pagination = document.querySelector('.pagination');
  let slider = new Slider(pages, pagination);

  function adjustPagesHeight() {
    let headerHeight = document.getElementById('header').offsetHeight;
    let footerHeight = document.getElementById('footer').offsetHeight;
    pages.style.height = `calc(100vh - ${headerHeight}px - ${footerHeight}px)`;
  }

  window.addEventListener('resize', adjustPagesHeight);
  adjustPagesHeight();
}
</script>

<script type="text/javascript">
	function showHoverContent(card) {
	    card.querySelector('.default-content').classList.add('hidden');
	    card.querySelector('.hover-content').classList.remove('hidden');
	}
	
	function hideHoverContent(card) {
	    card.querySelector('.default-content').classList.remove('hidden');
	    card.querySelector('.hover-content').classList.add('hidden');
	}
</script>

<script>
	//"Top" 버튼 기능
	function topFunction() {
	    document.querySelector('.first.page').scrollIntoView({ behavior: 'smooth' });
	}
	// 특정 섹션으로 스크롤
	function scrollToSection() {
	    var section = document.getElementById("ceoMessage");
	    section.scrollIntoView({ behavior: "smooth" });
	}
	
	// 페이지 로드 시 버튼을 화면 오른쪽 하단에 고정
	window.onscroll = function() {
	    var topButton = document.getElementById("topButton");
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	        topButton.style.display = "block";
	    } else {
	        topButton.style.display = "block"; // 항상 보이게 설정
	    }
	};
</script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    if (window.location.hash) {
      var element = document.querySelector(window.location.hash);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth' });
      }
    }
  });
</script>
<style>
body {
	background-image: url('./resources/main_image/header_image/sky01.jpg')
		!important;
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: top;
	background-color: #fff;
	position: relative;
	zoom: 1;
}
</style>


</head>

<body>

	<div id="header">
		<c:import url="./LB_NEST_HEADER.jsp"></c:import>
	</div>

	<div class="pages">
		<!-- 첫번째 페이지 첫번째 페이지 첫번째 페이지 첫번째 페이지 첫번째 페이지  -->
		<div class="first page" id="ceoMessage">
			<h1 class="title1">CEO 인사말</h1>
			<div class="content1">
				<div class="text-and-image1">
					<div class="text1 animated-slide-left">
						<h2>LB NEST를 찾아주셔서 감사합니다.</h2>
						<br />
						<h4>
							안녕하십니까, <span class="highlight01">LB네스트</span>를 찾아주신 고객 여러분, 진심으로
							환영합니다.
						</h4>
						<p>
							LB네스트는 고객 여러분께 <span class="highlight01">안정적이고 전문적인 금융 서비스</span>를
							제공하기 위해 <br /> 언제나 여러분 곁에서 최선을 다하고 있습니다.
						</p>
						<p>
							먼저 고객을 생각하고 고객에게 먼저 찾아가는 서비스로, 고객의 다양한 금융 니즈에<br /> 신속 정확한 최적의
							솔루션 서비스를 제공하는 것을 최고의 목표로 삼고 있습니다.
						</p>
						<p>
							저희 LB네스트는 <span class="highlight01">열정</span>과 <span
								class="highlight01">전문성</span>을 가진 인재들로 구성되어 있으며, <span
								class="highlight01">고객의 신뢰</span>, <span class="highlight01">고객
								만족</span>을<br /> LB네스트 구성원들은 최고의 가치로 여기며 고객의 성공과 미래를 위해 함께 노력하고자 합니다.
						</p>
						<p>
							저희 <span class="highlight01">LB네스트</span> 임직원 일동은 고객과 함께하는 지금
							이순간도 감사와 고마움을 표하며<br /> 언제나 여러분의 니즈를 충족하는 금융전문 세일즈 기업이 되고자 합니다.
						</p>

						<p>늘 고객님들의 건강과 행복을 기원합니다.</p>
						<p>감사합니다.</p>
						<p>
							<strong>- LB네스트 임직원 올림 -</strong>
						</p>
					</div>
					<div class="image-container1 animated-slide-right">
						<img
							src="${pageContext.request.contextPath}/resources/yj_image/consult07.jpg"
							alt="CEO 이미지" />
					</div>
				</div>
			</div>
		</div>


		<!--  두번째 페이지 두번째 페이지 두번째 페이지 두번째 페이지 두번째 페이지 -->
		<div class="second page" id="secondPage">
			<h1 class="title2">LB WAY</h1>
			<div class="timeline">
				<div class="timeline-event-wrapper">
					<div class="timeline-year">2024</div>
					<div class="timeline-event animate-right">
						<div class="timeline-dot"></div>
						<div class="timeline-date">03</div>
						<div class="timeline-content">
							<p>LB네스트 출범</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="timeline-event-wrapper">
					<div class="timeline-year">2024</div>
					<div class="timeline-event animate-right"
						style="animation-delay: 0.5s;">
						<div class="timeline-dot"></div>
						<div class="timeline-date">07</div>
						<div class="timeline-content">
							<p>**은행 업무협약 (예정)</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="timeline-event-wrapper">
					<div class="timeline-year">2024</div>
					<div class="timeline-event animate-right"
						style="animation-delay: 1s;">
						<div class="timeline-dot"></div>
						<div class="timeline-date">09</div>
						<div class="timeline-content">
							<p>금감원 대출성 상품 금융상품판매대리중개업 등록(예정)</p>
						</div>
					</div>
				</div>
				<hr>
			</div>
		</div>
		
		
		<!-- CI번째 페이지 CI번째 페이지 CI번째 페이지 CI번째 페이지 CI번째 페이지 CI번째 페이지 -->
		<div class="sixth page" id="ciPage">
			<h1 class="title1">CI</h1>
			<div class="content5">
				<div class="ci-container">
					<img
						src="${pageContext.request.contextPath}/resources/yj_image/ci.png"
						alt="대출모집인 등록증 이미지" class="small-img">
				</div>
			</div>
		</div>


		<!--  세번째 페이지 세번째 페이지 세번째 페이지 세번째 페이지 세번째 페이지 -->
		<div class="third page" id="valuePage">
			<h1 class="title2">LB 핵심가치</h1>
			<div class="card_top_container">
				<div class="card_container">
					<div class="card" onmouseover="showHoverContent(this)"
						onmouseout="hideHoverContent(this)">
						<div class="default-content">
							<p>동반성장</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/handshake01.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>A</h1>
							<h2>ccompanying</h2>
							<div class="card-content">
								<ul>
									<li>개인에 대한 <span class="li-highlight01">존중</span></li>
									<li>상대방에 대한 <span class="li-highlight01">배려</span></li>
									<li><span class="li-highlight01">일과 삶,</span> 회사와 가정의 <span
										class="li-highlight01">균형</span></li>
									<li>임직원이 <span class="li-highlight01">행복</span>할 수 있는 바람직한
										직장 문화
									</li>
									<li>회사, 고객, 구성원의 <span class="li-highlight01">동반성장</span></li>
								</ul>
							</div>
						</div>
						<div class="hover-content hidden">
							<p>동반성장</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/handshake02.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>A</h1>
							<h2>ccompanying</h2>
							<div class="card-content">
								<ul>
									<li><span>존중</span></li>
									<li>각 개개인을 존중하고 상대방의 입장에서 배려하며 다양성을 인정</li>
									<li><span>행복</span></li>
									<li>일과 삶 그리고 회사와 가정의 균형, 바람직한 직장 문화를 토대로 한 임직원의 행복</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card" onmouseover="showHoverContent(this)"
						onmouseout="hideHoverContent(this)">
						<div class="default-content">
							<p>도전정신</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/rocket01.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>C</h1>
							<h2>hallenging</h2>
							<div class="card-content">
								<ul>
									<li><span class="li-highlight01">미래</span>에 대한 끊임없는 <span
										class="li-highlight01">관심</span>과 관찰</li>
									<li>긴 안목에서의 <span class="li-highlight01">목적과 가치</span></li>
									<li>고객과 시대의 요구에 한 발 <span class="li-highlight01">앞선
											대응</span></li>
									<li>현실 <span class="li-highlight01">안주</span>를 <span
										class="li-highlight01">거부</span>하는 과감한 시도
									</li>
									<li>공동의 목표를 향한 <span class="li-highlight01">건전한 경쟁</span></li>
								</ul>
							</div>
						</div>
						<div class="hover-content hidden">
							<p>도전정신</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/rocket02.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>C</h1>
							<h2>hallenging</h2>
							<div class="card-content">
								<ul>
									<li><span>변화</span></li>
									<li>현실에 안주하지 않고 변화를 주도하여 시대의 흐름 및 요구에 선제적으로 대응</li>
									<li><span>도전</span></li>
									<li>도전적인 목표를 피하지 않고, 자율과 창의를 바탕으로 고객이 원하는 이상의 새로운 가치를 창출</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card" onmouseover="showHoverContent(this)"
						onmouseout="hideHoverContent(this)">
						<div class="default-content">
							<p>인재중시</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/light01.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>T</h1>
							<h2>alent</h2>
							<div class="card-content">
								<ul>
									<li>끊임없는 자기혁신</li>
									<li>최고 수준의 독특한 경쟁력</li>
									<li>원칙과 윤리, 책임 하에 스스로 주도하는 몰입</li>
									<li>고객과 파트너로부터의 신뢰와 인정</li>
									<li>인재에 대한 한없는 대우</li>
								</ul>
							</div>
						</div>
						<div class="hover-content hidden">
							<p>인재중시</p>
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/main_image/light02.png"
								style="width: 50px !important; margin-left: 150px;"><br>
							<h1>T</h1>
							<h2>alent</h2>
							<div class="card-content">
								<ul>
									<li><span>열정</span></li>
									<li>주인의식과 주도적 마인드를 기반으로 특화된 경쟁력을 끊임없이 함양</li>
									<li><span>인재중시</span></li>
									<li>최고 수준의 인재를 육성 및 영입하고, 합당한 보상과 자기개발 기회를 제공</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!--  네번째 페이지 네번째 페이지 네번째 페이지 네번째 페이지 네번째 페이지  -->
		<div class="fourth page" id="orgPage">
			<h1 class="title1">조직도</h1>
			<div class="content4">
				<img
					src="${pageContext.request.contextPath}/resources/yj_image/organization.png"
					alt="조직도 이미지" class="small-organization-img">
			</div>
		</div>

		<!-- 다섯번째 페이지 다섯번째 페이지 다섯번째 페이지 다섯번째 페이지 다섯번째 페이지 -->
		<div class="fifth page" id="regisPage">
			<h1 class="title2">대출모집인(법인)등록증</h1>
			<div class="content5">
				<img
					src="${pageContext.request.contextPath}/resources/main_image/registration.jpg"
					alt="대출모집인 등록증 이미지" class="small-img">
			</div>
		</div>

	</div>



	<div class="corner-image-left">
		<img
			src="${pageContext.request.contextPath}/resources/yj_image/lb_icon_half1.png"
			alt="Corner Image">
	</div>
	<div class="corner-image-right ">
		<img
			src="${pageContext.request.contextPath}/resources/yj_image/lb_icon_half1.png"
			alt="Corner Image">
	</div>
	<!-- 페이지네이션 페이지네이션 페이지네이션 페이지네이션 페이지네이션 페이지네이션 -->
	<ul class="pagination"></ul>

	<div id="footer">
		<c:import url="./LB_NEST_UNDER.jsp"></c:import>
	</div>

	<!-- <button onclick="scrollToSection()" id="topButton" title="Go to top">Top</button> -->



</body>

</html>
