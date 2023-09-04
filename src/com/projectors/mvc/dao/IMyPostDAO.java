package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.MyPostDTO;

public interface IMyPostDAO
{
	
	// 현재 모집 중인 공고가 있는지 체크
	public int presentCheck(String pinNo);
	// 현재 모집 중인 공고 검색
	public MyPostDTO presentRecruit(String pinNo);
	
	
	// 공고 취소 가능한 상태인지 체크
	public int checkDelete(String recruitNo);
	// ① 1차 합격자(들) 데이터 삭제
	public void deleteFirstCk(String recruitNo);
	// ② 지원서(들) 데이터 삭제
	public void deleteApply(String recruitNo);
	// ③ 모집 포지션 삭제
	public void deleteRecruitPos(String recruitNo);
	// ④ 공고 툴 데이터 삭제
	public void deleteRecruitTool(String recruitNo);
	// ⑤ 공고 삭제
	public void deleteRecruit(String recruitNo);
	
	
	// 미열람자 수 체크
	public int checkPresentNone(String recruitNo);
	// 현재 공고 중 미열람자
	public ArrayList<MyPostDTO> presentNone(String recruitNo);
	
	
	// 불합격자 수 체크
	public int checkPresentX(String recruitNo);
	// 현재 공고 중 불합격자
	public ArrayList<MyPostDTO> presentX(String recruitNo);
	
	
	// 합격자 수 체크
	public int checkPresentO(String recruitNo);
	// 현재 공고 중 합격자
	public ArrayList<MyPostDTO> presentO(String recruitNo);
	
	
	
	// 모집 포지션 번호 입력 해서 마감된 포지션인지 확인하는 메소드
	// 반환 값이 != 0 이면 마감된 모집 포지션의 번호
	public int fullCheckRecPos(String recruitPosNo);
	
	//-- 특정 지원서 보기 클릭 시 열람 처리 할 메소드
	public void readApply(String applyNo);
	
	
	//-- 특정 지원서에 대해 수락 버튼 클릭 시 수행될 메소드들
	//1. first_ck 테이블이 insert
	public void firstCk(String applyNo);
	
	// 1차 합격자 수 구하기 메소드
	public int firstCount(String recruitNo);
	// 모집 예정 인원수     -- ★★★★★★  1차 합격자수 인원가 비교해서 같으면 최종 합류 열어줄거임
	public int recruitCount(String recruitNo);
	
	// 특정 
	
	// 각 포지션별 모집 인원 구하는 메소드
	public ArrayList<MyPostDTO> positionInfo(String recruitNo);
	// 각 포지션별 마감 인원 구하는 메소드
	public ArrayList<MyPostDTO> doneInfo(String recruitNo);

	// 모집 현황 포지션 명 2 /3 이런꼴로 보이기 위함 public ArrayList<MyPostDTO>
	public ArrayList<MyPostDTO> postionCount(String recruitNo);
	
	
	// 최종 합류 대기자 존재하는지 
	public int checkFinal(String recruitNo);
	// (최종 합류 자 / 전체 인원) ==> 프로젝트 생성되었는지 유무로도 사용할 수 있음 
	public MyPostDTO finalCount(String recruitNo);
	// 최종 합류 수락 후 프로젝트 생성 대기자들 출력
	public ArrayList<MyPostDTO> finalWait(String recruitNo);
	
	
	//▼▼▼▼▼▼ 과거 모집 공고들 출력하는 메소드
	// 과거 모집 공고가 존재하는지
	public int checkPastPost(String pinNo);
	// 과거 모집 공고 정보 출력
	public ArrayList<MyPostDTO> myPastPost(String pinNo);
	
	
	
}
