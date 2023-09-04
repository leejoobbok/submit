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
<title>마이페이지 > 계정 관리</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

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

#myProfile /*내 프로필 영역*/ {
	padding: 24px;
}

#myPick /* 찜한 공고 영역*/ {
	
}
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		// smooth scroll
		/* $('#myPick,#myProfile,#myAccount').click(function(event) { 
			var id = $(this).attr("href");
			var offset = 60;
			var target = $(id).offset().top - offset;
			$('html, body').animate({scrollTop:target}, 500);
			event.preventDefault();
		}); */
	});
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

			<!-- ===== 계정 관리 =====-->
			<div id="myAccount">
				<!-- <h2 class="smallTitile">계정 관리</h2> -->

				<!-- 비밀번호 변경 -->
				<button type="button" onclick="window.location.href='changePassword.action'">비밀번호 변경</button>
				<%-- <c:import url="changePassword.action"></c:import> --%>

				<!-- 회원 탈퇴 -->
				<button type="button" onclick="window.location.href='leave.action'">회원 탈퇴</button>
				<%-- <c:import url="Leave.jsp"></c:import> --%>
			</div>

		</div>
		<!-- end of #myPageBox div -->

	</div>
	<!-- end of #root div -->

</body>
</html>

