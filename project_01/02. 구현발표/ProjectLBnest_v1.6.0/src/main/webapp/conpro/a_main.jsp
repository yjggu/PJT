<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
<!-- 추가 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 추가 -->
<title>메인화면</title>
<script>
	function encodeAndRedirect(classification) {
		const encodedClassification = encodeURIComponent(classification);
		/* encodeURIComponent */
		window.open('getProductList.do?classification=' + encodedClassification, '_blank');
		/* window.open : 새창 열기
		classification = "encodedClassification"인 것만 새창 열기 */
	}
</script>

</head>

<body>
	<center>
		<h1>메 인 화 면</h1>

		<br />
		<h3>미연결 상태 _ (메인화면:김형기)</h3>
		<br />
		<hr>
		<h2>
			<a href="javascript:encodeAndRedirect('주택담보대출');">주택담보대출</a>
			<a href="javascript:encodeAndRedirect('전세자금대출');">전세자금대출</a>
			<a href="javascript:encodeAndRedirect('신용대출');">신용대출</a>
			<a href="javascript:encodeAndRedirect('자동차대출');">자동차대출</a>
		</h2>
		<br /><br /><br />
		<h2>
			<a href="../conpro/consult.jsp" target="_blank">바로 상담신청</a>
		</h2>
		<br /><br /><br />
		<h2>
			<a href="../conpro/iMortgage.jsp" target="_blank">주택 안내</a>
			<a href="../conpro/iLease.jsp" target="_blank">전세 안내</a>
			<a href="../conpro/iCredit.jsp" target="_blank">신용 안내</a>
			<a href="../conpro/iCar.jsp" target="_blank">자동차 안내</a>
		</h2>
		
	</center>
</body>
</html>
