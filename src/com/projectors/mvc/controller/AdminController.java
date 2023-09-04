package com.projectors.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IAdminDAO;
import com.projectors.mvc.dao.IAdminNoticeDAO;
import com.projectors.mvc.dao.IRecruitDAO;
import com.projectors.mvc.dao.IfaqDAO;
import com.projectors.mvc.dto.AdminNoticeDTO;
import com.projectors.mvc.dto.FaqDTO;
import com.projectors.mvc.dto.RecruitDTO;

@Controller
public class AdminController
{
	// 주요속성구성
	@Autowired
	private SqlSession sqlSession;
	
	//admin으로 로그인 시 보여질 AdminMain 페이지 
	//-- (금일 회원 접속 수, 새 문의 건수 확인, 새 신고 건수 확인)
	@RequestMapping (value = "/adminMain.action", method = RequestMethod.POST)
	public String main(Model model, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";
		
		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
			
			model.addAttribute("todayMemberCnt", dao.todayMemberCnt());
			model.addAttribute("newReportCnt", dao.newReportCnt());
			model.addAttribute("newQuestionCnt", dao.newQuestionCnt());
			
			result = "/WEB-INF/view/AdminMainPage.jsp";
				
		}
		
		return result;
	}
	
	//==========================================공지===============================================
	
	//-- 공지사항으로 페이지 연결 - 리스트
	@RequestMapping (value = "/mainNoticeList.action", method = RequestMethod.GET)
	public String noticeLists(Model model, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
			
			model.addAttribute("lists", dao.lists());
			
			result = "/WEB-INF/view/AdminMainNoticeLists.jsp";
		}
		
		return result;
	}
	
	//-- 공지사항 아티클 들어가기
	@RequestMapping (value = "/adminNoticeArticle.action", method = RequestMethod.GET)
	public String noticeArticle(Model model, String adminNoticeNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
			
			model.addAttribute("article", dao.article(adminNoticeNo));
			
			result = "/WEB-INF/view/AdminMainNoticeArticle.jsp";
		}
		
		return result;
	}
	
	//-- 공지사항 아티클 작성하기 폼
	@RequestMapping (value = "/noticeInsertForm.action", method = RequestMethod.GET)
	public String noticeInsertForm(HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
			
			result = "/WEB-INF/view/MainNoticeInsert.jsp";
		}

		return result;
	}
	
	//-- 공지사항 작성
	@RequestMapping (value = "/noticeInsert.action", method = RequestMethod.POST)
	public String noticeInsert(AdminNoticeDTO dto, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
			
			String pinNo = (String)session.getAttribute("pinNo");
			
			dto.setPinNo(pinNo);
			
			//System.out.println(pinNo);
			
			dao.add(dto);
			
			result = "redirect:mainNoticeList.action";
		}

		return result;
	}
	
	//-- 공지사항 삭제 하기
	@RequestMapping (value = "/mainNoticeDelete.action", method = RequestMethod.GET)
	public String remove(Model model, String adminNoticeNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
			
			dao.remove(adminNoticeNo);
			
			result = "redirect:adminMain.action";
		}
		
		return result;
	}
	//==========================================공지===============================================

	
	//========================================= 문의관리 > FAQ ====================================
	
	//-- 문의 관리 > 메인 (FAQ 리스트 페이지)
	@RequestMapping (value = "/faqManagement.action", method = RequestMethod.GET)
	public String adminFaq(Model model, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			model.addAttribute("lists", dao.getFaqList());
			
			result = "/WEB-INF/view/FAQManagement.jsp";
			
		}
		
		return result;
	}
	
	//-- 문의 관리 > FAQ 아티클 확인 페이지
	@RequestMapping	(value = "/faqManagementArticle.action", method = RequestMethod.GET)
	public String adminFaqArticle(Model model, String faqNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			model.addAttribute("article", dao.viewFaqDetail(faqNo));

			result = "/WEB-INF/view/FAQManagementArticle.jsp";
		}
		
		return result;
	}
	
	//-- 문의 관리> FAQ 아티클 작성 폼 페이지
	@RequestMapping (value = "/faqInsertForm.action" , method = RequestMethod.GET)
	public String faqInsertForm(HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			result = "/WEB-INF/view/FAQInsert.jsp";
		}
		
		return result;
	}
	
	//-- FAQ 아티클 작성
	@RequestMapping (value = "/faqInsert.action", method = RequestMethod.GET)
	public String faqInsert(FaqDTO dto, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			dao.addFAQ(dto);
			
			result = "redirect:faqManagementArticle.action?faqNo="+dao.findFaqNo();
		}
		
		return result;
	}
	
	//-- FAQ 아티클 수정 폼
	@RequestMapping (value = "/faqUpdateForm.action", method = RequestMethod.GET)
	public String faqUpdateForm(Model model, String faqNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			model.addAttribute("article", dao.viewFaqDetail(faqNo));

			result = "/WEB-INF/view/FAQUpdate.jsp";
		}
		
		return result;
	}
	
	//-- FAQ 아티클 수정
	@RequestMapping (value = "/faqUpdate.action", method = RequestMethod.GET)
	public String faqUpdate(FaqDTO dto, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);

			dao.updateFAQ(dto);

			result = "redirect:faqManagementArticle.action?faqNo="+dto.getFaqNo();
		}
		
		return result;
	}
	
	//-- FAQ 아티클 삭제
	@RequestMapping (value = "/faqDelete.action", method = RequestMethod.GET)
	public String deleteFaq(String faqNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IfaqDAO dao = sqlSession.getMapper(IfaqDAO.class);
			
			dao.removeFAQ(faqNo);
			
			result = "redirect:faqManagement.action";
		}
		
		return result;
	}
	
	//========================================= 문의관리 > FAQ ====================================
	
	
	//=================================== 공고 리스트 관리 ========================================
	@RequestMapping (value = "/contentsManagement.action", method = RequestMethod.GET)
	public String recruitist(Model model, String recruitNo, HttpServletRequest request)
	{
		String result = "redirect:projectorsmain.action";

		HttpSession session = request.getSession();
		if (session.getAttribute("adminNo")!=null)
		{
			IRecruitDAO dao = sqlSession.getMapper(IRecruitDAO.class);
			List<ArrayList<RecruitDTO>> members = new ArrayList<ArrayList<RecruitDTO>>();
			
			model.addAttribute("lists", dao.lists());
			
			for (int i=0; i < dao.lists().size(); i++)
			{
				recruitNo = dao.lists().get(i).getRecruitNo();
				members.add(dao.countRecruitMember(recruitNo));
			}
			
			model.addAttribute("members", members);
			
			
			result = "/WEB-INF/view/ContentsManagement.jsp";
		}

		return result;
	}
	//=================================== 공고 리스트 관리 ========================================
	
}
