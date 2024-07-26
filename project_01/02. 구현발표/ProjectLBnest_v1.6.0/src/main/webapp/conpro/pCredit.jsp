<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productStyle.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_styles.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/under_style.css">

<title>신용대출</title>
<style>

body {
   background-image: url('../resources/main_image/header_image/sky01.jpg');
   background-repeat: no-repeat;		 /* 이미지 반복 안함 */
   background-size: cover; 				 /* 이미지가 화면 전체를 덮도록 조정 */
   margin: 0;
   padding: 0;
   position: relative;
   zoom: 1; 
}
</style>



<script>
$(document).ready(function() {
    var floatPosition = parseInt($("#leftColumn").css('top'));

    $(window).scroll(function() {
        var scrollTop = $(window).scrollTop();
        var navBarHeight = $('#fixed-header').height(); // 네비게이션 바의 높이 가져오기
        var newPosition = scrollTop + floatPosition + navBarHeight + 30;

        // 페이지 높이를 최대값으로 설정
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var maxPosition = documentHeight - leftColumnHeight - 300; // 최대값을 페이지 하단에서 300px 위로 설정
        var minPosition = 0; 										// 최소값 설정 (상단에서 떨어진 거리)

        // newPosition 값을 최대값과 최소값 사이로 제한
        newPosition = Math.min(newPosition, maxPosition);
        newPosition = Math.max(newPosition, minPosition);

        $("#leftColumn").stop().animate({
            "top": newPosition + "px"
        }, 500);
    }).scroll();

    // 네비게이션 바가 열릴 때 위치 조정
    $('#fixed-header').on('mouseenter', function() {
        var navBarHeight = $(this).height();
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var newPosition = floatPosition + navBarHeight + 150;

        // 페이지 높이를 최대값으로 설정
        var maxPosition = documentHeight - leftColumnHeight - 300; // 최대값을 페이지 하단에서 300px 위로 설정
        var minPosition = 0; 										// 최소값 설정 (상단에서 떨어진 거리)

        // newPosition 값을 최대값과 최소값 사이로 제한
        newPosition = Math.min(newPosition, maxPosition);
        newPosition = Math.max(newPosition, minPosition);

        $("#leftColumn").css('top', newPosition + 'px');
    });

    // 네비게이션 바가 닫힐 때 위치 조정
    $('#fixed-header').on('mouseleave', function() {
        var navBarHeight = $(this).height();
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var newPosition = floatPosition + navBarHeight + 50;

        // 페이지 높이를 최대값으로 설정
        var maxPosition = documentHeight - leftColumnHeight - 300; // 최대값을 페이지 하단에서 300px 위로 설정
        var minPosition = 0; 										// 최소값 설정 (상단에서 떨어진 거리)

        // newPosition 값을 최대값과 최소값 사이로 제한
        newPosition = Math.min(newPosition, maxPosition);
        newPosition = Math.max(newPosition, minPosition);

        $("#leftColumn").css('top', newPosition + 'px');
    });
});
</script>


</head>

<body>
	<div id="fixed-header">
		<c:import url="../LB_NEST_HEADER.jsp"></c:import>
	</div>
	<div id="title">
		<h2>신용대출</h2>
	</div>
	<div id="titleBackground"></div>
	<div id="main-container">
		<div id="container">
			<div id="content1">
				<div id="leftColumn">
					<h2>
						신용대출<br />상품 목록
					</h2>
					<br />
					<ul>
						<c:forEach var="product" items="${productList}">
							<c:if test="${product.classification == '신용대출'}">
								<li><a href="#"
									onclick="scrollToProduct('${product.pname}')">${product.pname}</a>
									<hr /></li>
							</c:if>
						</c:forEach>
					</ul>
					<h3>
						<a href="consult.jsp">상담 신청하기</a>
					</h3>
				</div>
			</div>

			<div id="content2">
				<c:forEach var="product" items="${productList}">
					<c:if test="${product.classification == '신용대출'}">
						<div class="product-section" id="${product.pname}">
							<h3>${product.pname}</h3>
							<a href="${product.pagelink}" target="_blank" class="detail-link"
								rel="noopener noreferrer">자세히보기</a>
							<table class="product-table">
								<tbody>
									<c:if test="${not empty product.feature}">
										<div class="product-detail">
											<span class="label">상품특징</span><br /> <span class="value">${product.feature}</span><br />
										</div>
									</c:if>

									<c:if test="${not empty product.qualification}">
										<div class="product-detail">
											<span class="label">대출신청자격</span><br /> <span class="value">${product.qualification}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.loanAmount}">
										<div class="product-detail">
											<span class="label">대출금액</span><br /> <span class="value">${product.loanAmount}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.payback}">
										<div class="product-detail">
											<span class="label">대출기간 및 상환 방법</span><br /> <span
												class="value">${product.payback}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.target}">
										<div class="product-detail">
											<span class="label">대출대상</span><br /> <span class="value">${product.target}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.applyFor}">
										<div class="product-detail">
											<span class="label">대출신청 시기</span><br /> <span class="value">${product.applyFor}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.autoLoan}">
										<div class="product-detail">
											<span class="label">자동대출</span><br /> <span class="value">${product.autoLoan}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.paybackMethod}">
										<div class="product-detail">
											<span class="label">상환방법</span><br /> <span class="value">${product.paybackMethod}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.cashback}">
										<div class="product-detail">
											<span class="label">캐시백</span><br /> <span class="value">${product.cashback}</span><br />
										</div>
									</c:if>
								</tbody>
							</table>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="fixed-bottom">
		<c:import url="../LB_NEST_UNDER.jsp"></c:import>
	</div>



	<!-- 스크롤 기능을 위한 JavaScript -->
	<script>
		function scrollToProduct(productName, link) {
			var element = document.getElementById(productName);
			if (element) {
				element.scrollIntoView({
					behavior : 'smooth'
				});
			}

			// 모든 링크에서 active 클래스 제거
			var links = document.querySelectorAll('#leftColumn a');
			links.forEach(function(lnk) {
				lnk.classList.remove('active');
			});

			// 클릭된 링크에 active 클래스 추가
			link.classList.add('active');
		}
	</script>
</body>
</html>
