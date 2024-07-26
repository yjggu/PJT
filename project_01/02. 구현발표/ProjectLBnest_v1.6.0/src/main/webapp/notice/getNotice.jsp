<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LB NEST �������� ����</title>
<!-- css ���� -->
<link rel="stylesheet" href="./resources/css/noticeStyles.css" />
<!-- Font Awesome ��ũ �߰� -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- �� ������ ���â ���� -->
<script type="text/javascript">
	function confirmDelete(url) {
		if (confirm("���� �� ���� �����Ͻ� �ǰ���?")) {
			location.href = url;
		}
	}
</script>
</head>
<body>
<c:import url="../LB_NEST_HEADER2.jsp"></c:import>
<div class="titleBackground">
	<h1>NOTICE</h1>
</div>
<div class="container">	
	<div id="main-container">
		<div id="second-container">
			<!-- �������� ��� �̹��� �� ���� -->
			<div class="n_header">
				<i class="fa-solid fa-envelope-circle-check"
					style="font-size: 40px;"></i>
				<h1 style="margin-left: 10px;">��������</h1>
			</div>
			<!-- �� �ҷ����� �� �� ���� -->
			<form action="getNoticeModify.do" method="post">
				<input name="n_seq" type="hidden" value="${notice.n_seq}" />
				<p align="center"
					style="border-bottom: 3px solid black; font-size: 30px; font-weight: bold;">
					${notice.n_title}</p>

				<table class="n_table"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr>
						<td align="center">�ۼ��� : <c:if
								test="${sessionScope.m_grade == 1}">
					${sessionScope.m_name} 
					</c:if> &nbsp;��ȸ�� : ${notice.n_count} &nbsp; �ۼ��� : ${notice.n_regDate}
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>${notice.n_content}</td>
					</tr>
					<tr>
						<td align="center"><c:if test="${not empty notice.filename}">
								<img src="./notice/imagefile/${notice.filename}" width="400"
									height="300" alt="${notice.filename}">
							</c:if></td>
					</tr>
					<c:if test="${sessionScope.m_grade == 1}">
						<tr>
							<td align="center"><input class="n_button" type="submit"
								value="�ۼ����ϱ�" /></td>
						</tr>
					</c:if>
				</table>
			</form>
			<hr>
			<!-- ������ ���� ���ǿ��� ���� ���� ���� ������ ��ư Ȯ�� ���� -->
			<div
				style="margin-left: auto; margin-right: auto; text-align: center;">
				<c:if test="${sessionScope.m_grade == 1}">
					<button class="n_button"
						onclick="location.href='./notice/insertNotice.jsp'">�۵��</button>
		&nbsp;
		<button class="n_button"
						onclick="confirmDelete('deleteNotice.do?n_seq=${notice.n_seq}')">�ۻ���</button>
				</c:if>
				&nbsp;
				<button class="n_button" onclick="location.href='getNoticeList.do'">�۸��</button>
			</div>
		</div>
	</div>
</div>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>

</body>
</html>