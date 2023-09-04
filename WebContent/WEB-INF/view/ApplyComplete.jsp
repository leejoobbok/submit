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
<title>지원하기 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/apply.css">
<script type="text/javascript">

	function goToMain() {
		window.location.href = 'projectorsmain.action';
	}
	
	function cancel() {
		window.close();
		window.opener.location.reload();
	}

</script>
</head>
<body>
	<div id="wrapper">
		
		<div class="completeApply">
			<p id="completeMent"><br><br>지원이 완료되었습니다.</p>
		</div>
      
		<div class="btnContainer">
		
			<button type="button" class="goMain" onclick="goToMain()">
			메인 페이지로
			</button>
			
			<button type="button" class=" goMyApply" onclick="cancel()">
			돌아가기
			</button>
			
		</div>
		
	</div>
</body>
</html>