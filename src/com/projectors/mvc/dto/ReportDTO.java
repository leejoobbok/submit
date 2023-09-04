package com.projectors.mvc.dto;


public class ReportDTO
{
	// 신고 미처리 주요 속성 구성
	private String reportedUserPinNo, reportUserPinNo, repNo, postNo, reportDate, repReason;
	//-- 신고받은유저pinNo, 신고한유저pinNo, 신고번호, 게시글번호, 신고일자, 신고사유
	//   ※ 댓글신고번호의 경우 DB 저장시 정수형으로 변환 필요
	private String reportedNickName, reportNickName;
	//-- 추가 : 신고받은 유저 닉네임, 신고한 유저 닉네임
	
	private String reguDate;
	//-- 신고처리일자
	
	// 신고 처리 후 주요 속성 구성
	private String resultNo, repResultNo, reguNo, reguPeriodNo, adminPinNo, adminNo, pinNo;
	//-- 신고처리결과번호, 결과처리번호(0:반려, 1: 처리), 제재 사유, 제재기간, 관리자pinNo , 관리자 번호
	
	// 신고 처리시 필요한 처벌유형내용, 처벌기간 리스트
	private String content, period;
	
	// 검색기능
	private String searchKey, searchVal;
	
	// getter / setter
	public String getReportedUserPinNo()
	{
		return reportedUserPinNo;
	}
	public void setReportedUserPinNo(String reportedUserPinNo)
	{
		this.reportedUserPinNo = reportedUserPinNo;
	}
	public String getReportUserPinNo()
	{
		return reportUserPinNo;
	}
	public void setReportUserPinNo(String reportUserPinNo)
	{
		this.reportUserPinNo = reportUserPinNo;
	}
	public String getRepNo()
	{
		return repNo;
	}
	public void setRepNo(String repNo)
	{
		this.repNo = repNo;
	}
	public String getPostNo()
	{
		return postNo;
	}
	public void setPostNo(String postNo)
	{
		this.postNo = postNo;
	}
	public String getReportDate()
	{
		return reportDate;
	}
	public void setReportDate(String reportDate)
	{
		this.reportDate = reportDate;
	}
	public String getRepReason()
	{
		return repReason;
	}
	public void setRepReason(String repReason)
	{
		this.repReason = repReason;
	}
	public String getReportedNickName()
	{
		return reportedNickName;
	}
	public void setReportedNickName(String reportedNickName)
	{
		this.reportedNickName = reportedNickName;
	}
	public String getReportNickName()
	{
		return reportNickName;
	}
	public void setReportNickName(String reportNickName)
	{
		this.reportNickName = reportNickName;
	}
	public String getReguDate()
	{
		return reguDate;
	}
	public void setReguDate(String reguDate)
	{
		this.reguDate = reguDate;
	}
	public String getResultNo()
	{
		return resultNo;
	}
	public void setResultNo(String resultNo)
	{
		this.resultNo = resultNo;
	}
	public String getRepResultNo()
	{
		return repResultNo;
	}
	public void setRepResultNo(String repResultNo)
	{
		this.repResultNo = repResultNo;
	}
	public String getReguNo()
	{
		return reguNo;
	}
	public void setReguNo(String reguNo)
	{
		this.reguNo = reguNo;
	}
	public String getReguPeriodNo()
	{
		return reguPeriodNo;
	}
	public void setReguPeriodNo(String reguPeriodNo)
	{
		this.reguPeriodNo = reguPeriodNo;
	}
	public String getAdminPinNo()
	{
		return adminPinNo;
	}
	public void setAdminPinNo(String adminPinNo)
	{
		this.adminPinNo = adminPinNo;
	}
	public String getAdminNo()
	{
		return adminNo;
	}
	public void setAdminNo(String adminNo)
	{
		this.adminNo = adminNo;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getPeriod()
	{
		return period;
	}
	public void setPeriod(String period)
	{
		this.period = period;
	}
	public String getSearchKey()
	{
		return searchKey;
	}
	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
	}
	public String getSearchVal()
	{
		return searchVal;
	}
	public void setSearchVal(String searchVal)
	{
		this.searchVal = searchVal;
	}
	public String getPinNo()
	{
		return pinNo;
	}
	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}

}
