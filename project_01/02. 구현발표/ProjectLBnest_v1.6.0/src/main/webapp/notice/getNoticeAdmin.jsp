<%@ page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>LB NEST �������� ����</title>
    <!-- css ���� -->
    <link rel="stylesheet" href="./resources/css/noticeStyles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allPage.css" type="text/css" />
    <!-- Font Awesome ��ũ �߰� -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <!-- jQuery CDN�� ����ϱ� ���� script �±� �߰� -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
    /* ���Ͼ��ε� ��ư */
        input[type=file]::file-selector-button {
            top: 50%;
            background-color: black;
            color: #fff;
            border: none;
            border-radius: 2px;
        }
        <!-- �� ������ ���â ���� -->
    </style>
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
    <div id="main-container">
        <div id="second-container">
            <!-- �������� ��� �̹��� �� ���� -->
            <div class="n_header">
                <i class="fa-solid fa-envelope-circle-check" style="font-size: 40px;"></i>
                <h1 style="margin-left: 10px;">��������</h1>
            </div>
            <!-- �� �ҷ����� �� �� ���� -->
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <form action="updateNotice.do" method="post" enctype="multipart/form-data">
                    <input name="n_seq" type="hidden" value="${notice.n_seq}" />
                    <p style="border-bottom: 3px solid black;">
                        <input name="n_title" type="text" style="background-color: #F6F6F6; margin-bottom: 20px;" value="${notice.n_title}" />
                    </p>
                    <table class="n_table" style="margin-left: auto; margin-right: auto; text-align: center;">
                        <tr>
                            <td align="center">�ۼ��� : 
                                <c:if test="${sessionScope.m_grade == 1}">
                                    ${sessionScope.m_name}
                                </c:if> 
                                &nbsp;��ȸ�� : ${notice.n_count} &nbsp; �ۼ��� : ${notice.n_regDate}
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
                                    <input type="checkbox" name="deleteFile" value="true"> ���� ����
                                </c:if> 
                                <br> 
                                <input type="file" name="n_upload" />
                            </td>
                        </tr>
                        <c:if test="${sessionScope.m_grade == 1}">
                            <tr>
                                <td align="center">
                                    <input class="n_button" type="submit" value="�����ϱ�" />
                                </td>
                            </tr>
                        </c:if>
                    </table>
                   <!--  ���� ���� js -->
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
                                            console.log('���� ���� ����');
                                        },
                                        error: function(xhr, status, error) {
                                            console.error('���� ���� ����: ' + error);
                                        }
                                    });
                                }
                            });
                        });
                    </script>
                </form>
            </div>
            <hr>
            <!-- ������ ���� ���ǿ��� ���� ���� ���� ������ ��ư Ȯ�� ���� -->
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <c:if test="${sessionScope.m_grade == 1}">
                    <button class="n_button" onclick="location.href='notice/insertNotice.jsp'">���۵��</button>
                    &nbsp;
                    <button class="n_button" onclick="confirmDelete('deleteNotice.do?n_seq=${notice.n_seq}')">�ۻ���</button>
                </c:if>
                &nbsp;
                <button class="n_button" onclick="location.href='getNoticeList.do'">�۸��</button>
            </div>
        </div>
    </div>
    <c:import url="../LB_NEST_UNDER.jsp"></c:import>
</body>
</html>
