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
<title>관리자 페이지 :Projectors</title>


<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">

	/*==========  상단 공통 요소 (메뉴바까지) ==================*/
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
	/*==========================================================*/
	
	#wrapper{margin: 10px 300px;}
	
	#recSearchBox li 					/*툴 리스트 스타일 정의*/
	{
	 	display: inline;
	 	margin: 0px 20px;
		padding: 2px; 
	} 
	
	#bannerBox					  /*배너영역*/
	{	
		width:1120px;
		height:360px;
		margin: auto;
		text-align: center;
		border: solid 1px;
		border-radius: 20px;
		background-color:#473659; 
	}
	
	#lookAroundBox 					/*둘러보기 버튼 영역*/
	{
		font-size: 30pt;
		text-align: center;
		margin: 10px;
	}
	#lookAroundBtn 				/*둘러보기 버튼*/
	{
		font-size: 16pt; 
		font-weight: bold;
		padding: 14px;
		border-radius: 20px;
	}
	.smallTitile 					/* 소제목 */
	{
		font-size: 14pt;
		margin-left: 40px;
	}
	/*==========================================================*/
	#recListBox 				/* 공고 리스트 영역 */
	{
		margin: auto;
		width: 1130px;
		text-align: center;
	}
	
	.recThumbnail 				/* 공고 썸네일 (개별 박스)*/
	{
		border: solid 1px;
		border-radius: 10px;
		
		text-align: left;
		margin: 10px 0px;
	}
	.recThumbnail li:first-child   /* 썸네일 첫줄( 모집마감일 ~ 인원..)*/
	{
		font-weight: bold;
		font-size: 11pt;
		margin-bottom: 10px;
	}
	
	.recThumbnail li:nth-child(2) 	/* 썸넬 둘째줄(제목) */
	{
		font-size:14pt; 
		font-weight:bold;
	}
	#imminent 							/*마감임박 , 모집중 . 마감 태그*/
	{
		background-color: #f58442;
		color: white;
		font-size: 9pt;
		border-radius: 8px;
		padding: 0px 6px 2px;
	}

	.recThumbnail p 				/*썸네일의 내용설명 텍스트*/
	{font-size: 11pt;}
	
	.recThumbnail li:nth-child(4) span /* 썸넬 4번줄 하위 요소들(태그) */
	{
		background-color: black;
		color: white;
		border-radius: 9px;
		padding: 0px 6px 2px;
	}
	
</style>

<script type="text/javascript">
	
	 $(document).ready(function() {
		// smooth scroll
		$('#lookAround ').click(function(event) { 
			var id = $(this).attr("href");
			var offset = 60;
			var target = $(id).offset().top - offset;
			$('html, body').animate({scrollTop:target}, 500);
			event.preventDefault();
		});
	});
</script>
</head>


<body>	

	<div id="root">
	 	
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
			
		<c:import url="adminLogo.jsp"></c:import> <!-- 로고이미지 -->
			
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->
	
	
		<div id="wrapper">
			<br>
			<h2 class="smallTitile">오늘의 할일</h2>
			<hr style="width: 100%">
			<p class="smallTitile" style="font-size: 13pt;">
				<a href="q-list-4admin.action"><span>문의 ${newQuestionCnt }건</span></a>
				<br>

				<a href="reportRecruit.action"><span>신고 ${newReportCnt }건</span></a>

			</p>
			
		</div><!-- end of #wrapper div -->
		
		<div id="wrapper">
			<br><br>
			<h2 class="smallTitile">사이트 현황</h2>
			<hr style="width: 100%">
			오늘 방문자 ${todayMemberCnt }명
			
		</div><!-- end of #wrapper div -->
		
	</div><!-- end of #root div -->

</body>
</html>