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
<title>팀 스페이스 > 공지 상세: Projectors </title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/teamSpace.css">

<style type="text/css">
	/*
	body { overflow: hidden;} 
	a{text-decoration: none;} 
	#root						   
	{
		width: 1400px;
		height:1000px;
		margin: auto;
		border: 2px solid #d1d7e0;
		
	}
	#innerBox				
	{
		margin: auto;
	}
	#spaceName 					
	{
		display: inline-block;
		text-align: left;
		font-size: 26px;
		padding-left: 80px;		
		
	}
	#categoryBar 				
	{	
		width: 660px;
		height: 40px;
		
		background-color: #fae896;
		padding: 10px 0px 0px 20px;
		margin-left: 60px;
		
		border-top: 2px solid;
		border-left: 2px solid;
		border-right: 2px solid;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	.index					
	{
		display: inline;
		border: 2px solid;  
		border-radius: 10px;
		
		vertical-align: bottom;
		font-weight: bold;
		padding: 6px 8px;
	}			
	
	.index a			
	{
		text-decoration: none;
		 
		font-size: 20px;
		padding: 4px 6px;
		margin: 0px;
	}
	#exitBtn					
	{	
		float: right;  
		margin-top: -12px; 	  
		padding-right: 60px;  
	}
	#directoryBox 
	{	
		position: relative; 
  		border: 2px solid;
		border: 2px solid; 
		border-radius: 20px;
		
		width: 1300px;
		height:740px;
		
		background-color: #fae896;  
		margin: auto;	
	}
	#topLeftBox		
	{
		width: 260px;
		height: 200px;
		border: 2px solid;
		border-radius: 10px;
		margin: 30px 20px 20px 20px;
		padding: 10px;
		background-color: gray;
	}
	#feed				
	{
		float: left;
		width: 268px;
		height: 430px;
		
		text-align: center;
		padding: 5px;
		margin: 0px 20px 10px 20px;
		
		border: 3px solid #757575;
		border-radius: 10px;
		background-color: #a8adad;
	}
	*/
	
	#titleBox 	
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
	#teamNoticeArticleTbl /* 공지 아티클 테이블*/
	{
		border: solid 1px;
		border-radius: 10px;
		margin:40px 0px 20px 50px;
		font-size: 12pt;
		text-align: center;
	}
	#teamNoticeTextArea /* 내용 출력 부분 */
	{
		width: 88%;
		height: 400px;
		magin: 10px;
		border-radius: 10px;
		padding: 10px;
	}
	/*======================================================*/
	
	#bottomBox				/* 하단 버튼 3개 영역*/
	{
		width: 300px;
		margin: 10px auto;
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
	#backBtn:hover					/* 목록으로 버튼*/
	{	
		border: 2px solid black;
		background-color: #dbd1ce;
		color: black;
	}
	#modifyBtn 						/* 수정 버튼 */
	{	
		background-color: #fadc6e;
		color: black;
	}	
	#modifyBtn:hover						
	{	
		background-color: #f5b576;
	}	
	#deleteBtn						/* 삭제 버튼*/
	{
		background-color: #fa6e6e;
		color: black;
	}
	#deleteBtn:hover						
	{	
		background-color: #d94925;
	}	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	
	// 삭제 버튼 클릭시 확인받기 
	function deleteTeamNotice() 
	{
        var confirmDelete = confirm("정말로 삭제하시겠습니까?");
       
        if (confirmDelete) {
        	
        	//alert(${teamArticle.spaceNoticeNo });
            window.location.href = "teamNoticeDelete.action?spaceNoticeNo=SN"+${teamArticle.spaceNoticeNo};
        }
    }
	
	// 수정하기 버튼 클릭시..
	function modifyTeamNotice()    // 편집박스 활성화 및 스타일 변경 
	{ 	
         $("#teamNoticeTextArea").removeAttr("readonly").removeAttr("disabled"); //--  본문 수정 가능하게 변경, 디자인 명시 
         $("#title").removeAttr("readonly").removeAttr("disabled");			//-- 제목 부분 수정 가능하게 변경 
         $("#modifyBtn, #deleteBtn").hide();							   //-- 기존 수정, 삭제 버튼 숨기기 
         $("#saveBtn").show();											   //-- 변경사항 저장버튼 
         
    };
			
	// 수정완료 버튼 클릭시 (수정 수행)
	function saveTeamNotice() 
	{			 					 // 수정한 값 저장 버튼 클릭 ▶ 편집 불가로 되돌림, 제목 뒤에 (수정됨) 표시 추가 
         $("#teamNoticeTextArea").attr("readonly",true); //-- 편집 불가 속성 추가 		
         $("#saveBtn").hide();
         $("#modifyBtn").show();
         $("#deleteBtn").show();
         
         var isModifiedSpan = $("#isModified");		//-- 제목 옆에 수정된 글이면 표시하는 span 요소
         var modifiedSpan = $("<span>").text("(수정됨)").css("color", "green"); //-- 수정 표시 문구
         isModifiedSpan.append(" ", modifiedSpan);
         
         var teamNoticeTextArea = document.getElementById("teamNoticeTextArea").value;
         
         //alert(teamNoticeTextArea);
         
         window.location.href = "teamNoticeModify.action?spaceNoticeNoSN"+${teamArticle.spaceNoticeNo}+"&content=" + teamNoticeTextArea;
     };
</script>

</head>
<body>

	<div id="root">
		<div id="innerBox">
			
			<div>
				<h1 id="spaceName">팀 스페이스 : 우리동네 밥친구 프로젝트 </h1>
			</div>
			<div id="exitBtn">
				<a href="MainPage.jsp"><img src="images/exit.png" style="width:50px"></a>
			</div> 
			
			<!-- 공지, 작업실, 회의록, 히스토리 (메뉴 인덱스) -->
			<div id="categoryBar">
				<div class="index idx1">
					<a href="TeamSpace.jsp">
						<img src="images/home.png" style="width:30px;"/>
					</a>
				</div>
				<div class="index idx2"><a href="teamNoticeList.action">공지</a></div>
				<div class="index idx3"><a href="TeamNoticeList.jsp">작업실</a></div>
				<div class="index idx4"><a href="TeamMeetingList.action">회의록</a></div>
				<div class="index idx5"><a href="TeamTotalRecord.jsp">히스토리</a></div>
				<div class="index idx6"><a href="TeamMemberInfo.jsp">멤버</a></div>
				<div class="index idx7"><a href="TeamSetting.jsp">설정</a></div>
			</div>
				
			<div id="directoryBox">
				
				<div id="topLeftBox"> <!-- 왼쪽 상단 영역 -->
						
					
				</div>
				
				
				<!-- ==============[ 담벼락 ] ============= -->
				<div id="feed">
					<c:import url="/loadFeed.action"/>
				</div>
				
				<!-- ===========[ 타이틀 (공지게시판)  ]=========== -->
				<div id="titleBox">
					<img src="images/megaphone.png" style="width:30px;">
					<span id="lineNotice">공지게시판</span>
				</div>
				
				<!-- ==========[ 팀 공지 아티클 상세 보기 영역 ]========== -->
				<div id="workSpaceBox">
					<form action="teamNoticeModify.action" method="get">	<!--  수정 시 제출하기 위한 폼 태그 -->
						<table id="teamNoticeArticleTbl">
							<tr>
								<th width="100px">글 번호</th>
								<th width="500px">제목</th>
								<th width="200px">작성일</th>
							</tr>
							<tr>
								<td>${teamArticle.spaceNoticeNo }</td>
								<td>${teamArticle.title }<span id="isModified"></span>
								</td>
								<td>${teamArticle.createdDate }</td>
							</tr>
							<tr>
	    						<td colspan="3">
	    							<hr>
		    						<textarea id="teamNoticeTextArea" name="content" readonly="readonly" disabled="disabled"
		    						>${teamArticle.content}</textarea>
	    						</td>
							</tr>
						</table>
						
						<div id="bottomBox">
							
							<a href="teamNoticeList.action">
								<button type="button" class="btn" id="backBtn">목록으로</button>
							</a>
						
							<!-- ※ 팀장에게만 보이는 버튼 -->
							<button type="button" id="modifyBtn" class=" btn" onclick="modifyTeamNotice()">수정하기</button>
							<button type="button" id="deleteBtn" class="btn"  onclick="deleteTeamNotice()">삭제하기</button>
							<button type="button" id="saveBtn" class=" btn"  onclick="saveTeamNotice()" style="display: none;">수정완료</button> <!-- 수정 시 나타나는 버튼 -->
						</div>
					</form>
				</div><!-- end of #workSpaceBox  -->
				
			</div><!-- end of #directoryBox div (콘텐츠 영역)-->
			
		</div><!-- end of #innerBox div  -->
		
	</div><!-- end of #root div -->

</body>
</html>
						
						