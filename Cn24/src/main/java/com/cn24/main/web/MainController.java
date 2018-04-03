package com.cn24.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.main.service.MainService;
import com.cn24.community.vo.CommunitySearchVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class MainController {
	
	private MainService mainService;
	
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/main")
	public ModelAndView viewMainPage() {
		// TODO pagenation, 검색 기능 추가
		
		ModelAndView view = new ModelAndView();
		// /WEB-INF/view/main/main.jsp
		view.setViewName("main/main");

		return view;
	}
}
