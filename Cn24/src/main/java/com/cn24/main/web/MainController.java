package com.cn24.main.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.main.service.MainService;
import com.cn24.member.constants.Member;
import com.cn24.member.vo.MemberVO;
import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;


@Controller
public class MainController {
	
	private MainService mainService;
	private CommunityVO communityVO;
	private CommunitySearchVO communitySearchVO;
	private MemberVO memberVO;
	
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	@RequestMapping("/main")
	public ModelAndView viewMainPage(HttpSession session, MemberVO memberVO, 
												HttpServletRequest request) {
		session = request.getSession();
		
		
		// TODO 검색 기능 추가
		
		ModelAndView view = new ModelAndView();
		view.setViewName("main/main");
		return view;

	}
	
}
