package com.cn24.member.service;

import com.cn24.member.dao.MemberDao;
import com.cn24.member.vo.MemberVO;
import com.cn24.util.SHA256Util;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public boolean createMember(MemberVO memberVO) {
		// SALT Logic 추가
		String salt = SHA256Util.generateSalt();
		memberVO.setSalt(salt);
		
		String password = memberVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt); // SHA256방식을 이용해 암호화
		memberVO.setPassword(password);
		
		return memberDao.insertMember(memberVO) > 0;
	}
	
	@Override
	public MemberVO readMember(MemberVO memberVO) {
		// SALT Logic 추가
		// 1. 사용자의 ID로 SALT 가져오기
		String salt = memberDao.selectSalt(memberVO.getEmail());
		if (salt == null) {
			salt = "";
		}
		// 2. SALT로 암호화 하기
		String password = memberVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		memberVO.setPassword(password);
		
		return memberDao.selectMember(memberVO);
	}
	
	@Override
	public boolean removeMember(int id) {
		return memberDao.deleteMember(id) > 0;
	}
}
