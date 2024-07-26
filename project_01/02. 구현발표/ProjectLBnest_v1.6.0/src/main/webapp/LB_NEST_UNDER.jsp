<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LB Nest Footer</title>

<link rel="stylesheet"
   href="https://www.lbhunet.com/theme/basic/skin/latest/basic/style.css?ver=171222">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet"
   href="https://www.lbhunet.com/js/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/under_style.css">
 <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	    $(".ft-family p a").on("click", function(e) {
	        e.preventDefault();
	        $(".fam-list").slideToggle(); // 하단 길이가 늘어나도록 애니메이션 효과
	    });
	});
</script>
</head>
<body>
<div class="footer">
   <div id="ft" class="fixed-bottom" style="background-color: #000000">
      <div id="ft_wr">
         <div class="ft-group1">
            <div id="ft_catch">
               <img
                  src="${pageContext.request.contextPath}/resources/main_image/엘비네스트_2.png"
                  alt="lbnest_logo">
            </div>
            <ul id="ft-info">
               <li><span>ADDRESS</span> 서울시 구로구 경인로 661,101동 26층</li>
               <li><span>TEL</span> 02-6941-2990</li>
               <li><span>FAX</span> 02-6941-3988</li>
            </ul>
            <div class="ft-family" style="background-color: black;">
               <p style="background-color: black;">
                  <a href="#">Family Site <i class="material-symbols-rounded">+</i></a>
               </p>
               <ul class="fam-list" style="background-color: black;">
                  <li><a target="_blank" href="http://lbinvestment.com/"
                     title="새창 열기">LB Investment</a></li>
                  <li><a target="_blank" href="http://lb-amc.com/"
                     title="새창 열기">LB AssetManagement</a></li>
                  <li><a target="_blank" href="http://www.ucesspartners.com/"
                     title="새창 열기">LB Ucess</a></li>
                  <li><a target="_blank" href="http://www.lbsemicon.com/"
                     title="새창 열기">LB Semicon</a></li>
                  <li><a target="_blank" href="http://www.lblusem.com/"
                     title="새창 열기">LB Lusem</a></li>
                  <li><a target="_blank" href="http://lb-pe.com/" title="새창 열기">LB
                        Private Equity</a></li>
                  <li><a target="_blank" href="https://www.lbhunet.com/"
                     title="새창 열기">LB Hunet</a></li>
               </ul>
            </div>
         </div>
         <div class="ft-group2">
            <div id="ft_copy">© 2024 LB NEST ALL RIGHTS RESERVED</div>
            <div id="ft_copy">(주) LB NEST는 NH농협은행과 KB국민은행과 대출모집위탁계약을 체결한
               대출모집법인 입니다.</div>
            <div id="ft_link">
               <a class="privacy">개인정보처리방침</a> <a class="privacy">영상정보처리기기 운영
                  및 관리방침</a>
            </div>
         </div>
      </div>
   </div>
</div>   
</body>
</html>
