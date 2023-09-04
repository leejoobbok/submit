package com.projectors.mvc.dto;

public class AdminDTO
{
	// 관리자 속성 구성

	private String adminNo, adminId, adminPw, pinNo, regDate;
	//-- 관리자번호, 관리자아이디, 관리자패스워드, 식별번호, 등록일
	private int newReportCnt, newQCnt, todayMemberCnt;
	//-- 새 신고건수, 새 문의건수, 금일 접속자 조회
	
	// getter / setter
	public String getAdminNo()
	{
		return adminNo;
	}

	public void setAdminNo(String adminNo)
	{
		this.adminNo = adminNo;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getAdminPw()
	{
		return adminPw;
	}

	public void setAdminPw(String adminPw)
	{
		this.adminPw = adminPw;
	}

	public String getPinNo()
	{
		return pinNo;
	}

	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}

	public String getRegDate()
	{
		return regDate;
	}

	public void setRegDate(String regDate)
	{
		this.regDate = regDate;
	}

	public int getNewReportCnt()
	{
		return newReportCnt;
	}

	public void setNewReportCnt(int newReportCnt)
	{
		this.newReportCnt = newReportCnt;
	}

	public int getNewQCnt()
	{
		return newQCnt;
	}

	public void setNewQCnt(int newQCnt)
	{
		this.newQCnt = newQCnt;
	}

	public int getTodayMemberCnt()
	{
		return todayMemberCnt;
	}

	public void setTodayMemberCnt(int todayMemberCnt)
	{
		this.todayMemberCnt = todayMemberCnt;
	}


}
