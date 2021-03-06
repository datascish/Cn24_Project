package com.cn24.reply.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.reply.vo.ReplyVO;

public class ReplyDaoImplForOracle extends SqlSessionDaoSupport implements ReplyDao{

	@Override
	public List<ReplyVO> selectAllReplies(int communityId) {
		return getSqlSession().selectList("ReplyDao.selectAllReplies", communityId);
	}
	
	@Override
	public ReplyVO SelectOneReply(int replyId) {
		return getSqlSession().selectOne("ReplyDao.SelectOneReply", replyId);
	}

	@Override
	public int insertReply(ReplyVO replyVO) {
		int sequence = getSqlSession().selectOne("ReplyDao.nextValue"); // query로 sequence 가져오기
		replyVO.setId(sequence); // sequence 값을 할당
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}
	
}
