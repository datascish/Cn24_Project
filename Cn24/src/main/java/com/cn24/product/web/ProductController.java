package com.cn24.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cn24.community.vo.CommunitySearchVO;
import com.cn24.member.constants.Member;
import com.cn24.member.vo.MemberVO;
import com.cn24.product.service.ProductService;
import com.cn24.product.vo.ProductSearchVO;
import com.cn24.product.vo.ProductVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class ProductController {
	
	private ProductService productService;
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping("/product")
	public ModelAndView viewProductListPage(ProductSearchVO productSearchVO, HttpSession session) {
		// 데이터가 넘어오지 않았을 경우
		// 1. 처음 리스트 페이지로 접속했을 경우
		// 2. 글 목록을 보고 [목록으로] 링크를 클릭했을 경우 - 페이지 새로 고침
		if (productSearchVO.getPageNo() < 0) {
			productSearchVO = (ProductSearchVO) session.getAttribute("__PRO_SEARCH__");
			if (productSearchVO == null) {
				productSearchVO = new ProductSearchVO();
				productSearchVO.setPageNo(0);
			}
		}
		session.setAttribute("__PRO_SEARCH__", productSearchVO); // session에 저장
		
		ModelAndView view = new ModelAndView();
		// /WEB-INF/view/product/product.jsp
		view.setViewName("product/product");
		
		view.addObject("search", productSearchVO);
		
		PageExplorer pageExplorer = productService.getAll(productSearchVO);
		view.addObject("pageExplorer", pageExplorer);
		return view;
		
	}
	
	@RequestMapping("/resetPro")
	public String viewInitListPage(HttpSession session) {
		// 글 작성 완료하면 초기 리스트 페이지로 이동
		session.removeAttribute("__PRO_SEARCH__");
		return "redirect:/product";
	}
	
	@RequestMapping(value="/productRegist", method=RequestMethod.GET)
	public String viewProductRegistPage() {
		return "product/productRegist";
	}
	
	@RequestMapping(value="/productRegist", method=RequestMethod.POST)
	public ModelAndView doProductRegist(@ModelAttribute("proForm") @Valid ProductVO product, Errors errors, 
				HttpServletRequest request, HttpSession session, MemberVO userType) {
		
		if (session.getAttribute(Member.USER) == null) {
			return new ModelAndView ("redirect:/login");
		} 
		
		if (errors.hasErrors()) {
			ModelAndView view = new ModelAndView();
			view.setViewName("product/productRegist");
			view.addObject("product", product); // 작성한 데이터 저장
			return view;
		}
		
		String requestorIp = request.getRemoteAddr();
		product.setRequestIp(requestorIp);
		product.save();
		
		boolean isSuccess = productService.createProduct(product);
		if (isSuccess) {
			return new ModelAndView("redirect:/resetPro");
		}
		return new ModelAndView("redirect:/productRegist");
	}
	
}
