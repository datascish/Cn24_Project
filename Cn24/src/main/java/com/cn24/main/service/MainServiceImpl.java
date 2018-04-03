package com.cn24.main.service;

import com.cn24.main.dao.MainDao;

public class MainServiceImpl implements MainService {
	
	private MainDao mainDao;
	
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
}
