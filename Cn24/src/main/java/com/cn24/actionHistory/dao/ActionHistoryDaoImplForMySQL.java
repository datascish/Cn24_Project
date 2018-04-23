package com.cn24.actionHistory.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.actionHistory.vo.ActionHistorySearchVO;
import com.cn24.actionHistory.vo.ActionHistoryVO;

public class ActionHistoryDaoImplForMySQL extends SqlSessionDaoSupport implements ActionHistoryDao {
	
	@Override
	public int insertActionHistory(ActionHistoryVO actionHistoryVO) {
		return getSqlSession().insert("ActionHistoryDao.insertActionHistory", actionHistoryVO);
	}

	@Override
	public int selectAllActionHistoryCount(ActionHistorySearchVO actionHistorySearchVO) {
		return getSqlSession().selectOne("ActionHistoryDao.selectAllActionHistoryCount", actionHistorySearchVO);
	}

	@Override
	public List<ActionHistoryVO> selectAllActionHistroy(ActionHistorySearchVO actionHistorySearchVO) {
		return getSqlSession().selectList("ActionHistoryDao.selectAllActionHistroy", actionHistorySearchVO);
	}
	
	
}
