<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/login.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>

<script type="text/javascript">

    function checkId() 
    {
		var userId = document.getElementById("userId").value;
		var url = "idcheck.action?userId="+userId;
		
		ajax = createAjax();
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
			{
				callBack();
			}
		};
		
		ajax.send("");
    }
/*     
    function checkEmail()
    {
        var userEmail = document.getElementById("userId").value;
        var url = "emailcheck.action?userEmail="+userEmail
        ajax.open("GET",url,true);
        
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
			{
				var data = ajax.responseText;
				document.getElementById("hiddenEmailCk").value = data;
				
				alert("이메일이 전송되었습니다 인증번호 입력란에 올바른 인증번호를 입력해주세요.");
				alert(data);
			}
			
		};
		
		ajax.send("");
    } 

    function inputCkEmail()
    {
    	var inputCkEmail = document.getElementById("inputCkEmail").value;
    	var url="inputCkEmail.action?"+inputCkEmail
    		
    	ajax = createAjax();
		ajax.open("GET", url, true);
    	
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
			{
				var data = ajax.responseText;
				data = parseInt(data);

				if (data == document.getEmelementById("hiddenEmailCk").value)
				{	
					document.getElementById("EmailCkResult").value="1";
					document.getElementById("emailCheckResult").innerText="인증이 완료되었습니다..";
				}
			}
		};
		ajax.send("");
    	
    }
     */
    
    function checkNickname()
    {
    	var nickname = document.getElementById("nickname").value;
    	
    	var url="nicknamecheck.action?nickname="+nickname;
    	
		ajax = createAjax();
		
		ajax.open("GET", url, true);
    	
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
			{
				callBack();
			}
		};
		
		ajax.send("");
    }
    
    function checkRePw()
    {
    	
    	var userPw = document.getElementById("userPw").value;
    	var userPwCk = document.getElementById("userPwCk").value;
    	
    	var url="checkrepw.action?userPw="+userPw+"&userPwCk="+userPwCk;
    	
		ajax = createAjax();
		
		ajax.open("POST", url, true);
    	
		ajax.onreadystatechange = function()
		{
			if(ajax.readyState == 4 && ajax.status == 200)
			{
				callBack();
			}
		};
		
		ajax.send("");
    }

    
	function callBack()
	{
		var data = ajax.responseText;
		
		data = parseInt(data);
		
		// 아이디 중복 x
		if (data == 0)
		{
			document.getElementById("idCheckResult").innerText="사용 가능한 아이디입니다.";
			document.getElementById("finalId").value="1";
		}
		// 아이디 중복 o
		else if (data == 1)
		{
			document.getElementById("idCheckResult").innerText="이미 사용중인 아이디입니다.";
			document.getElementById("finalId").value="0";
		}
		// 닉네임 중복 x
		else if (data == 2)
		{
			document.getElementById("nicknameCheckResult").innerText="사용 가능한 닉네임입니다.";			
			document.getElementById("finalNickname").value="1";
		
		}
		// 닉네임 중복 o
		else if (data == 3)
		{
			document.getElementById("nicknameCheckResult").innerText="이미 사용 중인 닉네임입니다.";	
			document.getElementById("finalNickname").value="0";
		}
		// 비밀번호 확인 일치
		else if (data == 10)
		{
			document.getElementById("pwReCheckResult").innerText="비밀번호 확인 완료.";
			document.getElementById("finalPw").value="1";
		}
		// 비밀번호 확인 불일치
		else if (data == 11)
		{
			document.getElementById("pwReCheckResult").innerText="비밀번호 확인이 일치하지 않습니다.";
			document.getElementById("finalPw").value="0";
		}
	}
	
	
	$(document).ready(function()
	{
		$("#userPw").change(function()
		{
		    checkPassword($('#userPw').val(),$('#userId').val());
		});
		
		function checkPassword(userPw, userId)
		{
		    
		    /*if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userPw))*/
		    if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/.test(userPw))
		    {            
		        /* alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.'); */
		        alert('숫자+영문자 조합으로 8자리 이상 사용해야 합니다.');
		        $('#userPw').val('').focus();
		        return false;
		    }    
		    var checkNumber = userPw.search(/[0-9]/g);
		    var checkEnglish = userPw.search(/[a-z]/ig);
		    if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        $('#userPw').val('').focus();
		        return false;
		    }
		    if(/(\w)\1\1\1/.test(userPw)){
		        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
		        $('#userPw').val('').focus();
		        return false;
		    }
		        
		    if(userPw.search(userId) > -1){
		        alert("비밀번호에 아이디가 포함되었습니다.");
		        $('#userPw').val('').focus();
		        return false;
		    }
		    return true;
		}
				
	
		
	});
	
	
	function submitJoin()
	{
		
		if (document.getElementById("finalId").value=='0'|| document.getElementById("finalPw").value =='0' || document.getElementById("finalNickname").value=='0'
			|| document.getElementById("nickname").value.length < 2)
		{
			if (document.getElementById("finalId").value=='0')
			{
				alert("아이디 가입 조건이 불충분합니다.");
				return;
			}
			else if (document.getElementById("finalPw").value =='0') 
			{
				alert("비밀번호 가입 조건이 불충분합니다.");
				return;
			}
			else if (document.getElementById("finalNickname").value=='0')
			{
				alert("닉네임 가입 조건이 불충분합니다.");
				return;
			}
			else if (document.getElementById("nickname").value.length < 2)
			{
				alert("닉네임은 최소 2글자 이상 최대 4글자 이내로 지정해야 합니다.")
			}			
		}
		else
		{
			 document.getElementById("registForm").submit();
		}
		
	}
		
	
    
</script>


</head>


<body>
	<div class="wrapper">
	
		<!-- ========== 로고만 import ======================== -->
		<div class="header-logo">
			<a href="projectorsmain.action"><img style="width: 400px;" src="<%=cp %>/images/NEXTART_LOGO.png"/></a>
		</div>	
		<!-- ================================================= -->
		
		<div class="titleBox">
		<span class="joinTitle">회원가입</span>
		</div>
		
		<div class="joinOuterBox">
			<div id="joinBox">
				<form action="userRegist.action" id="registForm">
				
				
					<span class="smallCheckListTitle">이메일(ID)</span>
					<input type="text" id="userId" name="userId" placeholder="이메일 입력(ex.abd1223@test.com)"
					required="required" oninput="checkId()"/>
					
					<!-- <button type="button"  id="checkIdt" onclick="checkId()">아이디 확인</button><br> -->
					<div class="Checkalert">
					<span id="idCheckResult" class="alertCheck"></span>
					</div>
					
					<!--
					<p id="msg_false">이미 사용중이거나 사용 불가한 아이디입니다.</p>
					<p id="msg_true">사용 가능한 아이디입니다. 인증번호 발송 버튼을 눌러 인증을 완료해주세요.</p>
	
					<button type="button" id="sendPinBtn"  onclick="checkEmail()">인증번호 발송</button><br>
					<p id="msgSend"></p>
					<br />

					<input type="hidden" id="hiddenEmailCk" name="hiddenEmailCk" value="" />
					<input type="hidden" id="emailCkResult" name="hiddenEmailCk" value="" />
								
					
					<span>인증번호 입력</span>
					<input type="text" id="userEmailCk" name="userEmailCk" 
					oninput="inputCkEmail()"/>
					<button type="button">인증번호 확인</button><br>
					
					<p id="emailCheckResult"></p>
 					-->			
					
					<br />
					<span class="smallCheckListTitle">비밀번호 </span>
					<input type="password" id="userPw" name="userPw" placeholder="최소 8자 최대 16자, 영문 숫자 조합"
					required="required" oninput="checkRePw()"/>
					<!-- <button type="button">비밀번호 확인</button><br> -->
					
					
					<!--
					<p id="msg_false">잘못된 비밀번호입니다. 8~16자 영문 숫자 조합으로 입력해주세요.</p>
					<p id="msg_true">사용가능한 비밀번호입니다. 아래에도 동일하게 입력해주세요.</p> 
					-->
					
					<br />
					<span class="smallCheckListTitle">비밀번호 재입력</span>
					<input type="password" id="userPwCk" name="userPwCk" placeholder="비밀번호를 동일하게 입력해주세요."
					required="required" oninput="checkRePw()"/>
					<div class="Checkalert">
					<span id="pwReCheckResult" class="alertCheck"></span>
					</div>
					
					<br />
					<span class="smallCheckListTitle">닉네임</span>
					<input type="text" id="nickname" name="nickname" placeholder="최소 2글자, 최대 4글자" 
					required="required" oninput="checkNickname()"  maxlength="3"/>
				<!-- 	<button type="button" id="checkNicknamet" onclick="checkNickname()">중복 확인</button><br>	 -->
					<div class="Checkalert">
					<span id="nicknameCheckResult" class="alertCheck"></span>
					</div>
					
					<input type="hidden" id="finalId" name="finalId" value="0"/>
					<input type="hidden" id="finalPw" name="finalPw" value="0"/>
					<input type="hidden" id="finalNickname" name="finalNickname" value="0"/>
					
					
					<!-- == 가입하기 전송 / 유효성 ok → 가입완료 페이지로 ==== -->
					<button type="button" id="sendJoinBtn" onclick="submitJoin()" >가입하기</button>
		
				</form>	
			</div><!-- end of #joinBox div -->
			
		</div><!-- end of #wrapper div -->
		
	</div><!-- end of #root div -->
</body>
</html>


