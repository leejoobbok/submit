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
<title>팀 스페이스 > 작업 기록 작성하기 - Projectors </title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/teamSpace.css">

<style type="text/css">
	
    .smallTitleBox   /* 소제목 박스들 공통 클래스 */
    {	
     	position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
   		height:30px;  
    	font-size: 16px;
	  	font-weight: bold;
	  	
	  	text-align: center;
	  	border: 2px solid ; 
	 	border-radius: 12px;
	  	padding: 10px 4px 4px 4px;
    }
    #titleIndex		/* 제목 제목박스 */
    {
    	 top: 60px;  /* 고정 top 마진 */
	  	 left: 166px; /* 고정 왼쪽 마진 */
	  	 width: 50px;
	  	 background-color: #c6fa96;
    }
    
    #workDateIndex /* 작업 날짜제목 박스*/
    {
    	 top: 60px;  /* 고정 top 마진 */
	  	 right: 334px; 
	  	 width: 80px;
	  	 background-color: pink;
    }
    #fileUrlIndex /* 첨부 파일 제목 박스*/
    {
    	 top: 116px;  /* 고정 top 마진 */
	  	 left: 500px; /* 고정 왼쪽 마진 */
	  	 width: 80px;
	  	 background-color: #a0c2f2;
    }
    
     /*===================================================*/
	#title 	/* 제목 작성란 (input 박스) */
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 60px;  			/* 고정 top 마진 */
	  left: 236px; 	
	  
	  width: 570px;
	  height: 30px;
	  background-color: white;
	 
	  
	  border: 2px solid;
	  border-radius: 12px;
	  
	  font-size: 16px;
	  font-weight: bold;
	  text-align: left;
 	  padding: 10px 4px 4px 10px;
	}
	
	#content		/* 내용 작성란 */
	{	
		 position: absolute; 
		/*  top: 150px; */
		 top: 110px;
		 right: 152px;
		 
		 font-size: 16px;
		 margin: 20px;
		 padding: 20px;
		 
		 border-radius: 14px;
		 border: 2px solid gray;
		 
		 width: 900px;
		 height:460px;
	}
	
	#workDate  /* 작업 날짜 선택란 */
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 60px;  			/* 고정 top 마진 */
	  right: 170px; 		
	  
	  height: 30px;
	  background-color: white;
	  width: 140px;
	  border: 2px solid;
	  border-radius: 12px;
	  
	  font-size: 16px;
	  font-weight: bold;
	  text-align: left;
 	  padding: 10px 4px 4px 10px;
	}
	
	#fileUrl /* 첨부파일 선택란 */
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 116px;  			/* 고정 top 마진 */
	  right: 180px; 			/* 고정 오른쪽 마진 */
	  
	  height: 30px;
	  background-color: white;
	  width: 500px;
	  border: 2px solid;
	  border-radius: 12px;
	  
	  font-size: 16px;
	  font-weight: bold;
	  text-align: left;
 	  padding: 10px 4px 4px 10px;
	}
	 /*===================================================*/
	.buttonContainer
	{
		position: absolute;
		bottom: 20px;
		right: 180px;
		padding-top: 30px;
	}
	.btn							/* 버튼 클래스 공통 */
	{	
		font-weight: bold;
		font-size: 12pt;
		padding: 2px 10px;
		border: 2px solid;
		border-radius: 12px;
	}
	#insertBtn 						/* 등록하기 버튼 */
	{	
		background-color: pink;
		color: black;
	}	
	#backBtn					/* 취소하기 버튼*/
	{	
		background-color: #dbd1ce;
		color: black;
	}
	/*======================================================*/
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	

    function send() // 등록 버튼 -> 로딩 -> 등록완료!
    {	
    	var title = $('#title').val();
    	var content = $('#content').val();
    	var workDate = $('#workDate').val();
    	
    	if(workDate == undefined) //유저가 작업일을 선택하지 않은 경우
   		{
	    	var workDateCheck = confirm("작업일을 선택하지 않으면 오늘 날짜로 등록됩니다. 이대로 등록하시겠습니까?");
	        
	        if (workDateCheck) {
	        	
	        	workDate = null; 
	            window.location.href = "insertMyWork.action?title="+title+"&content="+content+"&workDate="+workDate;
	        }
        }
    	
    }
</script>


</head>
<body>

	<div id="root">
		<div id="innerBox">
			
			<div>
				<h1 id="spaceName">팀 스페이스 : 우리동네 밥친구 프로젝트 </h1>
			</div>
			<div id="exitBtn">
				<a href="projectorsmain.action"><img src="images/exit.png" style="width:50px"></a>
			</div>  
			
			<!-- 공지, 작업실, 회의록, 히스토리 (메뉴 인덱스) -->
			<div id="categoryBar">
				<div class="index idx1">
					<a href="TeamSpace.jsp">
						<img src="images/home.png" style="width:30px;"/>
					</a>
				</div>
				<div class="index idx2"><a href="teamNoticeList.action">공지</a></div>
				<div class="index idx3"><a href="teamMyWorkspace.action">내 작업실</a></div>
				<div class="index idx4"><a href="TeamMeetingList.action">회의록</a></div>
				<div class="index idx5"><a href="TeamTotalRecord.jsp">히스토리</a></div>
				<div class="index idx6"><a href="TeamMemberInfo.jsp">멤버</a></div>
				<div class="index idx7"><a href="TeamSetting.jsp">설정</a></div>
			</div>
			
			<div id="directoryBox">	
				<form action="" method="get">

					<div id="titleIndex" class="smallTitleBox">제목</div>
					<input type="text" id="title" name="title"  placeholder="제목 입력">
					
					<div id="workDateIndex" class="smallTitleBox">작업일</div>
					<input type="date" name="workDate" id="workDate"></input>
					
					<textarea name="content" id="content"  placeholder="내용 입력"></textarea>
					
					<div class="buttonContainer">
						<button type="button" class="btn" id="insertBtn" onclick="send()">등록하기</button>
						<a href="teamMyWorkspace.action">
							<button type="button" class="btn" id="backBtn">취소하기</button>
						</a>
					</div>
				</form>
				
			</div><!-- end of #directoryBox div (노란 폴더 몸통 영역)-->
			
		</div><!-- end of #innerBox div  -->
		
	</div><!-- end of #root div -->

</body>
</html>

