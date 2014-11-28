package com.search.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.*;

public class IndexPlaceRecommend extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int comID=0;
		//System.out.println("我有進來IndexPlaceRecommend.java doGet");
		List<CompanyVO> comvos = new ArrayList<CompanyVO>();
		int [] comids = {19,20,21,22};
		try{
			for(int comID : comids){
				CompanyDAO comdao = new CompanyDAO();
				CompanyVO comvo = comdao.findByPrimaryKey(comID);
				comvos.add(comvo);
				System.out.println("comName="+comvo.getComName());
			}
		}catch(Exception e){
			//System.out.println("IndexPlaceRecommend的DAO處裡錯誤");
			e.printStackTrace();
		}
		request.setAttribute("comvos", comvos);

		RequestDispatcher rd = request.getRequestDispatcher("/_03_research/site.jsp");
		//System.out.println("IndexPlaceRecommend執行完畢轉跳site.jsp");
		rd.forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("我有進來IndexPlaceRecommend.java doPost");
		doPost(request,response);
	}
	
}
