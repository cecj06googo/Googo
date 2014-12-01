package com.template.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.template.model.Prototype_OrderTemp_DAO;
import com.template.model.Prototype_OrderTemp_VO;

/**
 * Servlet implementation class Prototype_OrderTemp_Servlet
 */
@WebServlet("/Prototype_OrderTemp_Servlet")
public class Prototype_OrderTemp_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Prototype_OrderTemp_Servlet() {
        super();
         
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		int com_id = Integer.parseInt(request.getParameter("com_id_form_view"));
		String content = "";
		if(request.getParameter("content_form_view") != null){
			content = new String(request.getParameter("content_form_view").getBytes("ISO-8859-1"),"UTF-8");	
		}else{
			System.out.println("no design content detected.");
			return;
		}
		
		String designResult = "";
		response.setCharacterEncoding("UTF-8");
		PrintWriter httpout = response.getWriter();
		
		System.out.println("command: " + command);
		System.out.println("com id: " + com_id);
		
		if ("insert".equals(command)) {
			
			System.out.println("insert content: \n" + content);
			
			Prototype_OrderTemp_VO tempVo = new Prototype_OrderTemp_VO();
			
			tempVo.setCom_id(com_id);
			tempVo.setContent(content);
			Prototype_OrderTemp_DAO dao = new Prototype_OrderTemp_DAO();
			dao.insert(tempVo);
			
			httpout.print("insertOK");
		}
		
		if ("retrieve".equals(command)) {
			Prototype_OrderTemp_DAO dao = new Prototype_OrderTemp_DAO();
			Prototype_OrderTemp_VO tempVo = dao.retrieve(com_id);
			designResult = tempVo.getContent();
			
			if(designResult == null || designResult.trim().length() < 1){
				designResult = "";
			}// if there is no designed template for current company, show empty string instead of null 
			
			System.out.println("load content: \n" + designResult);
			
			httpout.print(designResult); // modified for ajax retrieval 
			
//			request.setAttribute("tempVo", tempVo);
//			RequestDispatcher viewJsp = request.getRequestDispatcher(view);
//			viewJsp.forward(request, response);
		}
	}

}
