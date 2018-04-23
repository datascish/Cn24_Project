package com.cn24.actionHistory.dao;

import java.util.List;

import com.cn24.actionHistory.vo.ActionHistorySearchVO;
import com.cn24.actionHistory.vo.ActionHistoryVO;

public interface ActionHistoryDao {
	
	public int insertActionHistory(ActionHistoryVO actionHistoryVO);

	public int selectAllActionHistoryCount(ActionHistorySearchVO actionHistorySearchVO);

	public List<ActionHistoryVO> selectAllActionHistroy(ActionHistorySearchVO actionHistorySearchVO);
}
