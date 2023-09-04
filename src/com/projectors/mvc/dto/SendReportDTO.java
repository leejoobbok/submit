package com.projectors.mvc.dto;

public class SendReportDTO // 신고 전송용 dto
{	
	//공통 (신고자 번호, 사유)
	private String pinNo, repReason;
	
	//다른거 (공고번호, 지원서번호, 댓글번호, 쪽지번호)
	private String recruitNo, applyNo, commNo, noteNo;

	//getter setter
	public String getPinNo()
	{
		return pinNo;
	}

	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}

	public String getRepReason()
	{
		return repReason;
	}

	public void setRepReason(String repReason)
	{
		this.repReason = repReason;
	}

	public String getRecruitNo()
	{
		return recruitNo;
	}

	public void setRecruitNo(String recruitNo)
	{
		this.recruitNo = recruitNo;
	}

	public String getApplyNo()
	{
		return applyNo;
	}

	public void setApplyNo(String applyNo)
	{
		this.applyNo = applyNo;
	}

	public String getCommNo()
	{
		return commNo;
	}

	public void setCommNo(String commNo)
	{
		this.commNo = commNo;
	}

	public String getNoteNo()
	{
		return noteNo;
	}

	public void setNoteNo(String noteNo)
	{
		this.noteNo = noteNo;
	}
	
	

	

}
