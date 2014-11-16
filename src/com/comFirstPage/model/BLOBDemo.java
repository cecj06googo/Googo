package com.comFirstPage.model;

import java.sql.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.util.*;

public class BLOBDemo { // 該主要流程是把一張圖片存進資料庫，再從資料庫讀出後存成另外一張圖片
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	File f;

	// 建構子
	BLOBDemo(Connection conn) {
		this.conn = conn;
	}

	public void writeInSQL(String prod_id, String srcPicPath) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String insertStmt = "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?";
		try {
			f = new File(srcPicPath); // 標準的檔案開啟流程 準備讀取圖片寫入資料庫
			FileInputStream fis = new FileInputStream(f);
			stmt = conn.prepareStatement(insertStmt);// "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?"
			stmt.setBinaryStream(1, fis, (int) f.length()); // 2是第二個參數，fis是該檔fileinputstring,f.length是該圖片大小
			stmt.setString(2, prod_id);// 檔名
			stmt.executeUpdate();// insert update使用此
			System.out.println("Insert blob is successful!");
		} catch (Exception e) {
			System.out.println("writeInSQL 錯誤");
			e.printStackTrace();
		}
	}

	public void clearBlob(String prod_id) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String clearStmt = "UPDATE Product SET prod_subPic1 = null WHERE prod_id = ?";
		try {
			stmt = conn.prepareStatement(clearStmt);
			stmt.setString(1, prod_id);// 檔名
			stmt.executeUpdate();// insert update使用此
			System.out.println("Clear VARBINARY is successful!");
		} catch (Exception e) {
			System.out.println("clearBlob 錯誤");
			e.printStackTrace();
		}
	}

	public void readBlobfromSQL(String prod_id, String outPicPath) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String qryStmt = "SELECT prod_subPic1 FROM Product WHERE prod_id = ?";
		try {
			f = new File(outPicPath); // 要寫出的圖片檔名 :從資料庫讀出寫入圖片
			stmt = conn.prepareStatement(qryStmt);// "SELECT prod_subPic1 FROM Product WHERE prod_id = ?"
			stmt.setString(1, prod_id);// 要被複製的id名稱
			rs = stmt.executeQuery();
			if (rs.next()) {// 如果資料庫有該檔名才複製出來
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(f));// 標準寫檔流程
				Blob b = rs.getBlob("prod_subPic1");
				byte[] data = b.getBytes(1, (int) b.length());// 因為檔案很大，所以要拆成byte陣列來儲存，1
																// is the first
																// byte
				bos.write(data, 0, (int) b.length()); // bos是要寫入file的參照，將data的byte陣列，從0(最開頭)，以及該data大小
				// JAVA 0起頭 資料庫 1 起頭
				bos.close();
				System.out.println("File output is successful!");
			} // end of if (rs.next())
		} catch (Exception e) {
			System.out.println("readBlobfromSQL 錯誤");
			e.printStackTrace();
		}
	}

	public String getCountOfProductId() {
		String countNum = null;
		String countQry = "select count(prod_id) as count from Product";
		try {
			stmt = conn.prepareStatement(countQry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				countNum=rs.getString("count");
			}
		} catch (Exception e) {
			System.out.println("getCountOfProductId 錯誤");
			e.printStackTrace();
		}
		return countNum;
	}

	public static void main(String args[]) {
		String srcPicPath = "WebContent/img/car2.jpg";
		String outPicPath = "WebContent/img/Copycar1.jpg";
		Connection conn;
		ConnectionUtil conutil = new ConnectionUtil();
		conn = conutil.getConnection();
		try {
			if (conn == null) {
				System.out.println("conn 獲取失敗");
				return;
			}
			BLOBDemo blobdemo = new BLOBDemo(conn);
			// blobdemo.clearBlob("1");
			//blobdemo.writeInSQL("1", srcPicPath);
			//blobdemo.readBlobfromSQL("1", outPicPath);
			//System.out.println(blobdemo.getCountOfProductId());
		} catch (Exception e) {
			System.out.println("readBlobfromSQL 錯誤");
			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(conn);
		}
	}
}// end of class BLOBDemo
