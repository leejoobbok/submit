<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String meetingNo = request.getParameter("meetingNo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 스페이스 > 회의록 상세 : Projectors </title>
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
	#workSpaceBox			/* 회의록 리스트 영역*/
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
	#meetingArticleTbl /* 회의록 아티클 테이블*/
	{
		border: solid 1px;
		border-radius: 10px;
		margin:20px 10px 10px 10px;
		font-size: 12pt;
		text-align: center;
	}
	.firstTr
	{
		background-color: #bfbbb4;
	}
	input[id="title"]		/* 제목 인풋 태그 스타일 초기화*/
	{
	   border: none;
	   outline: none;
	   background: none;
	   padding: 0;
	   margin: 0;
	 }
	 
	 
	#title		 /*회의록 제목 */
	{
	   width: 200px;
	   font-size: 12pt;
	   text-align: center;
	}  
	#meetingDate, #createdDate
	{
		font-size: 10pt;
	}
	#meetingTextArea /* 내용 출력 부분 */                                             
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
	
	
	// 삭제 버튼 클릭시..
	function deleteMeeting() 
	{	
        var confirmDelete = confirm("정말로 삭제하시겠습니까?");
        
        if (confirmDelete) {
            window.location.href ="deleteMeeting.action?meetingNo=<%=meetingNo%>";
        }
    }
	
	// 수정하기 버튼 클릭시..
	function modifyMeeting()    // 편집박스 활성화 및 스타일 변경 
	{ 	
         $("#meetingTextArea").removeAttr("readonly").removeAttr("disabled"); //--  본문 수정 가능하게 변경, 디자인 명시 
         $("#title").removeAttr("readonly").removeAttr("disabled");			//-- 제목 부분 수정 가능하게 변경 
         $("#title").css({ "border": "1px solid #ccc",						//-- 제목 수정 가능표시를 위해 input  스타일 복구
         				   "padding": "4px",
         				   "border-radius":"10px"});
       
         $("#title").focus(function() {
             $(this).css({
                 "border": "2px solid black",  // 선택중일 때 스타일 변경 
                 "padding": "4px",
                 "border-radius": "10px"
             });
         });
         $("#title").blur(function() {			// 선택중이 아닐때 복구 
             $(this).css({
            	 "border": "1px solid #ccc",						
				  "padding": "4px",
				  "border-radius":"10px"
             });
         });

         $("#modifyBtn, #deleteBtn").hide();							   //-- 기존 수정, 삭제 버튼 숨기기 
         $("#saveBtn").show();											   //-- 변경사항 저장버튼 
         
    };
			
	// 수정 완료 버튼 클릭시 (수정 수행)
	function saveMeeting() 
	{			 					 // 수정한 값 저장 버튼 클릭 ▶ 편집 불가로 되돌림, 제목 뒤에 (수정됨) 표시 추가 
		
         $("#title").attr("readonly",true); 		  //-- 제목에 편집 불가 속성 추가 
         $("#title").css({ "border": "none",						//-- 제목 스타일 복구
			   "padding": "4px",
			   "border-radius":"10px"});
         $("#meetingTextArea").attr("readonly",true); //-- 내용에 편집 불가 속성 추가 		
         $("#saveBtn").hide();
         $("#modifyBtn").show();
         $("#deleteBtn").show();
         
         var isModifiedSpan = $("#isModified");		//-- 수정됨 표시를 붙일 대상 
		 var modifiedSpan = $("<span>").text("(수정됨)").css({  //-- 수정 표시 문구
		        	    "color": "green",
		        	    "font-size": "8pt"
         });
          
         //====== 넘기는 값 처리 
         var title = document.getElementById("title").value;
         var content = document.getElementById("meetingTextArea").value;
         var fileUrl = document.getElementById("fileUrl").textContent;
         
         //alert(fileUrl);
         if (fileUrl === undefined) {
             fileUrl = null;
         }                         
         
         //수정 가능한 3가지 값을 (제목, 내용, 첨부파일경로) 실제로 제출해서 수정
         window.location.href = "modifyMeeting.action?meetingNo=<%=meetingNo%>&title=" +title+ "&content=" +content+ "&fileUrl=" +fileUrl;
	 	 
	 
   
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
						
					여기 뭐 넣져??
				</div>
				
				
				<!-- ==============[ 담벼락 ] ============= -->
				<div id="feed">
					<c:import url="/loadFeed.action"/>
				</div>
				
				<!-- ===========[ 타이틀 (회의록 게시판)  ]=========== -->
				<div id="titleBox">
					<img src="images/megaphone.png" style="width:30px;">
					<span id="lineNotice">회의록</span>
				</div>
				
				<!-- ==========[ 회의록 아티클 상세 보기 영역 ]========== -->
				<div id="workSpaceBox">
				<form action="modifyMeeting.action" method="get"> 	<!-- 수정 제출 폼 -->
						<table id="meetingArticleTbl">
							<tr class="firstTr">
								<th width="100px">글 번호</th>
								<th width="300px">제목</th>
								<th width="200px">작성자</th>
								<th width="160px">회의일시</th>
								<th width="160px">작성일시</th>
							</tr>
							
							<tr>
								<td>
									${meetingArticle.meetingNo }
								</td>
								<td> 
									<input id="title" name="title" type="text" readonly="readonly" disabled="disabled"
									 value="${meetingArticle.title }"/>
									 <span id="isModified"></span>
								</td>
								<td>${meetingArticle.nickName }</td>
								<td>${meetingArticle.meetingDate}</td>
								<td>${meetingArticle.createdDate }</td>
							</tr>
							<tr>
	    						<td colspan="5">
	    							<hr>
		    						<textarea id="meetingTextArea" name="content" readonly="readonly" disabled="disabled"
		    						>${meetingArticle.content}</textarea>
	    						</td>
							</tr>
							<tr>
								<td colspan="5">
									<span id="fileUrl" name="fileUrl">${meetingArticle.fileUrl }</span>
								</td>
							</tr>
						</table>
						
						
						<div id="bottomBox">
							
							<a href="TeamMeetingList.action">
								<button type="button" class="btn" id="backBtn">목록으로</button>
							</a>
						
							<!-- ※ 팀장에게만 보이는 버튼 -->
							<button type="button" id="modifyBtn" class=" btn" onclick="modifyMeeting()">수정하기</button>
							<button type="button" id="deleteBtn" class="btn"  onclick="deleteMeeting()">삭제하기</button>
							<button type="button" id="saveBtn" class=" btn"  onclick="saveMeeting()" style="display: none;">수정완료</button> <!-- 수정 시 나타나는 버튼 -->
						</div>
					</form> 
				</div><!-- end of #workSpaceBox  -->
				
			</div><!-- end of #directoryBox div (콘텐츠 영역)-->
			
		</div><!-- end of #innerBox div  -->
		
	</div><!-- end of #root div -->

</body>
</html>