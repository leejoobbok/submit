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
<title>AdminBar.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

a 
{
	text-decoration: none;
	padding: 4px 14px 4px 14px;
}

#menuBar
{
	font-size: 16pt;
	font-weight: bold;
	background-color: white;
}

.submitBtn
{
	border: none;
	padding: 0;
	background: none;
	font-size:  16pt;
	font-weight: bold;
}

table
{
	margin: auto;
}

</style>
</head>

<body>
<div id="menuBar">

	<table>
		<tr>
			<th style="border: none;">
				<form action="adminMain.action" method="POST">
					<button class="submitBtn" type="submit">메인</button>
				</form>
			</th>
			<th style="border: none;"><a href="mainNoticeList.action">공지사항</a></th>
			<th style="border: none;"><a href="reportRecruit.action">신고관리</a></th>
			<th style="border: none;"><a href="faqManagement.action">FAQ/문의관리</a></th>
			<th style="border: none;"><a href="contentsManagement.action">컨텐츠관리</a></th>
			<th style="border: none;"><a href="userManagement.action">회원관리</a></th>
		</tr>
	</table>
	<hr>
</div>

</body>
</html>