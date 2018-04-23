package com.cn24.product.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.cn24.product.vo.ProductSearchVO;
import com.cn24.product.vo.ProductVO;

public class ProductDaoImplForOracle extends SqlSessionDaoSupport implements ProductDao {

	@Override
	public int insertProduct(ProductVO productVO) {
		return getSqlSession().insert("ProductDao.incrementProduct", productVO);
	}
	
	@Override
	public List<ProductVO> selectAll(ProductSearchVO productSearchVO) {
		return getSqlSession().selectList("ProductDao.selectAll", productSearchVO);
	}
	
	@Override
	public int selectCountAll(ProductSearchVO productSearchVO) {
		return getSqlSession().selectOne("ProductDao.selectCountAll", productSearchVO);
	}

	@Override
	public List<ProductVO> sortAll(ProductVO productVO) {
		return getSqlSession().selectList("ProductDao.sortAll", productVO);
	}
	
	
}
