package com.cn24.member.dao;

import com.cn24.member.vo.MemberVO;

public interface MemberDao {
	// 회원가입한 member 정보(MemberVO)를 집어넣는 interface
	// DB에서 정보를 받아오기 때문에 return type (int)
	public int insertMember(MemberVO memberVO);
	
	public MemberVO selectMember(MemberVO memberVO);
	
	public String selectSalt(String email); 
	
	// ajax
	//public int selectCountMemberAll(MemberVO memberVO);
	
	public int deleteMember(int id);

}
