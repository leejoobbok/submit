package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.LoginDTO;

public interface ILoginDAO
{
	public int count();
	
	//-- 유저 로그인
	public int userLogin(LoginDTO loginDTO);

	public String getUserPin(LoginDTO loginDTO);
	
	
	//-- 관리자 로그인
	public int adminLogin(LoginDTO loginDTO);	
	
	public String getAdminPin(LoginDTO loginDTO);
	
	public String getAdminNo(LoginDTO loginDTO);

	
	//-- 로그인 기록
	public void loginRec(String pinNo);
	
	public ArrayList<LoginDTO> findLoginRec();

	//-- 로그아웃 기록
	public void logoutRec(String pinNo);
	
	public ArrayList<LoginDTO> findLogoutRec();
}
