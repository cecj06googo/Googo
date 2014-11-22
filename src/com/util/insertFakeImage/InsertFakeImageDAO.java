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
	
	public void insertComImg(String srcPath){
		String insertStmt = "UPDATE Company  SET com_pic = ? WHERE com_id = ?";
		File[] files;
		
		List<String> comids = blobDemo.getComid("Company");
		ListDir listdir = new ListDir(srcPath);//不同車種會有不同資料夾路徑
		int totalComs = comids.size();//資料庫中該車種的總量
		if (totalComs > listdir.getTotalFilesNum()) {
			System.out.println("警告!!coms總數大於圖片");//只是提示用
		}
		if (!listdir.checkIlegal()) { //檢查是否寫入的照片格式是否正確，若錯誤則中止
			System.out.println("錯誤:照片資料檢查錯誤!!");
			return;
		}
		files = listdir.getFiles();//取得所有照片的Files
		int totalPics = files.length;//準備寫入的照片總量
		try {
			stmt = conn.prepareStatement(insertStmt);
			for (int i = 0; i < totalComs; i++) {
				FileInputStream fis = new FileInputStream(files[i%totalPics]); //若有重複則從第一張圖開始只有Files裡面放		
				stmt.setBinaryStream(1, fis, (int) files[i%totalPics].length()); //若有重複則從第一張圖開始只有Files裡面放
				stmt.setString(2,comids.get(i));// 檔名
				//System.out.println("prodids.get(i)="+comids.get(i));
				//System.out.println("i%totalPics="+(i%totalPics));
				//System.out.println("files[i%totalPics]="+files[i%totalPics]);
				stmt.addBatch();// 批次處理使用此
			}
			stmt.executeBatch();
			System.out.println("========================================================");
			System.out.println("insertComImg is successful!");
			System.out.println("========================================================");
		} catch (Exception e) {
			System.out.println("insertComImg 錯誤");
			ConnectionUtil.closeConnection(conn);
			e.printStackTrace();
		}
	}

	public void insertProdImgByCarType(String prod_type_value, String srcPath) {
		// 目的:根據不同的車種讀取該車種的數量，再根據數量來寫入該車種的圖片
		String insertStmt = "UPDATE Product  SET prod_subPic1 = ? WHERE prod_id = ?";
		File[] files;
		//根據車種取得該車種的所有id
		List<String> prodids = blobDemo.getProdidsbyCarType("Product",
				"prod_type", prod_type_value);
		ListDir listdir = new ListDir(srcPath);//不同車種會有不同資料夾路徑
		int totalProds = prodids.size();//資料庫中該車種的總量
		
		if (totalProds > listdir.getTotalFilesNum()) {
			System.out.println("警告!!prods總數大於圖片");//只是提示用
		}
		if (!listdir.checkIlegal()) { //檢查是否寫入的照片格式是否正確，若錯誤則中止
			System.out.println("========================================================");
			System.out.println("insertProdImgByCarType="+prod_type_value+" is Failed!");
			System.out.println("錯誤:照片資料檢查錯誤!!");
			System.out.println("========================================================");
			return;
		}
		files = listdir.getFiles();//取得所有照片的Files
		int totalPics = files.length;//準備寫入的照片總量
		try {
			stmt = conn.prepareStatement(insertStmt);
			for (int i = 0; i < totalProds; i++) {
				FileInputStream fis = new FileInputStream(files[i%totalPics]); //若有重複則從第一張圖開始只有Files裡面放		
				stmt.setBinaryStream(1, fis, (int) files[i%totalPics].length()); //若有重複則從第一張圖開始只有Files裡面放
				stmt.setString(2,prodids.get(i));// 檔名
				//System.out.println("prodids.get(i)="+prodids.get(i));
				//System.out.println("i%totalPics="+(i%totalPics));
				//System.out.println("files[i%totalPics]="+files[i%totalPics]);
				stmt.addBatch();// 批次處理使用此
			}
			stmt.executeBatch();
			System.out.println("========================================================");
			System.out.println("insertImgByCarType= "+prod_type_value +" is successful!");
			System.out.println("========================================================");
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
		String carSrcPath = "WebContent/img/cars";
		String motorSrcPath = "WebContent/img/motors";
		String bikeSrcPath = "WebContent/img/bikes";
		String comSrcPath = "WebContent/img/company";
		
		try {
			if (conn == null) {
				System.out.println("conn 獲取失敗");
				return;
			}
			insertFakeImg.insertProdImgByCarType("1", carSrcPath);// 汽車
			insertFakeImg.insertProdImgByCarType("2", motorSrcPath);//機車
			insertFakeImg.insertProdImgByCarType("3", bikeSrcPath);//腳踏車
			insertFakeImg.insertComImg(comSrcPath); //公司大頭貼
			System.out.println("圖片寫入結束，執行結果請看上方!");
		} catch (Exception e) {
			System.out.println("InsertFakeImageDAO 錯誤");
			e.printStackTrace();
		} finally {
			ConnectionUtil.closeConnection(conn);
		}
	}// public static void main
}// end public class InsertFakeImageDAO
