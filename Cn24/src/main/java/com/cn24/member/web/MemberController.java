package com.cn24.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.member.service.MemberService;
import com.cn24.member.vo.MemberVO;

@Controller
public class MemberController {
	private MemberService memberService;
	
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
	
		
		return new ModelAndView("redirect:/login");
				
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
	
	@RequestMapping("/find")
	public String viewFindPage() {
		return "member/find";
	}
}
