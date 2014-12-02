package com.orders.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.orders.model.LoginOrdProdOnLoadDAO;
import com.orders.model.OrdersVO;
import com.orders.model.ProductOrderVO;
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
		Integer com_id = 3;   //以防萬一
		Integer prod_id = 71; //捷安特
		
		try{
		com_id = Integer.parseInt(session.getAttribute("detail_com_id").toString());
		System.out.println("com_id:"+com_id);
		prod_id = Integer.parseInt(session.getAttribute("detail_prod_id").toString());
		System.out.println("prod_id:"+prod_id);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("placeOrdSetAttr  沒接到com_id或prod_id !!");
		}
		//暫時把會員VO存進session(登入會有，但目前未整合完畢)
//		Integer mem_id = 3;
//		MemService ms = new MemService();
//		MemVO memVO = ms.getOneMem(mem_id);
		 
		
		//取出商家資料
		CompanyService cs = new CompanyService();
		CompanyVO comVO = cs.getOneCom(com_id);
		//取出商品資料(自訂DAO和VO)
		ProductOrderVO prodOrdVO = new ProductOrderVO();
		prodOrdVO.setProdId(prod_id);
		prodOrdVO.setComId(com_id);
		LoginOrdProdOnLoadDAO LOPOLD = new LoginOrdProdOnLoadDAO();
		List<ProductOrderVO> ord_prodVoList  = LOPOLD.getAll(prodOrdVO);
		prodOrdVO = LOPOLD.prodIdgetAll(prodOrdVO);
		
		
		
		
		System.out.println("單一ProdDisc:"+prodOrdVO.getProdDisc());
		System.out.println("prodVoList.size:"+ord_prodVoList.size());
		
//		for (int i = 0,max = ord_prodVoList.size() ; i < max; i++) {
//			ProductVO obj = ord_prodVoList.get(i);
//			prodPriceMap.put(String.valueOf(obj.getProdId()),String.valueOf(obj.getProdPrice()));
//			boolean a = ord_prodVoList.contains(obj.getProdName());
//			System.out.println("prod_type:"+obj.getProdType());
//			System.out.println("prodId:"+obj.getProdId());
//			System.out.println("prodName:"+obj.getProdName());
//			System.out.println("getProdPrice:"+obj.getProdPrice());
//		}
//		session.setAttribute("ord_memVO", memVO);
		session.setAttribute("ord_prodVO", prodOrdVO);
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


