<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
isELIgnored="false"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>??? ???</title>

    <style>
      body {
        background-image: url("../resources/main_image/header_image/sky01.jpg");
        background-repeat: no-repeat; /* ????? ??? ???? */
        background-size: cover; /* ??????? ??? ????? ?????? ???? */
        margin: 0;
        padding: 0;
        position: relative;
        zoom: 1;
      }
    </style>

    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/conStyle.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/header_styles.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/privacypopupStyle.css"
    />
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.css"
    />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

    <script>
      /* r_phone ??? ???? */
      function combinePhone() {
        var prefix = document.getElementById("phone-prefix").value;
        var mid = document.getElementById("phone-mid").value;
        var end = document.getElementById("phone-end").value;
        var fullPhone = prefix + "-" + mid + "-" + end;
        document.getElementById("r_phone").value = fullPhone;
      }
      /* r_phone ??????? ????? ??? ????? */
      function validatePhone() {
        var phoneMid = document.getElementById("phone-mid").value;
        var phoneEnd = document.getElementById("phone-end").value;
        var phoneRegex = /^[0-9]{3,4}$/;

        var isValid = phoneRegex.test(phoneMid) && phoneRegex.test(phoneEnd);

        if (!isValid) {
          document.getElementById("phone-error").style.display = "inline";
        } else {
          document.getElementById("phone-error").style.display = "none";
        }

        return isValid;
      }
      /* ???????????? ???? ??? */
      function openPopup() {
        var url = "${pageContext.request.contextPath}/conpro/privacyPopup.jsp";
        var name = "popupWindow";
        var specs = "width=600,height=400,scrollbars=yes";
        window.open(url, name, specs);
      }
      /* ???????????? ???? ??? */
      function closePopup() {
        window.close();
      }

      /* ??? ?????? ??????, ????????? ?????? ????? */
      function toggleDateField() {
        if ($('input[name="r_check"]:checked').val() === "??λ??") {
          $("#r_date")
            .prop("disabled", true)
            .css("background-color", "#e9ecef");
          $("#r_date").val("");
          $("#reservation-message").hide();
        } else {
          $("#r_date").prop("disabled", false).css("background-color", "");
          $("#reservation-message").show();
        }
      }

      function setMinDateTime() {
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = String(today.getMonth() + 1).padStart(2, "0");
        var dd = String(today.getDate()).padStart(2, "0");
        var hh = String(today.getHours()).padStart(2, "0");
        var min = String(today.getMinutes()).padStart(2, "0");
        var ss = String(today.getSeconds()).padStart(2, "0");
        var minDateTime = yyyy + "-" + mm + "-" + dd + "T" + hh + ":" + min;

        $("#r_date").attr("min", minDateTime);
      }

      function validateDateTime() {
        var inputDate = new Date($("#r_date").val());
        var today = new Date();

        // ??? ?ð? ?? ????
        today.setHours(0, 0, 0, 0);

        var day = inputDate.getDay();
        if (day === 0 || day === 6) {
          alert("????? ???? ????????.");
          $("#r_date").val("");
          return false;
        }

        if (inputDate < today) {
          alert("???? ?????? ????? ?????? ?? ??????.");
          $("#r_date").val("");
          return false;
        }

        var hours = inputDate.getHours();
        if (hours < 9 || hours >= 18) {
          alert("09:00~18:00 ?????? ?ð??? ?????? ????????.");
          $("#r_date").val("");
          return false;
        }

        return true;
      }

      /* ????? ??? ?????? ???? ????? ??
	??????? ?? ??????? success.jsp?? ??????? */
      function validateForm() {
        var requiredFields = [
          "r_name",
          "phone-mid",
          "phone-end",
          "r_category",
          "agreement",
        ];
        var allValid = true;

        /* ???? ??????????? ???? ????ι????? */
        requiredFields.forEach(function (fieldId) {
          var field = document.getElementById(fieldId);
          if (
            !field ||
            !field.value.trim() ||
            (field.type === "checkbox" && !field.checked)
          ) {
            allValid = false;
            field.style.borderColor = "red";
          } else {
            field.style.borderColor = "";
          }
        });

        /* ??? ?? ????? */
        if (!validatePhone()) {
          allValid = false;
        }
        /* ??????????? ?? ?ð? ????? */
        if (
          $('input[name="r_check"]:checked').val() === "?????" &&
          !validateDateTime()
        ) {
          allValid = false;
        }
        /* ???????????? ??? */
        var agreementField = document.getElementById("agreement");
        if (!agreementField.checked) {
          allValid = false;
          agreementField.nextElementSibling.style.borderColor = "red";
        } else {
          agreementField.nextElementSibling.style.borderColor = "";
        }

        /* ?? ???? ?????? submit() */
        if (allValid) {
          combinePhone();
          document.getElementById("consultForm").submit();
        } else {
          alert("??????? ???? ??????.");
        }
      }

      $(document).ready(function () {
        toggleDateField();

        $('input[name="r_check"]').change(function () {
          toggleDateField();
        });

        $("#r_date").change(function () {
          validateDateTime();
        });
      });
    </script>
  </head>

  <body>
    <div id="fixed-header">
      <c:import url="../LB_NEST_HEADER.jsp"></c:import>
    </div>
    <div id="title">
      <h2>?????</h2>
    </div>
    <div id="titleBackground"></div>
    <div id="main-container">
      <div id="container">
        <form
          id="consultForm"
          action="${pageContext.request.contextPath}/conpro/insertCon.do"
          method="post"
        >
          <fieldset>
            <legend>&nbsp;&nbsp;&nbsp;<b>????????</b></legend>
            <hr class="custom-hr" />
            <br />
            <table>
              <tr>
                <td><label for="r_name">??????</label></td>
                <td>
                  <input type="text" id="r_name" name="r_name" required />
                </td>
              </tr>
              <tr>
                <td><label for="r_phone">?????(?????)</label></td>
                <td>
                  <div class="phone-input">
                    <select id="phone-prefix" name="phone-prefix">
                      <option value="010">010</option>
                    </select>
                    <span>-</span>
                    <input
                      type="text"
                      id="phone-mid"
                      name="phone-mid"
                      maxlength="4"
                      required
                    />
                    <span>-</span>
                    <input
                      type="text"
                      id="phone-end"
                      name="phone-end"
                      maxlength="4"
                      required
                    />
                    <span id="phone-error" class="error-message"
                      >???? ?????? ??????????</span
                    >
                    <input type="hidden" id="r_phone" name="r_phone" />
                  </div>
                </td>
              </tr>
              <tr>
                <td><label for="r_check">?????</label></td>
                <td>
                  <div class="radio-group">
                    <label
                      ><input
                        type="radio"
                        id="r_check1"
                        name="r_check"
                        value="??λ??"
                        checked
                      />
                      ??λ??</label
                    >
                    <label
                      ><input
                        type="radio"
                        id="r_check2"
                        name="r_check"
                        value="?????"
                      />?????</label
                    >
                  </div>
                </td>
              </tr>
              <tr>
                <td><label for="r_date">??? ????</label></td>
                <td>
                  <input
                    type="datetime-local"
                    id="r_date"
                    name="r_date"
                    required
                  />
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <p class="note">?? ??/??/???????? ????? ?????????.</p>
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <p id="reservation-message" style="display: none; color: red">
                    ???????? ?????? ??? ?ð??? ????? ???? ??????簡<br />????????
                    ????? ????帳???.
                  </p>
                </td>
              </tr>
              <tr>
                <td><label for="r_category">???????</label></td>
                <td>
                  <select id="r_category" name="r_category" required>
                    <option value="?????????">?????????</option>
                    <option value="??????????">??????????</option>
                    <option value="??????">??????</option>
                    <option value="?????????">?????????</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="fixed-width"><label for="r_memo">???</label></td>
                <td>
                  <textarea id="r_memo" name="r_memo" rows="4"></textarea>
                </td>
              </tr>
            </table>
            <br />
            <br />
            <hr class="custom-hr" />
          </fieldset>

          <div class="agreement">
            <input type="checkbox" id="agreement" name="agreement" required />
            <label for="agreement" onclick="openPopup()"
              >[???] ???????? ????? ????????? ????</label
            >
          </div>

          <div class="button-container">
            <button type="button" onclick="validateForm()">??? ??????</button>
          </div>
        </form>
      </div>
    </div>
    <div id="fixed-bottom">
      <c:import url="../LB_NEST_UNDER.jsp"></c:import>
    </div>
  </body>
</html>
