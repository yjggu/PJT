<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
<!-- �߰� -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- �߰� -->
<title>����ȭ��</title>
<script>
	function encodeAndRedirect(classification) {
		const encodedClassification = encodeURIComponent(classification);
		/* encodeURIComponent */
		window.open('getProductList.do?classification=' + encodedClassification, '_blank');
		/* window.open : ��â ����
		classification = "encodedClassification"�� �͸� ��â ���� */
	}
</script>

</head>

<body>
	<center>
		<h1>�� �� ȭ ��</h1>

		<br />
		<h3>�̿��� ���� _ (����ȭ��:������)</h3>
		<br />
		<hr>
		<h2>
			<a href="javascript:encodeAndRedirect('���ô㺸����');">���ô㺸����</a>
			<a href="javascript:encodeAndRedirect('�����ڱݴ���');">�����ڱݴ���</a>
			<a href="javascript:encodeAndRedirect('�ſ����');">�ſ����</a>
			<a href="javascript:encodeAndRedirect('�ڵ�������');">�ڵ�������</a>
		</h2>
		<br /><br /><br />
		<h2>
			<a href="../conpro/consult.jsp" target="_blank">�ٷ� ����û</a>
		</h2>
		<br /><br /><br />
		<h2>
			<a href="../conpro/iMortgage.jsp" target="_blank">���� �ȳ�</a>
			<a href="../conpro/iLease.jsp" target="_blank">���� �ȳ�</a>
			<a href="../conpro/iCredit.jsp" target="_blank">�ſ� �ȳ�</a>
			<a href="../conpro/iCar.jsp" target="_blank">�ڵ��� �ȳ�</a>
		</h2>
		
	</center>
</body>
</html>
