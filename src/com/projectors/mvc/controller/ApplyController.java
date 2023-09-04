package com.projectors.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IApplyDAO;
import com.projectors.mvc.dto.ApplyDTO;


@Controller
public class ApplyController
{
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/applyform.action", method = RequestMethod.GET)
	public String applyform(Model model, String recruitPosNo, HttpServletRequest request)
	{
		IApplyDAO dao = sqlsession.getMapper(IApplyDAO.class);

		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");

		model.addAttribute("memberInfo", dao.memberInfo(pinNo));
		model.addAttribute("recruitInfo", dao.recruitInfo(recruitPosNo));
		
		return "/WEB-INF/view/ApplyForm.jsp";
	}
	
	@RequestMapping(value = "/applyinsert.action", method = RequestMethod.POST)
	public String applyinsert(ApplyDTO dto ,String recruitPosNo, HttpServletRequest request)
	{
		IApplyDAO dao = sqlsession.getMapper(IApplyDAO.class);

		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");
		
		dto.setPinNo(pinNo);
		dto.setRecruitPosNo(recruitPosNo);
		
		System.out.println(dto.getPinNo());
		System.out.println(dto.getRecruitPosNo());
		System.out.println(dto.getContent());
		
		dao.applyInsert(dto);
		
		return "/WEB-INF/view/ApplyComplete.jsp";
	}
	

	@RequestMapping(value = "/applyarticle.action", method = RequestMethod.GET)
	public String applyarticle(Model model, String applyNo)
	{
		IApplyDAO dao = sqlsession.getMapper(IApplyDAO.class);

		model.addAttribute("article", dao.applyArticle(applyNo));
		
		return "/WEB-INF/view/ApplyComplete.jsp";
	}
	
}
