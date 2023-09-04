<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 로고</title>
<style type="text/css">
	#logoBox 					   /*로고 이미지*/
	{
		text-align: center;
		height: 100px;
		padding-top: 20px;
		/* border: 1px solid; */
		
	}
	.logoBoxBtn
	{
		border: none;
		padding: 0;
		background: none;
	}
	
</style>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
		<form action="adminMain.action" method="post">
		<div id="logoBox">    		<!-- 로고 이미지 -->
			<button class="logoBoxBtn" type="submit">
				<img src="images/tmp_logo_admin.jpg"/>
			</button>
		</div>	
		</form>
</body>
</html>