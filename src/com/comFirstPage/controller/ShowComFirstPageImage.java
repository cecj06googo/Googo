package com.comFirstPage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;


public class ShowComFirstPageImage extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    ServletOutputStream sos = null;
	    
		int comID = Integer.parseInt(req.getParameter("comID"));
		CompanyService comService = new CompanyService();
		CompanyVO comVO = comService.getOneCom(comID);
		
		// 檢查是否已有商家圖片
		if (comVO.getComPic() != null) {
			res.setContentType("image/jpg");
			try {
				sos = res.getOutputStream();
				sos.write(comVO.getComPic());
				sos.flush();
				sos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		else {
			res.setContentType("image/jpg");
			// 預設商家圖片
			File file = new File(getServletContext().getRealPath("/img/ComDefaultPic.jpg"));
			System.out.println(file.exists());
			byte[] comPic = new byte[(int) file.length()];
			try {
				BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
				in.read(comPic);
				sos = res.getOutputStream();
				sos.write(comPic);
				sos.flush();
				sos.close();
				in.close();
//				BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
//				in.read(comPic);
//				BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream("C:\\images\\testfile\\pic2.jpg"));
//				out.write(comPic);
//				out.flush();
//				out.close();
//				in.close();
			} catch(Exception e) {
		        e.printStackTrace();
			}
		}
	} // end doGet()
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
