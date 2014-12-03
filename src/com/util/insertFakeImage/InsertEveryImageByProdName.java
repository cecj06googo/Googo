package com.util.insertFakeImage;

import java.sql.Connection;

import com.util.ConnectionUtil;

public class InsertEveryImageByProdName {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn;
		ConnectionUtil conutil = new ConnectionUtil();
		conn = conutil.getConnection();
		InsertFakeImageDAO insertFakeImg = new InsertFakeImageDAO(conn);
		String prodName="賓士E-320";
		String srcMainProdPic ="WebContent/img/demoCars/BENZ_M320_01.jpg";
		String srcSub1Pic = "WebContent/img/demoCars/BENZ_M320_02.jpg";
		String srcSub2Pic = "WebContent/img/demoCars/BENZ_M320_03.jpg";
		String srcSub3Pic = "WebContent/img/demoCars/BENZ_M320_04.jpg";
		InsertFakeImageDAO c2 = new InsertFakeImageDAO(conn);
		
		try{
			insertFakeImg.InsertImagesByProdName(prodName, srcMainProdPic, srcSub1Pic, srcSub2Pic, srcSub3Pic);
			insertFakeImg.InsertImagesByProdName("法拉利458", "WebContent/img/demoCars/FERRARI_458_01.jpg", "WebContent/img/demoCars/FERRARI_458_02.jpg", "WebContent/img/demoCars/FERRARI_458_03.jpg", "WebContent/img/demoCars/FERRARI_458_04.jpg");
			insertFakeImg.InsertImagesByProdName("Mini-Cooper-2014", "WebContent/img/demoCars/MINI_COOPER_01.jpg", "WebContent/img/demoCars/MINI_COOPER_02.jpg", "WebContent/img/demoCars/MINI_COOPER_03.jpg", "WebContent/img/demoCars/MINI_COOPER_04.jpg");
			insertFakeImg.InsertImagesByProdName("野狼125", "WebContent/img/demoCars/125-1.jpg", "WebContent/img/demoCars/125-2.jpg", "WebContent/img/demoCars/125-3.jpg", "WebContent/img/demoCars/125-4.jpg");
			insertFakeImg.InsertImagesByProdName("捷安特GreatJourney", "WebContent/img/demoCars/GJ1-1.jpg", "WebContent/img/demoCars/GJ1-2.jpg", "WebContent/img/demoCars/GJ1-3.jpg", "WebContent/img/demoCars/GJ1-4.jpg");
			insertFakeImg.InsertImagesByAccName("黃色小鴨游泳圈", "WebContent/img/demoAcc/duck.jpg");
			insertFakeImg.InsertImagesByAccName("很普通游泳圈", "WebContent/img/demoAcc/circle.jpg");
			insertFakeImg.InsertImagesByAccName("童玩節單日暢遊卷2張", "WebContent/img/demoAcc/coupon01.jpg");
			insertFakeImg.InsertImagesByAccName("童玩節好吃餐卷2張", "WebContent/img/demoAcc/coupon02.jpg");
			System.out.println("End");
		}catch(Exception e){
			
		}finally {
			ConnectionUtil.closeConnection(conn);
		}
	}

}
