<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
isELIgnored="false"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
    <title>ã�ƿ��ô� ��</title>

    <style>
      body {
        background-image: url("../resources/main_image/header_image/sky01.jpg");
        background-repeat: no-repeat; /* �̹��� �ݺ� ���� */
        background-size: cover; /* �̹����� ȭ�� ��ü�� ������ ���� */
        margin: 0;
        padding: 0;
        position: relative;
        zoom: 1;
      }

      #titleBackground {
        width: 100%;
        max-width: none;
        margin: 0;
        padding-top: 50px;
        padding-bottom: 50px;
        background: linear-gradient(
          to bottom,
          rgba(255, 255, 255, 0) 0%,
          rgba(255, 255, 255, 0.1) 5%,
          rgba(255, 255, 255, 0.2) 10%,
          rgba(255, 255, 255, 0.4) 17%,
          rgba(255, 255, 255, 0.6) 27%,
          rgba(255, 255, 255, 0.8) 33%,
          rgba(255, 255, 255, 1) 50%
        );
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-position: top;
      }

      #main-container {
        margin: auto;
        background: #fff;
        padding-top: 80px;
        padding-bottom: 150px;
        text-align: center; /* ���� �������� ����� ���� */
      }

      #map {
        width: 640px; /* ���ϴ� �ʺ�� �����ϼ��� */
        height: 390px; /* ���ϴ� ���̷� �����ϼ��� */
        background-color: lightgray; /* �׽�Ʈ�� ���� ���� */
        margin: 0 auto; /* ������ ����� ���� */
      }

      #addr {
        width: 800px; /* ���ϴ� �ʺ�� �����ϼ��� */
        /* 	background-color: #fff;  */
        margin-left: 33%; /* ������ ����� ���� */
        text-align: left;
        padding-top: 10px;
        /* padding: 20px; */
      }

      #title h2 {
        font-family: "KoPubDotumProBold";
        color: #ffffff;
        font-size: 30px;
        font-weight: bold;
        text-align: left;
        margin-left: 2%;
      }
    </style>
  </head>
  <body>
    <div id="fixed-header">
      <c:import url="../LB_NEST_HEADER.jsp"></c:import>
    </div>
    <div id="title">
      <h2>ã�ƿ��ô� ��</h2>
    </div>
    <div id="titleBackground"></div>
    <div id="main-container">
      <div id="map">
        <!-- ��ġ ��ũ��Ʈ-->
        <script
          charset="UTF-8"
          class="daum_roughmap_loader_script"
          src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"
        ></script>

        <!-- īī���� ���� �ۿ� -->
        <div
          id="daumRoughmapContainer1719231802385"
          class="root_daum_roughmap root_daum_roughmap_landing"
        ></div>

        <!-- 3���� ��ũ��Ʈ -->
        <script charset="UTF-8">
          new daum.roughmap.Lander({
            timestamp: "1719231802385",
            key: "2jse9",
            mapWidth: "640",
            mapHeight: "360",
          }).render();
        </script>
      </div>
      <div id="addr">
        <h4>ADDRESS : (08208) ����Ư���� ���α� ���η� 661, 101�� 26��</h4>
        <h4>
          TEL &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 02-3439-7600
        </h4>
      </div>
    </div>
    <div id="fixed-bottom">
      <c:import url="../LB_NEST_UNDER.jsp"></c:import>
    </div>
  </body>
</html>
