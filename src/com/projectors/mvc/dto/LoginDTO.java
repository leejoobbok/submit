package com.projectors.mvc.dto;

public class LoginDTO
{
	private String adminNo, id, pw, pinNo;
   	//-- 관리자번호, 관리자아이디, 관리자패스워드, 식별번호(공용)
	//-- 유저 아이디, 유저 패스워드
	//-- id와 pw는 공용 변수
	
   	private int count;
   	//-- 로그인 시 데이터 조회 되었는지 확인하는 COUNT (0 또는 1)
   	
   	private String managerCheck;
   	
   	private String logInRecNo, logOutRecNo;
   	
   	private String logInDate, logOutDate;

	public String getAdminNo()
	{
		return adminNo;
	}

	public void setAdminNo(String adminNo)
	{
		this.adminNo = adminNo;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getPinNo()
	{
		return pinNo;
	}

	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public String getManagerCheck()
	{
		return managerCheck;
	}

	public void setManagerCheck(String managerCheck)
	{
		this.managerCheck = managerCheck;
	}

	public String getLogInDate()
	{
		return logInDate;
	}

	public String getLogInRecNo()
	{
		return logInRecNo;
	}

	public void setLogInRecNo(String logInRecNo)
	{
		this.logInRecNo = logInRecNo;
	}

	public void setLogInDate(String logInDate)
	{
		this.logInDate = logInDate;
	}

	public String getLogOutRecNo()
	{
		return logOutRecNo;
	}

	public void setLogOutRecNo(String logOutRecNo)
	{
		this.logOutRecNo = logOutRecNo;
	}

	public String getLogOutDate()
	{
		return logOutDate;
	}

	public void setLogOutDate(String logOutDate)
	{
		this.logOutDate = logOutDate;
	}

   	


	   
	   
}
