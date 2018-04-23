package com.cn24.member.dao;

import com.cn24.member.vo.MemberVO;

public interface MemberDao {
	// 회원가입한 member 정보(MemberVO)를 집어넣는 interface
	// DB에서 정보를 받아오기 때문에 return type (int)
	public int incrementMember(MemberVO memberVO);
	
	public MemberVO selectMember(MemberVO memberVO);
	
	// ajax - id(email), nickname 중복 체크 
	public int selectCountMemberEmail(String email);
		
	public int selectCountMemberNickname(String nickname);
	
	public String selectSalt(String email); 
	
	public int deleteMember(int id);
	
	
}
