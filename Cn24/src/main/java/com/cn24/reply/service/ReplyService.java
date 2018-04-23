package com.cn24.reply.service;

import java.util.List;

import com.cn24.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> readAllReplies(int communityId);
	
	public ReplyVO readOneReply(int replyId);
	
	public boolean createReply(ReplyVO replyVO);
}
