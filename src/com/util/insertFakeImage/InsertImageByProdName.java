package com.util.insertFakeImage;

import java.sql.Connection;

import com.util.ConnectionUtil;

public class InsertImageByProdName {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn;
		ConnectionUtil conutil = new ConnectionUtil();
		conn = conutil.getConnection();
		InsertFakeImageDAO insertFakeImg = new InsertFakeImageDAO(conn);
		String prodName="賓士320";
		//以下四行是範例
		//String srcMainProdPic = "WebContent/img/test/beauty1.jpg";		
		//String srcSub1Pic = "WebContent/img/test/beauty2.jpg";
		//String srcSub2Pic = "WebContent/img/test/beauty1.jpg";
		//String srcSub3Pic = "WebContent/img/test/beauty2.jpg";
		String srcMainProdPic ="自己打";
		String srcSub1Pic = "自己打";
		String srcSub2Pic = "自己打";
		String srcSub3Pic = "自己打";
		try{
		insertFakeImg.InsertImagesByProdName(prodName, srcMainProdPic, srcSub1Pic, srcSub2Pic, srcSub3Pic);
		}catch(Exception e){
			
		}finally {
			ConnectionUtil.closeConnection(conn);
		}
	}

}
