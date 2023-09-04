<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원하기 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/apply.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	function DoneApply(recruitPosNo) {
		window.location.href = 'applyinsert.action?recruitPosNo=' + recruitPosNo;
	}

	function updateProfile() {
		window.location.href = '';
	}
	
</script>
</head>
<body>

<div class="wrapper">
	<div class="main">
		
		<div class="container">
		<c:set var="memberInfo" value="${memberInfo }" />
		<c:set var="recruitInfo" value="${recruitInfo }" />
		
			<div class="myProfileOuter">
			<h3>지원하기</h3>
			
			<!-- 프로필 가져오기 -->
			<span class="smallTitle">나의 프로필</span>
			<button type="button" class="updateProfileBtn" onclick="updateProfile()">프로필 수정하기</button><br>
			
			<div class="myProfile">
				<div class="photo">
					<img class="img" alt="profileImg" src="<%=cp %>/${memberInfo.photoUrl }">
				</div>
				<div class="etc">
				닉네임 : ${memberInfo.nickName }<br>
				활동지역 : ${memberInfo.subRegionName }<br>
				사용가능 언어 및 환경<br>
				: &nbsp; <span>Java &nbsp;&nbsp;</span><span>JavaScript</span>
				</div>
			</div>	
			
			<!-- 지원 폼 -->
			<div class="applyFormOuter">
			
			<span class="smallTitle">지원하는 프로젝트</span> : ${recruitInfo.title }<br>
			<span class="smallTitle">지원하는 포지션</span> : ${recruitInfo.posName }<br><br>
			
			<form action="applyinsert.action" method="post">
			
			<textarea id="content" name="content" class="applyContent" rows="10" cols="70" 
					placeholder="전달하고 싶은 내용을 작성해주세요."></textarea>
			</div><!-- end.applyFormOuter -->
			<input type="hidden" id="recruitPosNo" name="recruitPosNo" value="${recruitInfo.recruitPosNo }">
			
			<div class="submitBtnDiv">
			<button type="submit" class="submitBtn">제출하기</button>
			</div>
			
			</form>
			
			</div><!-- end.myProfileOuter -->
		</div> <!-- end.container -->
	</div> <!-- end.main -->
</div>


</body>
</html>
