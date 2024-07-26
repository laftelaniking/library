<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
  function check_pwd(){
	var name = document.getElementById('name').value; 
	var id = document.getElementById('id').value;
	var dupli_num = document.getElementById('dupli_num').value;
    var pwd = document.getElementById('pass').value; // pwd라는 이름을 가진 id 참조
    var pwd2 = document.getElementById('pass2').value;
    var email = document.getElementById('email').value;
    var birth = document.getElementById('birth').value;
    var phone = document.getElementById('phone').value;
    var address_detail = document.getElementById('address_detail').value;
    var SC = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
    var check_SC = 0;
    
    if (name=='')
    {
      alert('이름을 입력하세요');
      document.member_register.name.focus();
      return false;
   	}
    if (id=='')
    {
      alert('ID를 입력하세요');
      document.member_register.id.focus();
      return false;
   	}
    if (dupli_num=='0')
    {
      alert('ID중복확인을 해주시기 바랍니다.');
      return false;
    }
    if (pwd=='')
    {
      alert('비밀번호를 입력하세요');
      document.member_register.pass.focus();
      return false;
    }
    if(pwd.length < 6 || pwd.length > 16) {
      window.alert('비밀번호는 6자 이상, 16자 이하, 특수기호를 사용해야합니다');
      document.getElementById('pass').value=''; // 입력이 맞지않으면 비밀번호 초기화
      return false;
    }

    for(var i = 0; i < pwd.length; i++){
      if(SC.test(pwd)) { // 전체 비밀번호 문자열에 대해 특수문자를 확인
        check_SC = 1; // 특수문자가 들어갔는지 확인한다. 들어갔으면 1로 리턴
        break; // 특수문자가 발견되면 루프를 종료한다.
      }
    }

    if(check_SC === 0) {
      window.alert('특수문자가 들어가 있지 않습니다'); // 0으로 리턴받으면 출력
      document.getElementById('pass').value=''; // 입력이 맞지않으면 비밀번호 초기화
      document.member_register.pass.focus();
      return false;
    }
    if (pwd2=='')
    {
      alert('비밀번호 확인란이 입력되지 않았습니다.')
      document.member_register.pass2.focus();
      return false;
    }

    if(document.getElementById('pass').value !='' && document.getElementById('pass2').value !=''){
      if(document.getElementById('pass').value == document.getElementById('pass2').value){
        document.getElementById('check').innerHTML = '일치합니다';
        document.getElementById('check').style.color = 'green';
      }
      else {
        document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
        document.getElementById('check').style.color='red';
      }
    }
    if (email=='')
    {
      alert('전자우편이 입력되지 않았습니다.');
      document.member_register.email.focus();
      return false;
    }
    if (birth=='')
    {
      alert('생년월일이 입력되지 않았습니다.');
      document.member_register.birth.focus();
      return false;
    }
    if (phone=='')
    {
      alert('전화번호가 입력되지 않았습니다.');
      document.member_register.phone.focus();
      return false;
    }
    if (address_detail=='')
    {
      alert('주소가 입력되지 않았습니다.')
      return false;
    }
	fn_check();
  }
  
  function execDaumPostcode() {
	  new daum.Postcode({
	        oncomplete: function(data) {
	            var fullAddr = '';
	            var extraAddr = '';
	            
	            if (data.userSelectedType === 'R') fullAddr = data.roadAddress;
	            else fullAddr = data.jibunAddress;

	            if(data.userSelectedType === 'R') {
	                if(data.bname !== '') extraAddr += data.bname;
	                if(data.buildingName !== '') extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

             document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	           //옛날구번호 document.getElementById("jusocode").value = data.postcode;
	           document.getElementById("address").value = fullAddr;
             //document.getElementById("zipcode").value = data.postcode;
	        }
	  }).open();
 }//execDaumPostcode end
 
 function duplicate(){
	  window.open('id_duplicate.do?idx='+document.member_register.id.value,'_blank','width=500, height=150, top=50, scrollbars=yes');
 }
 
 function fn_check() {
		/*if( document.myform.chk[0].checked == false ||
		    document.myform.chk[1].checked == false ) {
			alert("모든 약관에 동의해야 진행할 수 있습니다.");
			return false;
		}*/
		var tf = true;
		var len = document.getElementsByName("agree").length;
		for(var i=0; i<len; i++) {
			if( document.getElementsByName("agree")[i].checked == false ) {
				tf = false;
			}
		}
		if( tf == false ) {
			alert("모든 약관에 동의해야 진행할 수 있습니다.");
			return false;
		}
	    document.member_register.action="memberWriteSave.do";
	    alert('회원가입에 성공했습니다.');
	    document.member_register.submit();

	}
	function fn_allcheck() {
		// boolean 타입 : 
		var bool = document.frm.allcheck.checked;  // true or false
		var len = document.getElementsByName("agree").length;
		for (var i=0; i<len; i++) {
			document.getElementsByName("agree")[i].checked = bool;
		}
		
		//document.myform.chk[0].checked = bool;
		//document.myform.chk[1].checked = bool;
	}
</script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MINGW's Library</title>
<link href="./resources/static/css/styles2.css" rel="stylesheet" />
<style>
        textarea , h1,h2,h3{
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 1em;
        }
        p{
            margin: 0;
            padding: 0;
            word-break: break-all;
        }
        #container {
            position: relative;
            min-height: 500px;
            height: auto !important;
            background: #fff;
            zoom: 1;
        }
        #wrapper{
            z-index: 5;
            margin: 20px auto;
            width: 1000px;
            zoom: 1;
            position: relative;
        }
        #chapter_1 , #chapter_2{
            display: block;
            margin-bottom: 10px;
            padding: 5px;
            width: 98%;
            height: 150px;
            border: 1px solid #e9e9e9;
            background: #f7f7f7;
        }
        .btn_submit {
            width: 120px;
            height: 53px;
            border: 0;
            border-radius: 5px;
            padding: 13px 0;
            font-size: 1.09em;
            font-weight: bold;
            letter-spacing: 0;
            background-color: #86bf62;
            color: #fff;
            margin: 0;
            vertical-align: middle;
        }
       
    </style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원가입</h3>
								</div>
								<div class="card-body">
								
								
				<!--<form action="memberWriteSave.do" method="POST">-->
									<form name="member_register">
										<div class="form-floating mb-3">
											<input class="form-control" id="name" type="text"
												placeholder="Enter your name" name="name"/> <label for="inputName">이름</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="id" type="text"
												placeholder="Enter your id" name="id"/> <label for="inputName">아이디</label>
												&nbsp;<input type=button  onclick="duplicate();" value="중복확인" class="btn btn-success btn-sm">
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="pass"
														type="password" placeholder="Create a password" name="pass"/> <label
														for="inputPassword">비밀번호(6자리 이상 16자이하, 특수문자)</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="pass2"
														type="password" placeholder="Confirm password" name="pass2"/> <label
														for="inputPasswordConfirm">비밀번호 확인</label><span id="check"></span>
												</div>
											</div>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="email" type="email"
												placeholder="name@example.com" name="email"/> <label for="inputEmail">전자우편
												</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="birth" type="text"
												placeholder="" name="birth"/> <label for="inputEmail">생년월일(ex.200413)
												</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="phone" type="text"
												placeholder="" name="phone"/> <label for="inputEmail">전화번호
												</label>
										</div>
										<div class="form-floating mb-3">
											우편번호: <input type=text  name="zipcode" id="zipcode" size="8" class=myinput > &nbsp;
	   			 						<input type=button  onclick="execDaumPostcode();" value="우편번호" class="btn btn-success btn-sm">
												</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="address" type="text"
												placeholder="" name="address"/ readonly> <label for="inputEmail">주소
												</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="address_detail" type="text"
												placeholder="" name="address_detail"/> <label for="inputEmail">상세주소
												</label>
											<input type="hidden" id="dupli_num" name="dupli_num" value="0"/>
										</div>
										<div class="mt-4 mb-0">
										</div>
									</form>
        <div id="container">
            <div style="margin-bottom: 15px; font-size: 1.3em; font-weight: bold;">
                회원가입약관
            </div>
                <p style="color: #e8180c; text-align: center;">회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
                
                <section style="margin: 0 0 20px; padding: 20px 0;">
                    <h2 style="font-size: 1em; margin: 0 0 20px; text-align: center;">회원가입약관</h2>
                    <textarea readonly id="chapter_1">
Cummunity 서비스약관 (2022. 01. 01 부터 유효)

제1조(목적 등)
① Cummunity (www.Mtest.co.kr) 서비스 약관(이하 "본 약관"이라 합니다)은 이용자가 ㈜ www_pilot(이하 "Cummunity"이라 합니다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있 어 이용자와 "Cummunity"의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

② 이용자가 되고자 하는 자가 "Cummunity"이 정한 소정의 절차를 거쳐서 "등록하기" 단추를 누르면 본 약관에 동의하는 것 으로 간주합니다. 본 약관에 정하는 이외의 이용자와 "Cummunity"의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기 타 대한민국의 관련 법령과 상관습에 의합니다. 
 
 

제2조(이용자의 정의)
① 이용자"란 "Cummunity"에 접속하여 본 약관에 따라 "Cummunity" 회원으로 가입하여 "Cummunity"이 제공하는 서비스를 받는 자를 말합니다. 
 


제3조(회원 가입)
① 이용자가 되고자 하는 자는 "Cummunity"이 정한 가입 양식에 따라 회원정보를 기입하고 "등록하기" 단추를 누르는 방법으로 회원 가입을 신청합니다. 

② "Cummunity"은 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다. 
 
1. 가입신청자가 본 약관 제6조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만 제7조 제3항에 의한 회원자 격 상실 후 3년이 경과한 자로서 "Cummunity"의 회원재가입 승낙을 얻은 경우에는 예외로 합니다. 
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
3. 기타 회원으로 등록하는 것이 "Cummunity"의 기술상 현저히 지장이 있다고 판단되는 경우 
 
③ 회원가입계약의 성립시기는 "Cummunity"의 승낙이 가입신청자에게 도달한 시점으로 합니다.  
④ 회원은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 
 
 

제4조(서비스의 제공 및 변경) 
① "Cummunity"은 이용자에게 아래와 같은 서비스를 제공합니다.

1. 한메일넷 서비스
2. 인터넷동호회 카페 이용서비스
3. 칼럼 서비스 
4. 메시지 전송, 메일 통보, 친구찾기, 1:1 채팅, 실시간 뉴스, 증권정보의 제공 등을 내용으로 하는 메신저 서비스
5. 이동통신(핸드폰/PCS)으로 문자메세지를 발송할 수 있는 SMS서비스를 비롯한 무선인터넷 서비스 
6. 사람찾기 서비스. 다만, 사람찾기 서비스를 통하여 자신의 이용자정보가 공개되기를 원하지 않는 이용자는 가입시 또는 가입후 이용자정보관리 화면에서 비공개로 설정할 수 있습니다.
7. 회원을 위한 섹션 및 컨텐트 서비스, 맞춤 서비스
8. 기타 "Cummunity"이 자체 개발하거나 다른 회사와의 협력계약 등을 통해 회원들에게 제공할 일체의 서비스
 
② "Cummunity"은 그 변경될 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 이용자에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.

③ "Cummunity"은 "한메일넷 서비스"의 원활한 수행을 저해하는 제3자와 이용자간 혹은 이용자간 스팸메일, 대량메일 등 의 전송행위를 방지하기 위하여 여러가지 기술적, 제도적 정책(예: 온라인 우표제, 스팸메일방지정책 등)을 시행할 수 있으며, 이 로 인하여 "이용자"는 "Cummunity"이 제공하는 "한메일넷 서비스" 이용에 제한을 받을 수 있습니다.(2022년 12 월 18일자 변경) 
 
 

제5조(서비스의 중단)
① "Cummunity"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제 공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 "Cummunity"이 적절하다고 판단하는 사유에 기하여 현재 제공 되는 서비스를 완전히 중단할 수 있습니다. 

② 제1항에 의한 서비스 중단의 경우에는 "Cummunity"은 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다. 다 만, "Cummunity"이 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스 템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다. 
 


제6조(이용자 탈퇴 및 자격 상실 등)
① 이용자는 "Cummunity"에 언제든지 자신의 회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청할 수 있으며 "Cummunity"은 위 요청을 받은 즉시 해당 이용자의 회원 등록 말소를 위한 절차를 밟습니다. 

② 이용자가 다음 각 호의 사유에 해당하는 경우, "Cummunity"은 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다. 
 
1. 가입 신청 시에 허위 내용을 등록한 경우 
2. 다른 사람의 "서비스" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 
3. "서비스"를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 
 
③ "Cummunity"이 이용자의 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 이용자인 회원에게 회원 등록 말소 전에 이를 통지하고, 말소통지를 받은 날로부터 30일 이내에 소명할 기회를 부여합니다. (202년 7월 18일자 변 경)  

④ "이용자"가 본 약관에 의해서 회원 가입 후 "서비스"를 이용하는 도중, 연속하여 3개월 동안 "서비스"를 이용하기 위 해 log-in한 기록이 없는 경우, "Cummunity"은 이용자로 하여금 "한메일넷 서비스" 상에서 전자우편을 수령할 수 없도 록 제한을 가할 수 있습니다. (2022년 12월 18일자 변경) 

⑤ "이용자"가 본 약관에 의해서 회원 가입 후 "서비스"를 이용하는 도중, 연속하여 1년 동안 "서비스"를 이용하기 위 해 log-in한 기록이 없는 경우, "Cummunity"은 이용자의 회원자격을 상실시킬 수 있습니다.(2022년 6월28일자 변 경)  



제7조(이용자에 대한 통지)
① "Cummunity"이 특정 이용자에 대한 통지를 하는 경우 "Cummunity"이 부여한 메일주소로 할 수 있습니다. 

② "Cummunity"이 불특정다수 이용자에 대한 통지를 하는 경우 칠(7)이상 "Cummunity" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 
 


제8조(이용자의 개인정보보호)
① "Cummunity"은 맞춤서비스 제공을 목적으로, 이용자가 "Cummunity"회원으로 가입하는 시점에서, 이름, 성별, 주소, 연락처, 생년월일을 필수적인 개인정보로 수집합니다. (2022년 7월 18일자 신설) 

② "Cummunity"은 관련법령이 정하는 바에 따라서 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위하여 노력합니 다. 이용자의 개인정보보호에 관해서는 관련법령 및 "Cummunity"이 정하는 "개인정보보호정책"에 정한 바에 의합니다. 
 


제9조("Cummunity"의 의무)
① "Cummunity"은 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. 

② "Cummunity"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 구축합니다. 

③ "Cummunity"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 

④ "Cummunity"은 이용자가 서비스를 이용함에 있어 "Cummunity"의 고의 또는 중대한 과실로 인하여 입은 손해를 배상할 책임을 부담합니다. 
 


제10조(이용자의 ID 및 비밀번호에 대한 의무)
① "Cummunity"이 관계법령, "개인정보보호정책"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 이용자에게 있습니다. 

② 이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 

③ 이용자는 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "Cummunity"에 통보하고 "Cummunity"의 안내가 있는 경우에는 그에 따라야 합니다. 
 


제11조(이용자의 의무)
① 이용자는 다음 각 호의 행위를 하여서는 안됩니다. 
 
1. 회원가입신청 또는 변경시 허위내용을 등록하는 행위 
2. "Cummunity"에 게시된 정보를 변경하는 행위
3. "Cummunity" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위 
4. 다른 회원의 ID를 도용하는 행위 
5. 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입 할 것을 권유하는 메일, 외설 또는 폭력적인 메시지 ·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또 는게시하는 행위. 
6. 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 전송 또는 게시하는 행위
7. 다음의 직원이나 다음 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메일을 발송하는 행위
8. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위
9. 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위
10. 다른 이용자에 대한 개인정보를 그 동의 없이 수집,저장,공개하는 행위
11. 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 "Cummunity"의 서비스를 이용하여 영리목적의 활동을 하는 행위
12. "Cummunity"이 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위
 
② 제1항에 해당하는 행위를 한 이용자가 있을 경우 "Cummunity"은 본 약관 제6조 제2, 3항에서 정한 바에 따라 이용자의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.

③ 이용자는 그 귀책사유로 인하여 "Cummunity"이나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.

④ 민법상 미성년자인 이용자가 유료 콘텐츠 이용을 위해 결제하고자 할 경우 미성년자인 이용자는 법정대리인의 사전 동의를 얻어야 합니다.(2022년 10월 11일자 신설)
 
 

제12조(공개게시물의 삭제)
① 이용자의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "Cummunity"은 이용자에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 이용자의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다. 
1. 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용
2. 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
3. 범죄행위와 관련이 있다고 판단되는 내용
4. 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
5. 기타 관계 법령에 위배된다고 판단되는 내용 
6. 종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 Cummunity의 업무가 방해되거나 방해되리라고 판단되는 경우 (2022년 1월 11일자 신설)  

② 이용자의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 이용자 또는 제3자가 이용자 또는 "Cummunity"을 대상으 로 하여 민형사상의 법적 조치(예:고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해 오는 경우, "Cummunity"은 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관 련 게시물에 대한 접근을 잠정적으로 제한할 수 있습니다. (2022년 1월 11일자 신설) 
  


제13조(저작권의 귀속 및 이용제한)
① "Cummunity"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "Cummunity"에 귀속합니다. 

② 이용자는 "Cummunity"을 이용함으로써 얻은 정보를 "Cummunity"의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. 
 


제14조(약관의 개정)
① "Cummunity"은 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.  

② 다만, 개정 내용이 "이용자"에게 불리할 경우에는 적용일자 삼십(30)일 이전부터 적용일자 전일까지 공지합니다. (2022년 7월 18일자 변경) 

③ "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사 를 표명할 수 있습니다. "이용자"가 거부하는 경우 "Cummunity"은 당해 "이용자"와의 계약을 해지할 수 있습니다. 만 약 "이용자"가 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니 다. (2022년 12월 18일자 변경) 
 
 

제15조(재판관할)
 "Cummunity"과 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다. (2022년 12월 18일자 변경) 

부칙
본 약관은 2024. 04. 23 부터 적용되는 약관으로 대체합니다.
                    </textarea>
                    <fieldset  style="padding: 10px 0 0; text-align: right;">
                        <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
                        <input type="checkbox" name="agree" id="agree11" class="checkbox">
                    </fieldset>
                </section>
                <section style="margin: 0 0 20px; padding: 20px 0;">
                    <h2 style="margin: 0 0 20px; text-align: center; font-size: 1em;">개인정보처리방침안내</h2>
                    <textarea readonly id="chapter_2">
온라인 구인구직사이트를 운영하는 (주)웹모아소프트는 (이하 “당사”라 표기함)는 주요정보 암호화를 포함한 

"정보통신망 이용촉진 및 정보보호"에 관한 법률과 통신비밀보호법등을 준수하고 있습니다.

개인정보취급방침을 변경하는 경우 "이용자"가 쉽게 볼수 있도록 공지해드립니다.



⊙ 용어정의

* 정보통신 단말기(컴퓨터, 휴대폰, TV등...)로 접속이 가능한 가상의 영업/마케팅장소와  인터넷 홈페이지는 “사이트”로 표기됩니다.

* "당사"가 운영하는 인터넷 온라인 구인구직  "사이트"를 “당 사이트”로 표기합니다.

  하나의 통합된 "아이디", "비밀번호"로 "당 사이트"를 이용할 수 있습니다.

* 마우스 클릭(선택버튼 누름)에 의해 인터넷상으로 연결되어있는 상태를 “링크”로 표기합니다.

* "당 사이트”에 등록된 "링크"를 포함한 모든 내용은 “자료”로 표기됩니다.   자료 예: 회원정보, 증명서, 사진/이미지, 각종광고 및 이력서, 각종 데이터, 매매정보, 답글/꼬릿말, 홍보물 또는 클릭시 타 "사이트"로 이동되는 "링크" 등등



* “당 사이트”에 기본적인 정보를 제공하고 “이용자” 개별인식 식별코드 (이하 “아이디” 또는 "ID"로 표기)를 부여받은 사람(또는 회사/단체)을 “회원”으로 표기합니다. "회원"은 일반회원, 정회원, 기업회원, 개인 또는 구직회원, 유료회원, 무료회원등으로 구분될 수 있습니다.

* "회원"을 포함한 모든 "당 사이트" 방문객을 “이용자”라 표기합니다.

* "비밀번호" 또는 "패스워드"는 본인 확인을 위해 "이용자"가 지정한 영문과 숫자 조합을 뜻합니다.



■ 수집하는 개인정보 항목



"당 사이트"는 회원가입, 상담, 서비스 신청, 마케팅 또는 관리상의 이유등을 위해아래와 같은 개인정보를 수집하고 있습니다.

주민번호를 수집하지 않으므로 반드시 핸드폰, 이메일등을 기록해 주십시요 (아이디등의 정보분실시 핸드폰 또는 이메일로 발송!).

다른 방법으로는 "이용자" 본인확인 절차가 번거롭거나 불가능해 피해를 당하실 수 있습니다.



ο 수집항목 : 이름 , 출생연도 및 성별 , 비밀번호(운영자도 풀 수 없는 암호화), 로그인ID , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 직책 , 회사전화번호 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보 , 결제기록 및 "이용자"본인의 필요에 의해 "당 사이트"에 입력한 정보등 참고로, 출생연도와 성별을 간단히 암호화를 한 것은 악의적인 해킹등으로 개인정보대량 유출시 비교적 안전하도록 한 것입니다만, "당 사이트"내의 취업정보등에는 "이용자"가 조회가능하도록 성별과 나이를 프로그램으로 풀어 표시할 수 있습니다.

   

ο 개인정보 수집방법 : "당 사이트"(회원가입 및 광고등록등) , 제휴사로 부터의 제공



■ 개인정보의 수집 및 이용목적



"당 사이트"는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 콘텐츠 제공,매출관리, 구매 및 요금 결제 , 물품배송 또는 청구지 발송등

ο 회원 관리

  회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달

ο 마케팅 및 광고에 활용

  이벤트 등 광고성 정보 전달 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계



■ 개인정보의 보유 및 이용기간 



원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.(아래 표시는 최대 보존기간 및 최대 보존항목으로 "당사" 사정에 따라 표시된 기간 이전에 삭제 또는 아예 저장이나 보존하지 않을 수도 있습니다.)



보존 항목 : 이름 , 출생연도 및 성별 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 ,회사전화번호 , 쿠키 , 접속 IP 정보, 접속 로그 및 "이용자"본인의 필요에 의해 "당 사이트"에 입력한 정보 보존 근거 : 불량회원의 재 가입방지, 마케팅자료로 활용 보존 기간 : 최대 5년 미만

보존 항목 : 로그인ID

보존 근거 : 동일 id재가입에 따른 프로그램 에러방지

보존 기간 : 목적 달성시까지



보존 항목 : 직업 , 회사명 , 직책 , 서비스 이용기록 , 비밀번호 , 접속 로그

보존 근거 : 관리편리

보존 기간 : 최대 5년 미만



그리고 관계법령의 규정에 의하여 보존할 필요가 있는 경우 사이트는 아래와 같이

관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

보존 항목 : 결제기록 관련 (특성상 일부 개인정보가 동시 보존될 수도 있습니다.) 

보존 근거 : 부가가치세법 및  "당사" 매출분석 근거자료

보존 기간 : 최대 10년 미만



계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)관련법령 (직업안정법등...)



■ 개인정보의 파기절차 및 방법 



"당 사이트"는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

ο 파기절차

   "회원"가입 등을 위해 입력하신 정보는 목적이 달성된 후 (종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 (보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.

ο 파기방법

   전자적 컴퓨터 파일형태로 저장된 개인정보는 일반적인 방법으로는 기록을 재생할 수 없도록  데이터베이스(DB)에서 삭제합니다.



■ 개인정보 제공 



"당사"는 "이용자"의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

   - 공지사항을 통해 사전에 3개월 이상 충분히 공지한 경우 또는 이용자들이 사전에 동의한 경우. 

   - "당 사이트"의 인수합병 또는  매각될 경우 사전에 공지사항을 통해 공지드립니다.

   - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라

     수사기관의 요구가 있는 경우

   - "자료"(광고, 이력서포함)의 타사 제휴"사이트" 동시등록 관련(아래 "자료"배포 및 링크 참조!)



■ "자료" 배포 및 "링크"관련 



자발적으로 공개된 정보는 보호받기 어려우며, 또한 일반적으로 광고/홍보성 게시물은 "당 사이트" 개인정보책임자의 의지와 전혀 상관없이 타인으로 부터 쉽게 수집되고 이용될 수 있습니다. 주의하십시요.



▶ 게시물("자료")배포관련

구인/구직(이력서)광고, 홍보(또는 광고), 만남 또는 이벤트관련 ”자료”등 타인에게 알리기 위해 자발적으로 게시된 내용은 빠른 목적 달성을 위해 다른 회사 제휴"사이트"에 동시 게재를 원칙으로 하고 있습니다. 이때 “이용자” 본인의 "아이디" 및 "비밀번호"등은 제공하지 않습니다.(성별 및 출생연도는 타인이 조회가능토록 노출된 "자료"는 그대로 제공합니다.) 제휴"사이트"에 등록된 "자료"는 해당"사이트"의 정책에 따릅니다. 동시등록을 원하지 않는 경우 바로 삭제요청을 해 주시기 바랍니다. 제휴"사이트"에 동시등록된 "자료"의 수정이나 삭제는 "당 사이트"에서만 하시면 동시에 적용되나, 일부 사이트/홈페이지에서는 광고 삭제가 불가능할 수도 있습니다.이 경우 관리자에게 삭제요청 해 주시기 바랍니다.



▶ "링크"사이트 관련

"당사"는 다른 회사의 사이트 또는 "자료"에 대한 "링크"를 제공할 수 있습니다."링크"를 통해 방문한 외부 "사이트"(타인 소유의 사이트)는 해당 "사이트"의 개인정보보호정책,신뢰성등을 검토하시기 바랍니다



■ 수집한 개인정보의 위탁 



"당 사이트"는 고객님의 정보를 외부 업체에 위탁하지 않습니다.향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무내용에 대해 "당 사이트"내 공지사항을 통해 공지를 하겠습니다. 



현재, 정보위탁은 아니나 "당 사이트" 운영에 필수적인 외부 홈페이지 호스팅업체와 프로그램/디자인 수정관련 업체는 "당 사이트"에 접근이 가능합니다. 단기 또는 1회성 접근허용인 경우 수정 또는 보완 목적달성과 동시에 가능한 비밀번호를 변경합니다.



■ 이용자 및 법정대리인의 권리와 그 행사방법 



"이용자"는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 직접 가입해지할 수도 있습니다.이용자들이 자신의 개인정보를 조회 또는 수정을 위해서는 로그인 후 ‘개인정보변경’(또는 ‘회원정보수정’ 등) 이용해 직접 할수 있으며, 가입해지/탈퇴를 위해서는 로그인 후“회원탈퇴”를 클릭하여 탈퇴가 가능합니다.그외에 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시는 경우는 사정에 따라 일부 지연될수도 있으므로 가능한 로그인 후 직접 탈퇴를 권장합니다. 개인정보의 오류에 대한 정정은 로그인 후 개인정보변경을 하시면 보통 즉시 수정반영됩니다. 이때 잘못된 개인정보를 제3자(제휴사 포함)에게 이미 제공한 경우에는 정정 처리결과를



제3자에게 가능한 빨리 통지하여 정정이 이루어지도록 하겠습니다.



"당 사이트"는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 “당사"가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람또는 이용할 수 없도록 처리하고 있습니다.



■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항



"당 사이트"는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. "당사이트"는 다음과 같은 목적을 위해 쿠키를 사용합니다.



▶ 쿠키 등 사용 목적

회원과 비회원의 접속 빈도나 방문 시간등의 분석을 통한 웹 서비스제공의 품질 향상 및 방문객 편리를 위한 개인 맞춤 서비스 제공등에 활용합니다. 쿠키는 이용자의 컴퓨터는 식별하지만 이용자를 개인적으로 식별하지는 않습니다. "이용자"는 쿠키 설치에 대한 선택권을 가지고 있습니다. 단, 쿠키 설치를 거부하였을 경우 맞춤서비스등 유용한 서비스를 원할히 이용하는데 어려움이 있을 수 있습니다.

▶ 쿠키 설정 거부 방법

예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보



■ 개인정보에 관한 민원서비스 



고객의 개인정보보호 및 개인정보 관련 불만을 처리하기 위하여 아래와 같이

개인정보관리책임자를 지정하고 있습니다.



개인정보관리책임자 성명 : 신하철

전화번호 : 010-4710-4343

이메일 : opage@naver.com



"당 사이트"의 민원사항 처리를 위한 운영현황과 연락처는 다음과 같습니다.

근무시간 : 연락처보기 또는 고객센터 참조 ("당 사이트" 좌측메뉴 또는 하단에 있습니다.)

전화번호 : 위 개인정보관리 책임자와 동일

"당사"의 서비스로 인해 발생하는 모든 개인정보보호 관련 민원을 개인정보관리

책임자 혹은 담당부서로 신고하실 수 있습니다. "당 사이트"는 "이용자"들의 신고사항에 대해

성실히 답변드리겠습니다.



기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

1.개인분쟁조정위원회 (www.1336.or.kr/1336)

2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)

3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)

4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)

 



■ 부칙



개인정보취급방침 내용 변동이 있을 시에는 개정 전에 '공지사항'을 통해 안내드리겠습니다.
                    </textarea>
                    <fieldset class="fregister_agree" style="padding: 10px 0 0; text-align: right;">
                        <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
                        <input type="checkbox" name="agree" id="agree21" class="checkbox">
                    </fieldset>
                </section>
                <section style="margin: 0 0 20px; padding: 20px 0; text-align:right;">
                	<label for="agree31">모두 동의합니다.</label>
                    <input type="checkbox" name="allcheck"  onclick="fn_allcheck()" id="agree31" class="checkbox">
                </section>
                <div style="text-align: center;">
                    <input type="button" class="btn_submit" onclick="check_pwd();" return false;" value="회원가입" style="cursor: pointer;">
                </div>
    
            </form>
        </div>
    </div>
								
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		    <div id="wrapper">

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
</body>
</html>