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
		List<CompanyVO> comvos = new ArrayList<CompanyVO>();
		int [] comids = {19,20,21,22};
		for(int comID : comids){
			CompanyDAO comdao = new CompanyDAO();
			CompanyVO comvo = comdao.findByPrimaryKey(comID);
			comvos.add(comvo);
		}
		request.setAttribute("comvos", comvos);

		RequestDispatcher rd = request.getRequestDispatcher("/_03_research/site.jsp");
		//System.out.println("SearchServlete執行完畢轉跳research.jsp");
		rd.forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}
