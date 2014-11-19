package com.products.model;

public class TestService {
	 private ProductsDAO_interface dao;
		
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ProductsDAO dao = new ProductsDAO();
		ProductVO ProductVO = new ProductVO();
		
		//測試用
		ProductVO.setComId(18);
		ProductVO.setProdName("!Aesrvice");
		ProductVO.setProdType(1);
		
		ProductVO.setProdPrice(1013);
		ProductVO.setProdDisc(1.1);
		
  	 	byte[] bs = new byte[4];
  	 	bs[1]=1;
  	 	ProductVO.setProdPic(bs);
		ProductVO.setProdArticle("testService測試");
		ProductVO.setProdSubPic1(bs);

		ProductVO.setProdSubPic2(bs);
		ProductVO.setProdKind(1);
		ProductVO.setProdCc(1);
		ProductVO.setProdCarrier(1);
		ProductVO.setProdControl(1);
		ProductVO.setProdId(54);
		ProductVO.setProdPlate("ttt-11");
		ProductVO.setProdStatus(1);
		 
//		System.out.println(ProductsVO.getProdDisc());
//		System.out.println(ProductPlateVO.getPlateId());
//		System.out.println(ProductPlateVO.getProdId());
//		System.out.println(ProductPlateVO.getPlateStatus());
//		dao.delete(52);
//		dao.insert(ProductVO);
		dao.edit(ProductVO);
//		dao.getAll(ProductsVO);
//		for(ProductsVO aBookBean :dao.getAll(ProductsVO)){
//			System.out.println(aBookBean.getProdName());
//		
//		}
		
		
		

	}

}
