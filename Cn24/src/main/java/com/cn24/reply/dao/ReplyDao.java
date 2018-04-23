package com.cn24.reply.dao;

import java.util.List;

import com.cn24.reply.vo.ReplyVO;

public interface ReplyDao {
	
	public List<ReplyVO> selectAllReplies(int communityId);
	
	public ReplyVO SelectOneReply(int replyId);
	
	public int insertReply(ReplyVO replyVO);

}
