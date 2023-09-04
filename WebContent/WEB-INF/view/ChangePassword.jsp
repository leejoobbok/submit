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
<title>비밀번호 변경</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>

<style type="text/css">

	*
	{
		text-align: center;
		margin: auto;
	}
	
	/* ---------- 상단 고정 스타일(메뉴바까지) ----------*/
	#logoBox /*로고 이미지*/ {
		text-align: center;
		height: 100px;
		padding-top: 20px;
		/* border: 1px solid; */
	}
	
	#upperBarBox /*최상단 바(로그인..쪽지)*/ {
		text-align: right;
	}
	
	#menuBar /*메뉴바(메인|공지..)*/ {
		text-align: center;
		position: sticky;
		padding-top: 32px;
		top: -32px;
	}
	/*--- 여기까지 상단 고정 스타일 (메뉴바까지) ------*/
	#myPageBox /* 전체 박스 클래스 */ {
		margin: 10px 400px;
		border: 1px solid;
		border-radius: 20px;
	}
	
	#myPageTitle /*마이페이지 (타이틀)*/ {
		margin: 10px 20px;
		font-weight: bold;
		font-size: 16pt;
		text-align: left;
	}
	
	.smallTitile /* 소제목 */ {
		font-size: 14pt;
		margin-left: 40px;
	}
	
	#myPageMenus /*마이페이지 메뉴들 */ {
		border: 1px solid;
		border-radius: 20px;
		font-weight: bold;
		padding: 10px 10px 10px 10px;
		background-color: white;
	
		/* position :sticky;  */ /*sticky 속성*/
		/*  top: 70px; */ /*sticky 속성*/
	}
	#changePwBox	 /* 전체 영역 */
	{
		border: 1px solid;
		border-radius: 20px;
		padding: 10px;
		
		width: 500px;
		height:400px;
	}
	
	#changePwBox span /* 항목 글씨부분 */
	{	
		display: inline-block;
		width: 160px;
	}
	#changePwBtn, #cancleChangePw		/* 변경 버튼 */
	{
		font-weight: bold;
		border-radius: 10px;
		padding: 4px;
		margin: 10px 0px;
		
		background-color: black;
		color: white;
	}
	#msg_false, #msg_true  		/* 메세지 공통*/
	{
		font-size: 8pt;
		margin-left: 168px;
	}
	
	#msg_false					/* 실패 메세지 */
	{
		color: red;
		/* display: none; */
	}
	#msg_true					/* 성공 메세지 */
	{
		color: green;
		/* display: none; */
	}
</style>
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#newPassword").change(function()
		{
		    checkPassword($('#newPassword').val());
		});
		
		function checkPassword(newPassword)
		{
		    /*if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userPw))*/
		    if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/.test(newPassword))
		    {            
		        /* alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.'); */
		        alert('숫자+영문자 조합으로 8자리 이상 사용해야 합니다.');
		        $('#newPassword').val('').focus();
		        return false;
		    }    
		    var checkNumber = newPassword.search(/[0-9]/g);
		    var checkEnglish = newPassword.search(/[a-z]/ig);
		    if(checkNumber <0 || checkEnglish <0){
		        alert("숫자와 영문자를 혼용하여야 합니다.");
		        $('#newPassword').val('').focus();
		        return false;
		    }
		    if(/(\w)\1\1\1/.test(newPassword)){
		        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
		        $('#newPassword').val('').focus();
		        return false;
		    }
		    
		    return true;
		}
		
	
	});
	
	function checkRePw()
	{
		var userPw = document.getElementById("newPassword").value;
		var userPwCk = document.getElementById("newPasswordCk").value;
		
		// var url="checkrepw.action?userPw="+userPw+"&userPwCk="+userPwCk;			
		
		$.ajax(
		{
			type:"POST"
			, url:"checkrepw.action"
			, data:{ userPw : userPw, userPwCk : userPwCk }
			, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
			, success:function(result)
			{
				if (result == 10)
				{
					document.getElementById("msg_true").innerText = "변경할 비밀번호 확인 완료";
					document.getElementById("msg_false").innerText = "";
					
					document.getElementById("errorAllPwCk").value="0";
				}
				else if(result == 111)
				{
					document.getElementById("msg_true").innerText = "";
					document.getElementById("msg_false").innerText = "";
					
					document.getElementById("errorAllPwCk").value="1";
				}
				else
				{
					document.getElementById("msg_true").innerText = "";
					document.getElementById("msg_false").innerText = "변경할 비밀번호가 일치하지 않습니다.";
				
					document.getElementById("errorAllPwCk").value="1";
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
			
		});
	}
	
	function preChangePassword()
	{
		/* alert("비밀번호 변경 전 최종 실행시켜야 할 메소드"); */
		var password = document.getElementById("password").value;
		var pinNo = document.getElementById("pinNo").value;
		
		$.ajax(
		{
			type:"POST"
			, url:"preChangePw.action"
			, data:{ password : password,
					 pinNo : pinNo }
			, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
			, success:function(result)
			{
				if (result == "1")
				{
					document.getElementById("errorPw").value="0";
					/* 	alert("현재 비밀번호 올바르게 입력했음"
							+ document.getElementById("errorPw").value); */
					if (document.getElementById("errorPw").value == "0" && document.getElementById("errorAllPwCk").value == "0")
					{
						alert("비밀번호 변경이 완료되었습니다.");
						var myForm = document.getElementById("changePwForm");
						
						myForm.submit();
					}
					else
					{
						alert("변경할 비밀번호를 다시 확인해주세요.");
						return;
					}
				}
				else
				{
					document.getElementById("errorPw").value="1";
					alert("현재 비밀번호가 올바르지 않습니다.")
					/* 		alert("비밀번호 다름"
								+ document.getElementById("errorPw").value); */
					return;
				}
			} 
			, error:function(e)
			{
				alert(e.responseText);
			}
		});

	}

	
</script>
</head>
<body>
	<div id="root">

		<div class="header">

			<!-- header -->
			<c:choose>
				<c:when test="${not empty pinNo}">
					<div class="header-member">
						<c:import url="memberBar.jsp"></c:import>
					</div>
				</c:when>
				<c:otherwise>
					<div class="header-member">
						<c:import url="GuestBar.jsp"></c:import>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="header-logo">
				<a href="projectorsmain.action"><img style="width: 530px;"
					src="<%=cp%>/images/NEXTART_LOGO.png" /></a>
			</div>

		</div>

		<div class="header-menu">
			<c:import url="menuBar.jsp"></c:import>
		</div>
		<!-- ============================================================ -->


		<div id="myPageBox">

			<div id="myPageMenus">
				<span id="myPageTitle">마이페이지</span> <a href="mypage.action">내
					프로필</a>
				<!-- <a href="MyPage.jsp">찜한 모집 공고</a> -->
				<!-- <a href="accountManage.action" id="myAccount">계정관리</a> -->
				▶계정관리
			</div>


	<div id="root">

		<!-- <div id="changePwBox"> -->
		<div>
			<h3>비밀번호 변경</h3>
			<br />
			<form action="changePw.action" id="changePwForm">
				<span>현재 비밀번호 </span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" id="password" name="password" required="required"/>
				<br><br />
<!-- 
					<p id="msg_false">비밀번호가 틀렸습니다.</p>
					<p id="msg_true">비밀번호 확인.</p>
 -->
				
				<span>변경할 비밀번호 </span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" id="newPassword" name="newPassword" required="required"
				oninput="checkRePw()"/>
				<br><br />
<!-- 				
				<p id="msg_false">8~16자 영문 숫자 혼합으로 만들어주세요!</p>
				<p id="msg_true">사용 가능한 비밀번호 입니다.</p>
				
 -->
 				<span>변경할 비밀번호 확인</span> 
				<input type="password" id="newPasswordCk" name="newPasswordCk" required="required"
				oninput="checkRePw()"/>
				<br>
				<p id="msg_false"></p>
				<p id="msg_true"></p>
				
				<input type="hidden" id="pinNo" value="${pinNo }">
				<!-- value 가 1이면 변경 불가 0이가 변경 가능한 상태 -->
				<input type="hidden" id="errorPw" value="1">
				<input type="hidden" id="errorAllPwCk" value="1">
				
				<button type=button id="changePwBtn" onclick="preChangePassword()">변경하기</button>
				&nbsp;
				<button type=button onclick="alert('비밀번호 변경 취소')" id="cancleChangePw">취소하기</button>
			</form>
			<!-- 비밀번호 변경 완료 후 재로그인 해야 함 -->
		
		</div><!-- end of #changePwBox div -->

	</div><!-- end of #root div -->
</body>
	
	
</html>