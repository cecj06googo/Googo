package com.company.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.SendMail;

public class ContactUs extends HttpServlet{
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("進來ContactUs的doGet轉交給doPost");
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("我有進來ContactUs的doPost");
		String Name = request.getParameter("ContactName");
		String Phone = request.getParameter("ContactPhone");
		String Email = request.getParameter("ContactEmail");
		String Message = request.getParameter("ContactMessage");

		SendMail sendmail = new SendMail();
		String recieverAdress = "googocar@gmail.com";
		String subjectTitle= Name+"的聯絡訊息";   
		String messageContent= 
				"留言者姓名:"+Name+"\n"
				+"手機號碼:"+Phone+"\n"
				+"留言信息:\n"+Message;
		sendmail.send(recieverAdress,subjectTitle, messageContent);
		RequestDispatcher rd = request.getRequestDispatcher("/_00_fragment/about.jsp");
		request.setAttribute("Msg", "寄信成功!");
		rd.forward(request, response);
	}
}
