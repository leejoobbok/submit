<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집공고 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/recruitLists.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


	var regionChoiceName = "";
	var subRegionChoiceName = "";
	var posChoiceNo = "";
	var doTypeChoiceName = "";

	
	// 지역 선택 → 태그 추가
	function changeRegionSelect()
	{
		var regionSelect = document.getElementById("region").value;
		
		var inlineTag = document.querySelector(".inlineTagReg");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }

		if (regionSelect !== "default" && regionSelect !== "")
		{
			var regionSelectValue = document.getElementById("region").querySelector('option[value="' + regionSelect + '"]').textContent;
	        newSpan.innerHTML = regionSelectValue + "<button type='submit' class='SearchDelBtn' onclick='regionSelectDelete()'>x</button>";
	        inlineTag.appendChild(newSpan);
	        
	        regionChoiceName = regionSelectValue;
		}
		
	}
	
	// 삭제 버튼 → 태그 삭제
	function regionSelectDelete()
	{
		var inlineTag = document.querySelector(".inlineTagReg");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }
        
        regionChoiceName = "";
        subRegionChoiceName = "";
	}
	
	// 세부지역 선택 → 태그 추가
	function changeSubregionSelect()
	{
		var subRegionSelect = document.getElementById("subRegion").value;
		
		var inlineTag = document.querySelector(".inlineTagReg");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild.nextSibling)
        {
            inlineTag.removeChild(inlineTag.firstChild.nextSibling);
        }
        
		if (subRegionSelect !== "default" && subRegionSelect !== "")
		{
			var subRegionSelectValue = document.getElementById("subRegion").querySelector('option[value="' + subRegionSelect + '"]').textContent;
	        newSpan.innerHTML = subRegionSelectValue + "<button type='submit' class='SearchDelBtn' onclick='subRegionSelectDelete()'>x</button>";
	        inlineTag.appendChild(newSpan);
	        
	        subRegionChoiceName = subRegionSelect;
		}
	}
	
	// 삭제 버튼 → 태그 삭제
	function subRegionSelectDelete()
	{
		var inlineTag = document.querySelector(".inlineTagReg");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild.nextSibling)
        {
            inlineTag.removeChild(inlineTag.firstChild.nextSibling);
        }
        
        subRegionChoiceName = "";
	}

	// 포지션 선택 → 태그 추가
	function changePosSelect()
	{
		var posSelect = document.getElementById("position").value;
		
		var inlineTag = document.querySelector(".inlineTagPos");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }

		if (posSelect !== "default" && posSelect !== "")
		{
			var posSelectValue = document.getElementById("position").querySelector('option[value="' + posSelect + '"]').textContent;
	        newSpan.innerHTML = posSelectValue + "<button type='submit' class='SearchDelBtn' onclick='posSelectDelete()'>x</button>";
	        inlineTag.appendChild(newSpan);
	        
	        posChoiceNo = posSelect;
		}
	}

	// 삭제 버튼 → 태그 삭제
	function posSelectDelete()
	{
		var inlineTag = document.querySelector(".inlineTagPos");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }
        
        posChoiceNo = "";
	}

	// 진행방식 선택 → 태그 추가
	function changeDoTypeSelect()
	{
		var doTypeSelect = document.getElementById("doType").value;
		
		var inlineTag = document.querySelector(".inlineTagDo");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }

		if (doTypeSelect !== "default" && doTypeSelect !== "")
		{
			var doTypeSelectValue = document.getElementById("doType").querySelector('option[value="' + doTypeSelect + '"]').textContent;
	        newSpan.innerHTML = doTypeSelectValue + "<button type='submit' class='SearchDelBtn' onclick='doSelectDelete()'>x</button>";
	        inlineTag.appendChild(newSpan);
	        
	        doTypeChoiceName = doTypeSelectValue;
		}
	}

	// 삭제 버튼 → 태그 삭제
	function doSelectDelete()
	{
		var inlineTag = document.querySelector(".inlineTagDo");
        var newSpan = document.createElement("span");
        newSpan.className = "searchTag";

        while (inlineTag.firstChild)
        {
            inlineTag.removeChild(inlineTag.firstChild);
        }
        
        doTypeChoiceName = "";
	}
	
	// ajax 를 통해 지역을 선택하면 해당지역의 상세지역 옵션 가져오기
	$(function() {
		$("#region").change(function()
		{
			var regionNo = $.trim($(this).val());
			
			$.ajax(
			{
				type:"POST"
				, url:"getsubregion.action"
				, data:{ regionNo: regionNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					// alert(result);
					$('#subRegion').html(result);
				}
				, complete:changeRegionSelect
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
		
		$("#writeBtn").click(function()
		{	
			var pinNo = document.getElementById("pinNo").value;
			
			$.ajax(
			{
				type:"POST"
				, url:"checkadmin.action"
				, data:{ pinNo: pinNo }
				, contentType:  "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(result)
				{
					if (result == 0)
					{
						
						writeRecruit();	
					}
					else
					{
						alert("관리자 계정으로 해당 기능에 접근할 수 없습니다.");
						return;
					}
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
				
			});
		});
				
		
	});
	
	
	function searchRecruit()
	{
		// alert(regionChoiceName + " / " + subRegionChoiceName + " / " + posChoiceNo + " / " + doTypeChoiceName);
		
		if (regionChoiceName=="" && subRegionChoiceName=="" && posChoiceNo=="" && doTypeChoiceName=="")
		{
			// alert("확인");
			$('.alertbox').fadeIn(1000);
			$('.alertbox').fadeOut(3000);
		}
		
		alertBox.style.display = 'none';
		// alert(regionChoiceName + " / " + subRegionChoiceName + " / " + posChoiceNo + " / " + doTypeChoiceName);
		
		var url = "searchrecruitlist.action?";
		url += "regionName=" + regionChoiceName;
		url += "&subRegionName=" + subRegionChoiceName;
		url += "&posNo=" + posChoiceNo;
		url += "&doTypeName=" + doTypeChoiceName;
	    
		// 안됨
	    // window.location.href = url;
	}
	
	// 프로필 미작성자 / 이미 지원 / 모집 / 팀프로젝트가 있는 사람 예외처리
	function writeRecruit() {
		var member = '${pinNo}';
		if (!(member == null && member == "")) {
			if ($("#regCheck").val() > 0)
			{
				alert("제재중인 회원은 게시글 작성이 불가합니다.");
				// alert($("#regCheck").val());
			}
			else
			window.location.href = 'writerecruit.action';
		}
		else
			alert("회원만 모집공고 작성이 가능합니다.");
	}

	function cannotWriteRecruit() {
		alert("회원만 모집공고 작성이 가능합니다.");
	}
	

	
	
</script>


</head>

<body>


<div class="wrapper">

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
			<a href="projectorsmain.action"><img style="width: 530px;" src="<%=cp %>/images/NEXTART_LOGO.png"/></a>
		</div>	
		
	</div>
	
	<div class="header-menu">
		<c:import url="menuBar.jsp"></c:import>
	</div>
	
	<div class="main">
		<br>
			<div class="outerFilter">
			<div class="filter">
				<h3 class="inlineTitle">조건 검색</h3>
				<div class="inlineTagReg"></div>
				<div class="inlineTagPos"></div>
				<div class="inlineTagDo"></div>
			</div> <!-- end.filter -->
			</div> <!-- end.outerFilter -->
			
			<div class="search">
			
				<ul>
					<li>
						<span>지역</span>
						<select class="select" id="region" name="region">
							<option>전체</option>
						<c:forEach var="region" items="${regions }">
							<option value="${region.regionNo }">${region.regionName }</option>
						</c:forEach>
						</select>
					</li>
					<li>
						<span>상세 지역</span>
						<select class="select" id="subRegion" name="subRegion" onchange="changeSubregionSelect()">
							<option>-</option>
						</select>
					</li>
					<li>
						<span>포지션</span>
						<select class="select" id="position" name="position" onchange="changePosSelect()">
							<option>전체</option>
						<c:forEach var="pos" items="${poss }">
							<option value="${pos.posNo }">${pos.posName }</option>
						</c:forEach>
						</select>
					</li>
					<li>
						<span>진행방식</span>
						<select class="select" id="doType" name="doType" onchange="changeDoTypeSelect()">
							<option>전체</option>
						<c:forEach var="dotype" items="${dotypes }">
							<option value="${dotype.doTypeNo }">${dotype.doTypeName }</option>
						</c:forEach>
						</select>
					</li>
					<li>
						<button type="button" class="searchBtn" id="searchBtn" onclick="searchRecruit()">검색</button>
					</li>
				</ul>
				
				<div class="alertbox">검색 내용이 없습니다.</div>
				
				<hr style="width: 1000px;">
			</div> <!-- end.search -->
			
			
			
			<div class="recruitLists">
			
			<div class="writeBtnArea">
			
			<c:choose>
			<c:when test="${not empty pinNo}">
				<button type="button" id="writeBtn" class="writeBtn">공고 작성하기</button>
				<input type="hidden" id="regCheck" name="regCheck" value="${regDateCheck }">
			</c:when>
			<c:otherwise>
				<button type="button" class="guestBtn" onclick="cannotWriteRecruit()">공고 작성하기</button>
			</c:otherwise>
			</c:choose>
			
			</div>
			<h2 class="smallTitle">모집공고 둘러보기</h2>
			
				<c:forEach var="recruit" items="${lists }" varStatus="status">
					<div class="recruitList">
					<ul>
					
						<li>
							<span>모집 마감일  ${recruit.deadlineDate } (D-${recruit.dDay })</span>
							<span style="margin-left:60px;">프로젝트 기간 ${recruit.prjStart } ~ ${recruit.prjEnd } </span>
							<span style="margin-left:60px;">
								모집 인원 
								<c:forEach var="member" items="${members[status.index] }">
									${member.countPos } / ${member.countAll }
								</c:forEach> 
							</span>
						</li>
						<li>
							<span class="recruitTitle"><a href="recruitarticle.action?recruitNo=${recruit.recruitNo }">${recruit.title } </a></span>
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
						</li>
						<li>
							<p class="dotdot"><span>${recruit.content }</span></p>
						</li>
						<li>
							<c:forEach var="tool" items="${tools[status.index] }">
								<span class="toolTag">${tool }</span>
							</c:forEach>
							<span class="doTypeTag">${recruit.doTypeName }</span>
							<span class="regionTag">${recruit.regionName }</span>
							<span class="regionTag">${recruit.subRegionName }</span>
						</li>
						
					</ul>
					</div> <!-- end.recruitList -->
				</c:forEach>
				
				<input type="hidden" id="pinNo" name="pinNo" value="${pinNo }"/>
				
			</div> <!-- end.recruitLists -->
		</div> <!-- end.container -->
	</div> <!-- end.main -->
	
	
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>


</body>
</html>
