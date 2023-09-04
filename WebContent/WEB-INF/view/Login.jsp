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
<title>로그인 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/login.css">
</head>
<body>
	<div class="wrapper">
		<!-- ========== 로고만 import ======================== -->
		<div class="header-logo">
			<a href="projectorsmain.action"><img style="width: 400px;" src="<%=cp %>/images/NEXTART_LOGO.png"/></a>
		</div>		
		<!-- ================================================= -->
		
		<div class="loginBox">
			<form action="login.action" method="post">
				<span>아이디</span> 
				<input type="text" id="id" name="id" placeholder="이메일 전체를 입력해주세요."/><br>
				<span>패스워드</span> 
				<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요."/><br>
				<button id="loginBtn" type="submit">로그인</button><br>
				<span id="adminCheck">관리자
				<input type="checkbox" name="managerCheck" id="managerCheck"/>
				</span>
			</form>
		</div>
		<div id="etcLogin">
			<a href="createAccountForm.action">회원가입 </a>
			<a href="">아이디 찾기<span class="tempNotAccept">(공사중)</span></a>
			<a href="">비밀번호 찾기<span class="tempNotAccept">(공사중)</span></a>
		</div>
			
	</div><!-- end.wrapper -->
</body>
</html>


