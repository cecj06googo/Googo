package com.products.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.model.CompanyVO;
import com.products.model.ProductVO;
import com.products.model.ProductsService;

public class ProductOnload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		ProductsService ProdSvc = new ProductsService();
		ProductVO ProductsVO = new ProductVO();
		String action = request.getParameter("action");
		System.out.println("now is onload~");
		// 應該要能
		CompanyVO loginComToken = (CompanyVO) session
				.getAttribute("LoginComOK");
		ProductsVO.setComId(loginComToken.getComID());
		System.out
				.println("this is com_ID in onload. " + ProductsVO.getComId());
		session.setAttribute("comId", loginComToken.getComID());
		List<ProductVO> list = ProdSvc.getAll(ProductsVO);

		List<ProductVO> car = new ArrayList<ProductVO>();
		List<ProductVO> moto = new ArrayList<ProductVO>();
		List<ProductVO> bike = new ArrayList<ProductVO>();
		for (ProductVO aBookBean : list) {
			if (aBookBean.getProdType() == 1)
				car.add(aBookBean);
			else if (aBookBean.getProdType() == 2)
				moto.add(aBookBean);
			else if (aBookBean.getProdType() == 3)
				bike.add(aBookBean);
		}
		session.removeAttribute("car");
		session.removeAttribute("moto");
		session.removeAttribute("bike");
		session.setAttribute("car", car);
		session.setAttribute("moto", moto);
		session.setAttribute("bike", bike);
		session.setAttribute("list", list);
		// for(ProductVO aBookBean :list){
		// System.out.println(aBookBean.getProdName());
		// System.out.println(aBookBean.getComId());
		// }

		String url = "/_06_manage/product.jsp";
		RequestDispatcher successView = request.getRequestDispatcher(url);
		successView.forward(request, response);
//
//		if ("prodSelect".equals(action)) {
//			String _prodId = request.getParameter("prodId");
//			int prodId = Integer.parseInt(_prodId);
//			System.out.println(prodId);
//			
//
//		}
	}// end post
}
