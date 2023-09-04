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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	#leaveBox  /* 전체 영역 */
	{
		border: 1px solid;
		border-radius: 20px;
		padding: 10px;
		
		width: 500px;
		height: 200px;
		
	}

	#leaveBox span	/* 항목 글씨부분 */
	{	
		display: inline-block;
		width: 120px;
	}
	
	#leaveBtn		/* 탈퇴 버튼 */
	{
		font-weight: bold;
		border-radius: 10px;
		padding: 4px;
		margin: 10px 0px;
		
		background-color: black;
		color: white;
	}
	#leaveNotice
	{
		font-size: 10pt;
		color: red;
	}
	
</style>

</head>
<body>
	<div id="root">
		<div id="leaveBox">
			<h3>회원 탈퇴</h3>
			
			<form action="">
				<span>탈퇴 사유</span>
				<select>
					<option value="">--- 선택하세요 ---</option>
					<option value="">사용 빈도 감소</option>
					<option value="">서비스 이용 불편</option>
					<option value="">개인 사유</option>
				</select>
				<br>
				<span>비밀번호 입력</span> 
				<input type="password" id="password" name="password"/>
				
				<br>
				
				<div id="leaveNotice">
				※ 탈퇴는 취소할 수 없으며, 작성했던 게시글에 대한 권한이 사라집니다.<br>
					   어쩌구 저쩌구 경고 , 안내 문구....<br>
				</div>
				<button onclick="javascript:confirm('확인을 누르면 취소할 수 없습니다. 정말 탈퇴하시겠습니까?')" id="leaveBtn">탈퇴하기</button>
			
				
				<!-- 탈퇴하기 누르고 비밀번호 맞으면 탈퇴가 완료되었습니다. 
				탈퇴 완료 페이지로 이동
				MainPage.jsp로 이동
				
				틀리면 alert로 비밀번호가 올바르지 않습니다. 보여주고 현재 페이지에 머무름
				처리 부탁해 여기 담당 페이지 하는 사람에게 -->
			
			</form>
			
		</div><!-- end of #leaveBox div -->
	
	</div><!-- end of #root div -->
</body>
</html>