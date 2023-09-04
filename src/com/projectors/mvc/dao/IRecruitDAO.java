package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.RecruitDTO;

public interface IRecruitDAO
{
	public ArrayList<RecruitDTO> lists();
	// public ArrayList<RecruitDTO> searchLists(String regionName, String subRegionName, String posNo, String doTypeName);
	public ArrayList<String> showTool(String recruitNo);
	
	public ArrayList<RecruitDTO> optionRegion();
	public ArrayList<RecruitDTO> optionDoType();
	public ArrayList<RecruitDTO> optionPos();
	
	public ArrayList<String> subRegionList(int regionNo);
	public ArrayList<RecruitDTO> countRecruitMember(String recruitNo);
	
	public RecruitDTO article(String recruitNo);
	
	public ArrayList<RecruitDTO> countPosRecruitMember(String recruitNo);
	public ArrayList<RecruitDTO> recruitMember(String recruitNo);
	
	public ArrayList<RecruitDTO> getAllTools();
	public ArrayList<RecruitDTO> getAllPos();
	
	public void insertRecruit(RecruitDTO dto);
	public String getRecruitNo(RecruitDTO dto);
	public void insertRecruitTool(RecruitDTO dto);
	public void insertRecruitPos(RecruitDTO dto);
	public String getCapRecruitPosNo(RecruitDTO dto);
	public void insertApplyPosCap(RecruitDTO dto);
	public String getCapApplyNo(RecruitDTO dto);
	public void insertFirstCKCap(RecruitDTO dto);
	
	public int regDateCheck(String pinNo);
	
}
