package com.comFirstPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comFirstPage.model.ProductVO;
import com.comFirstPage.model.ProductsService;
import com.company.model.*;

/**
 * Servlet implementation class DispComFirstPage
 */
@WebServlet("/DispComFirstPage")
public class DispComFirstPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("我有進來DispComfirst.java doGet");
		int comId = 1;
		try {
			  comId = Integer.parseInt(request.getParameter("comId"));
		} catch (NumberFormatException e) {
			System.err.println("錯誤:DisComFirstPage的comId轉換成數字錯誤!");
			e.printStackTrace();
		}
		request.setAttribute("comId", comId);
		System.out.println("comId=" + comId);
		
		// ---------取得該商家Company VO--------------------
		CompanyService comService = new CompanyService();
		CompanyVO comVO = comService.getOneCom(comId);
		request.setAttribute("comVO", comVO);
		printDataOfACom(comVO);
		// ---------取得該商家所有商品資訊-------------------
		ProductsService prodService = new ProductsService();
		List<ProductVO> prodsVos = new ArrayList<ProductVO>();
		prodsVos = prodService.getProdsByComIdNoRepeat(comId);
		//prodsVos = prodService.getProdsByComId(comId);		
		request.setAttribute("prodsVos", prodsVos);
		checkHasTheTypeProduct(prodsVos,request);//檢查哪種車種是空的並傳到前端
		printProdsOfACom(prodsVos);// 測試用:vos內值是否正確
		//----------丟給Google Map使用--------------
		List<String> comAdressArray = new ArrayList<String>();
		List<String> comNameArray = new ArrayList<String>();
		comNameArray.add("\""+comVO.getComName()+"\"");
		comAdressArray.add("\""+comVO.getComAddr()+"\""); //把每一家地址存入
		request.setAttribute("comNameArray", comNameArray);//為了給Google Map使用
		request.setAttribute("comAdressArray", comAdressArray);//為了給Google Map使用
		String location = new String((request.getParameter("location")).getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("location="+location);
		request.setAttribute("location", location);//為了給Google Map使用
		request.setAttribute("rowsPerPage", 1);//每頁只有1個商家
		request.setAttribute("whichPage", 1);//目前在第一頁
		// ---------丟值顯示到商家首頁-------------
		RequestDispatcher rd = request
				.getRequestDispatcher("/_05_company/company.jsp");
		System.out.println("跳轉company.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("我有進來DispComfirst.java doPost");
		String comId = request.getParameter("comId");
		System.out.println("comId=" + comId);
	}

	protected void printProdsOfACom(List<ProductVO> vos) {
		for (ProductVO vo : vos) {
			System.out.println("getProdId=" + vo.getProdId());
			System.out.println("getComId=" + vo.getComId());
			System.out.println("getProdName=" + vo.getProdName());
			System.out.println("getProdType=" + vo.getProdType());
			System.out.println("getProdPrice=" + vo.getProdPrice());
			System.out.println("getProdDisc=" + vo.getProdDisc());
			System.out.println("getProdPic=" + vo.getProdPic());
			System.out.println("getProdArticle=" + vo.getProdArticle());
			System.out.println("getProdSubPic1=" + vo.getProdSubPic1());
			System.out.println("getProdSubPic2=" + vo.getProdSubPic2());
			System.out.println("getProdSubPic3=" + vo.getProdSubPic3());
			System.out.println("getProdKind=" + vo.getProdKind());
			System.out.println("getProdCc=" + vo.getProdCc());
			System.out.println("getProdCarrier=" + vo.getProdCarrier());
			System.out.println("getProdControl=" + vo.getProdControl());
			System.out.println("getProdPlate=" + vo.getProdPlate());
			System.out.println("getProdStatus=" + vo.getProdStatus());
			System.out
					.println("----------------------------------------------");
		}
	}//end protected void printProdsOfACom
	
	protected void printDataOfACom(CompanyVO comVO) {
		System.out.println("------------ComData--------------");
		System.out.println("ComID="+comVO.getComID());
		System.out.println("ComName="+comVO.getComName());
		System.out.println("------------ComDataEnd--------------");
	}
	
	protected void checkHasTheTypeProduct(List<ProductVO> prodsVos,HttpServletRequest request) {
		boolean hasCar = false;
		boolean hasMotor = false;
		boolean hasBike = false;
		for(ProductVO prodVo : prodsVos){//若全部檢查完非true代表沒有該種商品
			if(prodVo.getProdType()==1){
				hasCar = true;
			}
			if(prodVo.getProdType()==2){
				hasMotor = true;
			}
			if(prodVo.getProdType()==3){
				hasBike = true;
			}
		}//end for(ProductVO prodVo : prodsVos)
		if(hasCar){
			request.setAttribute("hasCar", 1);
		}else{
			request.setAttribute("hasCar", 0);
		}
		if(hasMotor){
			request.setAttribute("hasMotor", 1);
		}else{
			request.setAttribute("hasMotor", 0);
		}
		if(hasBike){
			request.setAttribute("hasBike", 1);
		}else{
			request.setAttribute("hasBike", 0);
		}
		System.out.println("hasCar="+hasCar);
		System.out.println("hasMotor="+hasMotor);
		System.out.println("hasBike="+hasBike);
	}//end protected void checkHasTheTypeProduct
}//end public class DispComFirstPage extends HttpServlet
