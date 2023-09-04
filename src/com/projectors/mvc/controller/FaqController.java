/*===========================
 	FaqController.java
    - FAQ 컨트롤러 
============================*/

package com.projectors.mvc.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IfaqDAO;

@Controller
public class FaqController
{
	@Autowired   
	private SqlSession sqlSession;
	
	// FAQ 리스트 출력 (FAQLists.jsp) 
	@RequestMapping(value="/faq-list.action", method = RequestMethod.GET)
	public String FaqList(Model model)
	{	
		String result = "";
		IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);	
	
		model.addAttribute("faqList", dao.getFaqList());
		
		/* result = "/WEB-INF/view/FAQLists.jsp"; */
		result = "/WEB-INF/view/FAQLists.jsp";
		return result; 
	}
	
	// FAQ 아티클 출력 (FAQArticle.jsp) 
	@RequestMapping(value="/faq-article.action", method = RequestMethod.GET)
	public String FaqArticle(String faqNo, Model model)
	{	
		String result = "";
		IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);	
		model.addAttribute("faqArticle", dao.viewFaqDetail(faqNo));
		
		result = "/WEB-INF/view/FAQArticle.jsp";
		return result; 
	}

}
