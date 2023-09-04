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
<title>공지 작성 : Projectors</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	
	#upperBarBox 				 /*최상단 바(로그인..쪽지)*/
	{
		text-align: right;
		fon
	}
	#menuBar					/*메뉴바(메인|공지..)*/
	{
		text-align: center;
		position :sticky;  
		padding-top: 32px;
	    top: -32px;
	}
	
	#mainNoticeInsert
	{
		  display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	}
	
	
	  #pageAllBox
	  {
	  	
	  	width: 90%;
	  	border: 1px solid black;
	  	padding-top: 5%;
	  	padding-botton: 5%;
	  	padding-left: 5%;
	  	padding-right: 5%;
	  }
	
	#pageTitle
	{
		 display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	}
	
	
	#categoryTitle
	{	
		 justify-content: center;
		 display: table-cell;
		 width: 60%;
	     height: 80%;
	     margin-bottom: 1em;
		 border: 2px solid black; /* 테두리 스타일 설정 */
	     text-align: center;
	     font-size: 30pt;
	}
		
	#noticeInsertTitle
	{	 
		display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	
	}
	
	#noticeTitleInsert
	{
		
		flex-direction: column;
		justify-content: center;
		align-items: center;
		text-align: center;
		
	}
	
	
	#noticeTitle
	{
		font-weight:bold;
		font-size: 20pt;
		
	}
	
	#noticeContentInsert
	{
		text-align: center;
	}
	
	
	
	.btnContainer 
	{
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  height: 30vh;
	}
	
	.buttonToOtherPage 
	{
	  padding: 10px 20px;
	  background-color: #bf5fe8;
	  color: #fff;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  text-decoration: none;
	  text-align: center;
	  margin: 10px;
	  font-size: 20px;
	}
</style>
<script type="text/javascript">
	
	function regist()
	{
		var f = document.forms["insertForm"];
		
		f.submit();
	}
	
	function cancle()
	{
		
		window.location.href="mainNoticeList.action";
	}
	
</script>
</head>
<body>
		<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	

		<c:import url="adminLogo.jsp"></c:import>

		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- =========================================================== -->
<div id="pageAllBox">
		<div id="pageTitle">
			<p id="categoryTitle">공지글 작성</p>
		</div>



<div id="MainNoticeInsert" name="MainNoticeInsert">
<form action="noticeInsert.action" method="post" name="insertForm">
	<div id="noticeTitleInsert">
		<span id="noticeTitle">
			제목  : 
		</span>
			<input type="text" id="title" name="title"
			 placeholder="제목"
			 style="width: 55%; height: 30pt; font-size: 20pt;"/>
	
	</div>
	<div id="noticeContentInsert">
		<p style="font-weight: bold; text-align:left; font-size: 20pt;
		padding-left: 20%; padding-right: 20%; padding-bottom: 0%;" >
			내용
		</p>
		<textarea name="content" id="content" cols="70" rows="15"
		placeholder="내용 입력" style="font-size:15pt;
		width: 60%;"
		></textarea>
	</div>

	<br />
	<div class="btnContainer">
		<button type="button" class="buttonToOtherPage" onclick="regist()">등록</button>
		<button type="button" class="buttonToOtherPage" onclick="cancle()">취소</a></button>
	</div>
	
</form>
</div>
</div>

</body>
</html>