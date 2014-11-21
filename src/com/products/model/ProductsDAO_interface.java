package com.products.model;

import java.util.List;

public interface ProductsDAO_interface {
	void delete(int prodId);
	void insert(ProductVO ProductVO);
	List<ProductVO> getAll(ProductVO ProductVO);
	void edit(ProductVO productVO);
}
