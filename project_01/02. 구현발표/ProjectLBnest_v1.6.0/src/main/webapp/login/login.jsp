<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html> 
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" />
<!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> ajax지원 안함-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>LBnest 로그인</title>

<script type="text/JavaScript">
  // 회원 가입  
  function join() {
    location.href="/loan/member_join/member_join_select.jsp";
  }

function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) {
        return parts.pop().split(";").shift();
    }
}
$(document).ready(function() {
    // 쿠키 값 가져오기
    var ck_id = getCookie("ck_id");
    var ck_id_save = getCookie("ck_id_save");
    console.log('ck_id : '+ck_id);
    console.log('ck_id_save : '+ck_id_save);
    
    // 쿠키 값이 있으면 입력 필드에 설정
    if (ck_id !== undefined && ck_id !== "") {
        $('#m_id').val(ck_id);
    }

    if (ck_id_save === 'y') {
        $('#ck_id_save').prop('checked', true);
    }
  });
  <!-- 로그인 -->
  function login_ajax() {
    var params = "";
    var m_id_input = document.getElementById('m_id').value;
    $('#ck_id').val(m_id_input);

    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    console.log(params);
    $.ajax(
            {
              url: '/loan/member/login.do',
              type: 'post',
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params, // 데이터
              success: function(rdata) { // 응답이 온경우 rdata는 Ajax 요청을 통해 받아온 서버의 응답 데이터

                if (rdata.status === "success") {
	                if (rdata.login_check == 1) {
	                  //// 이전 페이지로 이동 (로그인 성공 후)
	                  //window.location.href = document.referrer;//document.referrer는 현재 페이지로 이동하기 이전에 사용자가 방문한 페이지의 URL을 나타내는 JavaScript의 속성
	                  if (document.referrer) {
						    window.location.href = document.referrer; //로그인하면 이전페이지로 넘어가도록 수정
						} else {
						    // 이전 페이지 정보가 없을 경우 기본 페이지로 리디렉션
						    window.location.href = "/loan/main_page.jsp";
						}
	                  
	                } else {
	                  alert('로그인에 실패했습니다.\n잠시후 다시 시도해주세요.');
	                  
	                }
	              }else {
	                    // 로그인 실패 시
	                    alert("로그인 실패 \n" + rdata.message);
	                }

              },
              // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            }
          );  //  $.ajax END

        }
    
</script> 
<style>

/* 테이블 */

table {
	width: 200px;
	border-collapse: collapse;
	margin: auto;
	border: none;
}
th, td {
	width: auto; 
	font-family: 'KoPubDotumProLight', serif;
	border: 1px solid #ddd;
	white-space: nowrap;
	
	border: none;
}
input {
	background-color: #ebebeb;
	border-width: 0;
	width: 300px;
	height: 40px;
}

</style>
</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>


<div class="titleBackground">
	<h1> LOGIN </h1>
</div>
<div class="container">
<div class="content">
<span style="color: #757575; font-size: 100px; font-weight:bold; display: flex; justify-content: center; align-items: center; padding: 50px;">LOGIN</span>

   <FORM name='frm_login' id='frm_login' method='POST'>
	   <input type='hidden' name='ck_id' id='ck_id' value=''>
	    <%-- <input type="hidden" name="return_url" value="${return_url}"> --%>
		<div class="member-complete-box">
			<%-- <img style="width:200px;" src="${pageContext.request.contextPath}/resources/member/img/login.png"/> --%>
				<table>
				 <tr>
					<td style="text-align:right;"><img  class="loginInputImg" src="${pageContext.request.contextPath}/resources/member/img/id.png"/></td>
					<td style="text-align:center;"><input  type="text" name="m_id" id="m_id" required="required" max="20" value="${ck_id }" placeholder="아이디를 입력하시오.">
					<span id="checkIdMessage"></span>
					</td>
				 </tr>
		 		 <tr>
					<td style="text-align:right;"><img class="loginInputImg" src="${pageContext.request.contextPath}/resources/member/img/pwd.png"/></td>
					<td style="text-align:center;"><input type="password" name="m_pwd" id="m_pwd" required="required" max="20" placeholder="비밀번호를 입력하시오.">
					<span id="checkIdMessage"></span>
					</td>
				 </tr>
					
				<tr>
					<td>
						<div class="custom-control custom-checkbox my-1 mr-sm-2">
						    <input type="checkbox" class="custom-control-input" id="ck_id_save" name="ck_id_save" value='y' ${ck_id_save == 'y' ? "checked='checked'" : "" }>
						    <label class="custom-control-label" for="ck_id_save">아이디 저장</label>
						</div>
					</td>
					<td  style="text-align:right;">
					  <div>
					  	<a href="${pageContext.request.contextPath}/login/loginFind.jsp">아이디/비밀번호 찾기</a>
					  </div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn03" onclick="login_ajax()">로그인</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="btn04" onclick="join()">회원가입</button>
					</td>
				</tr>
			</table>
	     </div>
     </FORM>
     </div>
 </div>    

</body>
  <c:import url="../LB_NEST_UNDER.jsp"></c:import> 
</html>