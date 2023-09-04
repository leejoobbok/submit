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
<title>신고완료 : Projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/report.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#closeReport").click(function()
		{
			window.close();
		});
	});
	
</script>
</head>
<body>
		<div id="logoBox"> 
			<img src="images/tmp_logo.JPG"/>
		</div>	

		<div id="reportBox">
			<p>
				신고처리가 완료되었습니다. <br>
				빠른시일내로 처리하겠습니다.<br>
				감사합니다.<br>
			</p>			
			<p>
				<button id="closeReport">닫기</button>
			</p>
		</div>
</body>
</html>

