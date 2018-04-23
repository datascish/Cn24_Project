package com.cn24.community.web;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.actionHistory.vo.ActionHistory;
import com.cn24.actionHistory.vo.ActionHistoryVO;
import com.cn24.community.service.CommunityService;
import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;
import com.cn24.member.constants.Member;
import com.cn24.member.vo.MemberVO;
import com.cn24.util.DownloadUtil;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class CommunityController {

	private CommunityService communityService;
	
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
	public ModelAndView doWrite(@ModelAttribute("writeForm") @Valid CommunityVO community
											, Errors errors, HttpSession session, HttpServletRequest request) {
		// member가 아니면 접근 x
		if (session.getAttribute(Member.USER) == null) {
			return new ModelAndView ("redirect:/login");
		}
		
		// 에러 체크
		if (errors.hasErrors()) {
			ModelAndView view = new ModelAndView();
			view.setViewName("community/write");
			view.addObject("community", community); // 작성한 데이터 저장
			return view;
		}
		
		// 작성 - ip는 reqeust에 있으므로 불러와야 함
		String requestorIp = request.getRemoteAddr(); // ip 정보 불러옴
		community.setRequestIp(requestorIp);
		community.save(); // 저장
	
		// 글 작성 성공 여부 체크
		boolean isSuccess = communityService.createCommunity(community);
		
		if (isSuccess) {
			// 성공했다면
			return new ModelAndView("redirect:/reset"); // 글쓰기를 완료하면 /reset으로 이동
		}
		
		return new ModelAndView("redirect:/write");
	}
	
	@RequestMapping("/get/{id}")
	public void download(@PathVariable int id, HttpServletRequest request, HttpServletResponse response
			) {
		// return type이 void라도 response 보낼 수 있음
		// 게시글의 id를 가져와서 그 게시글에 있는 파일 이름을 가져올 것
		CommunityVO community = communityService.getOne(id);
		String fileName = community.getFileName();
		
//		// history 추가
//		actionHistory.setReqType(ActionHistory.ReqType.COMMUNITY);
//		String log = String.format(ActionHistory.LOG.DOWNLOAD, id, fileName);
//		actionHistory.setLog(log);
		
		DownloadUtil download = new DownloadUtil("d:/upload_cn24/" + fileName );
		try {
			download.download(request, response, fileName);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}
	
	@RequestMapping("/view/{id}")
	public ModelAndView viewViewPage(@PathVariable int id) {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("community/view");
		// id로 게시글 얻어오기
		CommunityVO community = communityService.getOne(id);
		view.addObject("community", community);

		return view;
	}
	
	@RequestMapping("/read/{id}")
	public String viewReadPage(@PathVariable int id) {
		// 조회수 증가
		if (communityService.incrementViewCount(id)) {
			return "redirect:/view/" + id;
		}
		return "redirect:/list";
	}
	
	@RequestMapping("/recommend/{id}")
	public String viewRecommendCount(@PathVariable int id 
				) {
		//  history log
//		actionHistory.setReqType(ActionHistory.ReqType.COMMUNITY);
//		String log = String.format(ActionHistory.LOG.RECOMMEND, id);
//		actionHistory.setLog(log);
		
		if (communityService.incrementRecommendCount(id)) {
			return "redirect:/view/" + id;
		}
		return "redirect:/list";
	}
	
	@RequestMapping(value="/modify/{id}", method=RequestMethod.GET)
	public ModelAndView viewModifyPage(@PathVariable int id, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute(Member.USER); // 명시적 형변환
		CommunityVO community = communityService.getOne(id);
		
		int userId = member.getId();
		if ( userId != community.getUserId() ) {
			return new ModelAndView("error/404");
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("community/write");
		view.addObject("community", community); // 원본 글 보여주기
		view.addObject("mode", "modify"); // key : mode, value : modify
		return view;
	}
	
	@RequestMapping(value="/modify/{id}", method=RequestMethod.POST)
	public String doModify(@PathVariable int id, HttpSession session, 
			@ModelAttribute("writeForm") @Valid CommunityVO community, Errors errors,
			HttpServletRequest request, @SessionAttribute("__USER__") MemberVO member) {
		// member 정보는 파라미터로 받아옴
		// 원본 글이 자신이 쓴 게 맞는지 체크
		member = (MemberVO) session.getAttribute(Member.USER);
		CommunityVO original = communityService.getOne(id);
		
		if (member.getId() != original.getUserId()) {
			return "";
		}
		if (errors.hasErrors()) {
			return "redirect:/modify/" + id;
		}
		
		/* 
		 * 여러 경우의 수(본인 글 확인, error 확인) 먼저 check 후 시작
		*	수정 시 유의할 점
		*	0. IP 변경 확인
		*	1. 제목 변경 확인
		*	2. 내용 변경 확인
		*	3. 파일 변경 확인
		*	4. 변경 X 확인
		*/
		
		// 수정된 정보만 newCommunity에 넣기 위해
		// 게시글 번호, 이를 작성한 user의 번호 - 필수 체크!
		CommunityVO newCommunity = new CommunityVO();
		newCommunity.setId(original.getId());
		newCommunity.setUserId(original.getUserId());
		
		boolean isModify = false;
		
//		String asIs = "";
//		String toBe = "";
		
		// 0. IP 변경 확인
		String ip = request.getRemoteAddr();
		if ( !ip.equals(original.getRequestIp()) ) {
			newCommunity.setRequestIp(ip);
			isModify = true;
//			asIs += "IP : " + original.getRequestIp() + "<br/>";
//			toBe += "IP : " + ip + "<br/>";
		}
		// 1. 제목 변경 확인
		if ( !original.getTitle().equals(community.getTitle()) ) {
			newCommunity.setTitle(community.getTitle());
			isModify = true;
//			asIs += "Title : " + original.getTitle() + "<br/>";
//			toBe += "Title : " + community.getTitle() + "<br/>";
		}
		// 2. 내용 변경 확인
		if ( !original.getBody().equals(community.getBody()) ) {
			newCommunity.setBody(community.getBody());
			isModify = true;
//			asIs += "Body : " + original.getBody() + "<br/>";
//			toBe += "Body : " + community.getBody() + "<br/>";
		}
		// 3. 파일 변경 확인 - 체크 여부 확인
		if ( original.getFileName().length() > 0 ) { // checked
			File file = new File("d:/upload_cn24/" + community.getFileName());
			file.delete();
			community.setFileName("");
		}
		else { // unchecked
			community.setFileName(original.getFileName()); // fiile을 그대로 유지
		}
		community.save(); // 조건에 따라 처리한 후 결과 저장
		if ( !original.getFileName().equals(community.getFileName()) ) {
			newCommunity.setFileName(community.getFileName());
			isModify = true;
//			asIs += "File : " + original.getFileName() + "<br/>";
//			toBe += "File : " + community.getFileName() + "<br/>";
		}
		
		// 4. 변경 X 확인
		if (isModify) {
			// AS_IS, TO_BE
//			asIs += "NoModify" + original.getId() + "<br/>";
//			toBe += "NoModify" + community.getId() + "<br/>";
			
			// 6. UPDATE 하는 Service code 호출
			communityService.updateCommunity(newCommunity); // 수정한 정보를 저장한 객체 받아오기
		}
		return "redirect:/view/" + id;
		
	}
	
	@RequestMapping("/remove/{id}")
	public String RemoveCommunities(@PathVariable int id, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		CommunityVO community = communityService.getOne(id); // 삭제하고자 하는 게시글의 정보(id)를 가져오기
		boolean isMine = member.getId() == community.getUserId(); // 내가 쓴 게시글인지 확인
		
//		// action history log 추가
//		actionHistory.setReqType(ActionHistory.ReqType.COMMUNITY);
//		String log = String.format(ActionHistory.LOG.DELETE, id, community.getTitle(), community.getBody());
//		actionHistory.setLog(log);
		
		if (isMine && communityService.removeCommunity(id)) {
			return "redirect:/list";
		}
		return "";
	}

}
