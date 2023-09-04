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
<title>팀 스페이스 > 내 작업실 - Projectors </title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/teamSpace.css">

<style type="text/css">
	
	#titleBox 	/* 타이틀 영역 */
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 30px;   /* 고정 top 마진 */
	  right: 20px; /* 고정 우측 마진 */
	  background-color: white;
	  width: 920px;
	  border: 2px solid;
	  border-radius: 10px;
	  
	  font-size: 16px;
	  font-weight: bold;
	  text-align: left;
	  padding: 4px 4px 6px 14px;
	}
	
	#lineNotice	,#noticeDate	/* 공지 글씨 (span) */
	{
		vertical-align: super;	/*베이스 라인을 위로.*/
	}

	/*===================================================*/
	#workSpaceBox			/* 공지글 리스트 영역*/
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 90px;   		/* 고정 top 마진 */
	  right: 20px; 		/* 고정 우측 마진 */
	  
	  background-color: white;
	  width: 920px;
	  height:596px;
	  
	  border: 2px solid;
	  border-radius: 10px;
	  padding: 10px;
	}
	#teamMeetingListTbl /* 회의록 목록 테이블*/
	{
		border: solid 1px;
		border-radius: 10px;
		margin:auto;
		font-size: 12pt;
		text-align: center;
	}
	.firstTr
	{
		background-color: #bfbbb4;
	}
	/*======================================================*/
	
	#pageNumBox				/* 페이지 넘버 영역*/
	{
		width: 300px;
		margin: 10px 0px 0px 360px;
		padding: 4px;
	}
	.btn							/* 버튼 클래스 공통 */
	{	
		background-color: black;
		color: white;
		font-weight: bold;
		font-size: 10pt;
		padding: 2px 10px;
		border-radius: 12px;
	}
	#writeBtn
	{
		vertical-align: super;	/*베이스 라인을 위로.*/
		margin-left:6px;
	}
	#writeBtn:hover
	{	
		border: 2px solid black;
		background-color: white;
		color: black;
	}
</style>
<script type="text/javascript">
	
	

</script>


</head>
<body>

	<div id="root">
			
			<div>
				<h1 id="spaceName">팀 스페이스 : 우리동네 밥친구 프로젝트 </h1>
			</div>
			<div id="exitBtn">
				<a href="projectorsmain.action"><img src="images/exit.png" style="width:50px"></a>
			</div>  
			
			<!-- 공지, 작업실, 회의록, 히스토리 (메뉴 인덱스) -->
			<div id="categoryBar">
				<div class="index idx1">
					<a href="teamSpaceMain.action">
						<img src="images/home.png" style="width:30px;"/>
					</a>
				</div>
				<div class="index idx2"><a href="teamNoticeList.action">공지</a></div>
				<div class="index idx3"><a href="teamMyWorkspace.action">내 작업실</a></div>
				<div class="index idx4"><a href="TeamMeetingList.action">회의록</a></div>
				<div class="index idx5"><a href="">히스토리</a></div>
				<div class="index idx6"><a href="teamMemberInfo.action">멤버</a></div>
				<div class="index idx7"><a href="TeamSetting.jsp">설정</a></div>
			</div>
				
			<div id="directoryBox">
				
				<div id="topLeftBox"> <!-- 왼쪽 상단 영역 -->
						
					
				</div>
				
				
				<!-- ==============[ 담벼락 ] ============= -->
				<div id="feed">
					<c:import url="/loadFeed.action"/>
				</div>	
				
				<!-- ===========[ 타이틀 (내 작업실 게시판)  ]=========== -->
				<div id="titleBox">
					<img src="images/megaphone.png" style="width:30px;">
					<span id="lineNotice">내 작업실</span>
					<a href="writeMyWork.action">  <!-- ※ 작성 페이지로 이동  -->
						<button type="button" class="btn" id="writeBtn">작업기록 작성</button>
					</a>
				</div>
				
				<!-- ==========[ 내 작업글 리스트 ]========== -->
				<div id="workSpaceBox">
					
					<table id="myWorkListTbl">
						<tr class="firstTr">
							<th width="100px">글 번호</th>
							<th width="400px">제목</th>
							<th width="200px">작업일</th>
							<th width="200px">작성일</th>
						</tr> 
						<c:forEach var="teamMyWork" items="${list}">
						<tr>
							<td>${teamMyWork.workspaceNo}</td>
							<td>
								<a href="teamMyWorkArticle.action?workspaceNo=WS${teamMyWork.workspaceNo}">${teamMyWork.title}</a>
							</td>
							<td>${teamMyWork.workDate}</td>
							<td>${teamMyWork.createdDate}</td>
						</tr>
						</c:forEach>
					</table><!-- ==== 한 페이지당 n개로 구성 ===== -->
					 
					
					<div id="pageNumBox">
						<span style="text-align: center"> ◀ 이전 1 2 3 4 5 다음 ▶</span>
					</div>
			
				</div><!-- end of #workSpaceBox  -->
				
			</div><!-- end of #directoryBox div (콘텐츠 영역)-->
			
	</div><!-- end of #root div -->

</body>
</html>
						
						