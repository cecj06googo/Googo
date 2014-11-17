package com.comFirstPage.model;

import java.util.List;

public class ProductsService {
	private ProductsDAO_interface dao;
	
	public ProductsService() {
		dao = new ProductsDAO();
	}

	public List<ProductVO> getProdsByComId(int prodId) {
		return dao.getProdsByComId(prodId);
	}

	public List<ProductVO> getAll() {
		return dao.getAll();
	}
}
