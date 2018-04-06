package com.cn24.community.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.community.service.CommunityService;
import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;
import com.cn24.member.constants.Member;
import com.cn24.member.vo.MemberVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class CommunityController {
	
	private MemberVO memberVO;
	private CommunityService communityService;
	
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	} 
	
	public void setCommunityService(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	@RequestMapping("/list")
	public ModelAndView viewListPage(CommunitySearchVO communitySearchVO, HttpSession session) {
		
		// 데이터가 넘어오지 않았을 경우
		// 1. 처음 리스트 페이지로 접속했을 경우
		// 2. 글 목록을 보고 [목록으로] 링크를 클릭했을 경우 - 페이지 새로 고침
		if (communitySearchVO.getPageNo() < 0) {
			// 데이터 x -> Session에 저장된 CommunitySearchVO를 가져옴
			communitySearchVO = (CommunitySearchVO) session.getAttribute("__SEARCH__");
			// Session에 저장된 CommunitySearchVO가 없을 경우 , pageNo = 0으로 초기화
			if (communitySearchVO == null) {
				communitySearchVO = new CommunitySearchVO();
				communitySearchVO.setPageNo(0);
			}

		}
		
		session.setAttribute("__SEARCH__", communitySearchVO); // session에 저장
			
		ModelAndView view = new ModelAndView();
		// /WEB-INF/view/community/list.jsp
		view.setViewName("community/list");
		
		view.addObject("search", communitySearchVO);
		
		PageExplorer pageExplorer = communityService.getAll(communitySearchVO);
		view.addObject("pageExplorer", pageExplorer);
		return view;
	}
	
	@RequestMapping("/reset")
	public String viewInitListPage(HttpSession session) {
		// 글 작성 완료하면 초기 리스트 페이지로 이동
		session.removeAttribute("__SEARCH__");
		return "redirect:/list";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String viewWritePage() {
		// page만 전달
		return "community/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView doWrite(@ModelAttribute("writeForm") @Valid CommunityVO communityVO
											, Errors errors, HttpSession session, HttpServletRequest request) {
		// member가 아니면 접근 x
		if (session.getAttribute(Member.USER) == null) {
			return new ModelAndView ("redirect:/login");
		}
		
		// 에러 체크
		if (errors.hasErrors()) {
			ModelAndView view = new ModelAndView();
			view.setViewName("community/write");
			view.addObject("communityVO", communityVO); // 작성한 데이터 저장
			return view;
		}
		
		// 작성 - ip는 reqeust에 있으므로 불러와야 함
		String requestorIp = request.getRemoteAddr(); // ip 정보 불러옴
		communityVO.setRequestIp(requestorIp);
		communityVO.save();
		
		// 글 작성 성공 여부 체크
		boolean isSuccess = communityService.createCommunity(communityVO);
		if (isSuccess) {
			// 성공했다면
			return new ModelAndView("redirect:/reset"); // 글쓰기를 완료하면 /reset으로 이동
		}
		
		return new ModelAndView("redirect:/write");
	}

}
