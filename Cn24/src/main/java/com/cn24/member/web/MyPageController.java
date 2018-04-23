package com.cn24.member.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.community.service.CommunityService;
import com.cn24.community.vo.CommunityVO;
import com.cn24.member.constants.Member;
import com.cn24.member.service.MemberService;
import com.cn24.member.vo.MemberVO;

@Controller
public class MyPageController {
	private MemberService memberService;
	private CommunityService communityService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	@RequestMapping("/mypage/communities")
	public ModelAndView viewMyCommunities(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		List<CommunityVO> myCommunities = communityService.readMyCommunities(member.getId());
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/mypage/myCommunities");
		view.addObject("myCommunities", myCommunities);
		
		return view;
	}
	
	@RequestMapping("/mypage/communities/delete")
	public String doDeleteMyCommunities(HttpSession session, @RequestParam List<Integer> delete) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		
		communityService.removeCommunities(delete, member.getId());
		return "redirect:/mypage/communities";
	}
	
}
