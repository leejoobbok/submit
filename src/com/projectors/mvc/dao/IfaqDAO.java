package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.FaqDTO;

public interface IfaqDAO
{
	public ArrayList<FaqDTO> getFaqList();   // FAQ 리스트 출력 (번호, 제목)
	
	public FaqDTO viewFaqDetail(String faqNo);	// 특정 FAQ 아티클 출력 (번호, 제목, 내용)  
	
	//===========[관리자 기능] faq 등록/수정/삭제 =============
	// 등록
	public int addFAQ(FaqDTO dto);
	
	// 수정
	public int updateFAQ(FaqDTO dto);
	
	// 삭제
	public int removeFAQ(String faqNo);
	
	// 가장 최근에 생성한 FAQ 넘버 가져오기 ( 새 글 등록 후 바로 해당 아티클 확인 가능하도록) 
	public String findFaqNo();
}
