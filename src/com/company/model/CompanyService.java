package com.company.model;

import java.io.IOException;
import java.util.List;
import com.util.HashService;

public class CompanyService {
	
	private ICompanyDAO dao;
	
	public CompanyService() {
		dao = new CompanyDAO();
	}
	
	// 驗證帳號是否重複
	synchronized public boolean verifyAccount(String account) throws IOException {
		boolean existAccount = true;    // 檢查account是否已經存在
		List<CompanyVO> list = dao.getAll();
		for (CompanyVO cv : list) {
			if (cv.getComAccount().equals(account.trim())) {
				existAccount = false;
				return existAccount;
			}
		}
		return existAccount;
	}
	
	// 驗證統一編號是否重複
	synchronized public boolean verifyVAT(String VAT) throws IOException {
		boolean existVAT = true;    // 檢查VAT是否已經存在
		List<CompanyVO> list = dao.getAll();
		for (CompanyVO cv : list) {
			if (cv.getComVAT().equals(VAT.trim())) {
				existVAT = false;
				return existVAT;
			}
		}
		return existVAT;
	}
	
	public CompanyVO addCompany(String comAccount,String comPwd,String comName,String comOwner,
	        String comAddr, String comTel, String comFax, String comVAT, Integer comStatus, String comHashURL) {
		
		CompanyVO comVO = new CompanyVO();
		comVO.setComAccount(comAccount);
		String encrypedString = HashService.encryptString(comPwd);
		comVO.setComPwd(HashService.getMD5Endocing(encrypedString));
		comVO.setComName(comName);
		comVO.setComOwner(comOwner);
		comVO.setComAddr(comAddr);
		comVO.setComTel(comTel);
		comVO.setComFax(comFax);
		comVO.setComVAT(comVAT);
		comVO.setComStatus(comStatus);
		comVO.setComHashURL(comHashURL);
		
		dao.insert(comVO);
		return comVO;
	}
	
	public CompanyVO updateCompany(Integer comID, String comAccount,String comPwd,String comName,String comOwner,
		    String comAddr, String comTel, String comFax, String comVAT, byte[] comPic, Integer comStatus) {
		
		CompanyVO comVO = new CompanyVO();
		comVO.setComID(comID);
		comVO.setComAccount(comAccount);
		comVO.setComPwd(comPwd);
		comVO.setComName(comName);
		comVO.setComOwner(comOwner);
		comVO.setComAddr(comAddr);
		comVO.setComTel(comTel);
		comVO.setComFax(comFax);
		comVO.setComVAT(comVAT);
		comVO.setComPic(comPic);
		comVO.setComStatus(comStatus);
		
		dao.update(comVO);
		return dao.findByPrimaryKey(comID);
	}
	
	// 開通商家帳號
	public CompanyVO updateComStatus(Integer comID, Integer comStatus) {
		CompanyVO comVO = dao.findByPrimaryKey(comID);
		comVO.setComID(comID);
		comVO.setComStatus(comStatus);
		dao.update(comVO);
		return dao.findByPrimaryKey(comID);
	}
	
	public CompanyVO getOneCom(Integer comID) {
		return dao.findByPrimaryKey(comID);
	}
	
	public Integer openComAccount(String comHashURL) {
		return dao.findByPrimaryKey(comHashURL);
	}
}
