package com.cn24.community.service;

import com.cn24.community.dao.CommunityDao;

public class CommunityServiceImpl implements CommunityService {
	
	private CommunityDao communityDao;
	
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}

}
