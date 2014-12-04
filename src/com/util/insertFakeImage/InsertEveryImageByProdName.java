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
	
		try{//-------------汽車區域------------------------------
			insertFakeImg.InsertImagesByProdName("Benz-E-320","WebContent/img/demoCars/BENZ_M320_01.jpg","WebContent/img/demoCars/BENZ_M320_02.jpg","WebContent/img/demoCars/BENZ_M320_03.jpg","WebContent/img/demoCars/BENZ_M320_04.jpg");
			insertFakeImg.InsertImagesByProdName("Ferrari-458", "WebContent/img/demoCars/FERRARI_458_01.jpg", "WebContent/img/demoCars/FERRARI_458_02.jpg", "WebContent/img/demoCars/FERRARI_458_03.jpg", "WebContent/img/demoCars/FERRARI_458_04.jpg");
			insertFakeImg.InsertImagesByProdName("Mini-Cooper-2014", "WebContent/img/demoCars/MINI_COOPER_01.jpg", "WebContent/img/demoCars/MINI_COOPER_02.jpg", "WebContent/img/demoCars/MINI_COOPER_03.jpg", "WebContent/img/demoCars/MINI_COOPER_04.jpg");
			insertFakeImg.InsertImagesByProdName("馬自達-3","WebContent/img/demoCars/m3_01.jpg","WebContent/img/demoCars/m3_02.jpg","WebContent/img/demoCars/m3_03.jpg","WebContent/img/demoCars/m3_04.jpg");
			insertFakeImg.InsertImagesByProdName("豐田-Yaris","WebContent/img/demoCars/Toyota_01.jpg","WebContent/img/demoCars/Toyota_02.jpg","WebContent/img/demoCars/Toyota_03.jpg","WebContent/img/demoCars/Toyota_04.jpg");
			insertFakeImg.InsertImagesByProdName("保時捷-911","WebContent/img/demoCars/porsche_01.jpg","WebContent/img/demoCars/porsche_02.jpg","WebContent/img/demoCars/porsche_03.jpg","WebContent/img/demoCars/porsche_04.jpg");
			//-------------機車區域------------------------------
			insertFakeImg.InsertImagesByProdName("野狼125", "WebContent/img/demoCars/125-1.jpg", "WebContent/img/demoCars/125-2.jpg", "WebContent/img/demoCars/125-3.jpg", "WebContent/img/demoCars/125-4.jpg");
			insertFakeImg.InsertImagesByProdName("Yamaha-CUXI", "WebContent/img/demoCars/CUXi-01.jpg", "WebContent/img/demoCars/CUXi-02.jpg", "WebContent/img/demoCars/CUXi-03.jpg", "WebContent/img/demoCars/CUXi-04.jpg");
			insertFakeImg.InsertImagesByProdName("Yamaha BWS", "WebContent/img/demoCars/BWS-01.jpg", "WebContent/img/demoCars/BWS-02.jpg", "WebContent/img/demoCars/BWS-03.jpg", "WebContent/img/demoCars/BWS-04.jpg");
			//-------------腳踏車區域------------------------------
			insertFakeImg.InsertImagesByProdName("捷安特GreatJourney", "WebContent/img/demoCars/GJ1-1.jpg", "WebContent/img/demoCars/GJ1-2.jpg", "WebContent/img/demoCars/GJ1-3.jpg", "WebContent/img/demoCars/GJ1-4.jpg");
			insertFakeImg.InsertImagesByProdName("MERIDA-FB-106", "WebContent/img/demoCars/m-1.jpg", "WebContent/img/demoCars/m-2.jpg", "WebContent/img/demoCars/m-3.jpg", "WebContent/img/demoCars/m-4.jpg");
			insertFakeImg.InsertImagesByProdName("Audi電動腳踏車", "WebContent/img/demoCars/A-1.jpg", "WebContent/img/demoCars/A-2.jpg", "WebContent/img/demoCars/A-3.jpg", "WebContent/img/demoCars/A-4.jpg");
			
//			這是商品和配備的分隔線 不要加錯邊
			insertFakeImg.InsertImagesByAccName("黃色小鴨游泳圈", "WebContent/img/demoAcc/duck.jpg");
			insertFakeImg.InsertImagesByAccName("很普通游泳圈", "WebContent/img/demoAcc/circle.jpg");
			insertFakeImg.InsertImagesByAccName("童玩節單日暢遊卷2張", "WebContent/img/demoAcc/coupon01.jpg");
			insertFakeImg.InsertImagesByAccName("童玩節好吃餐卷2張", "WebContent/img/demoAcc/coupon02.jpg");
			insertFakeImg.InsertImagesByAccName("對講機全罩安全帽2頂", "WebContent/img/demoAcc/helmet.jpg");
			insertFakeImg.InsertImagesByAccName("清靜農場哞哞午餐卷2張", "WebContent/img/demoAcc/coupon03.jpg");
			insertFakeImg.InsertImagesByAccName("小人國遊樂園入場卷2張", "WebContent/img/demoAcc/coupon04.jpg");
			insertFakeImg.InsertImagesByAccName("尾掛置物箱", "WebContent/img/demoAcc/storage.jpg");
			System.out.println("End");
		}catch(Exception e){
			
		}finally {
			ConnectionUtil.closeConnection(conn);
		}
	}

}
