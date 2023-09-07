package com.projectors.mvc.dao;

public interface IExceptionDAO
{
	// 프로필이 존재하는지
	public int limitByProfile(String pinNo);
	
	// 현재 모집, 지원, 진행 중인 공고, 지원서, 프로젝트가 있는지
	public int limitByRecruit(String pinNo);
	public int limitByApply(String pinNo);
	public int limitByProject(String pinNo);
	
	// 과거 프로젝트 중 개인 이탈, 팀 닫기 로 인한 제재기간 중에 있는지
	public int reguMemOut(String pinNo);
	public int reguTeamOut(String pinNo);
	
	// 개인 이탈 로 제재 다 받은 후 팀 닫기로 중복 처벌 받는 경우 방지 하고자 만든 메소드
	public int twiceReguException(String pinNo);
	
}
