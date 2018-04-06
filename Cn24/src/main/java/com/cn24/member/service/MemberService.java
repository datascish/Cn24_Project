package com.cn24.member.service;

import com.cn24.member.vo.MemberVO;

public interface MemberService {
	
	public boolean createMember(MemberVO memberVO);
	
	public MemberVO readMember(MemberVO memberVO);
	
	public boolean removeMember(int id);

}
