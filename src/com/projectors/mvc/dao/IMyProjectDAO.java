package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.MyProjectDTO;

public interface IMyProjectDAO
{
	public MyProjectDTO presentProject(String pinNo);
	
	public ArrayList<MyProjectDTO> pastProject(String pinNo);
	
	public int countProject(String pinNo);
	
	public ArrayList<MyProjectDTO> projectMember(String projectNo);
	
	public String getProjectNo(String recruitNo);
	
	public ArrayList<MyProjectDTO> getMember(String recruitNo);
	
	public ArrayList<MyProjectDTO> positionCount(String recruitNo);
	
	public int getMemberCount(String recruitNo);
	
	public int checkPresentProject(String pinNo);
	
	public int checkPastProject(String pinNo);

}
