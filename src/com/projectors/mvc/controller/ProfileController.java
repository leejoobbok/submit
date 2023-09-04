/*=================
  ProfileController.java
 ================*/

package com.projectors.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projectors.mvc.dao.IProfileDAO;
import com.projectors.mvc.dto.ProfileDTO;

@Controller
public class ProfileController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="/mypage.action", method = RequestMethod.GET)
	public String myPage(Model model,HttpServletRequest request)
	{
		String url="";
		
		IProfileDAO profileDAO = sqlSession.getMapper(IProfileDAO.class);
		
		HttpSession session = request.getSession();
		
		String pinNo = (String) session.getAttribute("pinNo");
		
		// 0 프로필 유무 확인

		int result = profileDAO.getResult(pinNo);

		System.out.println(result);

		model.addAttribute("result", result);

		// 1 프로필 내용

		ProfileDTO profileDTO = profileDAO.getProfile(pinNo);

		model.addAttribute("profileDTO", profileDTO);

		// 2 사용 기술

		
		
		int utoolResult = profileDAO.chekUserTool(pinNo);
		
		ArrayList<ProfileDTO> utool = profileDAO.getUserTool(pinNo);

		/* System.out.println(utool); */
		
		model.addAttribute("utool", utool);
		model.addAttribute("utoolResult", utoolResult);
		
		
		// 3 평가 출력

		ArrayList<ProfileDTO> totalRate = profileDAO.getTotalRate(pinNo);

		/* System.out.println("평가출력의" + totalRate); */

		model.addAttribute("totalRate", totalRate);

		url = "/WEB-INF/view/MyPage.jsp";

		return url;
		
		
	}
	
	
	
	@RequestMapping(value = "/profileview.action", method = RequestMethod.GET)
	public String profileView(Model model, HttpServletRequest request)
	{

		/*
		String url = "";

		IProfileDAO profileDAO = sqlSession.getMapper(IProfileDAO.class);

		HttpSession session = request.getSession();

		String pinNo = (String) session.getAttribute("pinNo");

		// 0 프로필 유무 확인

		int result = profileDAO.getResult(pinNo);

		System.out.println(result);

		model.addAttribute("result", result);

		// 1 프로필 내용

		ProfileDTO profileDTO = profileDAO.getProfile(pinNo);

		model.addAttribute("profileDTO", profileDTO);

		// 2 사용 기술

		ArrayList<ProfileDTO> utool = profileDAO.getUserTool(pinNo);

		// System.out.println(utool); 

		model.addAttribute("utool", utool);

		// 3 평가 출력

		ArrayList<ProfileDTO> totalRate = profileDAO.getTotalRate(pinNo);

		// System.out.println("평가출력의" + totalRate); 

		model.addAttribute("totalRate", totalRate);

		url = "/WEB-INF/view/ProfileView.jsp";

		return url;
		*/
		
	String url="";
		
		IProfileDAO profileDAO = sqlSession.getMapper(IProfileDAO.class);
		
		HttpSession session = request.getSession();
		
		String pinNo = (String) session.getAttribute("pinNo");
		
		// 0 프로필 유무 확인

		int result = profileDAO.getResult(pinNo);

		System.out.println(result);

		model.addAttribute("result", result);

		// 1 프로필 내용

		ProfileDTO profileDTO = profileDAO.getProfile(pinNo);

		model.addAttribute("profileDTO", profileDTO);

		// 2 사용 기술

		
		
		int utoolResult = profileDAO.chekUserTool(pinNo);
		
		ArrayList<ProfileDTO> utool = profileDAO.getUserTool(pinNo);

		/* System.out.println(utool); */
		
		model.addAttribute("utool", utool);
		model.addAttribute("utoolResult", utoolResult);
		
		
		// 3 평가 출력

		ArrayList<ProfileDTO> totalRate = profileDAO.getTotalRate(pinNo);

		/* System.out.println("평가출력의" + totalRate); */

		model.addAttribute("totalRate", totalRate);

		url = "/WEB-INF/view/MyPage.jsp";

		return url;
		

	}

	@RequestMapping(value = "/profileInsertForm.action", method = RequestMethod.GET)
	public String profileInsertForm(Model model, HttpServletRequest request)
	{
		String url;

		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);

		HttpSession session = request.getSession();

		String pinNo = (String) session.getAttribute("pinNo");

		// 1. 포지션 SELECT OPTION 출력
		ArrayList<ProfileDTO> positionList = dao.getPosition();

		model.addAttribute("positionList", positionList);

		// 2. 도구 번호 출력 checkBox
		ArrayList<ProfileDTO> toolList = dao.getTool();

		model.addAttribute("toolList",toolList);

		
		//3. 지역 번호와 이름 출력
		ArrayList<ProfileDTO> regionList = dao.getRegion();
		
		model.addAttribute("regionList", regionList);
		
		
		url = "/WEB-INF/view/ProfileInsert.jsp";
		return url;

	}
/*profileUpdate.action*/
	
	@RequestMapping(value = "/profileUpdateForm.action", method = RequestMethod.GET)
	public String profileUpdate(Model model, HttpServletRequest request)
	{	
		String url="";

		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		
		HttpSession session = request.getSession();

		String pinNo = (String) session.getAttribute("pinNo");

		// 1. 포지션 기존 유저 데이터 SELECT OPTION 출력
		ArrayList<ProfileDTO> positionList = dao.getUpdatePosition(pinNo);

		model.addAttribute("positionList", positionList);

		// 2. 기존 유저 데이터 도구 번호 출력 checkBox
		ArrayList<ProfileDTO> toolList = dao.getUpdateTool(pinNo);

		model.addAttribute("toolList",toolList);

		
		//3. 기존 유저 데이터 지역 번호와 이름 출력
		ArrayList<ProfileDTO> regionList = dao.getUpdateRegion(pinNo);
		
		model.addAttribute("regionList", regionList);
		
		
		//4. 기존 유저 데이터 세부 지역 번호와 이름 출력
		ArrayList<ProfileDTO> updateSubRegionList = dao.getUpdateSubRegion(pinNo);
		
		model.addAttribute("updateSubRegionList", updateSubRegionList);
		
		
		
		url="/WEB-INF/view/ProfileUpdateForm.jsp";
		return url;
		
	}
	
	
	  @RequestMapping(value="/changeSubRegionList.action", method = RequestMethod.GET)
	  public void subRegionList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	  {
	  
		  
		  String result="";
		  
		  IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		  
		  String regionNo = request.getParameter("regionNo");
		 
		  
		  ArrayList<ProfileDTO> subRegionList = dao.getSubRegion(regionNo);
		  
		  result += "<option value='0'>========상세 지역 선택=========</option>";
		  for (ProfileDTO subRegion : subRegionList)
		  {
			result+="<option value="+subRegion.getSubRegionNo()+">"+subRegion.getSubRegionName()+"</option>";
		  
			/* System.out.println(result); */
		  }
		  
		  request.setAttribute("result", result);
		  
		  RequestDispatcher dispatcher = request.getRequestDispatcher("show_subregion_ajax.jsp");
		  dispatcher.forward(request, response);
		  
	  
	  }
	  
	  
	  
	  @RequestMapping(value="/profileInsert.action",method = RequestMethod.GET)
	  public String profileInsert(ProfileDTO profileDTO, HttpServletRequest request)
	  {
		  String url="";
		  
		  IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);

		  HttpSession session = request.getSession();
		  
		  String pinNo = (String) session.getAttribute("pinNo");
		  
		  profileDTO.setPinNo(pinNo);
		  
			/* System.out.println("컨트롤러까지는 넘어갔음"); */
		  
		  
		  String[] toolNoArr = request.getParameterValues("toolCheckBox");
		  
			/*
			 * System.out.println("posNo:"+profileDTO.getPosNo());
			 * System.out.println("regionNo:"+profileDTO.getRegionNo());
			 * System.out.println("subRegionNo"+profileDTO.getSubRegionNo());
			 */
		  
		  System.out.println("체크박스 예외처리 여부"+request.getParameter("toolException"));
		  int toolException = Integer.parseInt(request.getParameter("toolException"));
		  
		  
		  // 프로필 생성
		  dao.insertProfile(profileDTO);
		  
		  // 유저 도구 입력을 위한 dto 인스턴스 새로 만들기
		  ProfileDTO userToolDTO = new ProfileDTO();
		  
		  /*도구 입력되었을 때만 USER_TOOL 테이블에 데이터 입력*/
		  if (toolException == 0)
		  {
			// 기존 유저 도구가 있는 경우
			if (dao.chekUserTool(pinNo) > 0)
			{
				dao.removeUserTool(pinNo);
			}
			
			// 공용
			
			for (String toolNo : toolNoArr)
			{
				 userToolDTO.setPinNo(pinNo);
				 userToolDTO.setToolNo(Integer.parseInt(toolNo));
				 
				 dao.userToolInsert(userToolDTO);
			}
			
		  }
		  
		  url = "redirect:mypage.action";
		  return url;
		  
	  }
	  
	  
	  @RequestMapping(value="/profileUpdate.action",method = RequestMethod.GET)
	  public String profileUpdate(ProfileDTO profileDTO, HttpServletRequest request)
	  {
		  String url="";
		  
		  IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);

		  HttpSession session = request.getSession();
		  
		  String pinNo = (String) session.getAttribute("pinNo");
		  
		  profileDTO.setPinNo(pinNo);
		  
			/* System.out.println("컨트롤러까지는 넘어갔음"); */
		  
		  
		  String[] toolNoArr = request.getParameterValues("toolCheckBox");
		  
			/*
			 * System.out.println("posNo:"+profileDTO.getPosNo());
			 * System.out.println("regionNo:"+profileDTO.getRegionNo());
			 * System.out.println("subRegionNo"+profileDTO.getSubRegionNo());
			 */
		  
		  System.out.println("체크박스 예외처리 여부"+request.getParameter("toolException"));
		  int toolException = Integer.parseInt(request.getParameter("toolException"));
		  
		  
		  // 프로필 생성
		  dao.updateProfile(profileDTO);
		  
		  // 유저 도구 입력을 위한 dto 인스턴스 새로 만들기
		  ProfileDTO userToolDTO = new ProfileDTO();
		  
		  /*도구 입력되었을 때만 USER_TOOL 테이블에 데이터 입력*/
		  if (toolException == 0)
		  {
			// 기존 유저 도구가 있는 경우
			if (dao.chekUserTool(pinNo) > 0)
			{
				dao.removeUserTool(pinNo);
			}
			
			// 공용 - 이후 다시 기존 유저 도구 입력 - 프라이머리키가 여러개라 이렇게 삭제 입력 반복으로 업데이트
			for (String toolNo : toolNoArr)
			{
				 userToolDTO.setPinNo(pinNo);
				 userToolDTO.setToolNo(Integer.parseInt(toolNo));
				 
				 dao.userToolInsert(userToolDTO);
			}
			
		  }
		  
		  url = "redirect:mypage.action";
		  return url;
		  
	  }
	
	  
	  // 신규 -=- 관리자가 신고 처리 사이트에서 보는 유저의 프로필
	  @RequestMapping(value="/profileadminview.action", method = RequestMethod.GET)
	  public String profileAdminView(Model model,HttpServletRequest request)
	  {
		  String url="";
			
		  IProfileDAO profileDAO = sqlSession.getMapper(IProfileDAO.class);
		  
			String pinNo = request.getParameter("pinNo");
			
			// 0 프로필 유무 확인

			int result = profileDAO.getResult(pinNo);

			System.out.println(result);

			model.addAttribute("result", result);

			// 1 프로필 내용

			ProfileDTO profileDTO = profileDAO.getProfile(pinNo);

			model.addAttribute("profileDTO", profileDTO);

			// 2 사용 기술

			
			
			int utoolResult = profileDAO.chekUserTool(pinNo);
			
			ArrayList<ProfileDTO> utool = profileDAO.getUserTool(pinNo);

			/* System.out.println(utool); */
			
			model.addAttribute("utool", utool);
			model.addAttribute("utoolResult", utoolResult);
			
			
			// 3 평가 출력

			ArrayList<ProfileDTO> totalRate = profileDAO.getTotalRate(pinNo);

			/* System.out.println("평가출력의" + totalRate); */

			model.addAttribute("totalRate", totalRate);

			url = "/WEB-INF/view/MiniProfile.jsp";
			return url;
	  }
	  
	  

	  
	  @RequestMapping(value="/accountManage.action", method = RequestMethod.GET)
	  public String accountManageMent()
	  {
		  return "/WEB-INF/view/AccountManagement.jsp";
	  }
	  
	  @RequestMapping(value="/changePassword.action", method = RequestMethod.GET)
	  public String changePassword()
	  {
		  return "/WEB-INF/view/ChangePassword.jsp";
	  }
	  
	  @RequestMapping(value="/leave.action", method = RequestMethod.GET)
	  public String leave()
	  {
		  return "/WEB-INF/view/WithDrawUser.jsp";
	  }
	  
	  
	  
	  

}
