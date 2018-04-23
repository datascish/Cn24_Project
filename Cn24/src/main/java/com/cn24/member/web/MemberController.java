package com.cn24.member.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.community.service.CommunityService;
import com.cn24.member.constants.Member;
import com.cn24.member.dao.MemberDao;
import com.cn24.member.service.MemberService;
import com.cn24.member.vo.MemberVO;


@Controller
public class MemberController {
	private MemberService memberService;
	private CommunityService communityService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	// ajax - email, nickname
	@RequestMapping("/api/exists/email")
	@ResponseBody // JSON
	public Map<String, Boolean> apiIsExistsEmail(@RequestParam String email) {
		boolean isExists = memberService.readCountMemberEmail(email);

		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);

		return response;

	}

	@RequestMapping("/api/exists/nickname")
	@ResponseBody // JSON
	public Map<String, Boolean> apiIsExistsNickname(@RequestParam String nickname) {
		boolean isExists = memberService.readCountMemberNickname(nickname);

		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("response", isExists);

		return response;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String viewLoginPage() {
		
		// jsp page return
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String doLoginAction(MemberVO memberVO, Errors errors, HttpSession session,
			HttpServletRequest request) {
		// TODO  actionHistory log 추가
		
		// FIXME DB에 계정이 존재하지 않을 경우로 변경
		MemberVO loginMember = memberService.readMember(memberVO);
		if (loginMember != null) {
			session.setAttribute(Member.USER, loginMember);
			return "redirect:/product";
		}
		
		return "redirect:/login";
				
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
	public ModelAndView doFindAction(@ModelAttribute("forgotForm") @Valid MemberVO memberVO, Errors errors) {
		// 회원 정보 - email check 후 이메일 보냈다고 alert 띄우기
		if (errors.hasErrors()) {
			return new ModelAndView("member/find");
		}
		if (memberService.readCountMemberEmail(memberVO.getEmail())) {
			return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
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
	
	@RequestMapping("/account/delete/{deleteFlag}")
	public String doRemoveMember(HttpSession session, @PathVariable String deleteFlag, 
							@RequestParam(required=false, defaultValue="") String token) {
			String sessionToken = (String) session.getAttribute("__TOKEN__");
			// sessionToekn이 null이거나 sessionToken을 임의로 변경한 경우
			if (sessionToken == null || sessionToken.equals(token)) {
				return "";
			}
			
			MemberVO member = (MemberVO) session.getAttribute(Member.USER); // session에 저장된 member 정보 받아오기
			// 회원 여부 체크
			if ( member == null) {
				return "redirect:/login";
			}
			
			int id = member.getId();
			if (memberService.removeMember(id, deleteFlag)) {
				session.invalidate();
			}
			return "member/delete/delete";
	}
	
	@RequestMapping("/delete/process1")
	public String viewVerifyPage() {
		return "member/delete/process1";
	}
	
	@RequestMapping("/delete/process2")
	public ModelAndView viewDeleteMyDatasPage(
			@RequestParam(required=false, defaultValue="") String password, HttpSession session) {
		// member가 작성한 게시글(게시판 글, 판매자인 경우 등록한 상품 글 포함) 제거
		if (password.length() == 0) {
			// password가 없다면
			return new ModelAndView("error/404");
		}
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		member.setPassword(password); // password 저장
		
		MemberVO verifyMember = memberService.readMember(member);
		if (verifyMember == null) {
			return new ModelAndView ("redirect:/delete/process1");
		}
		// 내가 작성한 게시글의 개수 가져오기
		int myCommunitiesCount = communityService.readMyCommunitiesCount(verifyMember.getId());
		// TODO 판매자일 경우 작성한 상품 등록 글의 개수 가져오기 
		
		ModelAndView view = new ModelAndView();
		view.setViewName("member/delete/process2");
		view.addObject("myCommunitiesCount", myCommunitiesCount);
		
		String uuid = UUID.randomUUID().toString();
		session.setAttribute("__TOKEN__", uuid); // token과 uuid(난수) 저장
		view.addObject("token", uuid); // 난수의 범위 지정
		return view;
	}
	
}
