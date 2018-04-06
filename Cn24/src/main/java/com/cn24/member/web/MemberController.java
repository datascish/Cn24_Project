package com.cn24.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.member.constants.Member;
import com.cn24.member.dao.MemberDao;
import com.cn24.member.service.MemberService;
import com.cn24.member.vo.MemberVO;


@Controller
public class MemberController {
	private MemberVO memberVO;
	private MemberService memberService;
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLoginPage() {
		// jsp page return
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView doLoginAction(@ModelAttribute("loginForm") @Valid MemberVO loginForm, Errors errors, 
			HttpServletRequest request) {
	
		// TODO  actionHistory log 추가
		
		
		return new ModelAndView("redirect:/main");
				
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	// parameter가 없어도 페이지 들어올 수 있도록 return type을 String으로
	public String viewRegistPage() {
		return "member/regist";
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView doRegistAction(@ModelAttribute("registForm") 
													@Valid MemberVO memberVO, Errors errors) {
		if ( errors.hasErrors()) {
			return new ModelAndView("member/regist");
		}
		if (memberService.createMember(memberVO)) {
			return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value="/find", method=RequestMethod.GET)
	public String viewFindPage() {
		return "member/find";
	}
	
	@RequestMapping(value="/find", method=RequestMethod.POST)
	public ModelAndView doFindAction() {
		// 회원 정보 - email, password 찾기 <- name, phone, nickname 필요
		
		return new ModelAndView();
	}
	
	@RequestMapping("/logout")
	public String doLogoutAction(HttpSession session, HttpServletRequest request) {
		
		session = request.getSession();
		// session에서 member 정보 가져오기 - id 값 받아오기 위해
		MemberVO memberVO = (MemberVO) session.getAttribute(Member.USER);
		
		// 세션 소멸 - 세션 전체를 다 제거
		session.invalidate();
		return "redirect:/login";
	}
	
	//@RequestMapping("/delete/")
}
