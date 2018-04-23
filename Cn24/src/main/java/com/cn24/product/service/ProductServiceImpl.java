package com.cn24.product.service;

import java.util.ArrayList;
import java.util.List;

import com.cn24.product.dao.ProductDao;
import com.cn24.product.vo.ProductSearchVO;
import com.cn24.product.vo.ProductVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public boolean createProduct(ProductVO productVO) {
		// insertCount = 1
		String productDesc = productVO.getProductDesc();
		productDesc = productDesc.replace("\n", "<br/>"); // \n --> <br/>
		productDesc = filter(productDesc);
		productVO.setProductDesc(productDesc);

		int insertCount = productDao.insertProduct(productVO);
		return insertCount > 0;
	}
	
	public String filter(String str) {

		List<String> blackList = new ArrayList<String>();
		blackList.add("ㅅㅂ");
		blackList.add("ㅗ");
		blackList.add("씨");
		blackList.add("발");
		blackList.add("존나");
		blackList.add("좆나");
		blackList.add("좆같은");
		blackList.add("xx");
		blackList.add("xxx");

		String[] splitString = str.split(" ");
		for (String word : splitString) {
			// word에 들어있는 글자가 blackList에 포함되어 있는지 확인
			for (String blackString : blackList) {
				if (word.contains(blackString)) {
					return "--";
				}
			}
		}
		return str;
	}
	
	@Override
	public PageExplorer getAll(ProductSearchVO productSearchVO) {
		Pager pager = PagerFactory.getPager(Pager.ORACLE, productSearchVO.getPageNo() + "",
				productDao.selectCountAll(productSearchVO));

		PageExplorer pageExplorer = pager.makePageExplorer(ClassicPageExplorer.class, productSearchVO);
		pageExplorer.setList(productDao.selectAll(productSearchVO));

		return pageExplorer;
	}
	
	@Override
	public boolean selectCountAll(ProductSearchVO productSearchVO) {
		return productDao.selectCountAll(productSearchVO) > 0;
	}

	@Override
	public List<ProductVO> sortAll(ProductVO productVO) {
		return productDao.sortAll(productVO);
	}
	
}
