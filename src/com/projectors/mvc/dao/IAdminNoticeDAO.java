package com.projectors.mvc.dao;

import java.util.ArrayList;

import com.projectors.mvc.dto.AdminNoticeDTO;

public interface IAdminNoticeDAO
{
	public ArrayList<AdminNoticeDTO> lists();
	
	public int add(AdminNoticeDTO dto);
	
	public int remove(String adminNoticeNo);
	
	public AdminNoticeDTO article(String adminNoticeNo);
	
}
