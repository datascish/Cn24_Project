package com.cn24.member.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.member.vo.MemberVO;

public class MemberDaoImplForOracle extends SqlSessionDaoSupport implements MemberDao {
	// 회원가입한 member 정보(MemberVO)를 집어넣는 interface를 확장한 class
	// DB에서 정보를 받아오기 때문에 return type (boolean) : 제대로 정보를 받아왔는지 체크
	@Override
	public int incrementMember(MemberVO memberVO) {
		return getSqlSession().insert("MemberDao.insertMember", memberVO);
	}
	
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectMember", memberVO);
	}
	
	@Override
	public int selectCountMemberEmail(String email) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberEmail", email);
	}
	
	@Override
	public int selectCountMemberNickname(String nickname) {
		return getSqlSession().selectOne("MemberDao.selectCountMemberNickname", nickname);
	}
	
	@Override
	public String selectSalt(String email) {
		return getSqlSession().selectOne("MemberDao.selectSalt", email);
	}
	
	@Override
	public int deleteMember(int id) {
		return getSqlSession().delete("MemberDao.deleteMember", id);
	}
	
}
