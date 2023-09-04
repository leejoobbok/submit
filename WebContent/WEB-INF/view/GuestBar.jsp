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
<title>회원일때</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	
	@font-face {
    font-family: 'Happiness-Sans-Title';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}

	.memberMenu
	{
		font-size: 15pt;
		font-weight: bold;
	}
	.btn
	{	
		border: 0;
  		background-color: transparent;
		font-size: 11pt;
		font-family:'Happiness-Sans-Title';
		
	}
	.profileImg
	{
		width: 20px;
		height: 20px;
	}
	.btn:hover {
		color: orange;
	}
	
</style>

<script type="text/javascript">

	$(function()
	{
		$("#loginBtn").click(function()
		{
			$(location).attr("href", "loginForm.action");
		});
		
		// 문의
		$("#faqBtn").click(function()
		{
			$(location).attr("href", "faq-list.action");
		});
		
	});

</script>

</head>
<body>
	<div class="memberMenu">
		
		<button type="button" class="btn" id="loginBtn" >로그인/회원가입</button>
		
		<button type="button" class="btn" id="faqBtn" >문의</button>
		
	</div>
</body>
</html>