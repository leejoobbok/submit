package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.MyApplyDTO;

public interface IMyApplyDAO
{
	// 현재 지원서가 있는지 조회
	public int checkPresentApply(String pinNo);
	
	// 현재 지원서 정보
	public MyApplyDTO getPresentApply(String pinNo);
	
	// 현재 지원서 중 합격 처리가 되지 않은 지원서 취소 가능한지 조회
	public int checkDeleteApply(String applyNo);
	
	// 지원서 취소가 가능하다면 취소 시켜주는 쿼리문
	public void deleteApply(String applyNo);
	
	// 현재 1차 합격 지원서가 있는지 조회
	public int checkFirstCk(String pinNo);
	
	// 1차 합격한 지원서 정보
	public MyApplyDTO getFirstCk(String pinNo);

	// 현재 최종 합류 대기중인 지원서가 있는지 조회
	public int checkFinal(String pinNo);
	
	// 최종 합류 대기중인 지원서 정보
	public MyApplyDTO getFinal(String pinNo);

	// 현재 프로젝트로 형성되었는지 확인하는 정보 
	public int checkProject(String recruitNo);
	
	// ※ 전체 모집 인원
	public int memberCount(String recruitNo);
	
	// ※ 1차 합격자 현재 총 인원
	public int firstCkCount(String recruitNo);
	
	// ※ 최종 합류 대기자 현재 총 인원
	public int finalCount(String recruitNo);
	
	// 최종 합류 버튼 클릭 시 수행될 메소드
	public void addFinal(String firstCkNo);

	// 프로젝트 add  최종 합류 인원과 모집 인원 수가 동일해 질 때
	public void addProject(String recruitNo);
	

	//==▼ 아래 과거 지원 이력 출력 관련 메소드▼
	
	// 과거 지원 이력이 존재하는지 조회
	public int checkPastApply(String pinNo);
	
	// 과거 지원 이력 리스트들 정보
	public ArrayList<MyApplyDTO> getPastApply(String pinNo);
	
	
}
