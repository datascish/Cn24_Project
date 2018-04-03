package com.cn24.community.dao;

import java.util.List;

import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;

public class CommunityDaoImplForOracle implements CommunityDao {

	@Override
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommunityVO selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectMyCommunitiesCount(int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityVO> selectMyCommunities(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int incrementViewCount(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int incrementRecommendCount(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCommunity(CommunityVO communityVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
