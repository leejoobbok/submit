package com.projectors.mvc.dao;

import com.projectors.mvc.dto.AccountManagementDTO;

public interface IAccountManagementDAO
{
	// 현재 비밀번호를 올바르게 입력했는지 확일할 때 사용될 메소드
	public String checkPw(AccountManagementDTO dto);
	// 모든 검사를 다 통과한 후 수행될 비밀번호 변경 메소드
	public void changePw(AccountManagementDTO dto);
	
	// 탈퇴 전 withdraw 테이블에 insert
	public void insertWithdraw(AccountManagementDTO dto);
	// 회원 탈퇴를 수행할 메소드
	public void withdraw(AccountManagementDTO dto);
}
