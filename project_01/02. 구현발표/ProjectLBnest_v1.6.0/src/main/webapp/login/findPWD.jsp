<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<meta charset="EUC-KR">
<title>LBnest ���̵�/��й�ȣ ã��</title>

</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>


<div class="titleBackground">
	<h1> ID/PWD ã�� </h1>
</div>
    <div class="container">
    <div class="content">
        <h1>LBnest ���̵�/��й�ȣ ã��</h1>
	<!-- ȸ������ �Ϸ� �ڽ� -->
	<div class="member-complete-box">
		<img style="width:200px;" src="${pageContext.request.contextPath}/resources/member/img/member_complete.png"/>
		<div>${m_email}���� �ӽ� ��й�ȣ�� �����Ͽ����ϴ�. <br>�α��� �� ȸ���������� ��й�ȣ�� �������ּ���.</div>

		<div class="btn-container">  
			<button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/member/login.do'">�α���</button>
		    <button type="button" class="btn03" onclick="location.href='${pageContext.request.contextPath}/home.jsp'">����ȭ��</button>
	  </div>
	</div>
	</div>
</div>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>    
</body>
</html>