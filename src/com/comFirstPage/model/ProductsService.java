package com.comFirstPage.model;

import java.util.List;

public class ProductsService {
	private ProductsDAO_interface dao;
	
	public ProductsService() {
		dao = new ProductsDAO();
	}

	public List<ProductVO> getProdsByComId(int comId) {
		return dao.getProdsByComId(comId);
	}
	
	public List<ProductVO> getProdsByComIdNoRepeat(int comId) {
		return dao.getProdsByComIdNoRepeat(comId);
	}

	public List<ProductVO> getAll() {
		return dao.getAll();
	}
}
