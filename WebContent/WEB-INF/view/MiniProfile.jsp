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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<div id="ProfileContainer">
		<!-- 프로필 전체 컨테이너 -->
		<div id="profileTitleBox">
			<h2 id="profileTitle">나의 프로필</h2>
		</div>



		<c:set var="result" value="${result}" scope="session" />
		<c:set var="utoolResult" value="${utoolResult}" scope="session" />
		<c:choose>
			<c:when test="${result == 1 }">


				<div id="profileImgContainer" style="margin: auto;">
					<div id="profileImgBox" style="margin: auto;">
						<img
							style="width: 100px; height: 100px; margin: 20px; border-radius: 6px"
							alt="profileImg" src="${profileDTO.photourl}">
					</div>
					<div style="margin: 30px 16px;">
						<button type="submit"
							onclick="window.open('<%=request.getContextPath()%>/photoUpdateForm.action','photoUpdate',
				 'left=500,top=300,width=400,height=400,resizable=no, location=no')">사진
							등록/수정</button>

						<button type="button"
							onclick="location.href='profileUpdateForm.action'">프로필
							수정하기</button>
					</div>
				</div>

				<div class="myProfileOuter">
					<!-- 		
			프로필 가져오기
			<span class="smallTitle">나의 프로필</span> -->


					<div class="myProfile" style="width: 200px;">
						<%-- 			
				<div class="photo">
					<img class="img" alt="profileImg" src="<%=cp %>/${profileDTO.photourl}">
				</div> 
				
--%>
						<div class="etc">
							닉네임 : ${profileDTO.nickname }<br> 희망포지션 :
							${profileDTO.posName }<br> 활동지역 : ${profileDTO.regionName }
							| ${profileDTO.subRegionName }<br>
						</div>

						<div class="toolBox">
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

					</div>
					<!-- end myProfile -->

					<br /> <br />
					<hr />
					<div id=rateBox>

						<table>
							<p style="font-size: x-large; font-family: 궁서체">평가</p>
							<c:forEach var="totalRate" items="${totalRate}">
								<tr>
									<th border="1px solid black">${totalRate.rateName }</th>
									<td border="1px solid black">${totalRate.count }</td>
								</tr>
							</c:forEach>

						</table>
					</div>
					<!-- end rateBox  -->
				</div>
				<!--end myProfileOuter"  -->

			</c:when>
			<c:otherwise>
            등록된 프로필이 존재하지 않습니다!
            <br />
				<button type="button"
					onclick="location.href='profileInsertForm.action'">등록하러 가기</button>
			</c:otherwise>
		</c:choose>

	</div>

</body>
</html>