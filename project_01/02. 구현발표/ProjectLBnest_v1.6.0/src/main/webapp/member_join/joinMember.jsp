<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%
    String m_grade = request.getParameter("m_grade");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" type="text/css" />
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/joinMember.js"></script> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="EUC-KR">
<title>LBnest ȸ������</title>

<script>

let m_grade = "<%= m_grade %>"; 
let idConfirm = 0;
let codeConfirm = 0; 
let pwdConfirm = 0; //��й�ȣ Ȯ���� �������� 1 �ȴ������� 

document.addEventListener('DOMContentLoaded', function() {
	// ��ȭ��ȣ �Է� ���� ���
    const phoneFirstPart = document.getElementById('phoneFirstPart');
    const phoneSecondPart = document.getElementById('phoneSecondPart');
    const phoneThirdPart = document.getElementById('phoneThirdPart');
    // �̸��� �Է� ���� ���
    const emailInput = document.getElementById('emailInput');
    const domainInput = document.getElementById('domainInput');
    const emailAddrSelect = document.getElementById('emailAddrSelect');
    const fullEmail = document.getElementById('fullEmail');

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
    });
    //�Է� ���� 
    phoneFirstPart.addEventListener('input', function(event) {
        validateNumberInput(event, 3);
    });
    phoneSecondPart.addEventListener('input', function(event) {
        validateNumberInput(event, 4);
    });
    phoneThirdPart.addEventListener('input', function(event) {
        validateNumberInput(event, 4);
    });
    
    if(m_grade == 2){
	    const codeInput = document.getElementById('m_counselor_code');
	    codeInput.addEventListener('input', function(event) {
	        validateCodeInput(event, 11);
	    });
    }    

  //============�޽��� �� �� �ʵ� �����ϸ� �޽��� �ʱ�ȭ===================================

 // �Լ��� �޽��� �ʱ�ȭ �� ��Ÿ�� �ʱ�ȭ
 function resetMessage(messageElement) {
     messageElement.textContent = "";
     messageElement.style.color = "";
     messageElement.style.fontWeight = "";
     messageElement.style.fontSize = "";
 }

 // �� �Է¶� ��Ŀ�� �̺�Ʈ ������ �߰�
 document.getElementById('m_name').addEventListener('focus', function() {
     resetMessage(nameMessage);
 });
 document.getElementById('emailInput').addEventListener('focus', function() {
     resetMessage(emailMessage);
 });
 document.getElementById('phoneFirstPart').addEventListener('focus', function() {
     resetMessage(phoneMessage);
 });
 
 
});


// ���ڸ� �Է� ���� �Լ�
function validateNumberInput(event, maxLength) {
    const input = event.target;
    const value = input.value;

    const filteredValue = value.replace(/[^0-9]/g, '');

    if (filteredValue.length > maxLength) {
        input.value = filteredValue.slice(0, maxLength);
    } else {
        input.value = filteredValue;
    }
}
//����, - �� �Է°���
function validateCodeInput(event, maxLength) {
    const input = event.target;
    const value = input.value;

    const filteredValue = value.replace(/[^0-9-]/g, '');

    if (filteredValue.length > maxLength) {
        input.value = filteredValue.slice(0, maxLength);
    } else {
        input.value = filteredValue;
    }
}

        


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
 	const m_pwd = document.getElementById("m_pwd").value;
 	const m_pwdck = document.getElementById("m_pwdck").value;
 		
	//�޽��� ����
	const idMessage = document.getElementById("checkIdMessage");
	const codeMessage = document.getElementById("checkCodeMessage");
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

    if (id === "" || !id|| id == null||$.trim(id).length == 0) { // $.trim(id) : ���ڿ� �¿��� ���� ����, length : ���ڿ� ����, id�� �Է¹��� ���� ���
    	idMessage.textContent = "ID�� �Է����ּ���.";
    	idMessage.style.color = "red";
    	idMessage.style.fontWeight = "bold";
    	idMessage.style.fontSize = "16px";
        return false;  // ȸ�� ���� ���� ����
      }
    if(idConfirm === 0 ){
    	idMessage.textContent = "���̵� �ߺ� ���θ� Ȯ���� �ּ���.";
    	idMessage.style.color = "red"; // Set red color
    	idMessage.style.fontWeight = "bold"; // Set bold font weight
    	idMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
    if(m_name == null || m_name === ""||!m_name || $.trim(m_name).length == 0){
    	nameMessage.textContent = "�̸��� �Է����ּ���.";
    	nameMessage.style.color = "red"; // Set red color
    	nameMessage.style.fontWeight = "bold"; // Set bold font weight
    	nameMessage.style.fontSize = "16px"; // Set font size
    	return false;	
    }
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
    if(m_grade == 2 && codeConfirm === 0){
    	codeMessage.textContent = "���� �ڵ� �ߺ� ���θ� Ȯ���� �ּ���.";
    	codeMessage.style.color = "red"; // Set red color
    	codeMessage.style.fontWeight = "bold"; // Set bold font weight
    	codeMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
    if(pwdConfirm === 0){
    	PwdMessage.textContent = "��й�ȣ�� ��й�ȣ Ȯ���� ��ġ�ϴ��� Ȯ���� �ּ���.";
    	PwdMessage.style.color = "red"; // Set red color
    	PwdMessage.style.fontWeight = "bold"; // Set bold font weight
    	PwdMessage.style.fontSize = "16px"; // Set font size
    	return false;
    }
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
    document.getElementById('join_frm').submit();
}

/* //	var m_grade = sessionStorage.getItem('m_grade');
    function submitGrade(m_grade) {
    	// m_grade ���� hidden input�� ����
        document.getElementById('m_grade').value = m_grade;
    } */
 //���̵� �ߺ� Ȯ�� ������ �ߺ��� ������ confirm = 1
function checkId() {
    var id = document.getElementById("m_id").value; // �Էµ� ID ��������
    var messageElement = document.getElementById("checkIdMessage");

	 //id �Է� ������ �� ���� ����
      if (id === "" || !id|| id == null||$.trim(id).length == 0) { // $.trim(id) : ���ڿ� �¿��� ���� ����, length : ���ڿ� ����, id�� �Է¹��� ���� ���
 		messageElement.textContent = "ID�� �Է����ּ���.";
	    messageElement.style.color = "red";
	    messageElement.style.fontWeight = "bold";
	    messageElement.style.fontSize = "16px";
        return false;  // ȸ�� ���� ���� ����
      }else {
	    // id�ߺ�Ȯ�� 
	    $.ajax({
	        url: "/loan/member/checkId.do",
	        type: "GET",
	        async: true,
	        data: {m_id: id},
	        success: function(response) {
	            var json = JSON.parse(response);// JSON ���ڿ��� ��ü�� ��ȯ
	            var idFlag = 0;
	           
	            idFlag = json.id_duplication_check; //id �����ϸ� 1 �ƴϸ� 0
				
	            console.log('flag : '+idFlag);
				console.log('json : '+json);
	            if (idFlag > 0) {
	                //alert("�̹� ��� ���� ID�Դϴ�.");
	    			messageElement.textContent = "�̹� ��� ���� ID�Դϴ�.";
	    		    messageElement.style.color = "red"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    idConfirm =0;
	            } else if (idFlag === 0) {
	                //alert("��� ������ ID�Դϴ�.");
	    			messageElement.textContent = "��� ������ ID�Դϴ�.";
	    		    messageElement.style.color = "blue"; // Set red color
	    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
	    		    messageElement.style.fontSize = "16px"; // Set font size
	    		    idConfirm = 1;
	            } else {
	                alert("�������� ������ �߻��߽��ϴ�.");
	                console.error(error);
	            }
	        },
	        error: function(xhr, status, error) {
	            alert("���� ��û �� ������ �߻��߽��ϴ�.");
	            console.error("Status: " + status);
	            console.error("Error: " + error);
	        }
	    });
	}
}


function checkCode(){
    var counselor_code = document.getElementById("m_counselor_code").value;
    var messageElement = document.getElementById("checkCodeMessage");
    var codeFlag = 0;

    if ($.trim(counselor_code).length == 0) { // $.trim(id) : ���ڿ� �¿��� ���� ����, length : ���ڿ� ����, id�� �Է¹��� ���� ���
	messageElement.textContent = "���� �ڵ带 �Է����ּ���.";
    messageElement.style.color = "red"; // Set red color
    messageElement.style.fontWeight = "bold"; // Set bold font weight
    messageElement.style.fontSize = "16px"; // Set font size
    return false;  // ȸ�� ���� ���� ����
  }
    
    $.ajax({
        url: "/loan/member/checkCode.do",
        type: "GET",
        data: {m_counselor_code: counselor_code},
        success: function(response) {
            var json = JSON.parse(response); // JSON ���ڿ��� ��ü�� ��ȯ
            var messageElement = document.getElementById("checkCodeMessage");
            var codeFlag = 0;

            codeFlag = json.code_check; //id �����ϸ� 1 �ƴϸ� 0
            //var messageElement = document.getElementById("checkIdMessage");
			console.log('flag : '+codeFlag);
			console.log('json : '+json);
            if (codeFlag === 1) {
                //alert("�̹� ��� ���� ID�Դϴ�.");
    			messageElement.textContent = "�̹� ��ϵ� ���� �ڵ� �Դϴ�.";
    		    messageElement.style.color = "red"; // Set red color
    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
    		    messageElement.style.fontSize = "16px"; // Set font size
    		    //submitButton.disabled = true;
            } else if (codeFlag === 0) {
                //alert("��� ������ ID�Դϴ�.");
    			messageElement.textContent = "��� ������ ���� �ڵ� �Դϴ�.";
    		    messageElement.style.color = "blue"; // Set red color
    		    messageElement.style.fontWeight = "bold"; // Set bold font weight
    		    messageElement.style.fontSize = "16px"; // Set font size
    		    //submitButton.disabled = false;
    		    codeConfirm = 1;
            } else {
                alert("�������� ������ �߻��߽��ϴ�.");
                console.error(error);
            }
        },
        error: function(xhr, status, error) {
            alert("���� ��û �� ������ �߻��߽��ϴ�.");
            console.error(error);
        }
    });
	
}	


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
	

</script>
<style>
.container{
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
	<h1>LBnest ȸ������</h1>
</div>
<div class="container">      
		<%if ("2".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">���� ���� ȸ��</h2>
		<%}else if ("3".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">�ε��� �߰� �繫�� ȸ��</h2>
		<%}else if ("4".equals(m_grade)) { %>
		<h2  class="container-sub-title" style="text-align: left; margin-top: 300px;">�Ϲ�ȸ��</h2>
		<%} %>
		
        <div class="step-indicator">
            <img src="${pageContext.request.contextPath}/resources/member/img/memberjoin02.png" alt="ȸ������ �ܰ�">
        </div>
    
	<div class="container-form">
	<form method="post" action="../member/joinMember.do" target="_self" id="join_frm" enctype="multipart/form-data">
	<input type="hidden" id="m_grade" name="m_grade" value="<%= m_grade %>">
	<table border="1">	
	 <tr>
		<td>ID</td>
		<td><input type="text" name="m_id" id="m_id" max="20" placeholder="���̵� �Է��Ͻÿ�.">
		<button type="button" class="btn01" onclick="checkId()">�ߺ�Ȯ��</button>
		<span id="checkIdMessage"></span>
		</td>
	 </tr>
	  <tr>
		<td>�̸�</td>
		<td><input type="text" name="m_name" id="m_name" placeholder="�̸��� �Է��Ͻÿ�.">
		<span id="nameMessage"></span></td>
	 </tr>
	  <%if ("2".equals(m_grade)) { %>
	 <tr>
		<td>���� �ڵ�</td>
		<td><input type="text" name="m_counselor_code" id="m_counselor_code" placeholder="�ڵ带 �Է��Ͻÿ�.">
		<button type="button" class="btn01" onclick="checkCode()">�ߺ�Ȯ��</button>
		<span id="checkCodeMessage"></span>
		</td>
	 </tr>
	 <% } %>
	 <tr>
		<td>��й�ȣ</td>
		<td><input type="password" name="m_pwd" id="m_pwd" placeholder="��й�ȣ�� �Է��Ͻÿ�."></td>
	 </tr>
	 <tr>
		<td>��й�ȣ Ȯ��</td>
		<td><input type="password" name="m_pwdck" id="m_pwdck" placeholder="��й�ȣ�� �Է��Ͻÿ�."> 
		<button type="button" class="btn01" onclick="checkPassword()">Ȯ��</button>
		<span id="password-confirm-message">���� ��ҹ���/����/Ư������ �� 2���� �̻� ����, 10��~16��</span>
		</td>
	 </tr>
	 <tr>
		<td>�̸���</td>
		<td>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="�̸����� �Է��Ͻÿ�." aria-describedby="basic-addon2" id="emailInput">
				  <label class="input-group-text" for="emailInput">@</label>
				  <input type="text" class="form-control" aria-describedby="basic-addon2" id="domainInput">
				  <select class="form-select" name="emailAddrSelect" id="emailAddrSelect" style="width:150px; text-align:center;">
					<option value="domain_input">�����Է�</option>
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
			  <input type="text" class="form-control" placeholder="010" aria-label="Server" id="phoneFirstPart">
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" placeholder="1234" aria-label="Server" id="phoneSecondPart">
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" placeholder="1234" aria-label="Server" id="phoneThirdPart">
			</div>
			<input type="hidden" id="fullPhoneNumber" name="m_phone">
			<span id="phoneMessage"></span>
		</td>
	 </tr>
	<%if ("3".equals(m_grade)) { %>
	  <tr>
		 <td width="200">�����ȣ</td>
		 <td><input type="text" name="m_zip_code" id="m_zip_code" size="7" readonly>
		   <button type="button" class="btn01" onclick="kakaopost()">�����ȣ ã��</button>
		   <span id="zipMessage"></span>
		 </td>
	</tr>
	
	<tr>
		 <td>�ּ�</td>
		 <td><input type="text" name="m_addr1" id="m_addr1" value="" placeholder=""></td>
	</tr>
	<tr>
	 	 <td>���ּ�</td>
		 <td><input type="text" name="m_addr2" id="m_addr2" value="" placeholder="���ּҸ� �Է��Ͻÿ�.">
		 <span id="addrMessage"></span>
		 </td>
		 
	</tr>
	 
	<tr>
		<td>����� �����</td>
		<td>
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="m_uploadFile1" name="m_uploadFile1" aria-describedby="inputGroupFileAddon03" onchange="updateFileName('m_uploadFile1')">
		    <label class="custom-file-label" for="m_uploadFile1">���� ����</label>
		    <span id="file1Message"></span>
		  </div>
		</div>
		</td>
	</tr>
	<tr>
		<td>�߰� �����</td>
		<td>
		<div class="input-group mb-3">
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" id="m_uploadFile2" name="m_uploadFile2" aria-describedby="inputGroupFileAddon03" onchange="updateFileName('m_uploadFile2')">
		    <label class="custom-file-label" for="m_uploadFile2">���� ����</label>
		    <span id="file2Message"></span>
		  </div>
		</div>
		</td>
	</tr>
	<% } %>
	 </table>
	 <div><button type="button" onclick="submitForm()" class="btn02">�����ϱ�</button></div>
	 </form>
	</div>
 </div>

</body>
 <c:import url="../LB_NEST_UNDER.jsp"></c:import>  
</html>