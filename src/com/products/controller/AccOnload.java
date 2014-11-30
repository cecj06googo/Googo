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
import com.products.model.AccService;
import com.products.model.AccessoryVO;
import com.products.model.ProductVO;
import com.products.model.ProductsService;

public class AccOnload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		AccService AccSvc = new AccService();
		AccessoryVO accVO = new AccessoryVO();
		System.out.println("now is onload~ For Acc");
		// 應該要能
		CompanyVO loginComToken = (CompanyVO) session
				.getAttribute("LoginComOK");
		accVO.setComId(loginComToken.getComID());
		System.out
				.println("this is com_ID in onload. " + accVO.getComId());
		session.setAttribute("comId", loginComToken.getComID());
		List<AccessoryVO> list2 = AccSvc.getAll(accVO);
		System.out.println("acc amount: "+list2.size());

		session.setAttribute("accList", list2);
		
		// for(ProductVO aBookBean :list){
		// System.out.println(aBookBean.getProdName());
		// System.out.println(aBookBean.getComId());
		// }

		String url = "/_06_manage/Accessory.jsp";
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
