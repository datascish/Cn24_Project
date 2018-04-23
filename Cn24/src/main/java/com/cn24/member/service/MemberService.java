package com.cn24.member.service;

import com.cn24.member.vo.MemberVO;

public interface MemberService {
	
	public boolean createMember(MemberVO memberVO);
	
	public MemberVO readMember(MemberVO memberVO);
	
	// ajax - id(email), nickname 중복 체크 
	public boolean readCountMemberEmail(String email);
			
	public boolean readCountMemberNickname(String nickname);
	
	public boolean removeMember(int id, String deleteFlag);
	
	
}
