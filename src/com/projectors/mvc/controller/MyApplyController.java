package com.projectors.mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IMyApplyDAO;
import com.projectors.mvc.dto.MyApplyDTO;

@Controller
public class MyApplyController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/myapply.action",method = RequestMethod.GET )
	public String myApply(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String pinNo = (String)session.getAttribute("pinNo");
		
		if (pinNo == null)
		{
			return "/WEB-INF/view/Login.jsp";
		}
		
		IMyApplyDAO dao = sqlSession.getMapper(IMyApplyDAO.class);
		
		int checkPresent = dao.checkPresentApply(pinNo);
		int checkFirstCk = dao.checkFirstCk(pinNo);
		int checkFinal = dao.checkFinal(pinNo);
		
		// if 현재 지원 이력이 없으면 else 있으면
		if (checkPresent == 0 || checkFirstCk != 0 || checkFinal != 0)
		{
			model.addAttribute("checkPresent", checkPresent);
		}
		else if(checkPresent != 0 || checkFirstCk == 0 || checkFinal == 0)
		{
			MyApplyDTO presentApplyDTO = dao.getPresentApply(pinNo);
			
			// 삭제 가능한 지원서인지 판별
			String applyNo = presentApplyDTO.getApplyNo();
			model.addAttribute("checkDeleteApply", dao.checkDeleteApply(applyNo));
			//System.out.println(dao.checkDeleteApply("1이면 지원서 삭제 가능 : "+applyNo));

			//
			model.addAttribute("presentApply", presentApplyDTO);
			model.addAttribute("checkPresent", checkPresent);
		}
		
		// if 1차 합격 지원 이력이 없으면 else 있으면
		if (checkFirstCk == 0 || checkFinal != 0)
		{
			model.addAttribute("checkFirstCk", checkFirstCk);
		}
		else if(checkFirstCk != 0 || checkFinal == 0)
		{
			MyApplyDTO firstCkApplyDTO = dao.getFirstCk(pinNo);
			
			model.addAttribute("firstCkApply", firstCkApplyDTO);
			model.addAttribute("checkFirstCk", checkFirstCk);
			
			// 모집 인원 , 1차 합격 총 인원 비교 위해서
			model.addAttribute("memberCount", dao.memberCount(firstCkApplyDTO.getRecruitNo()));
			model.addAttribute("firstCkCount", dao.firstCkCount(firstCkApplyDTO.getRecruitNo()));
		}
		
		// if 최종 합류 대기중인 지원 이력이 없으면 else 있으면
		if (checkFinal == 0)
		{
			model.addAttribute("checkFinal", checkFinal);
		}
		else if (checkFinal != 0)
		{
			MyApplyDTO finalApplyDTO = dao.getFinal(pinNo);
			int checkProject = dao.checkProject(finalApplyDTO.getRecruitNo());
			
			model.addAttribute("finalApply", finalApplyDTO);
			model.addAttribute("checkFinal", checkFinal);
			model.addAttribute("checkProject", checkProject);
		}
		
			
		return "/WEB-INF/view/MyApply.jsp";
	}
	

	@RequestMapping(value="addfinal.action", method = RequestMethod.GET )
	public String addFinal(HttpServletRequest request)
	{
		
		IMyApplyDAO dao = sqlSession.getMapper(IMyApplyDAO.class);
		
		String firstCkNo = request.getParameter("firstCkNo");
		String recruitNo = request.getParameter("recruitNo");	
		
		dao.addFinal(firstCkNo);
		
		// 해당 공고의 모집 인원 수
		int memberCount = dao.memberCount(recruitNo);
		// 해당 공고의 최종 합류 대기자 인원 수
		int finalCount = dao.finalCount(recruitNo);
		
		if (memberCount == finalCount)
		{
			dao.addProject(recruitNo);
		}
					
		return "redirect:myapply.action";
	}
	
	
	  @RequestMapping(value="/mypastapply.action",method = RequestMethod.GET )
	  public String mypastapply(Model model, HttpServletRequest request) 
	  {
		  HttpSession session = request.getSession();
		  
		  IMyApplyDAO dao = sqlSession.getMapper(IMyApplyDAO.class);
		  
		  String pinNo = (String)session.getAttribute("pinNo");
		  
		  int checkPastApply = dao.checkPastApply(pinNo);
		  
		  // if 과거 지원 이력이 존재하지 않는 다면 else 존재한다면 
		  if (checkPastApply==0) 
		  {
			  model.addAttribute("checkPastApply", checkPastApply); 
		  } 
		  else 
		  {
			  ArrayList<MyApplyDTO> pastApplyDTO = dao.getPastApply(pinNo);
		  
			  model.addAttribute("checkPastApply", checkPastApply);
			  model.addAttribute("pastApplyDTO", pastApplyDTO); 
		  }
		  
		  return "/WEB-INF/view/MyPastApply.jsp"; 
	  }
	  
	@RequestMapping(value="/deleteapply.action", method = RequestMethod.GET)
	public String deleteApply(Model model, String applyNo)
	{
		IMyApplyDAO dao = sqlSession.getMapper(IMyApplyDAO.class);
		
		dao.deleteApply(applyNo);
		
		return "redirect:myapply.action";
	}
	  
	  
}
