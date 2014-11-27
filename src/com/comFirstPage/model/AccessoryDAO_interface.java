package com.comFirstPage.model;

import java.util.List;

public interface AccessoryDAO_interface {

	void insert(AccessoryVO accVO);

	List<AccessoryVO> getAll(AccessoryVO accVO);

	void delete(int accId);

	void edit(AccessoryVO accVO);
	public List<AccessoryVO> getAccVosByComId(int ComId);

}
