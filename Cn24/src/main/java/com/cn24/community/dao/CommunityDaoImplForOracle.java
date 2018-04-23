package com.cn24.community.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;

public class CommunityDaoImplForOracle extends SqlSessionDaoSupport implements CommunityDao {

	@Override
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO) {
		return getSqlSession().selectList("CommunityDao.selectAll", communitySearchVO);
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
		return getSqlSession().selectList("CommunityDao.selectMyCommunities", userId);
	}

	@Override
	public int incrementViewCount(int id) {
		return getSqlSession().update("CommunityDao.incrementViewCount", id);
	}

	@Override
	public int incrementRecommendCount(int id) {
		return getSqlSession().update("CommunityDao.incrementRecommendCount", id);
	}
	
	@Override
	public int updateCommunity(CommunityVO communityVO) {
		return getSqlSession().update("CommunityDao.updateCommunity", communityVO);
	}
	
	@Override
	public int deleteMyCommunities(int userId) {
		return getSqlSession().delete("CommunityDao.deleteMyCommunities", userId);
	}

	@Override
	public int deleteCommunity(int id) {
		return getSqlSession().delete("CommunityDao.deleteCommunity", id);
	}

	@Override
	public int deleteCommunities(List<Integer> ids, int userId) {
		// 여러 개의 parameter를 전달하기 위해 map 형식으로 묶어 하나의 parameter로 처리
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", ids);
		params.put("userId", userId);
		
		return getSqlSession().delete("CommunityDao.deleteCommunities", params);
	}
	
}
