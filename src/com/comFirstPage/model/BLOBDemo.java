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

	public void batchWriteInSQL(String srcPicPath, String tableName,
			String columnName) {// 練習batch用
		// 因為沒有close connection 所以最外層要記得用finally去close
		String insertStmt = "UPDATE " + tableName + " SET " + columnName
				+ " = ? WHERE prod_id = ?";
		int countNum = Integer.parseInt(getCountOfProductId("prod_id",
				"Product"));
		try {
			stmt = conn.prepareStatement(insertStmt);// "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?"
			for (int i = 0; i < countNum; i++) {
				f = new File(srcPicPath); // 標準的檔案開啟流程 準備讀取圖片寫入資料庫
				FileInputStream fis = new FileInputStream(f); // 這兩行必須放在for迴圈裡面
				stmt.setBinaryStream(1, fis, (int) f.length()); // 2是第二個參數，fis是該檔fileinputstring,f.length是該圖片大小
				stmt.setString(2, Integer.toString(i + 1));
				stmt.addBatch();// 批次處理使用此
			}
			stmt.executeBatch();
			System.out.println("批次寫入所有圖片成功!");
		} catch (Exception e) {
			System.out.println("batchWriteInSQL 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void AllWriteInSQL(String srcPicPath, String tableName,
			String columnName) {// 練習batch用
		String insertStmt = "UPDATE " + tableName + " SET " + columnName
				+ " = ?";
		try {
			f = new File(srcPicPath); // 標準的檔案開啟流程 準備讀取圖片寫入資料庫
			FileInputStream fis = new FileInputStream(f);
			stmt = conn.prepareStatement(insertStmt);// "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?"
			stmt.setBinaryStream(1, fis, (int) f.length()); // 2是第二個參數，fis是該檔fileinputstring,f.length是該圖片大小
			stmt.executeUpdate();// insert update使用此
			System.out.println("AllWriteInSQL is successful!");
		} catch (Exception e) {
			System.out.println("AllWriteInSQL 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void singleWriteInSQL(String srcPicPath,
			String tableName, String columnName,String whereColumn,String whereValue) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String insertStmt = "UPDATE " + tableName + " SET " + columnName
				+ " = ? WHERE "+whereColumn+" = ?";
		try {
			f = new File(srcPicPath); // 標準的檔案開啟流程 準備讀取圖片寫入資料庫
			FileInputStream fis = new FileInputStream(f);
			stmt = conn.prepareStatement(insertStmt);// "UPDATE Product SET prod_subPic1 = ? WHERE prod_id = ?"
			stmt.setBinaryStream(1, fis, (int) f.length()); // 2是第二個參數，fis是該檔fileinputstring,f.length是該圖片大小
			stmt.setString(2, whereValue);// 檔名
			stmt.executeUpdate();// insert update使用此
			System.out.println("Insert blob into "+tableName+" is successful!");
		} catch (Exception e) {
			System.out.println("singleWriteInSQL 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void clearBlob(String prod_id, String tableName, String columnName) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String clearStmt = "UPDATE " + tableName + " SET " + columnName
				+ " = null WHERE prod_id = ?";
		try {
			stmt = conn.prepareStatement(clearStmt);
			stmt.setString(1, prod_id);// 檔名
			stmt.executeUpdate();// insert update使用此
			System.out.println("Clear VARBINARY is successful!");
		} catch (Exception e) {
			System.out.println("clearBlob 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void clearAllBlob(String tableName, String columnName) {
		String clearAllStmt = "UPDATE " + tableName + " SET " + columnName
				+ " = null";
		try {
			stmt = conn.prepareStatement(clearAllStmt);
			stmt.executeUpdate();// insert update使用此
			System.out.println("Clear Table:"+tableName+" AllPicture is successful!");
		} catch (Exception e) {
			System.out.println("clearAllBlob 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void readBlobfromSQL(String outPicPath,
			String tableName, String columnName,String whereColumn,String whereValue) {
		// 因為沒有close connection 所以最外層要記得用finally去close
		String qryStmt = "SELECT " + columnName + " FROM " + tableName
				+ " WHERE "+whereColumn+" = ?";
		try {
			f = new File(outPicPath); // 要寫出的圖片檔名 :從資料庫讀出寫入圖片
			stmt = conn.prepareStatement(qryStmt);// "SELECT prod_subPic1 FROM Product WHERE prod_id = ?"
			stmt.setString(1, whereValue);// 要被複製的id名稱
			rs = stmt.executeQuery();
			if (rs.next()) {// 如果資料庫有該檔名才複製出來
				BufferedOutputStream bos = new BufferedOutputStream(
						new FileOutputStream(f));// 標準寫檔流程
				Blob b = rs.getBlob(columnName);
				byte[] data = b.getBytes(1, (int) b.length());// 因為檔案很大，所以要拆成byte陣列來儲存，1
																// is the first
																// byte
				bos.write(data, 0, (int) b.length()); // bos是要寫入file的參照，將data的byte陣列，從0(最開頭)，以及該data大小
				// JAVA 0起頭 資料庫 1 起頭
				bos.close();
				System.out.println("Read Pic from "+tableName+" is successful!");
			} // end of if (rs.next())
		} catch (Exception e) {
			System.out.println("readBlobfromSQL 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public String getCountOfProductId(String countName, String tableName) {
		String countNum = null;
		String countQry = "select count(" + countName + ") as count from "
				+ tableName;
		try {
			stmt = conn.prepareStatement(countQry);
			rs = stmt.executeQuery();
			if (rs.next()) {
				countNum = rs.getString("count");
			}
		} catch (Exception e) {
			System.out.println("getCountOfProductId 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();			
		}
		System.out.println("The count of " + countName + " = " + countNum);
		return countNum;
	}

	public static void main(String args[]) {
		String srcPicPath = "WebContent/img/car2.jpg";
		String outPicPath = "WebContent/img/CopyCompany1.jpg";
		Connection conn;
		ConnectionUtil conutil = new ConnectionUtil();
		conn = conutil.getConnection();
		try {
			if (conn == null) {
				System.out.println("conn 獲取失敗");
				return;
			}
			BLOBDemo blobdemo = new BLOBDemo(conn);
			blobdemo.AllWriteInSQL(srcPicPath,"Product","prod_subPic1");//一次寫入Product Table該欄位所有圖片
			//blobdemo.clearAllBlob("Product","prod_subPic1");//清除該ProdTable欄位所有圖片
			//blobdemo.clearAllBlob("Company","com_pic");//清除該CompanyTable欄位所有圖片
			// blobdemo.batchWriteInSQL(srcPicPath,"Product","prod_subPic1");//批次寫入該table欄位所有圖片
			// blobdemo.clearBlob("1","Product","prod_subPic1");//清除單個圖片
			 //  blobdemo.singleWriteInSQL(srcPicPath,"Company","com_pic","com_id","1");//寫入Company單張圖片;
			//blobdemo.singleWriteInSQL(srcPicPath,"Product","prod_subPic1","prod_id","1");//寫入Product單張圖片;
			 //  blobdemo.readBlobfromSQL(outPicPath,"Company","com_pic","com_id","1");//讀出單張圖片
			// blobdemo.getCountOfProductId("prod_id","Product");//讀出胎table欄位有幾個
		} catch (Exception e) {
			System.out.println("readBlobfromSQL 錯誤");
			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(conn);
		}
	}
}// end of class BLOBDemo
