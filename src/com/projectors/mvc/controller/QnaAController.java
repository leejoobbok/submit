
/*======================================= 
	 QnaAController.java 
 - 관리자용 1:1 문의 답변 관련 컨트롤러
 ========================================*/

package com.projectors.mvc.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IqnaADAO;
import com.projectors.mvc.dto.QnaADTO;

@Controller
public class QnaAController
{	
	/*
	 * @Autowired private SqlSession sqlSession;
	 */
	
	//-- 모든 변경사항 자동 커밋을 위해 (위 세션 객체를 아래처럼 변경)
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	// [ 관리자 ] 답변 등록 (인서트 수행) (QnAQInsert.jsp) 
	@RequestMapping(value="/insert-answer.action", method = RequestMethod.GET )
	public String qnaAInsert(QnaADTO dto)
	{
		String result = "";
		
		try (SqlSession sqlSession = sessionFactory.openSession(true)) //-- 세션을 try 구문에서 정의 
		{
			IqnaADAO dao = sqlSession.getMapper(IqnaADAO.class);
			dao.addAnswer(dto);
			
			result = "redirect:q-article-4admin.action?questionNo=" + dto.getQuestionNo();   //-- 페이지 리로드 
		} catch (Exception e) {
			// 예외 처리 로직 추가
			e.printStackTrace();
		}
		
		return result;
	}
	
	// [ 관리자 ] 답변 수정 (update)  modifyAnswer
	@RequestMapping(value="/update-answer.action", method = RequestMethod.GET )
	public String updateAnswer(QnaADTO dto)
	{	
		String result = "";
		
		try (SqlSession sqlSession = sessionFactory.openSession(true)) //-- 세션을 try 구문에서 정의 
		{
			IqnaADAO dao = sqlSession.getMapper(IqnaADAO.class);
			dao.updateAnswer(dto);
			
			result = "redirect:q-article-4admin.action?questionNo=" + dto.getQuestionNo();   //-- 페이지 리로드 
		} catch (Exception e) {
			// 예외 처리 로직 추가
			e.printStackTrace();
		}
		return result;
	}
	
	// [관리자 ] 답변 삭제 (delete)  deleteAnswer
	@RequestMapping(value="/answer-delete.action", method = RequestMethod.GET )
	public String deleteAnswer(String questionNo, QnaADTO dto)
	{	
		String result = "";
		
		try (SqlSession sqlSession = sessionFactory.openSession(true)) //-- 세션을 try 구문에서 정의 
		{
			IqnaADAO dao = sqlSession.getMapper(IqnaADAO.class);
			
			questionNo = dto.getQuestionNo(); //-- 삭제 전 질문 번호 저장 
			
			dao.deleteAnswer(questionNo); //-- 제거 
			
			result = "redirect:q-article-4admin.action?questionNo=" + questionNo;   //-- 질문 번호로 페이지 리로드 
		} 
		catch (Exception e) {
			// 예외 처리 로직 추가
			e.printStackTrace();
		}
		return result;
	}
	
	
}
//-- 아현 메모)
// dto, dao.xml, idao는 질문과 답변 분리했으나, 컨트롤러는 질문-답변 같이 출력할 때 충돌 피하기 위해 통합. (08.08 )

//--> 유저쪽에 답변 확인할 때 같은 주소값으로 요청하느라 충돌나서 이 파일 자체를 주석처리했었음
//--> 관리자의 답변 등록,수정,삭제 컨트롤러로 활용 (08.09)