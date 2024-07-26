<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert 핵심가치</title>
<style type="text/css">
@font-face {
  font-family: 'KoPubDotumProMedium';
  src: url('./resources/font/KoPubDotumProMedium.otf') format('opentype');
  font-weight: 500;
  font-style: normal;
}
.card_top_container {
    font-family: 'KoPubDotumProMedium';
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width: 100vw; /* 부모 컨테이너의 크기를 화면 전체로 설정 */
}

.card_container {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
}

.card {
	position: relative;
    background-color: #008CD6; /* 기본 배경색 */
    color: white;
    padding: 20px;
    border-radius: 10px;
    width: 300px;
    height: 350px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, color 0.3s; /* 호버 시 배경색 및 텍스트 색상 변경을 위한 트랜지션 */

}

.card:nth-child(2) {
    background-color: #0059AB; /* 중간 카드 배경색 */
}

.card:nth-child(3) {
    background-color: #001839; /* 마지막 카드 배경색 */
}
.card:hover {
    background-color: white; /* 기본 배경색 */
    color: black;
    padding: 20px;
    border: 1px solid #D3D3D3; 
    border-radius: 10px;
    width: 300px;
    height: 350px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, color 0.3s; /* 호버 시 배경색 및 텍스트 색상 변경을 위한 트랜지션 */
}
.card h2 {
    margin-top: 0;
}

.card p {
    font-weight: bold;
    margin-bottom: 10px;
}

.default-content ul {
    list-style-type: disc;
}
.hover-content ul {
    list-style-type: none;
}
.card ul li {
    margin-bottom: 10px;
}
.card ul li p {
    display: inline;
}

.card-img{
    position: absolute;
	top: 30px;
	left: 260px;
    width: 50px;

}
.hidden {
    display: none;
}

.default-content h1, .default-content h2{
    display: inline;
    margin-right: 5px;

}
.default-content p, .default-content img{
    display: inline;
    margin-right: 5px;
}
.hover-content h1, .hover-content h2{
    display: inline;
    margin-right: 5px;
}
.hover-content p, .hover-content img{
    display: inline;
    margin-right: 5px;
}
.li-highlight01{
	font-weight: bold;
}
.hover-content h1{
	color: #008CD6;
}
.hover-content span{
	font-weight: bold;
	color: #008CD6;
}
.hover-content p{
	color: #727376;
}
.card-content{
    position: absolute;
    bottom: 20px; /* 원하는 만큼의 아래 여백 설정 */
    width: calc(100% - 40px); /* padding을 고려한 너비 설정 */
	margin-left: -20px;
}
</style>
<script type="text/javascript">
function showHoverContent(card) {
    card.querySelector('.default-content').classList.add('hidden');
    card.querySelector('.hover-content').classList.remove('hidden');
}

function hideHoverContent(card) {
    card.querySelector('.default-content').classList.remove('hidden');
    card.querySelector('.hover-content').classList.add('hidden');
}
</script>
</head>
<body>
<div class="card_top_container">
    <div class="card_container">
        <div class="card" onmouseover="showHoverContent(this)" onmouseout="hideHoverContent(this)">
        	<div class="default-content">
	        		<p>동반성장</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/handshake01.png"><br>
		            <h1>A</h1><h2>ccompanying</h2>
	            <div class="card-content">
		            <ul>
		                <li>개인에 대한 <span class="li-highlight01">존중</span></li>
		                <li>상대방에 대한 <span class="li-highlight01">배려</span></li>
		                <li><span class="li-highlight01">일과 삶,</span> 회사와 가정의 <span class="li-highlight01">균형</span></li>
		                <li>임직원이 <span class="li-highlight01">행복</span>할 수 있는 바람직한 직장 문화</li>
		                <li>회사, 고객, 구성원의 <span class="li-highlight01">동반성장</span></li>
		            </ul>
	            </div>
            </div>
            <div class="hover-content hidden">
	       		<p>동반성장</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/handshake02.png"><br>
	            <h1>A</h1><h2>ccompanying</h2>
			<div class="card-content">
	            <ul>
	                <li><span>존중</span></li>
	                <li>각 개개인을 존중하고 상대방의 입장에서 배려하며 다양성을 인정</li>
	                <li><span>행복</span></li>
	                <li>일과 삶 그리고 회사와 가정의 균형, 바람직한 직장 문화를 토대로 한 임직원의 행복</li>
	                
	            </ul>
            </div>
        </div>
        </div>
        <div class="card" onmouseover="showHoverContent(this)" onmouseout="hideHoverContent(this)">
            <div  class="default-content">
	            <p>도전정신</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/rocket01.png"><br>
	            <h1>C</h1><h2>hallenging</h2>
	            <div class="card-content">
		            <ul>
		                <li><span class="li-highlight01">미래</span>에 대한 끊임없는 <span class="li-highlight01">관심</span>과 관찰</li>
		                <li>긴 안목에서의 <span class="li-highlight01">목적과 가치</span></li>
		                <li>고객과 시대의 요구에 한 발 <span class="li-highlight01">앞선 대응</span></li>
		                <li>현실 <span class="li-highlight01">안주</span>를 <span class="li-highlight01">거부</span>하는 과감한 시도</li>
		                <li>공동의 목표를 향한 <span class="li-highlight01">건전한 경쟁</span></li>
		            </ul>
	            </div>
            </div>
            <div class="hover-content hidden">
	            <p>도전정신</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/rocket02.png"><br>
	            <h1>C</h1><h2>hallenging</h2>            
	            <div class="card-content">
		            <ul>
		            	<li><span>변화</span></li>
		                <li>현시에 안주하지 않고 변화를 주도하여 시대의 흐름 및 요구에 선제적으로 대응</li>
						<li><span>도전</span></li>
		                <li>도전적인 목표를 피하지 않고, 자율과 창의를 바탕으로 고객이 원하는 이상의 새로운 가치를 창출</li>
		            </ul>
	        	</div>
        	</div>
        </div>
        <div class="card" onmouseover="showHoverContent(this)" onmouseout="hideHoverContent(this)">
            <div  class="default-content">
	            <p>인재중시</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/light01.png"><br>
	            <h1>T</h1><h2>alent</h2>
	            <div class="card-content">
		            <ul>
		                <li>끊임없는 자기혁신</li>
		                <li>최고 수준의 독특한 경쟁력</li>
		                <li>원칙과 윤리, 책임 하에 스스로 주도하는 몰입</li>
		                <li>고객과 파트너로부터의 신뢰와 인정</li>
		                <li>인재에 대한 한없는 대우</li>
		            </ul>
            	</div>
            </div>
            <div class="hover-content hidden">
	            <p>인재중시</p><img class="card-img" src="${pageContext.request.contextPath}/resources/main_image/light02.png"><br>
	            <h1>T</h1><h2>alent</h2>           
	            <div class="card-content">
		            <ul>
		            	<li><span>열정</span></li>
		                <li>주인의식과 주도적 마인드를 기반으로 특화된 경쟁력을 끊임없이 함양</li>
						<li><span>인재중시</span></li>
		                <li>최고 수준의 인재를 육성 및 영입하고, 합당한 보상과 자기개발 기회를 제공</li>
		            </ul>
	            </div>
        	</div>
    	</div>
	</div>
</div>

</body>
</html>