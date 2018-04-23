package com.cn24.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn24.member.constants.Member;
import com.cn24.member.vo.MemberVO;
import com.cn24.reply.service.ReplyService;
import com.cn24.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	
	private ReplyService replyService;
	
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	@RequestMapping(value="/api/reply/{communityId}", method=RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> getAllReplies(@PathVariable int communityId) {
		return replyService.readAllReplies(communityId);
	}
	
	// 등록 성공 여부와 등록이 된 댓글의 정보
	@RequestMapping(value="/api/reply/{communityId}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createReply(@PathVariable int communityId, 
						HttpSession session, ReplyVO replyVO) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		replyVO.setUserId(member.getId()); // type이 int이므로 맞춰줘야 함
		replyVO.setCommunityId(communityId);
		
		boolean isSuccess = replyService.createReply(replyVO);
		
		ReplyVO newReply = null;
		if (isSuccess) {
			newReply = replyService.readOneReply(replyVO.getId());
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", isSuccess);
		result.put("reply", newReply); // 새로 생성한 뒤 데이터를 저장한 replyVO 객체를 넣어줘야 값이 전달됨
		
		return result;
	}
	
}
