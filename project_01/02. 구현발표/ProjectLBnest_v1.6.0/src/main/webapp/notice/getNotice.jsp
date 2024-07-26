<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LB NEST 공지사항 내용</title>
<!-- css 적용 -->
<link rel="stylesheet" href="./resources/css/noticeStyles.css" />
<!-- Font Awesome 링크 추가 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- 글 삭제시 경고창 띄우기 -->
<script type="text/javascript">
	function confirmDelete(url) {
		if (confirm("정말 이 글을 삭제하실 건가요?")) {
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
			<!-- 공지사항 상단 이미지 및 글자 -->
			<div class="n_header">
				<i class="fa-solid fa-envelope-circle-check"
					style="font-size: 40px;"></i>
				<h1 style="margin-left: 10px;">공지사항</h1>
			</div>
			<!-- 글 불러오기 및 글 수정 -->
			<form action="getNoticeModify.do" method="post">
				<input name="n_seq" type="hidden" value="${notice.n_seq}" />
				<p align="center"
					style="border-bottom: 3px solid black; font-size: 30px; font-weight: bold;">
					${notice.n_title}</p>

				<table class="n_table"
					style="margin-left: auto; margin-right: auto; text-align: center;">
					<tr>
						<td align="center">작성자 : <c:if
								test="${sessionScope.m_grade == 1}">
					${sessionScope.m_name} 
					</c:if> &nbsp;조회수 : ${notice.n_count} &nbsp; 작성일 : ${notice.n_regDate}
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
								value="글수정하기" /></td>
						</tr>
					</c:if>
				</table>
			</form>
			<hr>
			<!-- 관리자 모드로 세션에서 받은 값을 통해 관리자 버튼 확인 가능 -->
			<div
				style="margin-left: auto; margin-right: auto; text-align: center;">
				<c:if test="${sessionScope.m_grade == 1}">
					<button class="n_button"
						onclick="location.href='./notice/insertNotice.jsp'">글등록</button>
		&nbsp;
		<button class="n_button"
						onclick="confirmDelete('deleteNotice.do?n_seq=${notice.n_seq}')">글삭제</button>
				</c:if>
				&nbsp;
				<button class="n_button" onclick="location.href='getNoticeList.do'">글목록</button>
			</div>
		</div>
	</div>
</div>
<c:import url="../LB_NEST_UNDER.jsp"></c:import>

</body>
</html>