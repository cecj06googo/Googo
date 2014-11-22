package com.scheduler.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scheduler.model.SchedulerDAO;

public class SchedulerServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try{
			String item_id_string[] =req.getParameter("item_id").trim().split("-");
			String prod_plate =req.getParameter("prod_plate").trim();
		    System.out.println("開始調度車輛,將訂單編號:"+item_id_string[1]+"的車牌改為"+prod_plate);
		    int item_id=Integer.valueOf(item_id_string[1]);
		    SchedulerDAO schedulerDAO=new SchedulerDAO();
		    schedulerDAO.update(prod_plate,item_id);
		}catch(Exception e){
			System.out.println("調度失敗之Exception");
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req,res);
				
	}
}
