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
<title>프사 등록/수정 </title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	
	#outerBox	/*전체 박스 영역*/
	{
		width: 340px;
		height: 340px;
		border: solid 1px;
		border-radius: 14px;
		margin: auto;
		margin-top: 10px;
	}
	#innerBox	/* 내부 박스 영역*/
	{
		padding: 20px;
		width: 90%; /* float 적용을 위한 부모요소 길이 지정*/
	}
	#photoBox    /* 사진 영역*/
	{
		width: 100px;
		height: 100px;
		background-color: black;
		float: left;
		margin-left: 100px;
		margin-bottom: 10px;
	}
	#PhotoTitle	/*제목*/
	{
		font-size: 20px;
		font-weight: bold;
		text-align: center;
		margin-top: 40px;
	}
	#fileSelectBox	/*파일선택*/
	{
		text-align: center;
		margin: 10px 0px 10px 40px;
	}
	
	#btnArea				/*버튼 영역*/
	{text-align: center;}
	
	#btnArea button				/*버튼*/
	{
		font-weight: bold;
		font-size: 10pt;
		
		border-radius: 10px;
		padding: 2px 12px;
		background-color: black;
		color: white;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

	function removePhoto()
	{
		var removeConfirm = confirm("정말 삭제하시겠습니까?");
		
		if (removeConfirm)
		{
			return "removePhoto.action";
		}
		else if(!removeConfirm)
		{
			/* alert("삭제를 취소"); */
			return;
		}
	}

</script>


</head>


<body>
	<form action="updatePhoto.action">
	<div id="outerBox">
	
		<h1 id="PhotoTitle">프로필 사진 편집</h1>
		
		<div id="innerBox">

			<div id="photoBox"></div>

			<div id="fileSelectBox">
				<input type="file" id="photourl" name="photourl" value="${photourl}"/> 
				<br>
				
			</div>
			<div id="btnArea"> 
				<button type=button onclick="removePhoto()">삭제</button><!-- 기본이미지로 대체  -->
				<button type=submit>완료</button><!-- update 수행 		 -->
				<button onclick="window.close()">나가기</button><!-- 그냥 창 닫기  -->
			</div>
			
		</div><!-- end of #innerBox div -->
	</div>
	</form>
</body>
</html>

