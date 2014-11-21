package com.template.controller;

import java.io.IOException;

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
		String view = "/Temp/ViewSample_hooked.jsp";
		int com_id = Integer.parseInt(request.getParameter("com_id_form_view"));
		String content = request.getParameter("content_form_view");
		System.out.println("command: " + command);
		System.out.println("com id: " + com_id);
		
		if ("insert".equals(command)) {
			
			System.out.println("insert content: \n" + content);
			
			Prototype_OrderTemp_VO tempVo = new Prototype_OrderTemp_VO();
			
			tempVo.setCom_id(com_id);
			tempVo.setContent(content);
			Prototype_OrderTemp_DAO dao = new Prototype_OrderTemp_DAO();
			dao.insert(tempVo);
		}
		
		if ("retrieve".equals(command)) {
			Prototype_OrderTemp_DAO dao = new Prototype_OrderTemp_DAO();
			Prototype_OrderTemp_VO tempVo = dao.retrieve(com_id);
			
			System.out.println("load content: \n" + tempVo.getContent());
			
			request.setAttribute("tempVo", tempVo);
			RequestDispatcher viewJsp = request.getRequestDispatcher(view);
			viewJsp.forward(request, response);
		}
	}

}
