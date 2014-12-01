package com.comFirstPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comFirstPage.model.*;
import com.company.model.*;

import org.json.simple.JSONValue;//玩玩看

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
		//printDataOfACom(comVO);
		// ---------取得該商家所有商品資訊-------------------
		ProductsService prodService = new ProductsService();
		List<ProductVO> prodsVos = new ArrayList<ProductVO>();
		prodsVos = prodService.getProdsByComIdNoRepeat(comId);
		//prodsVos = prodService.getProdsByComId(comId);		
		request.setAttribute("prodsVos", prodsVos);
		countsTheTypeProduct(prodsVos,request);//統計車種數量並傳到前端
		//printProdsOfACom(prodsVos);// 測試用:vos內值是否正確
		//----------取得該商家所有配件資訊----------------
		AccService accservice = new  AccService();
		List<AccessoryVO> accsVos = new ArrayList<AccessoryVO>();
		accsVos = accservice.getAccVosByComId(comId);
		printAccsOfACom(accsVos);
		request.setAttribute("accsVos", accsVos);
		
		//----------丟給Google Map使用--------------
		List<String> comAdressArray = new ArrayList<String>();
		List<String> comNameArray = new ArrayList<String>();
		comNameArray.add("\""+comVO.getComName()+"\"");
		comAdressArray.add("\""+comVO.getComAddr()+"\""); //把每一家地址存入
		request.setAttribute("comNameArray", comNameArray);//為了給Google Map使用
		request.setAttribute("comAdressArray", comAdressArray);//為了給Google Map使用
		//String location = new String((request.getParameter("location")).getBytes("ISO-8859-1"),"UTF-8");
		String location = "目前這行用不到";
		System.out.println("location="+location);
		request.setAttribute("location", location);//為了給Google Map使用
		request.setAttribute("rowsPerPage", 1);//每頁只有1個商家
		request.setAttribute("whichPage", 1);//目前在第一頁
		//-----利用json傳資料給前端使用-----------
		try{
		List jsonList =new  LinkedList();
		for(int i=0;i<prodsVos.size();i++){
			Map jsonMap =new LinkedHashMap();
			jsonMap.put("prod_id", prodsVos.get(i).getProdId());
			jsonMap.put("prod_name", prodsVos.get(i).getProdName());
			jsonMap.put("prod_type", prodsVos.get(i).getProdType());
			jsonMap.put("prod_price", prodsVos.get(i).getProdPrice());
			jsonMap.put("prod_disc", prodsVos.get(i).getProdDisc());
			jsonMap.put("prod_cc", prodsVos.get(i).getProdCc());
			jsonMap.put("prod_carrier", prodsVos.get(i).getProdCarrier());
			jsonMap.put("prod_control", prodsVos.get(i).getProdControl());
				
			jsonList.add(jsonMap);
		}
		String jsonString=JSONValue.toJSONString(jsonList);
		System.out.println("jsonString="+jsonString);
		request.setAttribute("jsonString",jsonString);	
		}catch(Exception e){
			System.out.println("利用json傳資料給前端使用區塊錯誤");
			e.printStackTrace();
		}		
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
	
	protected void printAccsOfACom(List<AccessoryVO> accVOs) {
		for(AccessoryVO accVO : accVOs){
			System.out.println("------------AccData--------------");
			System.out.println("AccID="+accVO.getAccId());
			System.out.println("AccName="+accVO.getAccName());
			System.out.println("ComId="+accVO.getComId());
			System.out.println("AccDetail="+accVO.getAccDetail());
			System.out.println("AccPrice="+accVO.getAccPrice());
			System.out.println("AccStatus="+accVO.getAccStatus());
			System.out.println("------------AccDataEnd--------------");
	    }
	}
	protected void printDataOfACom(CompanyVO comVO) {
		System.out.println("------------ComData--------------");
		System.out.println("ComID="+comVO.getComID());
		System.out.println("ComName="+comVO.getComName());
		System.out.println("------------ComDataEnd--------------");
	}
	
	protected void countsTheTypeProduct(List<ProductVO> prodsVos,HttpServletRequest request) {
		int numOfCar = 0;
		int numOfMotor = 0;
		int numOfBike = 0;
		for(ProductVO prodVo : prodsVos){//若全部檢查完非true代表沒有該種商品
			if(prodVo.getProdType()==1){
				numOfCar++;
			}
			if(prodVo.getProdType()==2){
				numOfMotor++;
			}
			if(prodVo.getProdType()==3){
				numOfBike++;
			}
		}//end for(ProductVO prodVo : prodsVos)
			request.setAttribute("numOfCar", numOfCar);
			request.setAttribute("numOfMotor", numOfMotor);
			request.setAttribute("numOfBike", numOfBike);
		System.out.println("numOfCar="+numOfCar);
		System.out.println("numOfMotor="+numOfMotor);
		System.out.println("numOfBike="+numOfBike);
	}//end protected void checkHasTheTypeProduct
}//end public class DispComFirstPage extends HttpServlet
