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
<title>메뉴명 :projectors</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/flexBoxOne.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/recruitInsertForm.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$().ready(function()
	{
		// 제목 글자수 제한
		$('#title').keyup(function()
		{
			var content = $(this).val();
			// alert(content);
			
			var length = content.length;
			// alert(length);
			
			$('#titleRemainLength').html("(" + length+ "/38)");
			
			if (length>=38)
			{
				$(this).val(content.substring(0, 38));
                $('#titleRemainLength').html("(38/38)");
                $('#titleRemainLength').html("<span class='titleRemainLength' style='color: red;'>(38/38)</span>");
    			$('#titleAlart').fadeIn(700);
			}
			
			if (length<=37)
			{
                $('#titleRemainLength').html("<span class='titleRemainLength'>(" + length+ "/38)</span>");
    			$('#titleAlart').fadeOut(1000);
			}
			
		});
		
		
		// 내용 글자수 제한
		$('#content').keyup(function()
		{
			var content = $(this).val();
			// alert(content);
			
			var length = content.length;
			// alert(length);
			
			$('#contentRemainLength').html("(" + length+ "/500)");
			
			if (length>=500)
			{
				$(this).val(content.substring(0, 500));
                $('#contentRemainLength').html("(500/500)");
                $('#contentRemainLength').html("<span class='contentRemainLength' style='color: red;'>(500/500)</span>");
    			$('#contentAlart').fadeIn(700);
			}
			
			if (length<=499)
			{
                $('#contentRemainLength').html("<span class='contentRemainLength'>(" + length+ "/500)</span>");
    			$('#contentAlart').fadeOut(1000);
			}
		});
		
		
		// 사용언어 & 환경 최대 8개 갯수제한
		var maxCheckedTool = 8;

	    $('.tool').on('change', function() {
	    	var checkedCount = $('.tool:checked').length;
	    	// alert(checkedCount);

	        if (checkedCount > maxCheckedTool) {
	            $(this).prop('checked', false); // 체크를 해제
	            $('#toolAlart').fadeIn(700).fadeOut(3000);
	        }
	    });

		
		// 팀장 체크박스 1개
	    $('.pos').on('change', function() {
	    	var checkedCount = $('.pos:checked').length;
			
	    	// 선택한 포지션의 설정 인원 가져오기
	    	var ckeckedLi = $(this).closest('li');
	    	var posCountId = ckeckedLi.find('.posCount').attr('id');
	    	var posCountValue = $('#' + posCountId).val();
	    	// alert(posCountValue);
	    	
	    	// 2개 체크 일때 해제
	        if (checkedCount > 1) {
	            $(this).prop('checked', false);
	            $('#posAlart').fadeIn(700).fadeOut(3000);
	            return;
	        }
	    	//인원 수 선택 0 일때 체크해제
	    	if (posCountValue == '0')
			{
	            $(this).prop('checked', false);
	            $('#posCountAlart').fadeIn(700).fadeOut(3000);
	            return;
			}
	    	// 2개 체크 일때 해제
	        if (checkedCount > 1) {
	            $(this).prop('checked', false);
	            $('#posAlart').fadeIn(700).fadeOut(3000);
	            return;
	        }
	    });
		
		
		$('.posCount').on('change', function()
		{
	    	var ckeckedLi = $(this).closest('li');
	    	var posId = ckeckedLi.find('.pos').attr('id');
			var isChecked = $('#' + posId).is(':checked');
			// alert(isChecked);
			
			
			// 팀장 체크된거는 1 이하로 못줄임
			if (isChecked == true)
			{
				// alert($(this).val());
				
				if ($(this).val() < 1)
				{
					$(this).val(1);
		            $('#posCapAlart').fadeIn(700).fadeOut(3000);
				}
			}
			
			// 입력값이 숫자가 아니면 1 변환
			var inputValue = parseFloat($(this).val());
	    	
			$(this).blur(function()
			{
	    		if (isNaN(inputValue))
	  		    {
	  		    	$(this).val(1);
	  	            $('#posNumAlart').fadeIn(700).fadeOut(3000);
	  		    }
			});
			
			// 입력값이 0 이하면 0
			if ($(this).val() < 0)
				$(this).val(0);

			var total = 0;
	    		
	    	$('.posCount').each(function(event) {
	    		total += parseFloat($(this).val());
			});
			
	    	// 11일때
    		if (total == 11)
			{
    			$(this).val($(this).val()-1);
			}

	    	// 12부터는 0초기화
    		if (total > 11)
			{
    			$(this).val(0);
			}
		});
		
		// 프로젝트 시작일 (모집마감일로부터 14일이내 시작) / 종료일 (180일 이내) 예외처리 ★★★
		
		
		// 최종 submit
		$('.insertBtn').on('click', function()
		{	
			var titleLength = $("#title").val().trim().length;
			var contentLength = $("#content").val().trim().length;
			var toolChecked = $(".tool:checked").length;
			var posChecked = $(".pos:checked").length;
			var total = 0;
    		
	    	$('.posCount').each(function(event) {
	    		total += parseFloat($(this).val());
			});
	    	
	    	
	    	// 조건 충족시 submit
	    	if (titleLength >= 5)
			{
				if (contentLength >= 20)
				{
					if (toolChecked >= 2)
					{
						if (total >= 2)
						{
							if (posChecked > 0)
							{
								if (!($("#prjStart").val() == "" || $("#prjEnd").val() == ""))
								{
									if ($("#submitCheck:checked").length > 0)
									{
										// alert("전송");
										$('#myForm').submit();
									}
									else {
										$('#correctAlart').fadeIn(300); }
								}
								else {
									showSubmitAlert("프로젝트 시작일과 종료일을 입력해주세요."); }
							}
							else {
								showSubmitAlert("본인의 포지션을 선택해주세요."); }
						}
						else {
							showSubmitAlert("팀원은 최소 2명 이상이어야 합니다."); }
					}
					else {
						showSubmitAlert("사용언어 & 환경은 최소 2개 이상 선택해야 합니다."); }
				}
				else {
					showSubmitAlert("프로젝트 설명은 최소 20자 이상 입력해야 합니다."); }
			}
	    	else {
	    		showSubmitAlert("프로젝트명은 최소 5자 이상 입력해야 합니다."); }
	    	
		});
		
		
	});
	// 최종 확인 체크박스
	
	// 프로젝트 시작일 (모집마감일로부터 14일이내 시작) / 종료일 (180일 이내) 예외처리
	
	// 최종 submit 미입력 항목 안내 (*자이상 입력해주세요 / *개 이상 선택해주세요 /사용언어 & 환경 최소 1개 )
	
	function showSubmitAlert(message)
	{
		$('#submitAlart').text(message).fadeIn(300).fadeOut(3000);
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
	<div class="outerWriteContainer">
		<h3 class="pageTitle">모집공고 작성하기 <span class="right">모집 마감일 2023.08.24</span></h3>
		<hr class="line1">
		<br>
		
		
		<div class="writeContainer">
		<form action="postrecruit.action" method="post" id="myForm">
			
		<div class="smallContainer">
			<span class="smallTitle">프로젝트명</span><br>
			<input type="text" id="title" name="title" class="title">
			<span id="titleRemainLength" class="titleRemainLength">(0/38)</span><br>
			<span id="titleAlart" class="lengthAlart"> * 제목은 38자를 초과하여 입력할 수 없습니다.</span>
		</div>
		
		
		<div class="smallContainer">
			<span class="smallTitle">프로젝트 설명</span><br>
			<textarea rows="5" cols="100" id="content" name="content" class="content"
			></textarea>
			<span id="contentRemainLength" class="contentRemainLength">(0/500)</span><br>
			<span id="contentAlart" class="lengthAlart"> * 내용은 500자를 초과하여 입력할 수 없습니다.</span>
		</div>
			
			
		<div class="smallContainer">
			<span class="smallTitle">프로젝트 시작일</span>
			<input type="text" id="prjStart" name="prjStart" class="prjStart" placeholder="YYYY-MM-DD">
			<span class="smallTitle">프로젝트 종료일</span>
			<input type="text" id="prjEnd" name="prjEnd" class="prjEnd" placeholder="YYYY-MM-DD">
		</div><br>
			
			
		<div class="smallContainer">
			<span class="smallTitle">사용언어 &amp; 환경</span>
			<span class="right">2개부터 최대 8개 선택 가능</span><br><hr class="line2">
			
			<c:forEach var="tool" items="${tools }" varStatus="count">
				<input type="checkbox" id="tool${count.index }" name="tool" class="tool" value="${tool.toolNo }"
				><span class="toolName">${tool.toolName }</span>
				<c:if test="${count.index % 5 == 4}"><br></c:if>
			</c:forEach>
			<span id="toolAlart" class="lengthAlart"> * 8개 이상 선택할 수 없습니다.</span>
		</div>
			
			
		<div class="smallContainer">
			<span class="smallTitle">프로젝트 팀원 구성</span>
			<span class="right">최대인원 10명 (팀장 포함)</span><br><hr class="line2">
			
			<ul class="ulPos">
			
			<c:forEach var="pos" items="${poss }" varStatus="count">
				<li class="${count.index }">
					<input type="checkbox" id="pos${count.index }" name="pos" class="pos" value="${pos.posNo }"> <span class="posName">${pos.posName }</span>
					<input type="number" id="posCount${count.index }" name="posCount" class="posCount" value="0"> <span class="posName">명</span>
				</li>
			</c:forEach>

			</ul>
			<span class="alert">* 자신이 담당할 포지션을 체크(</span>
			<input type="checkbox" class="alertCheck" checked="checked">
			<span class="alert">)해주세요. 인원은 본인까지 포함한 인원으로 설정하셔야 합니다.</span><br>
			<span id="posAlart" class="lengthAlart"> * 본인이 담당할 포지션 하나만 선택해주세요.</span>
			<span id="posCountAlart" class="lengthAlart"> * 해당 포지션에 인원을 할당하신 후 본인의 포지션을 선택해주세요. 인원은 팀장 본인을 포함해야합니다.</span>
			<span id="posCapAlart" class="lengthAlart"> * 선택하신 포지션의 인원은 1보다 작을 수 없습니다.</span>
			<span id="posNumAlart" class="lengthAlart"> * 숫자를 입력해주세요</span>
			
		</div>
		
			
		<div class="smallContainer">
			<span class="smallTitle">진행방식</span>
			<select id="doTypeNo" name="doTypeNo" class="doType">
				<option value="1">대면</option>
				<option value="0">비대면</option>
			</select>
		</div>
			
			
		<div class="confirmContainer">
			<span>
			<input id="submitCheck" type="checkbox"> 작성하신 공고는 수정할 수 없습니다. 정확히 작성하셨나요?
			</span><br>
			<span id="correctAlart" class="lengthAlart">동의해주세요.<br></span>
			<button type="button" class="insertBtn">등록하기</button><br>
			<span id="submitAlart" class="lengthAlart"></span>
		</div>	
		
		
		</form>
		</div> <!-- end.writeContainer -->
	</div> <!-- end.outerWriteContainer -->
	</div> <!-- end.main -->
	
	
	
	<div class="footer">
		<!-- footer -->
		<c:import url="Footer.jsp"></c:import>
	</div>
</div>


</body>
</html>
