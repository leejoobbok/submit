<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String questionNo = request.getParameter("questionNo"); //-- 이전 페이지로부터 넘겨받은 문의 번호 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리 FAQ : Projectors</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>



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

	/* 헤더 */
	div>h1
	{padding-left : 5%; }

	/* ====================== 좌측바 ========================= */
	#leftBar
	{
		float: left;
		width: 20%;
		height : 300px;
		text-align: center;
	}
	.btnHeight
	{
		padding: 10px;
		border-right: 3px solid black;
	}
	/* ======================================================= */
	
	
	/* ====================== 우측바 ========================= */
	#rightBar
	{
		float: right;
		width: 70%;
		padding : 0% 5% 0% 5%;
	}
	
	.WriteBtn
	{
		font-size: small;
		float: right;
		width: 80px;
		margin-right: 11%;
		right: 0px;
		bottom: 0px;
	}

	.table
	{
		text-align: center;
		width: 90%;
	}

	/* ======================================================= */
	
	#answerTitle {font-size: 14pt; font-weight: bold;}
	
	.btn							/* 버튼 클래스 공통 */
	{
		background-color: black;
		color: white;
		font-weight: bold;
		font-size: 11pt;
		padding: 4px 10px;
		border-radius: 12px;
	}
	
	#modifyBtn 						/* 수정 버튼 */
	{
		background-color: #fadc6e;
		color: black;
	}	
	#deleteBtn						/* 삭제 버튼*/
	{
		background-color: #fa6e6e;
		color: black;
	}
	
	#returnList
	{
		font-size: medium;
		background-color: #CCCCCC;
		border: none;
		width: 120px;
		border-radius: 10px;
		padding: 5px 20px
	}
	
	#writeArea					/* 답변 작성 or 출력란 */
	{
		margin: 10px;
		padding: 10px;
		border-radius: 10px;
		font-size: 11pt;
		
		
	}
	.replydate					/* 답변 일시*/
	{
		font-size: 9pt;
		color: gray;
		padding-left: 30px;
	}
	
</style>



<script type="text/javascript">
	
	
	$(function()
	{	
		
		
		$("#returnList").click(function()				// 목록으로 버튼 클릭시 실행
		{
			window.location.href="q-list-4admin.action";
		});		
		
		$("#modifyBtn").click(function()    // 등록된 답변 수정 버튼 클릭시, 편집박스 활성화 및 스타일 변경 
		{ 
            $("#writeArea").removeAttr("readonly").removeAttr("disabled"); //-- 수정 가능하게 변경, 디자인 명시 
            $("#modifyBtn, #deleteBtn").hide();							   //-- 기존 수정, 삭제 버튼 숨기기 
            $("#saveBtn").show();
        });
		

		$("#saveBtn").click(function() {			  // 수정한 값 저장 버튼 클릭 ▶ 편집 불가로 되돌림, 답변 일시 뒤에 (수정됨) 표시 추가 

            $("#writeArea").attr("readonly",true); //-- 편집 불가 속성 추가 		
            $("#saveBtn").hide();
            $("#modifyBtn").show();
            $("#deleteBtn").show();
            
            var replyDateSpan = $(".replydate");		//-- 답변 등록일 값을 담고있는  span 요소 
            var modifiedSpan = $("<span>").text("(수정됨)").css("color", "green"); //-- 수정된 값 
            replyDateSpan.append(" ", modifiedSpan);
            
        });
	        
		$("#deleteBtn").click(function()					// 등록된 답변 삭제 버튼 클릭시 실행
		{	
			window.location.href="answer-delete.action?questionNo="+"<%= questionNo %>";
		});
		
	});
</script>
</head>


<body>
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<c:import url="adminLogo.jsp"></c:import> <!-- 로고이미지 -->
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->
		
		<div>
			<h1>FAQ / 문의</h1>
			<hr />
		</div>

		<div id="leftBar">
			<div class="btnHeight">
				<a href="faqManagement.action">
					<button type="button" class="btn">FAQ 관리</button>
				</a>
			</div>
			<div class="btnHeight">
				<a href="q-list-4admin.action">
					<button type="button" class="btn">1:1 문의 관리</button>
				</a>
			</div>
		</div><!-- end #leftBar -->

		<div id="rightBar">
			<div>
				<h2> 1:1 문의 상세 </h2>
			</div>
			<hr>
			
			<div>	<!--  ============사용자 문의 상세 내용 출력부분 =========== -->
				<table class="table">
					<tr>
						<th>문의번호</th>
						<th>회원번호</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>제목</th>
					</tr>
				    <tr>
				        <td>${qArticleForAdmin.questionNo}</td>
				        <td>${qArticleForAdmin.pinNo}</td>
				        <td>${qArticleForAdmin.nickName}</td>
				        <td>${qArticleForAdmin.qCreatedDate}</td>
				        <td>${qArticleForAdmin.questionTitle}</td>
				    </tr>
				    <tr>
				    	 <td colspan="5">${qArticleForAdmin.questionContent}</td>
				    </tr>
				</table>
			</div>
			<hr>
			
			<div class="wrapper"> <!--  ==========답변 등록 or 등록된 답변 관리 부분 =========== -->
				
				<div><%-- 등록된 답변이 있는 경우, 해당 내용과 수정/삭제 버튼 출력 --%>
				    <c:choose>
				        <c:when test="${not empty aArticleForAdmin.answerContent}">

				        	<span id="answerTitle">등록된 답변</span>
							<button type="submit" id="modifyBtn" class=" btn">수정</button>
							<button type="button" id="deleteBtn" class=" btn">삭제</button>
							<button type="submit" id="saveBtn" style="display: none;" class=" btn">저장</button> <!-- 수정 시 나타나는 버튼 -->
							
							<hr style="margin-left: 0px; width: 90%">
							
							<div>
								<span style="font-weight: bold;"><img src="images/adminPic.png" style="width:20px">운영자</span>
								<span class="replydate">답변일시: ${aArticleForAdmin.answerCreatedDate}</span>
							</div>
				            <textarea id="writeArea" cols="100" rows="5" name="answerContent" readonly="readonly" disabled="disabled">${aArticleForAdmin.answerContent}
				            </textarea>
				            
				            <hr style="margin-left: 0px; width: 90%">
				        </c:when>
				        <c:otherwise>
				            <!-- answerContent 가 null 이면, 이 부분 출력( 아무것도 나오지 않음 )  -->
				        </c:otherwise>
				    </c:choose>
				</div>
				
				<!-- 등록된 답변이 없을 때만 작성란 출력 -->
				<c:if test="${empty aArticleForAdmin.answerContent}">
				     <form action="insert-answer.action" method="GET">
       					 <textarea id="writeArea" cols="100" rows="5" name="answerContent" placeholder="문의에 답변을 남겨주세요."></textarea>
       					 <input type="hidden" name="questionNo" value="<%= questionNo %>">
				         <button type="submit" id="writeBtn">댓글 등록</button>
				     </form>
				</c:if>
			</div>
			
			<div style="text-align: center;">
				<br>
				<button id="returnList">목록으로</button>
			</div>
		
		</div><!-- end #rightBar -->

<!-- footer 넣을 자리	 -->

</body>
</html>