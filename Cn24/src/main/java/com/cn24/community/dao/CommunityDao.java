package com.cn24.community.dao;

import java.util.List;

import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;

public interface CommunityDao {
	
	// 전체 게시글의 목록 가져와서 보여주기
	public List<CommunityVO> selectAll(CommunitySearchVO communitySearchVO);

	public CommunityVO selectOne(int id);
	
	public int selectCountAll(CommunitySearchVO communitySearchVO);
	
	public int insertCommunity(CommunityVO communityVO);

	public int selectMyCommunitiesCount(int userId);

	public List<CommunityVO> selectMyCommunities(int userId);

	public int incrementViewCount(int id); // 조회수 증가

	public int incrementRecommendCount(int id); // 추천수 증가

}
