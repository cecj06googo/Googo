package com.company.model;

import java.util.List;

public interface ICompanyDAO {
	
	public void insert(CompanyVO comVO);
	public void update(CompanyVO comVO);
	public void delete(Integer comID);
	public CompanyVO findByPrimaryKey(Integer comID);
	public Integer findByPrimaryKey(String comHashURL);
    public List<CompanyVO> getAll();
}
