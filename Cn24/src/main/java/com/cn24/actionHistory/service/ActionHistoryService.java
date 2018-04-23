package com.cn24.actionHistory.service;

import com.cn24.actionHistory.vo.ActionHistorySearchVO;
import com.cn24.actionHistory.vo.ActionHistoryVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface ActionHistoryService {
	
	public boolean createActionHistory(ActionHistoryVO actionHistoryVO);

	public PageExplorer readAllActionHistory(ActionHistorySearchVO actionHistorySearchVO);
}
