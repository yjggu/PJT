<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
html{
  -webkit-text-size-adjust: none;
  text-size-adjust: none;
}
.ft-family .fam-list li a {
            display: block;
            font-size: 15px;
            color: #a4a4a4;
            letter-spacing: 0;
            padding: 3px 0;
        }

        .ft-family .fam-list li a:hover {
            color: #ddd
        }


        .login_button {
            position: absolute;
            top: 40px;
            right: 110px;
            background: black;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        * {
            font-family: 'KoPub Dotum_Pro Bold', sans-serif !important;
        }

        .image-container {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0;
            transition: opacity 1s ease-out, transform 1s ease-out;
            z-index: 1;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }

        .image-container.animate {
            opacity: 1;
            transform: translateX(0) translateY(-50%);
        }


        .menu ul {
            text-align: center;
            /* ����޴� �ؽ�Ʈ�� �߾� ���� */
        }

        @media (max-width: 768px) {
            .image-container {
                position: static;
                transform: none;
                opacity: 1;
                margin-top: 20px;
                z-index: 1;
            }
        }

        .image-container2 {
            position: absolute;
            right: -500px;
            top: -50%;
            width: auto;
            transform: translateY(-50%);
            transition: opacity 1s ease-out, transform 1s ease-out, border-radius 1s ease-out;
            z-index: 2;
            border-radius: 5%;
            overflow: hidden;
            opacity: 0;
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .image-container2 img {
            max-width: 100%;
            width: 100%;
            height: 100%;
            border-radius: 5%;
        }

        .image-container2.animate {
            transform: translateX(0) translateY(-50%);
            z-index: 2;
            opacity: 1;
        }

        @media (max-width: 768px) {
            .image-container2 {
                position: static;
                transform: none;
                margin-top: 20px;
                z-index: 2;
                border-radius: 5%;
            }
        }

        @keyframes slideInFromRight {
            to {
                transform: translateX(0) translateY(-50%);
            }
        }

        .mVisual {
            overflow: hidden;
            text-align: center;
        }

        .loan-option {
            opacity: 0;
            transform: translateX(-100%);
        }

        .loan-option.animate {
            animation: slideIn 1s forwards ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-100%);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .loan-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
            justify-content: center;
            margin-bottom: 20px;
        }

        .loan-container a {
            padding: 10px 20px;
            border: 5px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            color: #e6edff;
            background-color: black;
        }

        .center-text {
            text-align: center;
            margin-top: 20px;
        }

        .idx-careers {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            height: 100%;
            color: black;
        }

        .animated-image-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            margin-right: 10px;
            margin-top: 20px;
            background-color: white;
        }

        .animated-image {
            opacity: 0;
            transform: translate(150px, 0px);
            transition: opacity 1s ease-in-out, transform 1s ease-in-out;
            width: 100px;
            height: auto;
            border-radius: 10px;
            margin-left: -150px;
            background-color: #000000;
        }

        .animated-image.visible {
            opacity: 1;
            transform: translate(150px, 0px);
            background-color: #000000;
        }

        .car-txt {
            max-width: 600px;
            text-align: right;
            margin-top: 50px;
            background-color: white;
            color: black;
        }


        .ft-collaboration {
            text-align: center;
            background-color: white;
        }

        #demo-1 {
            background: url('resources/main_image/main_img3.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }

        .header.enter {
            background-color: #fff !important;
            backdrop-filter: none !important;
            -webkit-backdrop-filter: none !important;
            transition: all ease-in 2s !important;
        }

        #gnb_background {
            width: 100%;
            height: 350px;
            margin: auto 0;
            display: none;
            overflow: hidden;
            border-top: 1px solid #fff;
            left: 0;
            top: 0;
            background-color: #fff;
            backdrop-filter: none;
            -webkit-backdrop-filter: none;
            z-index: 10;
            transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1);
            /* Ŀ���� �ε巯�� �ִϸ��̼� */
        }

        #gnb ul li:hover #gnb_background,
        #gnb ul li:focus #gnb_background {
            display: block !important;
        }

        #gnb>ul>li>a,
        #gnb ul li .menu ul li a,
        #gnb ul li .menu ul li a:hover {
            color: black !important;
        }

        #gnb ul li:hover .menu,
        #gnb ul li:focus .menu {
            display: block !important;
            background-color: white !important;
            transition: all 0.5s cubic-bezier(0.25, 0.1, 0.25, 1);
            /* Ŀ���� �ε巯�� �ִϸ��̼� */
        }
</style>

</head>
<body>

	<!-- ��� ���� { -->
	<div id="hd" class="header"
		style="position: fixed; top: 0; left: 0; z-index: 1000; background-color: white;">
		<h1 id="hd_h1">����׽�Ʈ</h1>

		<div id="skip_to_container">
			<a href="#container">���� �ٷΰ���</a>
		</div>

		<!-- �˾����̾� ���� { -->
		<div id="hd_pop">
			<h2>�˾����̾� �˸�</h2>
			<span class="sound_only">�˾����̾� �˸��� �����ϴ�.</span>
		</div>

		<script>
            $(function () {
                $(".hd_pops_reject").click(function () {
                    var id = $(this).attr('class').split(' ');
                    var ck_name = id[1];
                    var exp_time = parseInt(id[2]);
                    $("#" + id[1]).css("display", "none");
                    set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
                });
                $('.hd_pops_close').click(function () {
                    var idb = $(this).attr('class').split(' ');
                    $('#' + idb[1]).css('display', 'none');
                });
                $("#hd").css("z-index", 1000);
            });
        </script>
		<!-- } �˾����̾� �� -->

		<div id="hd_wrapper">

			<div id="logo">
				<a><img
					src="${pageContext.request.contextPath}/resources/main_image/����׽�Ʈ_1.png"
					alt="����׽�Ʈ"></a>
			</div>

			<!-- �α��� ��ư �߰� -->
			<c:choose>
				<c:when test="${sessionScope.m_id != null}">
					<a href="${pageContext.request.contextPath}/member/logout.do"
						class="login_button">�α׾ƿ�</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login/login.jsp"
						class="login_button">�α���</a>
				</c:otherwise>
			</c:choose>

			<nav id="gnb">
				<h2>���θ޴�</h2>
				<ul>
					<li style="z-index: 1000"><a href="" target="_self"
						style="font-weight: bold; color: black;">ȸ��Ұ�</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">CEO �λ縻</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">LB WAY</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">CI</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">������</a></li>
								<li><a href="registration.jsp" target="_self"
									style="font-weight: bold; color: black;">���������(����) �����</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000"><a href="" target="_self"
						style="font-weight: bold; color: black;">������� �� ä��ȳ�</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">������� ����</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">������� Ȯ��</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">������� ä��</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">Top Performer ����</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: black;">�����ǰ�ȳ�</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">���ô㺸����</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">�����ڱݴ���</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">�ſ����</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">�ڵ�������</a></li>
								<li><a
									href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%8C%80%EC%B6%9C%EA%B3%84&qdt=0&ie=utf8&query=%EB%8C%80%EC%B6%9C%EA%B3%84%EC%82%B0%EA%B8%B0"
									target="_blank" style="font-weight: bold; color: black;">�������</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: black;">�����ڷ��</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">��������</a></li>
								<li><a href="" target="_blank"
									style="font-weight: bold; color: black;">��ǰ �޴���</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">�Ի�(ä��/����) ���</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">���� �����</a></li>
							</ul>
						</div></li>
					<li style="z-index: 1000" class=""><a href="" target="_self"
						style="font-weight: bold; color: black;">Ŀ�´�Ƽ</a>
						<div class="menu" style="position: absolute; display: none;">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self" style="font-weight: bold; color: black;">��������</a></li>
								
								<c:choose>
									<c:when test="${sessionScope.m_id != null}">
										<li><a href="" target="_self" style="font-weight: bold; color: black;">����������</a></li>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
								
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">ã�ƿ��ô� ��</a></li>
								<li><a href="" target="_self"
									style="font-weight: bold; color: black;">�系����</a></li>
							</ul>
						</div></li>
				</ul>
				<div id="gnb_background" style="position: absolute; display: none;"></div>
			</nav>



			<!-- ����ϸ޴� -->
			<div class="btn_hamburger">
				<span style="background-color: black;"></span> <span
					style="background-color: black;"></span> <span
					style="background-color: black;"></span>
			</div>

			<div id="navigation"
				style="display: none; background-color: white; color: black;">
				<div class="deco-symbol">
					<img src="/theme/basic/img/obj-star.svg" alt="">
				</div>
				<div class="mobile-slider-top">
					<div class="mo-logo">
						<a><img
							src="${pageContext.request.contextPath}/resources/main_image/����׽�Ʈ_1.png"
							alt="����׽�Ʈ"></a>
					</div>
					<i class="material-symbols-rounded close-menu"
						style="color: black; font-weight: bold; transform: none; transition: none; animation: none;">close</i>
				</div>

				<div class="dBox">
					<div class="d-slogan" style="color: black; font-weight: bold;">
						Good People, <br>Genuine Trust
					</div>

					<ul id="d-schedule" style="color: black;">
						<li style="z-index: 1000"><a href="" target="_self" asdf="7"
							style="color: black; font-weight: bold;">ȸ��Ұ�</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- CEO �λ縻</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- LB WAY</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- CI</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ������</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ���������(����) �����</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="4"
							style="color: black; font-weight: bold;">������� �� ä��ȳ�</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ������� ����</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ������� Ȯ��</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ������� ä��</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- Top Performer
										����</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="5"
							style="color: black; font-weight: bold;">�����ǰ�ȳ�</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ���ô㺸����</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- �����ڱݴ���</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- �ſ����</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- �ڵ�������</a></li>
								<li class=""><a
									href="https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=0&acr=1&acq=%EB%8C%80%EC%B6%9C%EA%B3%84&qdt=0&ie=utf8&query=%EB%8C%80%EC%B6%9C%EA%B3%84%EC%82%B0%EA%B8%B0"
									target="_blank" class=""
									style="color: black; font-weight: bold;">- �������</a></li>
							</ul></li>
						<li style="z-index: 1000"><a href="" target="_self" asdf="3"
							style="color: black; font-weight: bold;">�����ڷ��</a>
							<ul>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ��������</a></li>
								<li class=""><a href="" target="_blank" class=""
									style="color: black; font-weight: bold;">- ��ǰ �޴���</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- �Ի�(ä��/����) ���</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ���� �����</a></li>
							</ul></li>

						<li style="z-index: 1000"><a href="" target="_self" asdf="3"
							style="color: black; font-weight: bold;">Ŀ�´�Ƽ</a>
							<ul>
								<li class=""><a
									href="${pageContext.request.contextPath}/getNoticeList.do"
									target="_self" class=""
									style="color: black; font-weight: bold;">- ��������</a></li>
								<c:choose>
									<c:when test="${sessionScope.m_id != null}">
										<li><a href="" target="_self" style="font-weight: bold; color: black;">����������</a></li>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
								
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- ã�ƿ��ô� ��</a></li>
								<li class=""><a href="" target="_self" class=""
									style="color: black; font-weight: bold;">- �系����</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>