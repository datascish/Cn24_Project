package com.cn24.community.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;

public class CommunityDaoImplForOracle extends SqlSessionDaoSupport implements CommunityDao {

	@Override
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectOne("CommunityDao.selectAll", communitySearchVO);
	}

	@Override
	public CommunityVO selectOne(int id) {
		return getSqlSession().selectOne("CommunityDao.selectOne", id);
	}
	
	@Override
	public int selectCountAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectOne("CommunityDao.selectCountAll", communitySearchVO);
	}
	
	@Override
	public int insertCommunity(CommunityVO communityVO) {
		return getSqlSession().insert("CommunityDao.insertCommunity", communityVO);
	}
	
	@Override
	public int selectMyCommunitiesCount(int userId) {
		return getSqlSession().selectOne("CommunityDao.selectMyCommunitiesCount", userId);
	}

	@Override
	public List<CommunityVO> selectMyCommunities(int userId) {
		return getSqlSession().selectOne("CommunityDao.selectMyCommunities", userId);
	}

	@Override
	public int incrementViewCount(int id) {
		return getSqlSession().update("CommunityDao.incrementViewCount", id);
	}

	@Override
	public int incrementRecommendCount(int id) {
		return getSqlSession().update("CommunityDao.incrementRecommendCount", id);
	}

}
