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
	#WithdrawBox	 /* 전체 영역 */
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
	#withdrawBtn, #cancleWithdrawBtn		/* 변경 버튼 */
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
	
	function preWithdraw()
	{
		/* alert("비밀번호 변경 전 최종 실행시켜야 할 메소드"); */
		var password = document.getElementById("password").value;
		var pinNo = document.getElementById("pinNo").value;
		
		$.ajax(
		{
			type:"POST"
			, url:"preWithdraw.action"
			, data:{ password : password,
					 pinNo : pinNo }
			, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
			, success:function(result)
			{
				if (document.getElementById("wdTypeNo").value == 99)
				{
					alert("탈락 사유를 입력해주세요.")
					return;
				}
				
				if (confirm("탈퇴 시 기존 게시물의 수정 및 삭제 권한에 접근할 수 없습니다. 정말 삭제를 진행하시겠습니까?"))
				{
						if (result == "1")
						{
								alert("회원 탈퇴 완료");
															
 								var myForm = document.getElementById("withdrawForm");
								
								myForm.submit(); 
								
						}
						else
						{
							alert("비밀번호가 틀렸습니다.")

							return;
						}
				}
				else
				{
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
		<br /><br />
		<!-- <div id="changePwBox"> -->
		<div>
			<h3>회원 탈퇴</h3>
			<br /><br />
			<form action="withdraw.action" id="withdrawForm">
				<span>탈퇴 사유(필수)</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="wdTypeNo" id="wdTypeNo">
					<option value="99">------------- 선택 -------------</option>
					<option value="1">사용 빈도 감소</option>
					<option value="2">서비스 이용 불편</option>
					<option value="3">목적 달성</option>
					<option value="4">다른 서비스 이용</option>
					<option value="5">개인적 이유</option>
				</select>
				
				<br /><br /><br />
				
				
				<span>비밀번호 입력</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" id="password" name="password" required="required"/>
				<p id="msg_false"></p>
				<p id="msg_true"></p>

				<!-- 넘겨줄 pinNo hidden으로-->				
				<input type="hidden" name="pinNo" id="pinNo" value="${pinNo }">
				
			<br />
				<button type=button id="withdrawBtn" onclick="preWithdraw()">탈퇴하기</button>
				&nbsp;
				<button type=button onclick="alert('회원 탈퇴 취소')" id="cancleWithdrawBtn">취소하기</button>
			</form>
		
		</div><!-- end of #changePwBox div -->
		
		<br /><br />
	</div><!-- end of #root div -->
</body>
	
	
</html>