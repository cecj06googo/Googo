package com.member.model;

import java.util.List;
import java.util.Map;

  
public interface MemDAO_interface {
	 public void insert(MemVO memVO);
     public void update(MemVO memVO);
     public void delete(Integer mem_id);
     public MemVO findByPrimaryKey(Integer mem_id);
     public List<MemVO> getAll();
     public List<MemVO> getAll(Map<String, String[]> map); 
     
}
