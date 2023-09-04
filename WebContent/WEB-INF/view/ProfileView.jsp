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
<title>MyPage.jsp(마이페이지)</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">

*
{
	text-align: center;
	
	margin: auto;
}

/* ---------- 상단 고정 스타일(메뉴바까지) ----------*/
#logoBox /*로고 이미지*/ {
	text-align: center;
	height: 100px;
	padding-top: 20px;
	/* border: 1px solid; */
}

#upperBarBox /*최상단 바(로그인..쪽지)*/ {
	text-align: right;
}

#menuBar /*메뉴바(메인|공지..)*/ {
	text-align: center;
	position: sticky;
	padding-top: 32px;
	top: -32px;
}
/*--- 여기까지 상단 고정 스타일 (메뉴바까지) ------*/
#myPageBox /* 전체 박스 클래스 */ {
	width: 1007px; /* 윈도우 조절해도 안 줄어들게 고정 */
	margin: auto;
	border: 1px solid;
	border-radius: 20px;
}

#myPageTitle /*마이페이지 (타이틀)*/ {
	margin: 10px 20px;
	font-weight: bold;
	font-size: 16pt;
	text-align: left;
}

.smallTitile /* 소제목 */ {
	font-size: 14pt;
	margin-left: 40px;
}

#myPageMenus /*마이페이지 메뉴들 */ {
	border: 1px solid;
	border-radius: 20px;
	font-weight: bold;
	padding: 10px 10px 10px 10px;
	background-color: white;

	/* position :sticky;  */ /*sticky 속성*/
	/*  top: 70px; */ /*sticky 속성*/
}

#myProfile /*내 프로필 영역*/ {
	
}
</style>


</head>


<body>
	<div id="root">

		<div class="header">

			<!-- header -->
			<c:choose>
				<c:when test="${not empty pinNo}">
					<div class="header-member">
						<c:import url="memberBar.jsp"></c:import>
					</div>
				</c:when>
				<c:otherwise>
					<div class="header-member">
						<c:import url="GuestBar.jsp"></c:import>
					</div>
				</c:otherwise>
			</c:choose>

			<div class="header-logo">
				<a href="projectorsmain.action"><img style="width: 530px;"
					src="<%=cp%>/images/NEXTART_LOGO.png" /></a>
			</div>

		</div>

		<div class="header-menu">
			<c:import url="menuBar.jsp"></c:import>
		</div>
		<!-- ============================================================ -->


		<div id="myPageBox">

			<div id="myPageMenus">
				<span id="myPageTitle">마이페이지</span> <!-- <a href="profileview.action">내
					프로필</a> --> <b>▶내 프로필 |</b>
				<!-- <a href="MyPage.jsp">찜한 모집 공고</a> -->
				<a href="accountManage.action">계정관리</a>
			</div>


			<!-- ====== 나의 프로필 ====== -->
		<!--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->

	<div id="ProfileContainer"> <!-- 프로필 전체 컨테이너 -->
		<div id="profileTitleBox">
			<h2 id="profileTitle"> 나의 프로필</h2>
		</div>
		
		
 
<c:set var="result" value="${result}" scope="session"/>
<c:set var="utoolResult" value="${utoolResult}" scope="session"/>
<c:choose>
        <c:when test="${result == 1 }">
             
  	
		<div id="profileImgContainer" style="margin: auto;">
			<div id="profileImgBox" style="margin: auto;">
				<img style="width:100px; height: 100px; margin:20px; border-radius: 6px"
				  alt="profileImg" 
				  src="${profileDTO.photourl}">
			</div>
			<div style="margin: 30px 16px;">
			<button type="submit"
				 onclick="window.open('<%= request.getContextPath()%>/photoUpdateForm.action','photoUpdate',
				 'left=500,top=300,width=400,height=400,resizable=no, location=no')" >사진 등록/수정</button>	 
			
			<button type="button" onclick="location.href='profileUpdateForm.action'">프로필 수정하기</button>
			</div>
		</div>
				
		<div class="myProfileOuter">
	<!-- 		
			프로필 가져오기
			<span class="smallTitle">나의 프로필</span> -->
		
			
			<div class="myProfile" style="width:200px;" >
<%-- 			
				<div class="photo">
					<img class="img" alt="profileImg" src="<%=cp %>/${profileDTO.photourl}">
				</div> 
				
--%>
				<div class="etc">
<%-- 				
				<table style="border: 1px solid black;">
					<tr>
						<th>닉네임</th>
						<td> ${profileDTO.nickname }</td>
					</tr>
					<tr>
						<th>희망포지션</th>
						<td>${profileDTO.posName }</td>
					</tr>
					<tr>
						<th>활동 지역</th>
						<td>${profileDTO.regionName } - ${profileDTO.subRegionName }</td>
					</tr>
					
					
				</table>
				
	 --%>			
				닉네임 : ${profileDTO.nickname }<br>
				희망포지션 : ${profileDTO.posName }<br>
				활동지역 : ${profileDTO.regionName } | ${profileDTO.subRegionName }<br>
				</div>
				
				<div class="toolBox" >
				<p>「사용가능 언어 및 환경」</p>
				<hr />
				
				<c:choose>	
					<c:when test="${utoolResult > 0 }">			
						<c:forEach var="utool" items="${utool}">
									【${utool.toolName}】
						</c:forEach>
					</c:when>
					<c:otherwise>
						사용 기술이 없습니다.
					</c:otherwise>
				</c:choose>
				</div>
			
			</div> <!-- end myProfile -->

				<br />
				<br />
				<hr />			
				<div id=rateBox >
						
						<table >
						<p style="font-size:x-large; font-family: 궁서체">평가</p>
							<c:forEach var="totalRate" items="${totalRate}">
							<tr>
								<th border="1px solid black">${totalRate.rateName }</th>
								<td border="1px solid black">${totalRate.count }</td>
							</tr>	
							</c:forEach>
							
						</table>
				</div> <!-- end rateBox  -->
		</div>	<!--end myProfileOuter"  -->
         
        </c:when> 
        <c:otherwise>
            등록된 프로필이 존재하지 않습니다!
            <br />
            <button type="button" onclick="location.href='profileInsertForm.action'">등록하러 가기</button>
		</c:otherwise>	
</c:choose>
	
	</div> <!-- end of #wrapper div -->
	
<!--★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->



			<!-- ===== 내가 찜한 모집공고 ====== -->
			<%-- 			<hr>
			<div id="myPick">
				<h2 class="smallTitile">찜한 모집 공고</h2>
				<c:import url="PickedPost.jsp"></c:import>
			</div>
			 --%>
		</div>
		<!-- end of #myPageBox div -->

	</div>
	<!-- end of #root div -->

</body>
</html>

