package com.cn24.actionHistory.service;

import java.util.List;

import com.cn24.actionHistory.dao.ActionHistoryDao;
import com.cn24.actionHistory.vo.ActionHistorySearchVO;
import com.cn24.actionHistory.vo.ActionHistoryVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ListPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

public class ActionHistoryServiceImpl implements ActionHistoryService {
	private ActionHistoryDao actionHistoryDao;
	
	public void setActionHistoryDao(ActionHistoryDao actionHistoryDao) {
		this.actionHistoryDao = actionHistoryDao;
	}
	
	@Override
	public boolean createActionHistory(ActionHistoryVO actionHistoryVO) {
		return actionHistoryDao.insertActionHistory(actionHistoryVO) > 0;
	}
	
	@Override
	public PageExplorer readAllActionHistory(ActionHistorySearchVO actionHistorySearchVO) {
		Pager pager = PagerFactory.getPager(Pager.OTHER, actionHistorySearchVO.getPageNo() + "",
				actionHistoryDao.selectAllActionHistoryCount(actionHistorySearchVO));

		PageExplorer pageExplorer = pager.makePageExplorer(ListPageExplorer.class, actionHistorySearchVO);

		List<ActionHistoryVO> list = actionHistoryDao.selectAllActionHistroy(actionHistorySearchVO);
		pageExplorer.setList(list);

		return pageExplorer;
	}
}
