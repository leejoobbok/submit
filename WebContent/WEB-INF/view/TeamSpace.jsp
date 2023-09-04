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
<title>팀 스페이스: 메인 - Projectors </title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/teamSpace.css">
<style type="text/css">

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
	
	
	
	
	
</script>


</head>
<body>
	<div id="root">
			
			<div id="spaceNameBox">
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
				<div class="index idx5"><a href="TeamTotalRecord.jsp">히스토리</a></div>
				<div class="index idx6"><a href="teamMemberInfo.action">멤버</a></div>
				<div class="index idx7"><a href="">설정</a></div>
			</div>
				
			<div id="directoryBox">
				
				<div id="topLeftBox"> <!-- 왼쪽 상단 영역 -->
						
					
				</div>
				
				
				<!-- ==============[ 담벼락 ] ============= -->
				<div id="feed">
					<c:import url="/loadFeed.action"/>
				</div>	
				
				
				<!-- ===========[ 상단 한 줄 공지 ]=========== -->
				<div id="lineNoticeBox">
					<img src="images/megaphone.png" style="width:30px;">
					<span id="lineNotice"><a href="TeamNoticeArticle.jsp">공지: 새로운 콘텐츠 추가 회의는 오프라인으로 진행합니다!</a></span>
					<span id="noticeDate">2023.08.04</span>
				</div>
				
				<!-- ==========[ 멤버별 작업실 미리보기(메인)]========== -->
				<div id="workSpaceBox">
					
					
				</div>
				
				<!-- ==========[ 메인에는 무슨 기능을 넣어야 할까]========== -->
				<div>
					
					
				</div>
				
				<!-- ====================================================================================== -->
			</div><!-- end of #directoryBox div (콘텐츠 영역)-->
			
		
	</div><!-- end of #root div -->
</body>
</html>

