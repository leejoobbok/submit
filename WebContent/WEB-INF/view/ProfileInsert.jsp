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
<title>프로필 입력/ 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

/*==========  상단 공통 요소 (메뉴바까지) ==================*/
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
/*==================================================*/
#wrapper /* 상단 import 제외 전체 영역 */ {
	margin: 0px 400px;
	border: 1px solid;
	border-radius: 20px;
	padding: 40px;
}

#profileUpdateBox /* 항목 작성,선택 하는 영역*/ {
	padding: 20px 0px;
}

#smallTitle /* 소제목(프로필 작성/수정)*/ {
	font-size: 14pt;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 10px;
}

/*======== 유효성 검사용 메세지 ===============*/
#msg_false, #msg_true /* 메세지 공통*/ {
	font-size: 8pt;
	/* margin-left: 150px; */
}

#msg_false /* 실패 메세지 */ {
	color: red;
	/* display: none; */
}

#msg_true /* 성공 메세지 */ {
	color: green;
	/* display: none; */
}

.profileItem /* 입력 항목 제목들(포지션,도구,지역..)*/ {
	display: inline-block;
	padding-bottom: 4px;
	font-weight: bold;
}

#ProfileInsertBtns /* 버튼 영역 */ {
	padding: 10px 0px;
}

#ProfileUpdateBtns 	button /* 버튼  */ {
	font-size: 12pt;
	font-weight: bold;
	background-color: black;
	color: white;
	border-radius: 14px;
	padding: 2px 8px;
}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function changeSubRegion()
	{
		var regionNo = document.getElementById("regionNo").value;

		var url = "changeSubRegionList.action?regionNo=" + regionNo;

		ajax = createAjax();

		ajax.open("GET", url, true);

		ajax.onreadystatechange = function()
		{

			if (ajax.readyState == 4 && ajax.status == 200)
			{
				callSubRegion();

			}
		};

		ajax.send("");
	}

	function callSubRegion()
	{
		var data = ajax.responseText;

		document.getElementById("subRegionNo").innerHTML = data;

	}

	$(document).ready(function()
	{

		$("#insertFormSubmit").click(function()
		{

			if (document.getElementsByName('posNo')[0].value == 0)
			{
				alert("희망 포지션을 입력해주세요(필수).");
				return;
			} else if (document.getElementsByName('regionNo')[0].value == 0)
			{
				alert("지역을 입력해주세요(필수).");
				return;

			} else if (document.getElementsByName("subRegionNo")[0].value == 0)
			{
				alert("세부지역을 입력해주세요(필수).");
				return;
			} else
			{
				if ($("input[name=toolCheckBox]").is(":checked") == false)
				{
					alert("도구 체크된 것이 없어용");

					document.getElementById("toolException").value = "1";

					/*히든 도구없음 체크박스 체크 ㅇ */
					document.getElementById("noTool").checked = true;

					document.getElementById("insertForm").submit();
				} else
				{
					// alert("도구 체크된 것이 있다!!!!!");

					document.getElementById("toolException").value = "0";

					/*히든 도구없음 체크박스 체크 해제 */
					document.getElementById("noTool").checked = false;

					document.getElementById("insertForm").submit();
				}
			}

		});

	});
</script>


</head>



<body>
	<div id="root">
		<!-- ========== 공통 상단 영역( 메뉴바까지) ======================== -->
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
		<!--================================================================  -->


		<div id="wrapper">
			<!-- 상단 import 제외 하고 감싸는 div -->

			<h1 id="smallTitle">프로필 작성/수정</h1>

			<div id="profileUpdateBox">
				<!-- 항목 작성 영역 -->

				<form id="insertForm" action="profileInsert.action">

					<!-- 프로필 이미지<input type="file" value="profileImage"/>  별도 jsp 파일로 뺌 -->
					<!-- 
					1	FRONTEND
					2	BACKEND
					3	FULLSTACK
					4	PUBLISHING
					5	DESIGN
					6	PLANNING
					 -->
					<span class="profileItem">희망 포지션</span><br> <select id="posNo"
						name="posNo">
						<option value="0">=== 선택해주세요 ===</option>
						<!-- 코어 태그 반복문으로 포지션 리스트 출력  -->
						<c:forEach var="positionList" items="${positionList}">
							<option value="${positionList.posNo}">${positionList.posName }</option>
						</c:forEach>
					</select> <span id="msg_false"> 희망 포지션을 선택해주세요.</span> <br>
					<br> <span class="profileItem">사용 도구</span> <span
						style="font-size: 8pt;">(다중선택 가능)</span> <span id="msg_false">
						사용 가능한 도구를 1개 이상 선택해주세요!</span> <br /> <br />
					<!-- 널값 넘겨주면 에러나서 만든 히든 체크박스 value는 toolTable에 없는 값  -->
					<input type="checkbox" id="noTool" name="toolCheckBox"
						hidden="hidden" value="0">
					<c:forEach var="tool" items="${toolList}" varStatus="loopStatus">

						<c:if test="${loopStatus.count == 1}">

							<b>==================== 언어 ===================</b>
						</c:if>
						<c:if test="${loopStatus.count == 11}">
							<hr />
							<b>=============== IDE 등 개발 환경 =================</b>
							<br />
						</c:if>
						<c:if test="${loopStatus.count == 21}">
							<hr />
							<b>============= 프레임워크 / 라이브러리 ===========</b>
							<br />
						</c:if>
						<c:if test="${loopStatus.index % 4 == 0}">
							<br>
						</c:if>
						<!--여기  -->		    
						    ┃<label>${tool.toolName} <input type="checkbox"
							id="tool${tool.toolNo}" name="toolCheckBox"
							value="${tool.toolNo}" />
						</label>
					</c:forEach>
					<!-- 도구 선택 있나 없나 체크용 히든  -->
					<input type="hidden" id="toolException" name="toolException"
						value="1"> <br>

					<!-- 					
					
				    ==================== 언어 ===================
					코어 태그 반복문 들어갈 자리 
					<label>Java<input type="checkbox" id="java" name="java"></label>
					<label>Javascript<input type="checkbox" id="js" name="js"></label>
					<label>HTML<input type="checkbox" id="html" name="html"></label>
					<label>CSS<input type="checkbox" id="css" name="css"></label>
					<label>Python<input type="checkbox" id="python" name="python"></label>
					<label>Go<input type="checkbox" id="go" name="go"></label>
					
					<hr>
					=============== IDE 등 개발 환경 ==================
					코어 태그 반복문 들어갈 자리 
					<label>Eclipse<input type="checkbox" id="eclipse" name="eclipse"></label>
					<label>VsCode<input type="checkbox" id="vscode" name="vscode"></label>
					
					<hr>
					=============== 프레임워크 / 라이브러리 ===========
					코어 태그 반복문 들어갈 자리 
					<label>Spring<input type="checkbox" id="spring" name="spring"></label>
					<label>React<input type="checkbox" id="react" name="react"></label>
					
					
					 -->
					<br> <span class="profileItem">지역</span> <span id="msg_false">
						지역을 선택해주세요!</span> <br> <select id="regionNo" name="regionNo"
						onchange="changeSubRegion()">
						<option value="0">=== 지역 선택 ===</option>

						<c:forEach var="region" items="${regionList}">
							<option value="${region.regionNo }">${region.regionName }</option>
						</c:forEach>
					</select> <select id="subRegionNo" name="subRegionNo">
						<option value="0">========상세 지역 선택=========</option>
					</select> <br> <br>
					<!-- 				
					<span class="profileItem">진행 방식</span>
					<span id="msg_false"> 선호하는 방식을 선택해주세요!</span><br>

			  		<input type='radio' name='doType' value='1' />대면
			  		<input type='radio' name='doType' value='2' />비대면
					<br>
				 -->
					<div id="ProfileInsertBtns">
						<button type="submit" hidden="hidden"></button>
						<button type="button" id="insertFormSubmit">저장</button>
						<button type="button" onclick="location.href='MyPage.jsp'">취소</button>
					</div>

				</form>

			</div>
			<!-- end of #profileUpdateBox div -->

		</div>
		<!-- end of #wrapper div -->

	</div>
	<!-- end of #root div -->
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</body>
</html>


