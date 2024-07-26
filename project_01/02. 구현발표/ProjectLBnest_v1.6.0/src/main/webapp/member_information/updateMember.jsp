<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/join_input.js"></script> --%>

<meta charset="EUC-KR">
<title>LBnest ȸ������</title>

<script>
let m_grade = ${memberVO.m_grade};
let idConfirm = 0;
let codeConfirm = 0; 
let pwdConfirm = 0; //��й�ȣ Ȯ���� �������� 1 �ȴ������� 
// ������ �ε� �� ��й�ȣ �ʵ带 �ʱ�ȭ�մϴ�.
window.onload = function() {
    var pwdField = document.getElementById("m_pwd");
    var pwdCkField = document.getElementById("m_pwdck");
    
    pwdField.defaultValue = pwdField.value;  // �⺻�� ����
    pwdField.value = "";  // �ʵ� �ʱ�ȭ

    pwdCkField.defaultValue = pwdCkField.value;  // �⺻�� ����
    pwdCkField.value = "";  // �ʵ� �ʱ�ȭ
};
document.addEventListener('DOMContentLoaded', function() {
    // �̸��� �Է� ���� ���
    const emailInput = document.getElementById('emailInput');
    const domainInput = document.getElementById('domainInput');
    const emailAddrSelect = document.getElementById('emailAddrSelect');
    const fullEmail = document.getElementById('fullEmail');
    
    // ��ȭ��ȣ �Է� ���� ���
    const phoneFirstPart = document.getElementById('phoneFirstPart');
    const phoneSecondPart = document.getElementById('phoneSecondPart');
    const phoneThirdPart = document.getElementById('phoneThirdPart');
    
    // �ʱ� �̸��� ����
    const existingEmail = "${memberVO.m_email}";
    const emailParts = existingEmail.split('@');
    
    if (emailParts.length === 2) {
        emailInput.value = emailParts[0];
        domainInput.value = emailParts[1];
    }
    
    // �̸��� ������ ���� ���� �� ó��
    emailAddrSelect.addEventListener('change', function() {
        const domainSelect = emailAddrSelect.value;
        if (domainSelect === 'domain_input') {
            domainInput.value = '';
            domainInput.removeAttribute('readonly');
            domainInput.focus();
        } else {
            domainInput.value = domainSelect;
            domainInput.setAttribute('readonly', 'readonly');
        }
        //updateFullEmail();
    });
    
    // ��ȭ��ȣ �ʱ� ����
    const existingPhone = "${memberVO.m_phone}";
    const phoneParts = existingPhone.match(/(\d{3})(\d{4})(\d{4})/);
    
    if (phoneParts && phoneParts.length === 4) {
        phoneFirstPart.value = phoneParts[1];
        phoneSecondPart.value = phoneParts[2];
        phoneThirdPart.value = phoneParts[3];
    }
    
    // �̸��� �� ��ȭ��ȣ ������Ʈ �Լ�
    function updateFullEmail() {
        fullEmail.value = emailInput.value + '@' + domainInput.value;
    }
    
    function updateFullPhone() {
        fullPhoneNumber.value = phoneFirstPart.value + phoneSecondPart.value + phoneThirdPart.value;
    }
    
    // �̸��� �Է� �̺�Ʈ ������ ���
    emailInput.addEventListener('input', updateFullEmail);
    emailAddrSelect.addEventListener('change', updateFullEmail);
    
    // ������ �ε� �� �ʱ� ���� ȣ��
    updateFullEmail();
    updateFullPhone();
});

//��й�ȣ Ȯ��
 function checkPassword() {
	 var m_pwd = document.getElementById("m_pwd").value;
	 var m_pwdck = document.getElementById("m_pwdck").value;
	 var messageElement = document.getElementById("password-confirm-message");
	 var submitButton = document.querySelector(".submit-join-button");
	 
	 let passwordRegex = /^(?=.*?[A-Z].*?[a-z]|.*?[A-Z].*?\d|.*?[A-Z].*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]|.*?[a-z].*?\d|.*?[a-z].*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]|.*?\d.*?[!@#$%^&*()\-_=+[\]{};:'"\\|,.<>/?]).{10,16}$/;

	 	  if(m_pwd === null || m_pwd === "" || m_pwdck === null || m_pwdck === ""){
	 		messageElement.textContent = "��й�ȣ�� �Է��ϼ���.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; // Set font size
	 	  }else if(!passwordRegex.test(m_pwd)){
	 		messageElement.textContent = "���� ��ҹ���/����/Ư������ �� 2���� �̻� ����, 10��~16��";
	 		messageElement.style.color = "red";
	 		messageElement.style.fontWeight = "bold";
    	  	messageElement.style.fontSize = "16px";
	 	  } 
	 	  else if (m_pwd != m_pwdck) {
			//alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			messageElement.textContent = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		    messageElement.style.color = "red";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px"; 
		  } else {
			messageElement.textContent = "��й�ȣ�� ��ġ�մϴ�.";
		    messageElement.style.color = "blue";
		    messageElement.style.fontWeight = "bold";
		    messageElement.style.fontSize = "16px";
		    pwdConfirm = 1;
		  }
		}

function updateFileName(inputId) {
    var input = document.getElementById(inputId);
    var fileName = input.files[0].name;
    var label = input.nextElementSibling;
    label.innerText = fileName;
}	
function editAttachment() {
    // ��ũ �κ� �����
    document.getElementById("linkSection").style.display = "none";
    // ���� ���ε� �κ� ���̱�
    document.getElementById("uploadSection").style.display = "block";
}
function openPdf(fileName) {
    // pdfView.do ��ο� fileName�� �Ķ���ͷ� �����Ͽ� �� â���� ����
    var url = 'pdfView.do?fileName=' + encodeURIComponent(fileName);
    window.open(url, '_blank');
}
//���ε� ���� �̸� ���̱�. ������ ���� ÷���Ҷ� ���ϸ��� �Ⱥ���.
function updateFileName(inputId) {
    var input = document.getElementById(inputId);
    var fileName = input.files[0].name;
    var label = input.nextElementSibling;
    label.innerText = fileName;
}	
//�ε��� �߰� �繫�� �ּ�ã��
function kakaopost() {
	  new daum.Postcode({
	    oncomplete: function (data) {
	      document.querySelector("#m_zip_code").value = data.zonecode;
	      document.querySelector("#m_addr1").value = data.address
	    }
	  }).open();
	}
// ����
// ��ȭ��ȣ, �̸��� �� ���� �Լ�
function submitForm() {

	const id = document.getElementById("m_id").value;
	const name = document.getElementById('m_name').value;
    // �̸��� �Է� ���� ���
    const emailInput = document.getElementById('emailInput').value;
    const domainInput = document.getElementById('domainInput').value;
    const emailAddrSelect = document.getElementById('emailAddrSelect').value;
    const fullEmail = emailInput+"@"+domainInput;
    
    // ��ȭ��ȣ �Է� ���� ���
    const phoneFirstPart = document.getElementById('phoneFirstPart').value;
    const phoneSecondPart = document.getElementById('phoneSecondPart').value;
    const phoneThirdPart = document.getElementById('phoneThirdPart').value;
	const fullPhone = phoneFirstPart+phoneSecondPart+phoneThirdPart;
	
	// ��й�ȣ �Է� ���
 	const m_pwd = document.getElementById("m_pwd");
 	const m_pwdck = document.getElementById("m_pwdck");
 	let m_pwd_v = m_pwd ? m_pwd.value : "";
 	let m_pwdck_v = m_pwdck ? m_pwdck.value : "";

	//�޽��� ����
	const idMessage = document.getElementById("checkIdMessage");
	//const codeMessage = document.getElementById("checkCodeMessage");
	const PwdMessage = document.getElementById("password-confirm-message");
	const zipMessage = document.getElementById("zipMessage");
	const file1Message = document.getElementById("file1Message"); 
	const file2Message = document.getElementById("file2Message");
	const addrMessage = document.getElementById("addrMessage");
	const nameMessage = document.getElementById("nameMessage");
	const emailMessage = document.getElementById("emailMessage");
	const phoneMessage = document.getElementById("phoneMessage");
    
	// ��ȭ��ȣ, �̸��� ���ļ� ����
    document.getElementById('fullPhoneNumber').value = fullPhone;
    document.getElementById('fullEmail').value = fullEmail;
     
    // ��й�ȣ ������ ������ �ʴ� ��� ���� ��й�ȣ ���� :: �ȵ�
/* 	if ((m_pwd_v === "" || m_pwd_v == null || m_pwd_v.trim().length == 0) && 
	    (m_pwdck_v === "" || m_pwdck_v == null || m_pwdck_v.trim().length == 0)) {
	    m_pwd_v = "${memberVO.m_pwd}";
	    m_pwdck_v = "${memberVO.m_pwdck}";
	    pwdConfirm = 1;
	}
 */
    if(fullEmail == null || fullEmail === ""||!fullEmail||$.trim(fullEmail).length == 0 ){
    	emailMessage.textContent = "�̸����� �Է����ּ���";
    	emailMessage.style.color = "red"; // Set red color
    	emailMessage.style.fontWeight = "bold"; // Set bold font weight
    	emailMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
    if(fullPhone == null || fullPhone === ""){
    	phoneMessage.textContent = "�ڵ��� ��ȣ�� �Է����ּ���.";
    	phoneMessage.style.color = "red"; // Set red color
    	phoneMessage.style.fontWeight = "bold"; // Set bold font weight
    	phoneMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
/*     if(m_grade == 2 && codeConfirm === 0){
    	codeMessage.textContent = "���� �ڵ� �ߺ� ���θ� Ȯ���� �ּ���.";
    	codeMessage.style.color = "red"; // Set red color
    	codeMessage.style.fontWeight = "bold"; // Set bold font weight
    	codeMessage.style.fontSize = "16px"; // Set font size
    	return false;
    } */

/*     if(pwdConfirm === 0){
    	PwdMessage.textContent = "��й�ȣ�� ��й�ȣ Ȯ���� ��ġ�ϴ��� Ȯ���� �ּ���.";
    	PwdMessage.style.color = "red"; // Set red color
    	PwdMessage.style.fontWeight = "bold"; // Set bold font weight
    	PwdMessage.style.fontSize = "16px"; // Set font size
    	return false;
    } */
    if(m_grade == 3){
     	//�ε��� �߰� �繫�� �ʼ� �Է°� ��� (�ּ�, ÷������)
     	const zip = document.getElementById("m_zip_code").value;
     	const m_addr1 = document.getElementById("m_addr1").value;
     	const m_addr2 = document.getElementById("m_addr2").value;
     	const m_uploadFile1 = document.getElementById("m_uploadFile1").value;
     	const m_uploadFile2 = document.getElementById("m_uploadFile2").value;
     	
    	if(!zip || zip == null || zip === ""){
    		zipMessage.textContent = "�����ȣ�� �Է��� �ּ���.";
    		zipMessage.style.color = "red"; // Set red color
    		zipMessage.style.fontWeight = "bold"; // Set bold font weight
    		zipMessage.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_addr2 || m_addr2 == null || m_addr2 === ""){
    		addrMessage.textContent = "���ּҸ� �Է��� �ּ���.";
    		addrMessage.style.color = "red"; // Set red color
    		addrMessage.style.fontWeight = "bold"; // Set bold font weight
    		addrMessage.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_uploadFile1 || m_uploadFile1 == null ||$.trim(m_uploadFile1).length == 0){
    		file1Message.textContent = "����� ������� ÷���� �ּ���.";
    		file1Message.style.color = "red"; // Set red color
    		file1Message.style.fontWeight = "bold"; // Set bold font weight
    		file1Message.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	if(!m_uploadFile2 || m_uploadFile2 == null ||$.trim(m_uploadFile2).length == 0){
    		file2Message.textContent = "����� ������� ÷���� �ּ���.";
    		file2Message.style.color = "red"; // Set red color
    		file2Message.style.fontWeight = "bold"; // Set bold font weight
    		file2Message.style.fontSize = "16px"; // Set font size
        	return false;
    	}
    	
    }
    //return true;
    document.getElementById('update_frm').submit();
}
// ȸ��Ż��
function deleteMember(){
    var url = "${pageContext.request.contextPath}/member_join/deleteMember.jsp"; 
    window.location.href = url; 
}
</script>
<style>
 .container {
    /* display: flex; */
    width: 100%; /* ��ü �ʺ�� ���� */
    max-width: none; /* �ִ� �ʺ� ���� ���� */

    padding-top: 100px;
    padding-bottom: 100px;
	background: linear-gradient(to bottom, 
                            rgba(255, 255, 255, 0) 0%, 
                            rgba(255, 255, 255, 0.1) 2%, 
                            rgba(255, 255, 255, 0.2) 4%, 
                            rgba(255, 255, 255, 0.4) 8%, 
                            rgba(255, 255, 255, 0.6) 10%, 
                            rgba(255, 255, 255, 0.8) 12%,  
                            rgba(255, 255, 255, 1) 15%);
                                
    background-size: cover; /* �׶��̼� ũ�� ���� */
    background-repeat: no-repeat; /* �ݺ� ���ֱ� */
    background-position: top; /* ��ܿ� �׶��̼� ��ġ ���� */
    
}
</style>
</head>
<c:import url="../LB_NEST_HEADER.jsp"></c:import>
<body>

<div class="titleBackground">
	<h1> ���������� </h1>
</div>
<div class="container">
	<h4>${memberVO.m_id}�� ȸ������ ����</h4>	
	<div class="container-form">
	<c:if test="${memberVO.m_grade eq 2}"><h2>���� ���� ȸ��</h2></c:if>
	<c:if test="${memberVO.m_grade eq 3}"><h2>�ε��� �߰� �繫�� ȸ��</h2></c:if>
	<c:if test="${memberVO.m_grade eq 4}"><h2>�Ϲ�ȸ��</h2></c:if>
	   
		<form method="post" action="../member/updateMember.do" target="_self" id="update_frm" enctype="multipart/form-data">
		<input name="m_grade" id="m_grade" type="hidden" value="${memberVO.m_grade}" />
		<input name="m_id" id="m_id" type="hidden" value="${memberVO.m_id}" />
		<table border="1">
		 <tr>
			<td>ID</td>
			<td><p>${memberVO.m_id }</p></td>
		 </tr>
		  <tr>
			<td>�̸�</td>
			<td><input type="text" name="m_name" id="m_name" placeholder="�̸��� �Է��Ͻÿ�." value="${memberVO.m_name }"></td>
		 </tr>
		<c:if test="${m_grade eq 2}">
		 <tr>
			<td>���� �ڵ�</td>
			<td>
			<p>${memberVO.m_counselor_code }</p>
			<span id="checkCodeMessage"></span>
			</td>
			
		 </tr>
		</c:if>
		 <tr>
			<td>��й�ȣ</td>
			<td><input type="password" name="m_pwd" id="m_pwd" placeholder="��й�ȣ�� �Է��Ͻÿ�." value="${memberVO.m_pwd}"></td>
		 </tr>
		 <tr>
			<td>��й�ȣ Ȯ��</td>
			<td><input type="password" name="m_pwdck" id="m_pwdck" placeholder="��й�ȣ�� �Է��Ͻÿ�." value="${memberVO.m_pwdck}"> 
			<button type="button" class="btn01" onclick="checkPassword()">Ȯ��</button>
			<span id="password-confirm-message"></span>
			</td>
		 </tr>
		 <tr>
			<td>�̸���</td>
			<td>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="�̸����� �Է��Ͻÿ�." aria-describedby="basic-addon2" id="emailInput">
					  <label class="input-group-text" for="inputGroupSelect01">@</label>
					  <input type="text" class="form-control" aria-describedby="basic-addon2" id="domainInput">
					  <select class="form-select" name="emailAddrSelect" id="emailAddrSelect" style="width:150px; text-align:center;">
						<option value="domain_input" >�����Է�</option>
						<option value="naver.com" selected>naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="kakao.com">kakao.com</option>
						<option value="daum.net">daum.net</option>
					  </select>
				</div>
				<span id="emailMessage"></span>
				<input type="hidden" id="fullEmail" name="m_email">
			</td>
		 </tr>
		 
		 <tr>
			<td>��ȭ��ȣ</td>
			<td>
				<div class="input-group mb-3" >
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneFirstPart" style="width:150px; text-align:center;">
				  <span class="input-group-text">-</span>
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneSecondPart" style="width:150px; text-align:center;">
				  <span class="input-group-text">-</span>
				  <input type="text" class="form-control" value="${memberVO.m_phone }" aria-label="Server" id="phoneThirdPart" style="width:150px; text-align:center;">
				</div>
				<span id="phoneMessage"></span>
				<input type="hidden" id="fullPhoneNumber" name="m_phone">
			</td>
		 </tr>
		<c:if test="${memberVO.m_grade eq 3}">
		  <tr>
			 <td width="200">�����ȣ</td>
			 <td><input type="text" name="m_zip_code" id="m_zip_code" size="7" readonly value="${memberVO.m_zip_code }">
			   <button type="button" class="btn01" onclick="kakaopost()">�����ȣ ã��</button>
			 <span id="zipMessage"></span>
			 </td>
		</tr>
		
		<tr>
			 <td>�ּ�</td>
			 <td><input type="text" name="m_addr1" id="m_addr1" readonly value="${memberVO.m_addr1 }"></td>
		</tr>
		<tr>
		 	 <td>���ּ�</td>
			 <td>
			 <input type="text" name="m_addr2" id="m_addr2" value="${memberVO.m_addr2 }">
			 <span id="addrMessage"></span>
			 </td>
			 
		</tr>
		 
		<tr>
			<td>����� �����</td>
			<td>
			<%-- <a href="#" onclick="openPdf('${memberVO.m_file1}')">${memberVO.m_file1}</a> --%>
			<div class="input-group mb-3">
			  <div class="custom-file">
			    <input type="file" class="custom-file-input" name="m_uploadFile1" id="m_uploadFile1" aria-describedby="m_uploadFile1" onchange="updateFileName('m_uploadFile1')" value="${memberVO.m_file1 }">
			    <label class="custom-file-label" for="inputGroupFile03">${memberVO.m_file1}</label>
			  	<span id="file1Message"></span>
			  </div>
			</div>
			</td>
		</tr>
		<tr>
		   <td>�߰� �����</td>
		   <td>
		   <%-- <a id="savedFile2" href="#" onclick="openPdf('${memberVO.m_file2}')">${memberVO.m_file2}</a> --%>
		   <!-- <button id="fileUpdateBtn2" type="button" onclick="toggleFileUpload()">÷������ ����</button> -->
		       <div class="input-group mb-3">
		           <div class="custom-file">
		               <input type="file" class="custom-file-input" id="m_uploadFile2" name="m_uploadFile2" aria-describedby="inputGroupFileAddon03" onchange="updateFileName('m_uploadFile2')" value="${memberVO.m_file2 }">
		               <label class="custom-file-label" for="inputGroupFile03">${memberVO.m_file2}</label>
		           	<span id="file2Message"></span>
		           </div>
		       </div>  
		   </td>
		</tr>
		</c:if>
		 </table>
		 <a style="margin-left:95%; font-size: 16px;" href="${pageContext.request.contextPath}/member_join/deleteMember.jsp">Ż���ϱ�</a>
		 <div style="margin-top: 2%;">
		 	<button type="button" onclick="submitForm()" class="btn03" style="margin-left:30%;">�����ϱ�</button>
		 </div>
		 
		 <!-- <div><button type="button" onclick="deleteMember()" class="btn04">Ż���ϱ�</button></div> -->
	
		 </form>
	</div>
 </div>

</body>
  <c:import url="../LB_NEST_UNDER.jsp"></c:import> 
</html><!-- C:/1kosmosc/sts/work-space/Test_LBnest03/src/main/webapp/resources/pdf/ -->