package com.cn24.product.dao;

import java.util.List;

import com.cn24.product.vo.ProductSearchVO;
import com.cn24.product.vo.ProductVO;

public interface ProductDao {
	
	public int insertProduct(ProductVO productVO);
	
	public List<ProductVO> selectAll(ProductSearchVO productSearchVO);
	
	public int selectCountAll(ProductSearchVO productSearchVO);
	
	public List<ProductVO> sortAll(ProductVO productVO);
}
