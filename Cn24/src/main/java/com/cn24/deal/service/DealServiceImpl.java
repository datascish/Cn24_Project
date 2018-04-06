package com.cn24.deal.service;

import com.cn24.deal.dao.DealDao;

public class DealServiceImpl implements DealService {
	
	private DealDao dealDao;
	
	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}
}
