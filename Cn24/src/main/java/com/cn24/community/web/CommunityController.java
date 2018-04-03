package com.cn24.community.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.community.service.CommunityService;
import com.cn24.community.vo.CommunitySearchVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public class CommunityController {
	
	private CommunityService communityService;
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	@RequestMapping("/list")
	public ModelAndView viewListPage(CommunitySearchVO communitySearchVO) {

		ModelAndView view = new ModelAndView();
		// /WEB-INF/view/community/list.jsp
		view.setViewName("community/list");

		PageExplorer pageExplorer = communityService.getAll(communitySearchVO);
		view.addObject("pageExplorer", pageExplorer);
		return view;
	}

}
