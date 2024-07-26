<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <meta http-equiv="content-type" content="text/html; charset=EUC-KR" />

    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/header_styles.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/infoProStyle.css"
    />

    <title>대출안내</title>

    <style>
      body {
        background-image: url("../resources/main_image/header_image/sky01.jpg");
        background-repeat: no-repeat; /* 이미지 반복 안함 */
        background-size: cover; /* 이미지가 화면 전체를 덮도록 조정 */
        margin: 0;
        padding: 0;
        position: relative;
        zoom: 1;
      }
    </style>
  </head>

  <body>
    <div id="fixed-header">
      <c:import url="../LB_NEST_HEADER.jsp"></c:import>
    </div>
    <div id="title">
      <h2>대출안내</h2>
    </div>

    <div id="titleBackground"></div>
    <div id="main-container">
      <div id="container">
        <div class="tabs">
          <div class="tab" onclick="showTabContent('Mortgage')">
            주택담보대출
          </div>
          <div class="tab" onclick="showTabContent('Lease')">전세자금대출</div>
          <div class="tab" onclick="showTabContent('Credit')">신용대출</div>
          <div class="tab active" onclick="showTabContent('Car')">
            자동차대출
          </div>
        </div>
        <div id="content2">
          <!-- 주택담보대출 -->
          <div id="Mortgage" class="tab-content">
            <h2>내 자산으로 더욱 안전한 담보대출</h2>
            <div class="section">
              <h3>주택을 담보로 신청하는 주택담보대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>최고한도</th>
                    <td>
                      담보조사가격 및 소득금액, 담보물건지 지역 등에 따른
                      대출가능금액 이내
                    </td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>1년 이상 최장 50년 이내</td>
                  </tr>
                  <tr>
                    <th>상품특징</th>
                    <td>혼합금리와 변동금리 중 선택이 가능</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>
                분양대금 잔금을 납부하려는 고객을 위한
                주택구입자금대출(집단주잔금대출)
              </h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출대상</th>
                    <td>은행이 승인한 사업장의 입주예정자</td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>1년 이상 최장 40년 이내</td>
                  </tr>
                  <tr>
                    <th>최고한도</th>
                    <td>소요자금의 100% 이내(사업장별 승인한도 범위 내)</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>
                일반부동산(주택제외)을 담보로 신청하는 일반부동산 담보대출
              </h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>최고한도</th>
                    <td>
                      담보조사가격 및 소득금액, 담보물건지 지역 등에 따른
                      대출가능금액 이내
                    </td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>1년 이상 최장 35년 이내</td>
                  </tr>
                  <tr>
                    <th>상품특징</th>
                    <td>상가, 오피스텔, 나대지를 담보로 제공 가능</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- 주택담보대출 -->

          <!-- 전세자금대출 -->
          <div id="Lease" class="tab-content">
            <h2>고객님의 전세금을 지원하는 전세자금대출</h2>
            <div class="section">
              <h3>한국주택금융공사 보증서 담보로 지원하는 대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>최고한도</th>
                    <td>임차보증금의 80%이내(최대 4억4천4백만원)</td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>1년이상 2년이내</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>SGI서울보증보험 보증서 담보로 지원하는 대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출한도</th>
                    <td>임차보증금의 80%이내(최대 5억원)</td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>3개월 이상 3년 이내</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>주택도시보증공사 보증서 담보로 지원하는 대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출한도</th>
                    <td>임차보증금의 80%이내(최대 4억원)</td>
                  </tr>
                  <tr>
                    <th>대출기간</th>
                    <td>10개월 이상 25개월 이내</td>
                  </tr>
                </table>
                <p>
                  「전세보증금반환보증」 가입으로 임차보증금을 안전하게 보장
                </p>
                <br />
                <br />
                <br />
                <p>
                  * 모든 전세자금대출은 연소득, 부채금액 등 개인별 신용평가에
                  의해 최종 대출금액 결정
                </p>
              </div>
            </div>
          </div>
          <!-- 전세자금대출 -->

          <!-- 신용대출 -->
          <div id="Credit" class="tab-content">
            <h2>담보 없이도 가능한 신용대출</h2>
            <div class="section">
              <h3>직장인 이라면 신청가능한 직장인 신용대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출대상</th>
                    <td>
                      재직 및 소득을 증빙할 수 있는 직장인 이라면 신청 가능한
                      상품
                    </td>
                  </tr>
                  <tr>
                    <th>대출한도</th>
                    <td>소득 및 신용평가결과에 따라 차등 적용</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="section">
              <h3>의료인을 위한 맞춤 대출 닥터론</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출대상</th>
                    <td>
                      의사전용 신용대출로 대출한도 및 대출금리를 우대한 상품.<br />
                      근로소득 또는 사업소득이 있는 현직의사(전문의, 레지던트,
                      인턴, 군의관, 공중보건의 포함), 한의사, 치과의사, 또는
                      개업예정의(의사, 한의사, 치과의사), 의대본과 4학년 및
                      의사면허합격자(치의대,한의대 포함)로서
                      개인신용평가시스템(CSS)에 의해 대출적격자로 판정된 고객
                    </td>
                  </tr>
                  <tr>
                    <th>대출한도</th>
                    <td>현소득, 현직종사유형, 신용등급에 따라 차등적용</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="section">
              <h3>전문직 종사자는 무보증으로 전문직 신용대출</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>대출대상</th>
                    <td>
                      일정한 국내자격증을 소지한 현직종사자 (수의사, 약사,
                      공인회계사, 세무사, 관세사, 변리사, 기술사, 도선사,
                      건축사, 법무사, 감정평가사, 공인노무사, 손해사정인 )를
                      대상으로 무보증으로 간편하게 대출해드리는 상품
                    </td>
                  </tr>
                  <tr>
                    <th>대출한도</th>
                    <td>
                      자격증 종류 및 연소득과 신용등급에 따라 대출한도 차등 적용
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- 신용대출 -->

          <!-- 자동차대출 -->
          <div id="Car" class="tab-content active">
            <h2>신차, 중고차 구매에 필요한 자금은 자동차대출</h2>
            <div class="section">
              <h3></h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>상품특징</th>
                    <td>
                      - 캐피탈 대비 유리한 금리조건으로 신규 및 중고차를
                      구매하려는 고객을 위한 맞춤상품 <br />
                      - 별도의 취급수수료, 보험료, 근저당설정 부담 없음 <br />
                      - 다른 금융기관(은행권 제외)에서 받은 자동차할부금융을
                      대환 가능
                    </td>
                  </tr>
                  <tr>
                    <th>대출신청자격</th>
                    <td>소득증빙이 가능한 만 19세 이상 개인고객</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- 자동차대출 -->
        </div>
      </div>
    </div>
    <div id="fixed-bottom">
      <c:import url="../LB_NEST_UNDER.jsp"></c:import>
    </div>

    <script>
      function showTabContent(tabId) {
        var contents = document.querySelectorAll(".tab-content");
        contents.forEach(function (content) {
          content.classList.remove("active");
        });
        document.getElementById(tabId).classList.add("active");

        var tabs = document.querySelectorAll(".tabs .tab");
        tabs.forEach(function (tab) {
          tab.classList.remove("active");
        });
        document
          .querySelector(
            ".tabs .tab[onclick=\"showTabContent('" + tabId + "')\"]"
          )
          .classList.add("active");
      }
    </script>
  </body>
</html>
