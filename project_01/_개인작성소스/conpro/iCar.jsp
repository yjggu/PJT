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

    <title>����ȳ�</title>

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
    </style>
  </head>

  <body>
    <div id="fixed-header">
      <c:import url="../LB_NEST_HEADER.jsp"></c:import>
    </div>
    <div id="title">
      <h2>����ȳ�</h2>
    </div>

    <div id="titleBackground"></div>
    <div id="main-container">
      <div id="container">
        <div class="tabs">
          <div class="tab" onclick="showTabContent('Mortgage')">
            ���ô㺸����
          </div>
          <div class="tab" onclick="showTabContent('Lease')">�����ڱݴ���</div>
          <div class="tab" onclick="showTabContent('Credit')">�ſ����</div>
          <div class="tab active" onclick="showTabContent('Car')">
            �ڵ�������
          </div>
        </div>
        <div id="content2">
          <!-- ���ô㺸���� -->
          <div id="Mortgage" class="tab-content">
            <h2>�� �ڻ����� ���� ������ �㺸����</h2>
            <div class="section">
              <h3>������ �㺸�� ��û�ϴ� ���ô㺸����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>�ְ��ѵ�</th>
                    <td>
                      �㺸���簡�� �� �ҵ�ݾ�, �㺸������ ���� � ����
                      ���Ⱑ�ɱݾ� �̳�
                    </td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>1�� �̻� ���� 50�� �̳�</td>
                  </tr>
                  <tr>
                    <th>��ǰƯ¡</th>
                    <td>ȥ�ձݸ��� �����ݸ� �� ������ ����</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>
                �о��� �ܱ��� �����Ϸ��� ���� ����
                ���ñ����ڱݴ���(�������ܱݴ���)
              </h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>������</th>
                    <td>������ ������ ������� ���ֿ�����</td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>1�� �̻� ���� 40�� �̳�</td>
                  </tr>
                  <tr>
                    <th>�ְ��ѵ�</th>
                    <td>�ҿ��ڱ��� 100% �̳�(����庰 �����ѵ� ���� ��)</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>
                �Ϲݺε���(��������)�� �㺸�� ��û�ϴ� �Ϲݺε��� �㺸����
              </h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>�ְ��ѵ�</th>
                    <td>
                      �㺸���簡�� �� �ҵ�ݾ�, �㺸������ ���� � ����
                      ���Ⱑ�ɱݾ� �̳�
                    </td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>1�� �̻� ���� 35�� �̳�</td>
                  </tr>
                  <tr>
                    <th>��ǰƯ¡</th>
                    <td>��, ���ǽ���, �������� �㺸�� ���� ����</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- ���ô㺸���� -->

          <!-- �����ڱݴ��� -->
          <div id="Lease" class="tab-content">
            <h2>������ �������� �����ϴ� �����ڱݴ���</h2>
            <div class="section">
              <h3>�ѱ����ñ������� ������ �㺸�� �����ϴ� ����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>�ְ��ѵ�</th>
                    <td>������������ 80%�̳�(�ִ� 4��4õ4�鸸��)</td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>1���̻� 2���̳�</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>SGI���ﺸ������ ������ �㺸�� �����ϴ� ����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>�����ѵ�</th>
                    <td>������������ 80%�̳�(�ִ� 5���)</td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>3���� �̻� 3�� �̳�</td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="section">
              <h3>���õ��ú������� ������ �㺸�� �����ϴ� ����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>�����ѵ�</th>
                    <td>������������ 80%�̳�(�ִ� 4���)</td>
                  </tr>
                  <tr>
                    <th>����Ⱓ</th>
                    <td>10���� �̻� 25���� �̳�</td>
                  </tr>
                </table>
                <p>
                  �����������ݹ�ȯ������ �������� ������������ �����ϰ� ����
                </p>
                <br />
                <br />
                <br />
                <p>
                  * ��� �����ڱݴ����� ���ҵ�, ��ä�ݾ� �� ���κ� �ſ��򰡿�
                  ���� ���� ����ݾ� ����
                </p>
              </div>
            </div>
          </div>
          <!-- �����ڱݴ��� -->

          <!-- �ſ���� -->
          <div id="Credit" class="tab-content">
            <h2>�㺸 ���̵� ������ �ſ����</h2>
            <div class="section">
              <h3>������ �̶�� ��û������ ������ �ſ����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>������</th>
                    <td>
                      ���� �� �ҵ��� ������ �� �ִ� ������ �̶�� ��û ������
                      ��ǰ
                    </td>
                  </tr>
                  <tr>
                    <th>�����ѵ�</th>
                    <td>�ҵ� �� �ſ��򰡰���� ���� ���� ����</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="section">
              <h3>�Ƿ����� ���� ���� ���� ���ͷ�</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>������</th>
                    <td>
                      �ǻ����� �ſ����� �����ѵ� �� ����ݸ��� ����� ��ǰ.<br />
                      �ٷμҵ� �Ǵ� ����ҵ��� �ִ� �����ǻ�(������, ������Ʈ,
                      ����, ���ǰ�, ���ߺ����� ����), ���ǻ�, ġ���ǻ�, �Ǵ�
                      ����������(�ǻ�, ���ǻ�, ġ���ǻ�), �Ǵ뺻�� 4�г� ��
                      �ǻ�����հ���(ġ�Ǵ�,���Ǵ� ����)�μ�
                      ���νſ��򰡽ý���(CSS)�� ���� ���������ڷ� ������ ��
                    </td>
                  </tr>
                  <tr>
                    <th>�����ѵ�</th>
                    <td>���ҵ�, ������������, �ſ��޿� ���� ��������</td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="section">
              <h3>������ �����ڴ� ���������� ������ �ſ����</h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>������</th>
                    <td>
                      ������ �����ڰ����� ������ ���������� (���ǻ�, ���,
                      ����ȸ���, ������, ������, ������, �����, ������,
                      �����, ������, �����򰡻�, ���γ빫��, ���ػ����� )��
                      ������� ���������� �����ϰ� �����ص帮�� ��ǰ
                    </td>
                  </tr>
                  <tr>
                    <th>�����ѵ�</th>
                    <td>
                      �ڰ��� ���� �� ���ҵ�� �ſ��޿� ���� �����ѵ� ���� ����
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- �ſ���� -->

          <!-- �ڵ������� -->
          <div id="Car" class="tab-content active">
            <h2>����, �߰��� ���ſ� �ʿ��� �ڱ��� �ڵ�������</h2>
            <div class="section">
              <h3></h3>
              <div class="table-container">
                <table>
                  <tr>
                    <th>��ǰƯ¡</th>
                    <td>
                      - ĳ��Ż ��� ������ �ݸ��������� �ű� �� �߰�����
                      �����Ϸ��� ���� ���� �����ǰ <br />
                      - ������ ��޼�����, �����, �����缳�� �δ� ���� <br />
                      - �ٸ� �������(����� ����)���� ���� �ڵ����Һα�����
                      ��ȯ ����
                    </td>
                  </tr>
                  <tr>
                    <th>�����û�ڰ�</th>
                    <td>�ҵ������� ������ �� 19�� �̻� ���ΰ�</td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
          <!-- �ڵ������� -->
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
