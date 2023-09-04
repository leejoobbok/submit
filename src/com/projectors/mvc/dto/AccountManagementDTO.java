package com.projectors.mvc.dto;

public class AccountManagementDTO
{
	// 주요 속성 구성 
	private String pinNo, pw, newPw; 
	private int checkPw;
	// 회원 탈퇴에만 쓰일 메소드
	private int wdTypeNo;
	// getter/ setter 구성
	public String getPinNo()
	{
		return pinNo;
	}
	public int getWdTypeNo()
	{
		return wdTypeNo;
	}
	public void setWdTypeNo(int wdTypeNo)
	{
		this.wdTypeNo = wdTypeNo;
	}
	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	public String getNewPw()
	{
		return newPw;
	}
	public void setNewPw(String newPw)
	{
		this.newPw = newPw;
	}
	public int getCheckPw()
	{
		return checkPw;
	}
	public void setCheckPw(int checkPw)
	{
		this.checkPw = checkPw;
	}
	
	
}
