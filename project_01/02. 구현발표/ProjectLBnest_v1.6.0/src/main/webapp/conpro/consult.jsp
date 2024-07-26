<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상담 신청</title>

<style>
body {
	background-image: url('../resources/main_image/header_image/sky01.jpg');
	background-repeat: no-repeat; /* 이미지 반복 안함 */
	background-size: cover; /* 이미지가 화면 전체를 덮도록 조정 */
	margin: 0;
	padding: 0;
	position: relative;
	zoom: 1;
}
</style>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/conStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header_styles.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/privacypopupStyle.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.13.18/jquery.timepicker.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>

<script>
	/* r_phone 번호 합쳐 */
	function combinePhone() {
		var prefix = document.getElementById('phone-prefix').value;
		var mid = document.getElementById('phone-mid').value;
		var end = document.getElementById('phone-end').value;
		var fullPhone = prefix + '-' + mid + '-' + end;
		document.getElementById('r_phone').value = fullPhone;
	}
	/* r_phone 숫자말고 다른건 입력 못하게 */
	function validatePhone() {
		var phoneMid = document.getElementById('phone-mid').value;
		var phoneEnd = document.getElementById('phone-end').value;
		var phoneRegex = /^[0-9]{3,4}$/;

		var isValid = phoneRegex.test(phoneMid) && phoneRegex.test(phoneEnd);

		if (!isValid) {
			document.getElementById('phone-error').style.display = 'inline';
		} else {
			document.getElementById('phone-error').style.display = 'none';
		}

		return isValid;
	}
	/* 개인정보동의 팝업창 뜨기 */
	function openPopup() {
		var url = "${pageContext.request.contextPath}/conpro/privacyPopup.jsp";
		var name = "popupWindow";
		var specs = "width=600,height=400,scrollbars=yes";
		window.open(url, name, specs);
	}
	/* 개인정보동의 팝업창 닫기 */
	function closePopup() {
		window.close();
	}
	
	/* 바로 상담이면 비활성화, 예약상담이면 날짜받게 할거임 */
	function toggleDateField() {
        if ($('input[name="r_check"]:checked').val() === '바로상담') {
            $('#r_date').prop('disabled', true).css('background-color', '#e9ecef');
            $('#r_date').val('');
            $('#reservation-message').hide();
        } else {
            $('#r_date').prop('disabled', false).css('background-color', '');
            $('#reservation-message').show();
        }
    }
	
	function setMinDateTime() {
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = String(today.getMonth() + 1).padStart(2, '0'); 
        var dd = String(today.getDate()).padStart(2, '0');
        var hh = String(today.getHours()).padStart(2, '0');
        var min = String(today.getMinutes()).padStart(2, '0');
        var ss = String(today.getSeconds()).padStart(2, '0');
        var minDateTime = yyyy + '-' + mm + '-' + dd + 'T' + hh + ':' + min;

        $('#r_date').attr('min', minDateTime);
    }

	function validateDateTime() {
        var inputDate = new Date($('#r_date').val());
        var today = new Date();

        // 일단 시간 다 초기화
        today.setHours(0, 0, 0, 0);

        var day = inputDate.getDay();
        if (day === 0 || day === 6) {
            alert('평일만 선택 가능합니다.');
            $('#r_date').val('');
            return false;
        }

        if (inputDate < today) {
            alert('오늘 이후의 날짜만 선택할 수 있습니다.');
            $('#r_date').val('');
            return false;
        }

        var hours = inputDate.getHours();
        if (hours < 9 || hours >= 18) {
            alert('09:00~18:00 사이의 시간만 선택이 가능합니다.');
            $('#r_date').val('');
            return false;
        }

        return true;
    }
	
	/* 상담신청 버튼 누르기 전에 검사할 거
	필수값들 다 채워져야 success.jsp로 넘어가도록 */
	function validateForm() {
        var requiredFields = ['r_name', 'phone-mid', 'phone-end', 'r_category', 'agreement'];
        var allValid = true;
		
       /* 내용 안채워졌으면 빨간 박스로바꿀거임 */
        requiredFields.forEach(function(fieldId) {
            var field = document.getElementById(fieldId);
            if (!field || !field.value.trim() || (field.type === 'checkbox' && !field.checked)) {
                allValid = false;
                field.style.borderColor = 'red';
            } else {
                field.style.borderColor = '';
            }
        });
		
		/* 번호 잘 들어갔나 */
        if (!validatePhone()) {
            allValid = false;
        }
		/* 상담예약체크했을 때 시간 들어갔나 */
        if ($('input[name="r_check"]:checked').val() === '상담예약' && !validateDateTime()) {
            allValid = false;
        }
        /* 개인정보동의 했나 */
        var agreementField = document.getElementById('agreement');
        if (!agreementField.checked) {
            allValid = false;
            agreementField.nextElementSibling.style.borderColor = 'red';
        } else {
            agreementField.nextElementSibling.style.borderColor = '';
        }
		
        /* 다 값이 맞으면 submit() */
        if (allValid) {
            combinePhone();
            document.getElementById('consultForm').submit();
        } else {
            alert('미입력한 값이 있습니다.');
        }
    }

	$(document).ready(function () {
        toggleDateField();

        $('input[name="r_check"]').change(function () {
            toggleDateField();
        });
        
        $('#r_date').change(function () {
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
		<h2>상담신청</h2>
	</div>
	<div id="titleBackground"></div>
	<div id="main-container">
		<div id="container">
			<form id="consultForm"
				action="${pageContext.request.contextPath}/conpro/insertCon.do"
				method="post">
				<fieldset>
					<legend>
						&nbsp;&nbsp;&nbsp;<b>고객정보</b>
					</legend>
					<hr class="custom-hr">
					<br />
					<table>
						<tr>
							<td><label for="r_name">고객명</label></td>
							<td><input type="text" id="r_name" name="r_name" required></td>
						</tr>
						<tr>
							<td><label for="r_phone">연락처(휴대폰)</label></td>
							<td>
								<div class="phone-input">
									<select id="phone-prefix" name="phone-prefix">
										<option value="010">010</option>
									</select> <span>-</span> <input type="text" id="phone-mid"
										name="phone-mid" maxlength="4" required> <span>-</span>
									<input type="text" id="phone-end" name="phone-end"
										maxlength="4" required> <span id="phone-error"
										class="error-message">올바른 형식을 입력해주세요</span> <input
										type="hidden" id="r_phone" name="r_phone">
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="r_check">상담구분</label></td>
							<td>
								<div class="radio-group">
									<label><input type="radio" id="r_check1" name="r_check"
										value="바로상담" checked> 바로상담</label> <label><input
										type="radio" id="r_check2" name="r_check" value="상담예약">상담예약</label>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="r_date">상담 일자</label></td>
							<td><input type="datetime-local" id="r_date" name="r_date"
								required></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<p class="note">※ 토/일/공휴일은 상담이 불가능합니다.</p>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<p id="reservation-message" style="display: none; color: red;">
									고객님이 원하시는 날짜 시간에 맞추어 전담 대출상담사가<br />고객님의 상담을 도와드립니다.
								</p>
							</td>
						</tr>
						<tr>
							<td><label for="r_category">상담유형</label></td>
							<td><select id="r_category" name="r_category" required>
									<option value="주택담보대출">주택담보대출</option>
									<option value="전세자금대출">전세자금대출</option>
									<option value="신용대출">신용대출</option>
									<option value="자동차대출">자동차대출</option>
							</select></td>
						</tr>
						<tr>
							<td class="fixed-width"><label for="r_memo">메모</label></td>
							<td><textarea id="r_memo" name="r_memo" rows="4"></textarea></td>
						</tr>
					</table>
					<br /> <br />
					<hr class="custom-hr">
				</fieldset>

				<div class="agreement">
					<input type="checkbox" id="agreement" name="agreement" required>
					<label for="agreement" onclick="openPopup()">[필수] 개인정보 필수적
						수집·이용 동의</label>
				</div>

				<div class="button-container">
					<button type="button" onclick="validateForm()">상담 신청하기</button>
				</div>
			</form>
		</div>
	</div>
	<div id="fixed-bottom">
		<c:import url="../LB_NEST_UNDER.jsp"></c:import>
	</div>
</body>
</html>
