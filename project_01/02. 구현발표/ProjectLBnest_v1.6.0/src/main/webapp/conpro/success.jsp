<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title>����û�Ϸ�</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header_styles.css" />

<style>
body {
	background-image: url('../resources/main_image/header_image/sky01.jpg');
	background-repeat: no-repeat; /* �̹��� �ݺ� ���� */
	background-size: cover; /* �̹����� ȭ�� ��ü�� ������ ���� */
	margin: 0;
	padding: 0;
	position: relative;
	zoom: 1;
}

#main-container {
	margin-top: 200px;
	background-color: white;
	padding-bottom: 50px;
	/* 	padding-top: 50px; */
}

#fixed-header {
	height: 500px;
	line-height: 50px;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

#container {
	/* 	border: 1px solid; */
	width: 1184px;
	text-align: center;
	margin: auto;
	margin-top: 150px;
	padding-top: 150px;
	padding-bottom: 150px;
	padding-left: 50px;
	padding-right: 50px;
	border-radius: 7px;
}

.content {
	/*     border: 1px solid red; */
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
	width: 100%;
	border-radius: 7px;
	margin-bottom: 50px;
	text-align: center;
}

h1 {
	font-size: 24px;
	margin-top: 50px;
	background-color: #e1eeff;
	padding: 50px;
}

h3 {
	font-size: 18px;
	margin: 10px 0;
}

button {
	background-color: #0078d7;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin: 0 auto; /* ���� �߾� ���� */
}

button:hover {
	background-color: #003080; /* ȣ�� �� ��� ���� ���� */
	border-color: #003080; /* ȣ�� �� �׵θ� ���� ���� */
}
</style>

</head>

<body>
	<div id="fixed-header">
		<c:import url="../LB_NEST_HEADER.jsp"></c:import>
	</div>
	
	<div id="main-container">
		<div id="container">
			<div class="content">
				<h1>��� ��û�� �Ϸ�Ǿ����ϴ�.</h1>
				<h3>�����մϴ�.</h3>
				<br />
			</div>
			<button type="button" onclick="goToMain()">���� ȭ������ ����</button>
		</div>
	</div>
	
	<div id="fixed-bottom">
		<c:import url="../LB_NEST_UNDER.jsp"></c:import>
	</div>
	
	<script>
		function goToMain() {
			window.location.href = "../main_page.jsp";
		}
	</script>
</body>
</html>
