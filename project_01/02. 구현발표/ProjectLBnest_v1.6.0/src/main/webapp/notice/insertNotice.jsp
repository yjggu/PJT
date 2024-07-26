<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>LB NEST �������� ���۵��</title>
<!-- css ���� -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticeStyles.css"
	type="text/css" />

<!-- Font Awesome ��ũ �߰� -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- ��ũ��Ʈ ���� -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body{
    background-image: url('../resources/main_image/header_image/balloons.jpg');
    background-repeat: no-repeat; /* �̹��� �ݺ� ���� */
    background-size: 100% auto; /* �̹����� ���� ũ�⿡ ���������� ���� */
    background-position: top; /* �̹����� �� �� �߾ӿ� ��ġ */
    background-color: #fff; /* ������ ������� ä�� */
    position: relative;
    zoom: 1;
}
.n_header {
	position: relative;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 30px;
}
.n_button {
	top: 50%;
	background-color: black;
	color: #fff;
	border: none;
	border-radius: 2px;
	cursor: pointer;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

/* �巡�� �� ��� ��Ÿ�� */
.drop-zone {
	border: 2px dashed #007bff;
	border-radius: 5px;
	padding: 20px;
	text-align: center;
	color: #007bff;
	cursor: pointer;
	transition: background-color 0.3s;
	width: 100%;
	max-width: 400px;
	margin: 20px auto;
	font-size: 12px;
}

.drop-zone.dragover {
	background-color: #e8f0fe;
}
/* �Խñ� ������ �� �ؽ�Ʈ ���� �����ϱ� */
.n_text {
	background-color: #F6F6F6;
	resize: none;
}
/* ���� ���ε� ��ư */
input[type=file]::file-selector-button {
	top: 50%;
	background-color: white;
	color: #007bff;
	border: none;
	border-radius: 2px;
	cursor: pointer;
}
</style>
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
				<i class="fa-regular fa-pen-to-square" style="font-size: 40px;"></i>
				<h1 style="margin-left: 10px;">�������� �ۼ�</h1>
			</div>
			<!-- �� �ۼ��ϱ� -->
			<div style="text-align: center;">
				<form
					action="${pageContext.request.contextPath}/notice/insertNotice.do"
					method="post" enctype="multipart/form-data">
					<p align="center" style="border-bottom: 3px solid black;">
						<input name="n_title" type="text"
							style="background-color: #F6F6F6; margin-bottom: 20px;"
							placeholder="������ �Է��ϼ���" />
					</p>
					<table class="n_table"
						style="margin-left: auto; margin-right: auto; text-align: center;">
						<tr>
							<td align="center">�ۼ��� :<input type="text" name="n_writer"
								size="10" value="${sessionScope.m_name}" style="border: none;" /></td>
						</tr>
						<tr>
							<td>
								<div>
									<textarea name="n_content" cols="60" rows="30"
										placeholder="������ �Է��ϼ���" class="n_text"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="drop-zone" id="drop-zone"
									style="margin: auto;">
									<p>������ �巡���Ͽ� �ø��ų� �Ʒ� '���ϼ���'�� ��������</p>
									<i class="fa-solid fa-folder-open"></i> <input type="file"
										name="n_upload" id="file-input" />
								</div>
							</td>
						</tr>
						<tr>
							<td><input class="n_button" type="submit" value="�� ���" /></td>
						</tr>
					</table>
				</form>
				<hr>
				&nbsp;
				<button class="n_button"
					style="margin-left: 0px; margin-right: 12px"
					onclick="location.href='${pageContext.request.contextPath}/getNoticeList.do'">�۸��</button>
			</div>
		</div>
	</div>
</div>
	<!-- �巡�׾ص�� js -->
	<script>
		$(document).ready(function() {
			var dropZone = $("#drop-zone");

			dropZone.on("dragover", function(e) {
				e.preventDefault();
				e.stopPropagation();
				dropZone.addClass("dragover");
			});

			dropZone.on("dragleave", function(e) {
				e.preventDefault();
				e.stopPropagation();
				dropZone.removeClass("dragover");
			});

			dropZone.on("drop", function(e) {
				e.preventDefault();
				e.stopPropagation();
				dropZone.removeClass("dragover");

				/* var files = e.originalEvent.dataTransfer.files;
				if (files.length > 0) {
					$("#file-input")[0].files = files;
					var reader = new FileReader();
					reader.onload = function(e) {
						dropZone.find("p").text(files[0].name);
					};
					reader.readAsDataURL(files[0]);
				} */
				var files = e.originalEvent.dataTransfer.files;
				if (files.length > 0) {
					$("#file-input")[0].files = files;
					dropZone.find("p").text(files[0].name);
				}
			});

			dropZone.on("click", function() {
				$("#file-input").click();
			});

			$("#file-input").on("change", function() {
				var files = $(this)[0].files;
				if (files.length > 0) {
					dropZone.find("p").text(files[0].name);
				}
			});
		});
	</script>
	<c:import url="../LB_NEST_UNDER.jsp"></c:import>
</body>
</html>