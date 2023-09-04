package com.projectors.mvc.dao;

import com.projectors.mvc.dto.QnaADTO;

public interface IqnaADAO // 1:1 문의 답변 DAO 인터페이스
{	
	
	public QnaADTO AnswerManage(String questionNo);	// 특정 답변 출력 ( 내용, 등록일) //-- 유저
	
	//========[관리자 기능] 답변 등록,수정,삭제, 최근답변 번호 찾기 ==========
	
	// 유저의 전체 질문 리스트 조회 기능은 QDAO 쪽에 있음 
	// 특정 질문글 아티클 - 답변 등록란 같이 뜨는 관리자용 아티클 페이지도 QDAO쪽에.
	
	// 특정 질문글에 대한 답변 조회
	public QnaADTO answerView(String questionNo);
	
	// 등록
	public int addAnswer(QnaADTO dto);
	
	// 수정
	public int updateAnswer(QnaADTO dto);
	
	// 삭제
	public int deleteAnswer(String questionNo);
	
}

/* QnaADTO 의 속성들
 questionNo, answerNo, answerPinNo, answerContent, answerCreatedDate;
: 질문번호, 답변번호, (관리자)식별번호, 답변내용, 답변등록일 
*/