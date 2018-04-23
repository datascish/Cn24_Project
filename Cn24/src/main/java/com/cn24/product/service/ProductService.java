package com.cn24.product.service;

import java.util.List;

import com.cn24.product.vo.ProductSearchVO;
import com.cn24.product.vo.ProductVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface ProductService {
	
	public boolean createProduct(ProductVO productVO);
	
	public PageExplorer getAll(ProductSearchVO productSearchVO);
	
	public boolean selectCountAll(ProductSearchVO productSearchVO);
	
	public List<ProductVO> sortAll(ProductVO productVO);

}
