package com.cn24.reply.vo;

import com.cn24.community.vo.CommunityVO;
import com.cn24.member.vo.MemberVO;

public class ReplyVO {
	
	private int id;
	private String body;
	private String registDate;
	private int parentReplyId;
	
	private int level;
	private int userId;
	private int communityId;
	
	private MemberVO memberVO;
	private CommunityVO communityVO;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getBody() {
		return body;
	}
	
	public void setBody(String body) {
		this.body = body;
	}
	
	public String getRegistDate() {
		return registDate;
	}
	
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	
	public int getParentReplyId() {
		return parentReplyId;
	}
	
	public void setParentReplyId(int parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	
	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getCommunityId() {
		return communityId;
	}
	
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	public CommunityVO getCommunityVO() {
		return communityVO;
	}
	
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}

	
}
