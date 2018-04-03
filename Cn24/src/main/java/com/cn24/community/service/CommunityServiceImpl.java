package com.cn24.community.service;

import java.util.ArrayList;
import java.util.List;

import com.cn24.community.dao.CommunityDao;
import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.community.vo.CommunityVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

public class CommunityServiceImpl implements CommunityService {
	
	private CommunityDao communityDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}

	@Override
	public PageExplorer getAll(CommunitySearchVO communitySearchVO) {
		// Oracle pagenation을 사용하겠다
		Pager pager = PagerFactory.getPager(Pager.ORACLE, communitySearchVO.getPageNo() + "",
				communityDao.selectCountAll(communitySearchVO));

		PageExplorer pageExplorer = pager.makePageExplorer(ClassicPageExplorer.class, communitySearchVO);
		pageExplorer.setList(communityDao.selectAll(communitySearchVO));

		return pageExplorer;
	}

	@Override
	public CommunityVO getOne(int id) {
		return communityDao.selectOne(id);
	}

	@Override
	public int readMyCommunitiesCount(int userId) {
		return communityDao.selectMyCommunitiesCount(userId);
	}

	@Override
	public List<CommunityVO> readMyCommunities(int userId) {
		return communityDao.selectMyCommunities(userId);
	}
	
	@Override
	public boolean incrementViewCount(int id) {
		return communityDao.incrementViewCount(id) > 0;
	}
	
	@Override
	public boolean incrementRecommendCount(int id) {
		return communityDao.incrementRecommendCount(id) > 0;
	}

	@Override
	public boolean createCommunity(CommunityVO communityVO) {
		// insertCount = 1
		String body = communityVO.getBody();
		body = body.replace("\n", "<br/>"); // \n --> <br/>
		body = filter(body);
		communityVO.setBody(body);

		int insertCount = communityDao.insertCommunity(communityVO);
		return insertCount > 0;
	}
	
	public String filter(String str) {

		List<String> blackList = new ArrayList<String>();
		blackList.add("ㅅㅂ");
		blackList.add("ㅗ");
		blackList.add("씨");
		blackList.add("발");
		blackList.add("존나");
		blackList.add("좆나");
		blackList.add("좆같은");
		blackList.add("xx");
		blackList.add("xxx");

		String[] splitString = str.split(" ");
		for (String word : splitString) {
			// word에 들어있는 글자가 blackList에 포함되어 있는지 확인
			for (String blackString : blackList) {
				if (word.contains(blackString)) {
					return "--";
				}
			}
		}
		return str;
	}
	
}
