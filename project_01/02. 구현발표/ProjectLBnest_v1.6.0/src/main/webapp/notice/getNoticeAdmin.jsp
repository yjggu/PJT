<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>LB NEST 공지사항 내용</title>
    <!-- css 적용 -->
    <link rel="stylesheet" href="./resources/css/noticeStyles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allPage.css" type="text/css" />
    <!-- Font Awesome 링크 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <!-- jQuery CDN을 사용하기 위한 script 태그 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    /* 파일업로드 버튼 */
        input[type=file]::file-selector-button {
            top: 50%;
            background-color: black;
            color: #fff;
            border: none;
            border-radius: 2px;
        }
        <!-- 글 삭제시 경고창 띄우기 -->
    </style>
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
    <div id="main-container">
        <div id="second-container">
            <!-- 공지사항 상단 이미지 및 글자 -->
            <div class="n_header">
                <i class="fa-solid fa-envelope-circle-check" style="font-size: 40px;"></i>
                <h1 style="margin-left: 10px;">공지사항</h1>
            </div>
            <!-- 글 불러오기 및 글 수정 -->
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <form action="updateNotice.do" method="post" enctype="multipart/form-data">
                    <input name="n_seq" type="hidden" value="${notice.n_seq}" />
                    <p style="border-bottom: 3px solid black;">
                        <input name="n_title" type="text" style="background-color: #F6F6F6; margin-bottom: 20px;" value="${notice.n_title}" />
                    </p>
                    <table class="n_table" style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td align="center">작성자 : 
                                <c:if test="${sessionScope.m_grade == 1}">
                                    ${sessionScope.m_name}
                                </c:if> 
                                &nbsp;조회수 : ${notice.n_count} &nbsp; 작성일 : ${notice.n_regDate}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="n_content" cols="60" rows="30" class="n_text">${notice.n_content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <c:if test="${not empty notice.filename}">
                                    <a href="./notice/imagefile/${notice.filename}">${notice.filename}</a>
                                    <input type="checkbox" name="deleteFile" value="true"> 파일 삭제
                                </c:if> 
                                <br> 
                                <input type="file" name="n_upload" />
                            </td>
                        </tr>
                        <c:if test="${sessionScope.m_grade == 1}">
                            <tr>
                                <td align="center">
                                    <input class="n_button" type="submit" value="수정하기" />
                                </td>
                            </tr>
                        </c:if>
                    </table>
                   <!--  파일 삭제 js -->
                    <script>
                        $(document).ready(function() {
                            $('input[name="deleteFile"]').change(function() {
                                if ($(this).is(':checked')) {
                                    var nSeq = $('input[name="n_seq"]').val();
                                    var filename = '${notice.filename}';
                                    $.ajax({
                                        type: 'POST',
                                        url: 'deleteFile.do',
                                        data: {
                                            nSeq: nSeq,
                                            filename: filename
                                        },
                                        success: function(response) {
                                            console.log('파일 삭제 성공');
                                        },
                                        error: function(xhr, status, error) {
                                            console.error('파일 삭제 실패: ' + error);
                                        }
                                    });
                                }
                            });
                        });
                    </script>
                </form>
            </div>
            <hr>
            <!-- 관리자 모드로 세션에서 받은 값을 통해 관리자 버튼 확인 가능 -->
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <c:if test="${sessionScope.m_grade == 1}">
                    <button class="n_button" onclick="location.href='notice/insertNotice.jsp'">새글등록</button>
                    &nbsp;
                    <button class="n_button" onclick="confirmDelete('deleteNotice.do?n_seq=${notice.n_seq}')">글삭제</button>
                </c:if>
                &nbsp;
                <button class="n_button" onclick="location.href='getNoticeList.do'">글목록</button>
            </div>
        </div>
    </div>
    <c:import url="../LB_NEST_UNDER.jsp"></c:import>
</body>
</html>
