package com.comFirstPage.model;

import java.util.List;

public interface ProductsDAO_interface {
	void delete(int prodId);
	void insert(ProductVO ProductVO);
	List<ProductVO> getAll();
	List<ProductVO> getProdsByComId(int prodId);
	List<ProductVO> getProdsByComIdNoRepeat(int comId);
}
