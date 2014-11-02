package com.search.model;

import java.util.List;
import java.util.Set;

public interface SearchComDAO_interface {
	
	public SearchComVO findByPrimaryKey(Integer com_id);
	public List<SearchComVO> SearchByCondition(String location,Integer prod_type , String keySearch);
}
