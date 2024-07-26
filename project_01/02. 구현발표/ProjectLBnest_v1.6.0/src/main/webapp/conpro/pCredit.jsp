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

<title>�ſ����</title>
<style>

body {
   background-image: url('../resources/main_image/header_image/sky01.jpg');
   background-repeat: no-repeat;		 /* �̹��� �ݺ� ���� */
   background-size: cover; 				 /* �̹����� ȭ�� ��ü�� ������ ���� */
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
        var navBarHeight = $('#fixed-header').height(); // �׺���̼� ���� ���� ��������
        var newPosition = scrollTop + floatPosition + navBarHeight + 30;

        // ������ ���̸� �ִ밪���� ����
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var maxPosition = documentHeight - leftColumnHeight - 300; // �ִ밪�� ������ �ϴܿ��� 300px ���� ����
        var minPosition = 0; 										// �ּҰ� ���� (��ܿ��� ������ �Ÿ�)

        // newPosition ���� �ִ밪�� �ּҰ� ���̷� ����
        newPosition = Math.min(newPosition, maxPosition);
        newPosition = Math.max(newPosition, minPosition);

        $("#leftColumn").stop().animate({
            "top": newPosition + "px"
        }, 500);
    }).scroll();

    // �׺���̼� �ٰ� ���� �� ��ġ ����
    $('#fixed-header').on('mouseenter', function() {
        var navBarHeight = $(this).height();
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var newPosition = floatPosition + navBarHeight + 150;

        // ������ ���̸� �ִ밪���� ����
        var maxPosition = documentHeight - leftColumnHeight - 300; // �ִ밪�� ������ �ϴܿ��� 300px ���� ����
        var minPosition = 0; 										// �ּҰ� ���� (��ܿ��� ������ �Ÿ�)

        // newPosition ���� �ִ밪�� �ּҰ� ���̷� ����
        newPosition = Math.min(newPosition, maxPosition);
        newPosition = Math.max(newPosition, minPosition);

        $("#leftColumn").css('top', newPosition + 'px');
    });

    // �׺���̼� �ٰ� ���� �� ��ġ ����
    $('#fixed-header').on('mouseleave', function() {
        var navBarHeight = $(this).height();
        var documentHeight = $(document).height();
        var leftColumnHeight = $("#leftColumn").height();
        var newPosition = floatPosition + navBarHeight + 50;

        // ������ ���̸� �ִ밪���� ����
        var maxPosition = documentHeight - leftColumnHeight - 300; // �ִ밪�� ������ �ϴܿ��� 300px ���� ����
        var minPosition = 0; 										// �ּҰ� ���� (��ܿ��� ������ �Ÿ�)

        // newPosition ���� �ִ밪�� �ּҰ� ���̷� ����
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
		<h2>�ſ����</h2>
	</div>
	<div id="titleBackground"></div>
	<div id="main-container">
		<div id="container">
			<div id="content1">
				<div id="leftColumn">
					<h2>
						�ſ����<br />��ǰ ���
					</h2>
					<br />
					<ul>
						<c:forEach var="product" items="${productList}">
							<c:if test="${product.classification == '�ſ����'}">
								<li><a href="#"
									onclick="scrollToProduct('${product.pname}')">${product.pname}</a>
									<hr /></li>
							</c:if>
						</c:forEach>
					</ul>
					<h3>
						<a href="consult.jsp">��� ��û�ϱ�</a>
					</h3>
				</div>
			</div>

			<div id="content2">
				<c:forEach var="product" items="${productList}">
					<c:if test="${product.classification == '�ſ����'}">
						<div class="product-section" id="${product.pname}">
							<h3>${product.pname}</h3>
							<a href="${product.pagelink}" target="_blank" class="detail-link"
								rel="noopener noreferrer">�ڼ�������</a>
							<table class="product-table">
								<tbody>
									<c:if test="${not empty product.feature}">
										<div class="product-detail">
											<span class="label">��ǰƯ¡</span><br /> <span class="value">${product.feature}</span><br />
										</div>
									</c:if>

									<c:if test="${not empty product.qualification}">
										<div class="product-detail">
											<span class="label">�����û�ڰ�</span><br /> <span class="value">${product.qualification}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.loanAmount}">
										<div class="product-detail">
											<span class="label">����ݾ�</span><br /> <span class="value">${product.loanAmount}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.payback}">
										<div class="product-detail">
											<span class="label">����Ⱓ �� ��ȯ ���</span><br /> <span
												class="value">${product.payback}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.target}">
										<div class="product-detail">
											<span class="label">������</span><br /> <span class="value">${product.target}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.applyFor}">
										<div class="product-detail">
											<span class="label">�����û �ñ�</span><br /> <span class="value">${product.applyFor}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.autoLoan}">
										<div class="product-detail">
											<span class="label">�ڵ�����</span><br /> <span class="value">${product.autoLoan}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.paybackMethod}">
										<div class="product-detail">
											<span class="label">��ȯ���</span><br /> <span class="value">${product.paybackMethod}</span><br />
										</div>
									</c:if>
									<c:if test="${not empty product.cashback}">
										<div class="product-detail">
											<span class="label">ĳ�ù�</span><br /> <span class="value">${product.cashback}</span><br />
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



	<!-- ��ũ�� ����� ���� JavaScript -->
	<script>
		function scrollToProduct(productName, link) {
			var element = document.getElementById(productName);
			if (element) {
				element.scrollIntoView({
					behavior : 'smooth'
				});
			}

			// ��� ��ũ���� active Ŭ���� ����
			var links = document.querySelectorAll('#leftColumn a');
			links.forEach(function(lnk) {
				lnk.classList.remove('active');
			});

			// Ŭ���� ��ũ�� active Ŭ���� �߰�
			link.classList.add('active');
		}
	</script>
</body>
</html>
