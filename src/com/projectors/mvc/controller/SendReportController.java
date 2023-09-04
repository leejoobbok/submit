package com.projectors.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.ISendReportDAO;
import com.projectors.mvc.dto.SendReportDTO;

@Controller
public class SendReportController // 신고 전송 컨트롤러
{
	@Autowired
	private SqlSession sqlSession;
	
	// 공고 신고 팝업창으로 이동 
	@RequestMapping (value = "/popUpRecruitReport.action", method = RequestMethod.GET)
	public String popUpRecruitReport(HttpServletRequest request)
	{
		String result = "";

		HttpSession session = request.getSession();
		result = "/WEB-INF/view/RecruitReportForm.jsp";
		
		return result;
	}
	// 공고 신고 인서트 
	@RequestMapping (value = "/sendRecruitReport.action", method = RequestMethod.GET)
	public String sendRecruitReport(HttpServletRequest request)
	{
		String result = "";

		HttpSession session = request.getSession();
		ISendReportDAO dao = sqlSession.getMapper(ISendReportDAO.class);
		
		System.out.println((String)session.getAttribute("pinNo"));
		
		
		SendReportDTO dto = new SendReportDTO();
		dto.setRecruitNo(request.getParameter("recruitNo")); 			// 공고 번호 
		dto.setPinNo((String)session.getAttribute("pinNo")); 		    // 신고자 핀번호 
		dto.setRepReason(request.getParameter("repReason")); 			// 신고 사유
		
		dao.reportRecruit(dto);
		
		result = "/WEB-INF/view/AfterReport.jsp";
		
		return result;
	}
}
