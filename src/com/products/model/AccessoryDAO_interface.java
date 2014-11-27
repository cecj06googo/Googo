package com.products.model;

import java.util.List;

public interface AccessoryDAO_interface {

	void insert(AccessoryVO accVO);

	List<AccessoryVO> getAll(AccessoryVO accVO);

	void delete(int accId);

	void edit(AccessoryVO accVO);

}
