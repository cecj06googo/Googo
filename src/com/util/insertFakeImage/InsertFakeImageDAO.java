package com.util.insertFakeImage;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.ConnectionUtil;

import java.sql.*;
import java.util.List;
import java.io.*;

import com.util.*;

public class InsertFakeImageDAO {
	Connection conn;
	BLOBDemo blobDemo;
	PreparedStatement stmt;
	ResultSet rs;
	File f;

	InsertFakeImageDAO(Connection conn) {
		this.conn = conn;
		this.blobDemo = new BLOBDemo(conn);
	}

	public void insertImgByCarType(String prod_type_value, String srcPath) {
		// 目的:根據不同的車種讀取該車種的數量，再根據數量來寫入該車種的圖片
		String insertStmt = "UPDATE Product  SET prod_subPic1 = ? WHERE prod_id = ?";
		File[] files;
		List<String> prodids = blobDemo.getProdidsbyCarType("Product",
				"prod_type", prod_type_value);
		ListDir listdir = new ListDir(srcPath);
		int totalProds = prodids.size();
		
		if (totalProds > listdir.getTotalFilesNum()) {
			System.out.println("警告!!prods總數大於圖片");
			//return;
		}
		if (!listdir.checkIlegal()) {
			System.out.println("錯誤:照片資料檢查錯誤!!");
			return;
		}
		files = listdir.getFiles();
		int totalPics = files.length;
		try {
			stmt = conn.prepareStatement(insertStmt);
			for (int i = 0; i < totalProds; i++) {
				FileInputStream fis = new FileInputStream(files[i%totalPics]); //若有重複則從第一張圖開始只有Files裡面放		
				stmt.setBinaryStream(1, fis, (int) files[i%totalPics].length()); //若有重複則從第一張圖開始只有Files裡面放
				stmt.setString(2,prodids.get(i));// 檔名
				System.out.println("prodids.get(i)="+prodids.get(i));
				System.out.println("i%totalPics="+(i%totalPics));
				System.out.println("files[i%totalPics]="+files[i%totalPics]);
				stmt.addBatch();// 批次處理使用此
			}
			stmt.executeBatch();
			System.out.println("insertImgByCarType is successful!");
		} catch (Exception e) {
			System.out.println("insertImgByCarType 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}
	// 需要一個根據不同車種會讀回prod_id的陣列
	public static void main(String[] args) {
		Connection conn;
		ConnectionUtil conutil = new ConnectionUtil();
		conn = conutil.getConnection();
		InsertFakeImageDAO insertFakeImg = new InsertFakeImageDAO(conn);

		String srcPath = "WebContent/img/cars";
		try {
			if (conn == null) {
				System.out.println("conn 獲取失敗");
				return;
			}
			insertFakeImg.insertImgByCarType("1", srcPath);// 汽車

		} catch (Exception e) {
			System.out.println("InsertFakeImageDAO 錯誤");
			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(conn);
		}
	}// public static void main
}// end public class InsertFakeImageDAO
