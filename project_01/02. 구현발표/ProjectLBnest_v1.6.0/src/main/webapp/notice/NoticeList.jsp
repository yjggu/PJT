<%@page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- css ���� -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticeStyles.css"
	type="text/css" />
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/allPage.css"
	type="text/css" /> --%>

<!-- Font Awesome ��ũ �߰� -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
	
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>LB NEST ��������</title>

<style>
/* �������� ���������̼� */
.n_new_notice_page {
	top: 50%;
	background-color: black;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.n_pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	list-style-type: none;
	padding: 0;
	margin: 20px 0;
}

.n_pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	list-style-type: none;
	padding: 0;
	margin: 20px 0;
}

.n_pagination a {
	text-decoration: none;
	color: #333;
	padding: 2px 5px;
	margin: 0 4px;
	border: 1px solid black;
	border-radius: 10%;
	transition: background-color 0.3s, color 0.3s;
}

.n_pagination a:hover {
	background-color: gray;
}

.n_pagination .active {
	font-weight: bold;
	background-color: #00008D;
	color: white;
	border-color: #000113;
}

.n_pagination .next1, .n_pagination .next2 {
	font-weight: bold;
	background-color: skyblue;
	color: white;
	border-radius: 30px;
}

.n_pagination .next1:hover, .n_pagination .next2:hover {
	background-color: gray;
	color: white;
}
</style>
</head>
<c:import url="../LB_NEST_HEADER2.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1>NOTICE</h1>
</div>
<div class="container">
	<div id="main-container">
		<div id="second-container">
			<!-- �������� ��� �̹��� �� ���� -->
			<div class="n_header">
				<i class="fa-solid fa-envelope" style="font-size: 40px;"></i>
				<h1 style="margin-left: 10px;">��������</h1>
			</div>
			<!-- �˻�â -->
			<div class="n_search_container">
				<form action="getNoticeList.do" method="post">
					<table style="">
						<tr>
							<td><select name="searchCondition">
									<c:forEach items="${conditionMap}" var="option">
										<option value="${option.value}">${option.key}
									</c:forEach>
							</select> <input type="text" name="searchKeyword" class="n_keyword"
								placeholder="�˻�� �Է��ϼ���" />
								<button type="submit" class="n_glass_submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button></td>
						</tr>
					</table>
				</form>
			</div>
			<br> <br>
			<!-- �������� �Խ��� -->
			<br>
			<table style="margin-left: auto; margin-right: auto;">
				<tr class="n_menu-bar">
					<th width="70">��ȣ</th>
					<th width="210">����</th>
					<th width="100">�ۼ���</th>
					<th width="210">�����</th>
					<th width="110">��ȸ��</th>
				</tr>
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<td>${notice.n_seq}</td>
						<td><a href="getNotice.do?n_seq=${notice.n_seq}">${notice.n_title}</a></td>
						<td>${notice.n_writer}</td>
						<td>${notice.n_regDate}</td>
						<td>${notice.n_count}</td>
					</tr>
				</c:forEach>
			</table>

			<br>
			<!-- ������ �׺���̼� -->
			<div>
				<ul class="n_pagination">
					<c:if test="${currentPage > 1}">
						<a
							href="getNoticeList.do?page=${currentPage - 1}&size=${pageSize}"
							class="next1"> <i class="fa-solid fa-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="1" end="${totalPages}">
						<a href="getNoticeList.do?page=${i}&size=${pageSize}"
							style="${i == currentPage ? 'font-weight:bold;' : ''}"
							class="number ${i == currentPage ? 'active' : ''}">${i}</a>
					</c:forEach>
					<c:if test="${currentPage < totalPages}">
						<a
							href="getNoticeList.do?page=${currentPage + 1}&size=${pageSize}"
							class="next2"><i class="fa-solid fa-arrow-right"></i></a>
					</c:if>
				</ul>
			</div>
<div>${sessionScope.m_grade}</div>
			<!-- ������ ��� �������� �Խ��� ����ϱ� -->
			<div
				style="margin-left: auto; margin-right: auto; text-align: center;">
				<c:if test="${sessionScope.m_grade == 1}">
					<br>
					<button class="n_button"
						onclick="location.href='notice/insertNotice.jsp'">���� ���</button>
					<button class="n_button" onclick="location.href='logout.do'">�α׾ƿ�</button>
				</c:if>
			</div>
		</div>
	</div>
	</div>
	

</body>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>
</html>