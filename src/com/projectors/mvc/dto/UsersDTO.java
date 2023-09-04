package com.projectors.mvc.dto;

public class UsersDTO
{
	// 유저 속성 구성  유저번호 
	private String userNo, pinNo, userId, userPw, nickname, photourl;
	
	// 추가 속성
	private String userPwCk;
	private int count;
	
	private String joinDate;
	
	//getter / setter
	public String getUserNo()
	{
		return userNo;
	}
	public void setUserNo(String userNo)
	{
		this.userNo = userNo;
	}
	public String getPinNo()
	{
		return pinNo;
	}
	public void setPinNo(String pinNo)
	{
		this.pinNo = pinNo;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getUserPw()
	{
		return userPw;
	}
	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getPhotourl()
	{
		return photourl;
	}
	public void setPhotourl(String photourl)
	{
		this.photourl = photourl;
	}
	public String getUserPwCk()
	{
		return userPwCk;
	}
	public void setUserPwCk(String userPwCk)
	{
		this.userPwCk = userPwCk;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public String getJoinDate()
	{
		return joinDate;
	}
	public void setJoinDate(String joinDate)
	{
		this.joinDate = joinDate;
	}

	
}
