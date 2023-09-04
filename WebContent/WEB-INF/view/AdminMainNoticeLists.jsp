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
<title>관리자 공지 : Projectors</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	table 
	{
		font-size: 16pt;
		text-align: center;
	}
	

	/*==========  상단 공통 요소 (메뉴바까지) ==================*/
	li {list-style-type: none;}

	
	#logoBox 					   /*로고 이미지*/
	{
		text-align: center;
		height: 100px;
		padding-top: 20px;
		/* border: 1px solid; */
	}
	#upperBarBox 				 /*최상단 바(로그인..쪽지)*/
	{
		text-align: right;
	}
	#menuBar					/*메뉴바(메인|공지..)*/
	{
		text-align: center;
		position :sticky;  
		padding-top: 32px;
	    top: -32px;
	}
	/*==================================================*/
	
	#wrapper
	{
		margin: 50px 150px;
		border: solid 2px;
		border-radius: 20px;
		padding: 60px 100px;
	}
	
	#write /*공지 작성 버튼*/
	{	
		display: block;
		text-align: right;
	}
	
	#mainNoticeListBox /*공지글 테이블 영역*/
	{
		margin: 20px 0px;
		font-size: 16pt;
		width: 100%;
		
		
	}
	#mainNoticeLists /* 공지글 테이블*/
	{
		margin: auto;
		width: 80%;
		font-size: 12pt;
	}
	th	{	border-bottom: 1px solid black;	}
	td	{	border-bottom: 1px solid gray;	}
</style>
</head>

<body>
	<div id="root">
	
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
				<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<c:import url="adminLogo.jsp"></c:import> <!-- 로고이미지 -->	
		<div id="menuBar">			<!-- 메뉴바( 메인 | 공지..) -->
				<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================ -->
		
		<div id="wrapper">
			<div id="NoticeTitleBox"> 
				<h2>공지 게시판</h2>
			</div>
			<div id="write">
				<button type="button"><a href="noticeInsertForm.action">공지 작성</a></button>
			</div>
			
			
			<div id="mainNoticeListBox" name="mainNoticeListBox"> <!-- 테이블 영역 -->
				<table id="mainNoticeLists">
					<tr>
						<th style="width: 10%;">글 번호</th>
						<th style="width: 75%;">제목</th>
						<th style="width: 15%;">작성자</th>
					</tr>
					<c:forEach var="notice"  items="${lists }">
						<tr>
							<td>${notice.adminNoticeNo }</td>
							<td style="text-align: left;">
							<a href="adminNoticeArticle.action?adminNoticeNo=${notice.adminNoticeNo }">
							${notice.title }</a></td>
							<td>${notice.pinNo }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<p> ◀ 이전 1 2 3 4 5 다음 ▶</p>
			
		</div><!-- end of #wrapper div -->	
		
			
	</div><!-- end of .root div -->
</body>
</html>