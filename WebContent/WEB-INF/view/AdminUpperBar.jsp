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
<title>최상단 바(로그인 여부에 따라 분기)</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	#upperBarMenus
	{
		font-size: 12pt;
		font-weight: bold;
	}
	

</style>

</head>
<body>
	<div id="upperBarMenus">
	
		<img src="images/adminPic.png" style="width: 20px; height: 20px;"/> 관리자
		
		<a href="logout.action">로그아웃</a>
		
	</div>
</body>
</html>