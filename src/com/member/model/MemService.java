package com.member.model;

import java.util.List;
import java.util.Map;
  
public class MemService {
 
	private MemDAO_interface dao;

	public MemService() {
		dao = new MemDAO();
	}

	public MemVO addMem(String mem_account, String mem_pwd, String mem_name,Integer mem_gender,java.sql.Date mem_bdate,
			String mem_idnumber, String mem_tel,String mem_phone,String mem_address) {
		
		MemVO memVO = new MemVO();
		memVO.setMem_account(mem_account);
		memVO.setMem_pwd(mem_pwd);
		memVO.setMem_name(mem_name);
		memVO.setMem_gender(mem_gender);
		memVO.setMem_bdate(mem_bdate);
		memVO.setMem_idnumber(mem_idnumber);
		memVO.setMem_tel(mem_tel);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_address(mem_address);
		
		dao.insert(memVO);
		return memVO;
	}

	public MemVO updateMem(String mem_pwd, String mem_name, Integer mem_gender,
			java.sql.Date mem_bdate, String mem_idnumber, String mem_tel, String mem_phone,String mem_address,Integer mem_id) {

		MemVO empVO = new MemVO();

		empVO.setMem_pwd(mem_pwd);
		empVO.setMem_name(mem_name);
		empVO.setMem_gender(mem_gender);
		empVO.setMem_bdate(mem_bdate);
		empVO.setMem_idnumber(mem_idnumber);
		empVO.setMem_tel(mem_tel);
		empVO.setMem_phone(mem_phone);
		empVO.setMem_address(mem_address);
		empVO.setMem_id(mem_id);
		dao.update(empVO);

		return empVO;
	}

	public void deleteMem(Integer mem_id) {
		dao.delete(mem_id);
	}

	public MemVO getOneEmp(Integer mem_id) {
		return dao.findByPrimaryKey(mem_id);
	}

	public List<MemVO> getAll() {
		return dao.getAll();
	}
	
	public List<MemVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
}
