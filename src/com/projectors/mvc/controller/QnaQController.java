/*==================================
 	QnaQController.java
 -  1:1 문의 관련 컨트롤러 (유저용)  
===================================*/
package com.projectors.mvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IqnaADAO;
import com.projectors.mvc.dao.IqnaQDAO;
import com.projectors.mvc.dto.QnaADTO;
import com.projectors.mvc.dto.QnaQDTO;

@Controller
public class QnaQController
{
	@Autowired   
	private SqlSession sqlSession;    // 질문 관련 SQL 세션
	
	@Autowired
	private SqlSession answerSqlSession; // 답변 출력용 SQL 세션 
	 
	 
	 
	// (유저) 문의글 작성창 이동
	@RequestMapping(value="/questioninsertform.action", method = RequestMethod.GET )
	public String questioninsertform()
	{
		return "/WEB-INF/view/QnAQInsert.jsp"; 
	}
	 
	// (유저) 문의글 insert
	@RequestMapping(value="/questioninsert.action", method = RequestMethod.GET )
	public String questioninsert(QnaQDTO dto, HttpServletRequest request)
	{
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);

		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");
		
		dto.setPinNo(pinNo);
		
		dao.insert(dto);
		
		return "redirect:question-list.action"; 
	}
	
	// (유저)나의 질문 리스트 출력 (QnALists.jsp) 
	@RequestMapping(value="/question-list.action", method = RequestMethod.GET)
	public String qList(Model model, HttpServletRequest request)
	{	
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);	
		
		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");
	
		model.addAttribute("questionList", dao.getQuestionList(pinNo));
		
		return "/WEB-INF/view/QnALists.jsp"; 
	}
	
	
	// (유저) 특정 질문 아티클 출력 (답변 포함) (QnAArticle.jsp)
	@RequestMapping(value = "/question-article.action", method = RequestMethod.GET)
	public String combinedData(String questionNo, Model model) {
	    IqnaQDAO qDAO = sqlSession.getMapper(IqnaQDAO.class);
		IqnaADAO aDAO = answerSqlSession.getMapper(IqnaADAO.class); //-- 세션 다름! 

	    QnaQDTO questionArticle = qDAO.viewQuestionDetail(questionNo);
		QnaADTO answerArticle = aDAO.answerView(questionNo);

	    model.addAttribute("questionArticle", questionArticle);
		model.addAttribute("answerArticle", answerArticle); 

	    return "/WEB-INF/view/QnAArticle.jsp";
	}
	//=========================================================================
	
	
	// [관리자 ]모든 유저의 문의글 리스트로 가져오기 (AnswerManagement.jsp )
	@RequestMapping(value = "/q-list-4admin.action", method = RequestMethod.GET)
	public String getAllQList(Model model)
	{
		String result = "";
		
		IqnaQDAO dao = sqlSession.getMapper(IqnaQDAO.class);
		
		model.addAttribute("qListForAdmin", dao.getAllQList());
		//result = "/WEB-INF/view/AnswerManagement.jsp";
		result = "/WEB-INF/view/AnswerManagement.jsp";
		return result;
	}
	
	// [관리자 ] 특정 질문 아티클 출력 (등록된 답변 포함) (AnswerManagementArticle.jsp)
		@RequestMapping(value = "/q-article-4admin.action", method = RequestMethod.GET)
		public String adminQuestionDetail(String questionNo, Model model) 
		{	
			String result = "";
			
		    IqnaQDAO qDAO = sqlSession.getMapper(IqnaQDAO.class);
			IqnaADAO aDAO = answerSqlSession.getMapper(IqnaADAO.class);  //-- 세션 다름! 

		    QnaQDTO qArticleForAdmin = qDAO.adminQuestionDetail(questionNo);//-- 질문 조회
			QnaADTO aArticleForAdmin = aDAO.answerView(questionNo); 		//-- 답변 조회

		    model.addAttribute("qArticleForAdmin", qArticleForAdmin);
			model.addAttribute("aArticleForAdmin", aArticleForAdmin);
			
			result = "/WEB-INF/view/AnswerManagementArticle.jsp";
			
			System.out.println();
		    return result; 
		}
	
}

/* dto 속성
 questionNo, questionPinNo , questionTitle, questionContent, qCreatedDate, isReply
 */
