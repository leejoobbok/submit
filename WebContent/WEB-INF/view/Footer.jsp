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
<title>footer</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	
	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

	.btn
	{	
		border: 0;
  		background-color: transparent;
		font-size: 13pt;
		
		font-family:'Pretendard-Regular';
		font-weight: bold;
		
	}
	.profileImg
	{
		width: 20px;
		height: 20px;
	}
	
	.footerMenu
	{
		margin-top: 30px;
		text-align: center;
		width: 100%;
	}
	
</style>

<script type="text/javascript">

	$(function()
	{
		/* 예시
		$("#loginBtn").click(function()
		{
			// alert("마이페이지");
			$(location).attr("href", "MyPage.jsp");
		});
		*/
	});

</script>

</head>
<body>
	<div class="footerMenu">
		<br>
		
		<button type="button" class="btn" id="" >이용약관</button>
		
		<button type="button" class="btn" id="" >개인정보처리방침</button>
		
		<button type="button" class="btn" id="" >서비스소개</button>
		
		<button type="button" class="btn" id="" >제휴제안</button>
		
	</div>
</body>
</html>