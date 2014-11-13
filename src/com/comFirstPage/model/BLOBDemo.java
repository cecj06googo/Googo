package com.comFirstPage.model;

import java.sql.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BLOBDemo extends HttpServlet{  //該主要流程是把一張圖片存進資料庫，再從資料庫讀出後存成另外一張圖片
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Connection conn = null;
		try {     
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=GGDB";
			conn = DriverManager.getConnection(connUrl, "sa", "sa123456");
			
			String prod_id="1";
			String srcPicPath = getServletContext().getRealPath("/img/car1.jpg");
			String outPicPath=  getServletContext().getRealPath("/img/Copycar1.jpg");
			
			String qryStmt = "SELECT prod_subPic1 FROM Product WHERE prod_id = ?";//做為檢察是否已存在該圖片
			PreparedStatement stmt = conn.prepareStatement(qryStmt); 
			
			stmt.setString(1,prod_id); //檢查該id是否存在圖片
			ResultSet rs = stmt.executeQuery();
//			if (rs.next()) {//如果已經有此圖片則刪除該圖片
//				String deleteStmt = "UPDATE Product SET prod_subPic1 = null WHERE prod_id = ?"; 
//				stmt = conn.prepareStatement(deleteStmt);//共用stmt即可，不需要再prepared一個
//				stmt.setString(1, prod_id);
//				stmt.executeUpdate();
//				System.out.println("Delete blob is successful!");
//			}

			File f = new File(srcPicPath); //標準的檔案開啟流程 準備讀取圖片寫入資料庫
			FileInputStream fis = new FileInputStream(f);
			String insertStmt = "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?";		
			stmt = conn.prepareStatement(insertStmt);
			stmt.setBinaryStream(1, fis, (int)f.length()); //2是第二個參數，fis是該檔fileinputstring,f.length是該圖片大小
			stmt.setString(2, prod_id);//檔名
			stmt.executeUpdate();//insert update使用此
			System.out.println("Insert blob is successful!");
	
			f = new File(outPicPath); //要寫出的圖片檔名 :從資料庫讀出寫入圖片
			stmt = conn.prepareStatement(qryStmt);
			stmt.setString(1, prod_id);//要被複製的id名稱
			rs = stmt.executeQuery();
			if (rs.next()) {//如果資料庫有該檔名才複製出來
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(f));//標準寫檔流程
				Blob b = rs.getBlob("prod_subPic1");
				byte[] data = b.getBytes(1, (int)b.length());//因為檔案很大，所以要拆成byte陣列來儲存，1 is the first byte
				bos.write(data, 0, (int)b.length()); //bos是要寫入file的參照，將data的byte陣列，從0(最開頭)，以及該data大小
				//JAVA 0起頭  資料庫 1 起頭
				bos.close();
				System.out.println("File output is successful!");
			} // end of if (rs.next()) 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null){
				try {
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
				
		}
	}// end of main()
}// end of class BLOBDemo 
