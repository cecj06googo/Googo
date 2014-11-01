package com.search.model;

import java.util.Set;

public class SearchService {
	SearchComDAO_interface dao;
	public SearchService() {
		dao = new SearchComDAO();
	}
	public SearchComVO getOneCom(Integer com_id) {
		return dao.findByPrimaryKey(com_id);
	}
	public Set<SearchComVO> getCompanysByCondition(String location,Integer prod_type,String keySearch) {
		return dao.SearchByCondition(location,prod_type ,keySearch);
	}
}
