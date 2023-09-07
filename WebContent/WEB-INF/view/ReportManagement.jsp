<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고처리대기-공고 : Projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/reportManagement.css">
<style type="text/css">

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
function manageReport(button)
{
	var row = button.closest('tr');
    var reportedNickName = row.querySelector('.reportedNickName').value;
    
    var newWindow = window.open('managementReport.action?reportedNickName='+reportedNickName
								, 'manageReport', 'left=500,top=300,width=600,height=500,resizable=no');
    
    window.addEventListener('message', function(event) 
 	{
        if (event.origin !== window.location.origin) 
        {
            // 안전한 출처 확인
            return;
        }

        // 전달받은 데이터 사용
        var receivedData = JSON.parse(event.data);
        
        row.querySelector('.reguNo').value = receivedData.param1;
        row.querySelector('.reguPeriodNo').value = receivedData.param2;
        
        var postNo = row.querySelector('.postNo').value;
        var repNo = row.querySelector('.repNo').value;
        var reguNo = row.querySelector('.reguNo').value;
        var reguPeriodNo = row.querySelector('.reguPeriodNo').value;
        
        window.location.href = 'clearManageReport.action?repNo='+repNo+'&postNo='+postNo
        							+'&reguNo='+reguNo+'&reguPeriodNo='+reguPeriodNo;
 	});
    
}

function cancelReport(button)
{
	var row = button.closest('tr');
	var repNo = row.querySelector('.repNo').value;
	var postNo = row.querySelector('.postNo').value;
	
	if (confirm("정말 신고 처리 취소 하시겠습니까?"))
	{
		window.location.href = "rejectManageReport.action?repNo="+repNo+'&postNo='+postNo;
	}
	return;
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
			신고 처리 대기 - 공고
		</h2> 
	</div>
	<div id="subMenuBar">
		<a href="reportRecruit.action" style="background-color: gray; color: white; border-radius: 5px;">공고</a>
		<a href="reportApply.action">지원서</a>
		<a href="reportComm.action">댓글</a>
		<a href="reportNote.action">쪽지</a>
		<!-- <a href="reportTeamSpace.action">팀스페이스</a> -->
		<hr>
	</div>
	<br />

<!-- 공고 처리 대기하는 form/table 구성 위치 -->
<!-- 
	처리할 때 필요한 속성
	공고번호,해당 신고번호,처벌 번호,처벌 기간
-->
<div>

<form action="">
<table class="table">
	<tr>
		<th>신고번호</th>
		<th>공고번호</th>	<!-- 클릭시 해당 게시물 이동 -->
		<th>피신고자</th>	<!-- 클릭시 해당 유저 프로필 이동 -->
		<th>신고자</th>		<!-- 클릭시 해당 유저 프로필 이동 -->
		<th>사유</th>
		<th>신고일자</th>
		<th>신고처리</th><!-- 버튼에 따라 처리결과 value 넘김 -->
	</tr>
<c:choose>
	<%-- 신고 내역이 있을 경우 --%>
	<c:when test="${not empty lists }"> 
	<c:forEach var="report" items="${lists }" varStatus="i">
	
	<tr class="${i.count }">
		<%-- 신고번호 --%>
		<td>
			${report.repNo }
			<input type="hidden" class="repNo" name="repNo" value="${report.repNo }"/>
		</td>
		<%-- 공고번호 --%>
		<td>
			<a href="recruitarticle.action?recruitNo=${report.postNo }">${report.postNo }</a>
			<input type="hidden" class="postNo" name="postNo" value="${report.postNo }"/>
		</td>
		<%-- 피신고자 --%>
		<td>
			<a href="<%= request.getContextPath()%>/profileadminview.action?pinNo=${report.reportedUserPinNo}"
						 onclick="window.open(this.href, 'photoUpdate',
                      'left=500,top=300,width=400,height=400,resizable=no,location=no');
         						return false;">${report.reportedNickName }</a>
			<input type="hidden" class="reportedNickName" name="reportedUserPinNo" 
				value="${report.reportedNickName }" />
			<input type="hidden" class="reportedUserPinNo" name="reportedUserPinNo" 
				value="${report.reportedUserPinNo }" />
		</td>
		<%-- 신고자 --%>
		<td>
			<c:choose>
			<c:when test="${fn:contains(report.reportNickName, '관리자') }">		
				${report.reportNickName }
			</c:when>
			<c:when test="${fn:contains(report.reportNickName, '탈퇴회원') }">		
				${report.reportNickName }
			</c:when>
			<c:otherwise>
				<a href="<%= request.getContextPath()%>/profileadminview.action?pinNo=${report.reportUserPinNo}"
						 onclick="window.open(this.href, 'photoUpdate',
		                    'left=500,top=300,width=400,height=400,resizable=no,location=no');
		       						return false;">${report.reportNickName }</a>
			</c:otherwise>
			</c:choose>

			<input type="hidden" class="reportUserPinNo" name="reportUserPinNo" 
				value="${report.reportUserPinNo }" />					
				
		</td>
		<%-- 사유 --%>
		<td>
			${report.repReason } 
			<input type="hidden" class="reguNo" name="reguNo"/>	<%-- 처벌사유 --%>
			<input type="hidden" class="reguPeriodNo" name="reguPeriodNo"/> <%-- 처벌기간 --%>
		</td>
		<%-- 신고일자 --%>
		<td>
			${report.reportDate }
		</td>
		<%-- 신고처리 --%>
		<td>
			<button type="button" class="manageReport" name="repResultNo" value="${i.count}" onclick="manageReport(this)">처리</button>
			<button type="button" class="cancelReport" name="repResultNo" value="${i.count}" onclick="cancelReport(this)">반려</button>
		</td>
	</tr>
	
	</c:forEach>
	</c:when>
	
	<c:otherwise>
		<th colspan="7"> 신고 내역이 없습니다.</th>
	</c:otherwise>
</c:choose>
</table>
</form>






</div>



	<div id="paging">
		[페이징 위치]
	</div>

</div><!-- end #rightBar -->

</body>
</html>
