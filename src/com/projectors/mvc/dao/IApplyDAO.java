package com.projectors.mvc.dao;

import com.projectors.mvc.dto.ApplyDTO;

public interface IApplyDAO
{
	public ApplyDTO memberInfo(String pinNo);
	public ApplyDTO recruitInfo(String recruitPosNo);
	public void applyInsert(ApplyDTO dto);
	public ApplyDTO applyArticle(String applyNo);
}
