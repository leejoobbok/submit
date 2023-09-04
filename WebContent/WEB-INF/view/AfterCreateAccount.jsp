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
<title>회원가입 완료 창</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	
	*{
		font-weight: bold;
		text-align: center;
	 }
	 
	 #logoBox		/*import한 로고 영역*/
	 {
	 	margin-top: 80px;
	 }
	
	#welcomeBox		/*전체 영역 박스*/
	{	
		border: 1px solid;
		border-radius: 30px;
		width: 500px;
		height: 300px;
		
		margin: auto;
		padding: 100px;
	}
	#welcomeTitle				/* 가입완료 타이틀*/
	{
		font-size: 24pt;
		margin-bottom: 30px;
	}
	
	#welcome					/* 환영합니다 */
	{font-size: 16pt;}
	
	#welcomeMsg					/* 메세지 */
	{
		font-size: 12pt;
		margin-bottom: 30px;
	}
	
	button						/* 버튼*/
	{
		background-color: black;
		color: white;
		border-radius: 14px;
		padding: 6px 10px;
		font-size: 12pt;
		
	}
	
	a:link,a:visited,a:hover,a:active /*하이퍼링크 스타일 */
	{ 
		text-decoration: none;
	  	color: white;
		font-size: 12pt;
	}	
</style>

</head>
<body>
	<div id="root">
	
		<div id="logoBox">    		<!-- 로고 이미지 import -->
			<a href="MainPage.jsp"><img src="images/tmp_logo.JPG"/></a>
		</div>	
		
		<div id="welcomeBox">
			<div id="welcomeTitleBox">
				<h2 id="welcome">WELCOME!</h2>
				<h1 id="welcomeTitle">가입이 완료되었습니다.</h1>
				<p id="welcomeMsg">프로필을 작성하고 프로젝트에 참여해보아요~!</p>
			</div>
			
				<button type="button"><a href="projectorsmain.action">메인 페이지</a></button>
			<br>
		</div>	
		
	</div><!-- end of #root div -->
</body>
</html>