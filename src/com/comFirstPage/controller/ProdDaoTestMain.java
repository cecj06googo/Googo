package com.comFirstPage.controller;

import java.util.ArrayList;
import java.util.List;

import com.comFirstPage.model.*;

public class ProdDaoTestMain {

	public static void main(String[] args) {
		ProductsService prodService=new ProductsService() ;
		//取得商家id為1的公司其所有產品資訊
		List<ProductVO> vos = new ArrayList<ProductVO>();
		vos = prodService.getProdsByComId(1);
		for (ProductVO vo : vos) {
			System.out.println("getProdId=" + vo.getProdId());
			System.out.println("getComId=" + vo.getComId());
			System.out.println("getProdName=" + vo.getProdName());
			System.out.println("getProdType=" + vo.getProdType());
			System.out.println("getProdPrice=" + vo.getProdPrice());
			System.out.println("getProdDisc=" + vo.getProdDisc());
			System.out.println("getProdPic=" + vo.getProdPic());
			System.out.println("getProdArticle=" + vo.getProdArticle());
			System.out.println("getProdSubPic1=" + vo.getProdSubPic1());
			System.out.println("getProdSubPic2=" + vo.getProdSubPic2());
			System.out.println("getProdSubPic3=" + vo.getProdSubPic3());
			System.out.println("getProdKind=" + vo.getProdKind());
			System.out.println("getProdCc=" + vo.getProdCc());
			System.out.println("getProdCarrier=" + vo.getProdCarrier());
			System.out.println("getProdControl=" + vo.getProdControl());
			System.out.println("getProdPlate=" + vo.getProdPlate());
			System.out.println("getProdStatus=" + vo.getProdStatus());
			System.out.println("----------------------------------------------");
		}
	    //取得所有公司產品資訊
		List<ProductVO> vos2 = new ArrayList<ProductVO>();
		vos2 = prodService.getAll();
		for (ProductVO vo : vos2) {
			System.out.println("getProdId=" + vo.getProdId());
			System.out.println("getComId=" + vo.getComId());
			System.out.println("getProdName=" + vo.getProdName());
			System.out.println("getProdType=" + vo.getProdType());
			System.out.println("getProdPrice=" + vo.getProdPrice());
			System.out.println("getProdDisc=" + vo.getProdDisc());
			System.out.println("getProdPic=" + vo.getProdPic());
			System.out.println("getProdArticle=" + vo.getProdArticle());
			System.out.println("getProdSubPic1=" + vo.getProdSubPic1());
			System.out.println("getProdSubPic2=" + vo.getProdSubPic2());
			System.out.println("getProdSubPic3=" + vo.getProdSubPic3());
			System.out.println("getProdKind=" + vo.getProdKind());
			System.out.println("getProdCc=" + vo.getProdCc());
			System.out.println("getProdCarrier=" + vo.getProdCarrier());
			System.out.println("getProdControl=" + vo.getProdControl());
			System.out.println("getProdPlate=" + vo.getProdPlate());
			System.out.println("getProdStatus=" + vo.getProdStatus());
			System.out.println("----------------------------------------------");
		}
	}

}
