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

import com.projectors.mvc.dao.IMyPostDAO;
import com.projectors.mvc.dto.MyPostDTO;

@Controller
public class MyPostController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/mypost.action", method = RequestMethod.GET)
	public String myApply(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		IMyPostDAO dao = sqlSession.getMapper(IMyPostDAO.class);

		String pinNo = (String) session.getAttribute("pinNo");

		if (pinNo == null)
		{
			return "/WEB-INF/view/Login.jsp";
		}
			
		String url = "";

		int check = dao.presentCheck(pinNo);
		
		/* System.out.println(check); */
		
		// 현재 모집 중인 공고가 존재한다면
		if (check > 0)
		{

			MyPostDTO presentRecruit = dao.presentRecruit(pinNo);

			String recruitNo = presentRecruit.getRecruitNo();

			model.addAttribute("presentRecruit", presentRecruit);
			
			model.addAttribute("positionCount", dao.postionCount(recruitNo));
		
			
			// 미열람자 존재시
			if (dao.checkPresentNone(recruitNo) > 0)
			{

				ArrayList<MyPostDTO> dto = dao.presentNone(recruitNo);

				ArrayList<MyPostDTO> presentNone = new ArrayList<MyPostDTO>();

				for (MyPostDTO dtoElement : dto)
				{
					// 마감이 아닐때
					if (dao.fullCheckRecPos(dtoElement.getRecruitPosNo()) == 0)
					{
						dtoElement.setFullCount(0);
					}
					// 마감되었을 때
					else
					{
						dtoElement.setFullCount(1);
					}

					presentNone.add(dtoElement);
				}

				model.addAttribute("presentNone", presentNone);

			}
			// 보류자 존재시
			if (dao.checkPresentX(recruitNo) > 0)
			{
				ArrayList<MyPostDTO> dto = dao.presentX(recruitNo);

				ArrayList<MyPostDTO> presentX = new ArrayList<MyPostDTO>();

				for (MyPostDTO dtoElement : dto)
				{
					// 마감이 아닐때
					if (dao.fullCheckRecPos(dtoElement.getRecruitPosNo()) == 0)
					{
						dtoElement.setFullCount(0);
					}
					// 마감되었을 때
					else
					{
						dtoElement.setFullCount(1);
					}

					presentX.add(dtoElement);
				}

				model.addAttribute("presentX", presentX);

				// model.addAttribute("presentX", dao.presentX(recruitNo));
			}
			// 1차 합격자 존재시
			if (dao.checkPresentO(recruitNo) > 0)
			{
				model.addAttribute("presentO", dao.presentO(recruitNo));
			}
			
			// 최종 합류 대기자 존재시
			if (dao.checkFinal(recruitNo) > 0)
			{
				ArrayList<MyPostDTO> finalMemberDTO = dao.finalWait(recruitNo);
				
				model.addAttribute("finalMemberDTO", finalMemberDTO);
				
			}
			
			/* System.out.println("모집 취소 체크" + dao.checkDelete(recruitNo)); */
			
			// 프로젝트로 이동하는 버튼 만들어줄지 안 만들어줄지 
			MyPostDTO finalCountDTO = dao.finalCount(recruitNo);
			model.addAttribute("finalCountDTO", finalCountDTO);
			
			model.addAttribute("checkDelete", dao.checkDelete(recruitNo));
			model.addAttribute("checkPresentNone", dao.checkPresentNone(recruitNo));
			model.addAttribute("checkPresentX", dao.checkPresentX(recruitNo));
			model.addAttribute("checkPresentO", dao.checkPresentO(recruitNo));
			model.addAttribute("checkFinal", dao.checkFinal(recruitNo));
		}

		
		model.addAttribute("check", check);

		url = "/WEB-INF/view/MyPostLists.jsp";

		return url;
	}

	@RequestMapping(value= "/deleteRecruit.action", method = RequestMethod.GET)
	public String deleteRecruit(String recruitNo)
	{
		IMyPostDAO dao = sqlSession.getMapper(IMyPostDAO.class);
		
		//System.out.println("삭제할 공고 번호 확인 : " + recruitNo);
		
		// 1차 합격자 데이터 삭제
		dao.deleteFirstCk(recruitNo);
		// 지원서 데이터 삭제
		dao.deleteApply(recruitNo);
		// 모집 포지션 데이터 삭제
		dao.deleteRecruitPos(recruitNo);
		// 공고 툴 데이터 삭제
		dao.deleteRecruitTool(recruitNo);
		// 공고 데이터 삭제
		dao.deleteRecruit(recruitNo);
		
		return "redirect:mypost.action";
	}
	
	
	
	@RequestMapping(value = "/readApply.action", method = RequestMethod.GET)
	public String readApply(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();

		String url = "";

		String applyNo = request.getParameter("applyNo");

		IMyPostDAO dao = sqlSession.getMapper(IMyPostDAO.class);

		dao.readApply(applyNo);

		/*
		 * 특정 지원서 보는 action 처리해줄 파트
		 */

		url = "redirect:/mypost.action";

		return url;

	}

	@RequestMapping(value = "/passApply.action", method = RequestMethod.GET)
	public String passApply(Model model, HttpServletRequest request)
	{
		String url = "";

		IMyPostDAO dao = sqlSession.getMapper(IMyPostDAO.class);

		String applyNo = request.getParameter("applyNo");
		String recruitNo = request.getParameter("recruitNo");

		// 1차 합류 시키기
		dao.firstCk(applyNo);

		// 모집 인원수
		int recruitCount = dao.recruitCount(recruitNo);
		int firstCount = dao.firstCount(recruitNo);

		int firstFull = 0;

		// 1차 합격 수가 모집 인원 수랑 같으면
		if (firstCount == recruitCount)
		{
			// 최종합류 카테고리 활성화
			firstFull = 1;
		}

		model.addAttribute("firstFull", firstFull);

		url = "redirect:/mypost.action";

		return url;

	}
	// 공고 취소 관련 메소드
	
	
	
	
	//▼ 나의 과거 모집 메소드~
	@RequestMapping(value = "/mypastpost.action", method = RequestMethod.GET)
	public String mypastpost(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String pinNo = (String)session.getAttribute("pinNo");
		
		IMyPostDAO dao = sqlSession.getMapper(IMyPostDAO.class);
		
		int checkPastPost = dao.checkPastPost(pinNo);
		
		// if 과거 모집 이력이 존재하지 않을 경우 else 존재하는 경우
		if (checkPastPost == 0)
		{
			model.addAttribute("checkPastPost", checkPastPost);
		}
		else
		{
			ArrayList<MyPostDTO> myPastPostDTO = dao.myPastPost(pinNo);
			
			model.addAttribute("checkPastPost", checkPastPost);
			model.addAttribute("myPastPostDTO", myPastPostDTO);
		}
		
		return "/WEB-INF/view/MyPastPostLists.jsp";
	}


}
