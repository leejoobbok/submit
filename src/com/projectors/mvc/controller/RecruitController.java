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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projectors.mvc.dao.IRecruitDAO;
import com.projectors.mvc.dto.RecruitDTO;


@Controller
public class RecruitController
{
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/recruitlist.action", method = RequestMethod.GET)
	public String recruitlist(HttpServletRequest request, Model model, String recruitNo)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		List<ArrayList<String>> tools = new ArrayList<ArrayList<String>>();
		List<ArrayList<RecruitDTO>> members = new ArrayList<ArrayList<RecruitDTO>>();
		
		model.addAttribute("lists", dao.lists());
		
		for (int i=0; i < dao.lists().size(); i++)
		{
			recruitNo = dao.lists().get(i).getRecruitNo();
			tools.add(dao.showTool(recruitNo));
			members.add(dao.countRecruitMember(recruitNo));
		}

		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");
		
		if (pinNo != null)
		{
			model.addAttribute("regDateCheck", dao.regDateCheck(pinNo));
		}
		
	    model.addAttribute("tools", tools);
	    model.addAttribute("members", members);
		
	    model.addAttribute("regions", dao.optionRegion());
	    model.addAttribute("dotypes", dao.optionDoType());
	    model.addAttribute("poss", dao.optionPos());

		String result = "/WEB-INF/view/RecruitLists.jsp";
		return result;
	}
	/*
	@RequestMapping(value = "/searchrecruitlist.action", method = RequestMethod.GET)
	public String searchrecruitlist(Model model, String recruitNo, String regionName, String subRegionName, String posNo, String doTypeName)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		List<ArrayList<String>> tools = new ArrayList<ArrayList<String>>();
		List<ArrayList<RecruitDTO>> members = new ArrayList<ArrayList<RecruitDTO>>();
		
		System.out.println(1);
		System.out.println(regionName);
		System.out.println(subRegionName);
		System.out.println(posNo);
		System.out.println(doTypeName);

		if (regionName==null)
			regionName = "1";

		if (subRegionName==null)
			subRegionName = "2";

		if (posNo==null)
			posNo = "3";

		if (doTypeName==null)
			doTypeName = "4";


		System.out.println(2);
		System.out.println(regionName);
		System.out.println(subRegionName);
		System.out.println(posNo);C

		
		List<RecruitDTO> searchResults = dao.searchLists(regionName, subRegionName, posNo, doTypeName);
		model.addAttribute("lists", searchResults);

		for (int i=0; i < searchResults.size(); i++)
		{
			recruitNo = searchResults.get(i).getRecruitNo();
			tools.add(dao.showTool(recruitNo));
			members.add(dao.countRecruitMember(recruitNo));
			
			System.out.println(i);
			System.out.println(recruitNo);
		}
		
	    model.addAttribute("tools", tools);
	    model.addAttribute("members", members);
		
	    model.addAttribute("regions", dao.optionRegion());
	    model.addAttribute("dotypes", dao.optionDoType());
	    model.addAttribute("poss", dao.optionPos());
	    
		String result = "/recruit_jakupjung/RecruitLists.jsp";
		return result;
	}
	*/
	
	@RequestMapping(value = "/getsubregion.action")
	@ResponseBody
	public String getsubregion(int regionNo)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		
		String result = "";
		
		if ( dao.subRegionList(regionNo).size() > 1)
			result = "<option>전체</option>";
		
		for (String lists : dao.subRegionList(regionNo))
			result += "<option value='" + lists + "'>" + lists + "</option>";
		
		return result;
	}
	
	@RequestMapping(value = "/recruitarticle.action", method = RequestMethod.GET)
	public String recruitarticle(Model model, String recruitNo)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		
		model.addAttribute("article", dao.article(recruitNo));
		model.addAttribute("tools", dao.showTool(recruitNo));
		model.addAttribute("countPos", dao.countPosRecruitMember(recruitNo));
		model.addAttribute("recruitMember", dao.recruitMember(recruitNo));
		
		String result = "/WEB-INF/view/RecruitArticle.jsp";
		return result;
	}

	@RequestMapping(value = "/writerecruit.action", method = RequestMethod.GET)
	public String writerecruit(Model model)
	{
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);
		
		model.addAttribute("tools", dao.getAllTools());
		model.addAttribute("poss", dao.getAllPos());
		
		return "/WEB-INF/view/RecruitInsert.jsp";
	}
	
	@RequestMapping(value = "/postrecruit.action", method = RequestMethod.POST)
	public String postrecruit(RecruitDTO dto, HttpServletRequest request,
							  @RequestParam String[] posCount,
							  @RequestParam String[] pos,
							  @RequestParam String[] tool)
	{	
		IRecruitDAO dao = sqlsession.getMapper(IRecruitDAO.class);

		HttpSession session = request.getSession();
		String pinNo = (String)session.getAttribute("pinNo");
		
		System.out.println("pinNo : " + pinNo);
		
		dto.setPinNo(pinNo);
		
		// 모집공고 생성
		dao.insertRecruit(dto);
		
		// 가져온 모집공고 번호 → setter 로 dto 안에 집어넣기
		dto.setRecruitNo(dao.getRecruitNo(dto));
		
		// 모집공고 필요기술 삽입
		for (int i = 0; i < tool.length; i++) {
			int intToolNo = Integer.parseInt(tool[i]);
			dto.setToolNo(intToolNo);
			dao.insertRecruitTool(dto);
		}
		
		// 모집공고 필요포지션 삽입
		for (int i = 0; i < posCount.length; i++) {
			if (posCount[i] != "0") {
				int count = Integer.parseInt(posCount[i]);
				dto.setPosNo(i+1);
				for (int j = 0; j < count; j++)
					dao.insertRecruitPos(dto);
			}
		}
		
		// 팀장이 선택한 포지션의 지원번호 가져오기
		
		int posCap = Integer.parseInt(pos[0]);
		dto.setPosCapNo(posCap);
		dto.setRecruitPosNo(dao.getCapRecruitPosNo(dto));
		
		// 팀장이 선택한 포지션에 자동 지원
		dao.insertApplyPosCap(dto);
		
		// 팀장의 지원서 가져오기
		dto.setApplyNo(dao.getCapApplyNo(dto));
		
		// 팀장 지원서 자동합격
		dao.insertFirstCKCap(dto);
		
		
		String result = "redirect:recruitlist.action";
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
