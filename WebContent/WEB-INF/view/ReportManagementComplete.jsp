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
<title>신고 관리 : Projectors</title>

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
	#userSearch
	{
		text-align: center;
	}
	#paging
	{
		margin: auto;
		text-align: center;
	}
	
</style>

<script type="text/javascript">
function search()
{
	var searchKey = document.getElementById("searchKey").value;
	var searchVal = document.getElementById("searchVal").value;
	
	//alert(searchVal);
	
	if (searchVal=="")
	{
		alert("검색어를 입력하세요");
		return;
	}
	
	var form = document.forms.searchForm;
	
	form.action = "recruitReportManageCompleteSearch.action?searchKey="+searchKey+"&searchVal="+searchVal;
	form.submit();

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
		<!-- ============================================================= -->

<div>
<h1>신고 관리</h1>
<hr />
</div>
<br />


<div id="leftBar">
	<div class="btnHeight">
		<button type="button">
			<a href="reportRecruit.action">신고 처리 대기</a>
		</button>
	</div>
	<div class="btnHeight">
		<button type="button">
			<a href="reportManageComplete.action">신고 처리 완료</a>
		</button>
	</div>
</div><!-- end #leftBar -->


<div id="rightBar">
	<div>
		<h2>
			신고 처리 완료 - 공고
		</h2> 
	</div>
	<div id="subMenuBar">
		<a href="reportManageComplete.action" style="background-color: gray; color: white; border-radius: 5px;">공고</a>
		<a href="applyManageComplete.action">지원서</a>
		<a href="commManageComplete.action">댓글</a>
		<a href="noteManageComplete.action">쪽지</a>
		<!-- <a href="reportTeamSpace.action">팀스페이스</a> -->
	</div>
		<hr />
		<br />
	
	<div id="userSearch">
		<form action="" id="searchForm">
				<select id="searchKey" name="searchKey">
					<option value="1">관리자번호</option>
					<option value="2">닉네임</option>
					<option value="3">신고번호</option>
				</select>
				<input type="text" id="searchVal" name="searchVal" 
				required="required" placeholder="검색어를 입력하세요(대소문자 구별 및 전체입력)" style="width: 30%;"/>
			<button type="button" id="searchBtn" onclick="search()">검색</button>
		</form>
	</div>
	<br>
	
	<div>
		<table class="table">
			<tr>
				<th>신고처리번호</th>
				<th>신고번호</th>
				<th>피신고자닉네임</th>
				<th>재제사유</th>
				<th>재제기간</th>
				<th>재제일자</th>
				<th>관리자번호</th>
			</tr>
				<c:forEach var="list" items="${lists }">
				<tr>
					<td>${list.resultNo}</td>
					<td>${list.repNo}</td>
					<td><a href="">${list.reportedNickName }</a></td><!-- 해당 유저 프로필 확인할 수 있는 창 -->
					<td>${list.content }</td>
					<td>${list.period }일</td>
					<td>${list.reguDate }</td>
					<td>
						${list.adminNo }
						<input type="hidden" id="adminPinNo" value="${list.adminPinNo }"/>
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
