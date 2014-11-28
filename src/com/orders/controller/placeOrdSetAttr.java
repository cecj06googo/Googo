package com.orders.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.member.model.MemService;
import com.member.model.MemVO;
import com.products.model.ProductVO;
import com.products.model.ProductsDAO;

public class placeOrdSetAttr extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//從session取出商品id和商家id
		Integer com_id = Integer.parseInt(session.getAttribute("detail_com_id").toString());
		System.out.println("com_id:"+com_id);
		Integer prod_id = Integer.parseInt(session.getAttribute("detail_prod_id").toString());
		System.out.println("prod_id:"+prod_id);
		//暫時把會員VO存進session(登入會有，但目前未整合完畢)
//		Integer mem_id = 3;
//		MemService ms = new MemService();
//		MemVO memVO = ms.getOneMem(mem_id);
		 
		
		//把CompanyVO和List<ProductVO>存入session
		CompanyService cs = new CompanyService();
		CompanyVO comVO = cs.getOneCom(com_id);
		ProductsDAO pdao = new ProductsDAO();
		ProductVO prodVO = new ProductVO();
		prodVO.setProdId(prod_id);
		List<ProductVO> ord_prodVoList  = pdao.getAll(prodVO);
		
		
//		session.setAttribute("ord_memVO", memVO);
		session.setAttribute("ord_comVO", comVO); //key修改會影響彥靖
		session.setAttribute("ord_prod_id", prod_id);
		session.setAttribute("ord_prodVoList", ord_prodVoList);
		/******************** (轉向)*******************/
		String url = "/_07_order/placeOrder.jsp";
		RequestDispatcher successView = request
				.getRequestDispatcher(url);
		successView.forward(request, response);
		
	
	} // end doPost	
} // end placeOrdSetAttr
