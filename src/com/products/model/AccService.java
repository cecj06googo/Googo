package com.products.model;

import java.util.List;

public class AccService {
	private AccessoryDAO dao;

	public AccService() {
		dao = new AccessoryDAO();
	}

	public AccessoryVO addAcc(int _comId, String _accName,
			double _accPrice, byte[] _accPic, String _accDetail) {

		System.out.println("in service");
		AccessoryVO accVO = new AccessoryVO();
		accVO.setComId(_comId);
		accVO.setAccName(_accName);
		accVO.setAccPrice(_accPrice);
		accVO.setAccPic(_accPic);
		accVO.setAccDetail(_accDetail);
		accVO.setAccStatus(1);

		dao.insert(accVO);

		return accVO;
	}

	public void delAcc(Integer prodId) {
		dao.delete(prodId);

	}

	public List<AccessoryVO> getAll(AccessoryVO accVO) {
		return dao.getAll(accVO);
	}

	public AccessoryVO editAcc(int accId, int _comId, String _accName,
			double _accPrice, byte[] _accPic, String _accDtail) {
		AccessoryVO accVO = new AccessoryVO();
		accVO.setAccId(accId);
		accVO.setComId(_comId);
		accVO.setAccName(_accName);
		accVO.setAccPrice(_accPrice);
		accVO.setAccPic(_accPic);
		accVO.setAccDetail(_accDtail);
		System.out.println();
		dao.edit(accVO);
		return accVO; 

	}
}
