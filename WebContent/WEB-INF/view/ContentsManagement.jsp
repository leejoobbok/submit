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
<title>공고리스트 관리 : Projectors</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/recruitLists.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">

	/*==========  상단 공통 요소 (메뉴바까지) ==================*/
	#logoBox 					   /*로고 이미지*/
	{
		text-align: center;
		height: 100px;
		padding-top: 20px;
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
	
	.blackBtn
	{
		font-size: x-small;
		color: white;
		background-color: black;
		border: none;
	}
	.table
	{
		text-align: auto;
		width: 100%;
	}
	
	th
	{
		border-bottom: 1px solid gray;
	}
	
	td
	{
		text-align: center;
	}
	
	.right-left { width: 80%;}
	.right-right { width: 10%;}
	/* ======================================================= */
	#paging
	{
		margin: auto;
		text-align: center;
	}
	
</style>

<script type="text/javascript">

</script>
</head>


<body>	
	 	<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
		
		<div id="upperBarBox">		<!-- 로그인/ 회원가입 문의/ 쪽지 -->
			<c:import url="AdminUpperBar.jsp"></c:import>
		</div>	
		<div id="logoBox">    		<!-- 로고 이미지 -->
			<a href="AdminMainPage.jsp"><img src="images/tmp_logo_admin.jpg"/></a>
		</div>
		<div id="menuBar">						<!-- 메뉴바( 메인 | 공지..) -->
			<c:import url="AdminBar.jsp"></c:import>
		</div>
		<!-- ============================================================= -->

<div>
<h1>컨텐츠 관리</h1>
<hr />
</div>
<br />


<div id="leftBar">
	<div class="btnHeight">
		<button type="button">
			<a href="contentsManagement.action">공고리스트관리</a>
		</button>
	</div>
	<div class="btnHeight">
		<button type="button">
			<a href="TeamSpaceManagement.jsp">팀스페이스관리</a>
		</button>
	</div>
</div><!-- end #leftBar -->


<div id="rightBar">
	<div>
		<h2>
			공고리스트관리 
		</h2> 
	</div>
		<hr />
		<br />
	<br>
	
	<div>
		<table class="table">
			<tr>
				<th>공고번호</th>
				<th>제목</th>
				<th>모집인원</th>
				<th>모집마감일</th>
				<th>상태</th>
			</tr>
			<!-- 
			<tr>
				<td>1234</td>
				<td><a href="">어쩌구저쩌구 프로젝트</a></td>해당 프로젝트 공고 열기
				<td>1/5</td>
				<td>2023-07-23</td>
				<td>모집중</td>
			</tr>
			-->
			<c:forEach var="recruit" items="${lists }" varStatus="status">
			<tr>
				<td>${recruit.recruitNo }</td>
				<td><a href="recruitarticle.action?recruitNo=${recruit.recruitNo }">${recruit.title }</td>
				<td> 
					<c:forEach var="member" items="${members[status.index] }">
						${member.countPos } / ${member.countAll }
					</c:forEach> 
				</td>
				<td>${recruit.deadlineDate }</td>
				<td>
					<c:forEach var="member" items="${members[status.index] }">
						<c:choose>
							<c:when test="${Integer.parseInt(member.countAll) - Integer.parseInt(member.countPos) == 0 }">
								<span class="endStatus">모집마감</span>
							</c:when>
							<c:otherwise>
						      	<span class="recruitStatus">모집중</span>
							</c:otherwise>
						</c:choose> 
					</c:forEach>
				</td>
			</tr>
			</c:forEach>
			
			
		</table>	
	</div>

	<div id="paging">
		[페이징 처리처리처리처리]
	</div>

</div><!-- end #rightBar -->

</body>
</html>
