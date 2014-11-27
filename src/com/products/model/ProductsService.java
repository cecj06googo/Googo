package com.products.model;

import java.util.List;

public class ProductsService {
	private ProductsDAO_interface dao;

	public ProductsService() {
		dao = new ProductsDAO();
	}

	public ProductVO addProd(int _prodId, int _comId, String _prodName,
			int _prodType, double _prodPrice, double prodDisc,
			byte[] _prodPic, String _prodArticle, byte[] _prodSubPic1,
			byte[] _prodSubPic2, byte[] _prodSubPic3, int _prodKind,
			double _prodCc, int _prodCarrier, int _prodControl,
			String _prodPlate, int _prodStatus) {

		ProductVO ProductVO = new ProductVO();
		// ProductsVO.setProd_id(_ProdId);
		ProductVO.setComId(_comId);
		ProductVO.setProdName(_prodName);
		ProductVO.setProdType(_prodType);
		ProductVO.setProdPrice(_prodPrice);
		ProductVO.setProdDisc(prodDisc);
		ProductVO.setProdPic(_prodPic);
		ProductVO.setProdArticle(_prodArticle);
		ProductVO.setProdSubPic1(_prodSubPic1);
		ProductVO.setProdSubPic2(_prodSubPic2);
		ProductVO.setProdSubPic3(_prodSubPic3);
		ProductVO.setProdKind(_prodKind);
		ProductVO.setProdCc(_prodCc);
		ProductVO.setProdCarrier(_prodCarrier);
		ProductVO.setProdControl(_prodControl);
		ProductVO.setProdPlate(_prodPlate);
		ProductVO.setProdStatus(_prodStatus);

		dao.insert(ProductVO);

		return ProductVO;
	} // end addOrder

	public void delProd(Integer prodId) {
		dao.delete(prodId);

	}

	public List<ProductVO> getAll(ProductVO ProductVO) {
		// for(ProductVO aBookBean :dao.getAll(ProductVO)){
		// System.out.println("in service "+aBookBean.getComId());
		// }
		return dao.getAll(ProductVO);
	}

	public com.products.model.ProductVO editProd(int _prodId, int _comId, String _prodName,
			int _prodType, double _prodPrice, double prodDisc,
			byte[] _prodPic, String _prodArticle, byte[] _prodSubPic1,
			byte[] _prodSubPic2, byte[] _prodSubPic3, int _prodKind,
			double _prodCc, int _prodCarrier, int _prodControl,
			String _prodPlate, int _prodStatus) {
		ProductVO ProductVO = new ProductVO();
		ProductVO.setProdId(_prodId);
		ProductVO.setComId(_comId);
		ProductVO.setProdName(_prodName);
		ProductVO.setProdType(_prodType);
		ProductVO.setProdPrice(_prodPrice);
		ProductVO.setProdDisc(prodDisc);
		ProductVO.setProdPic(_prodPic);
		ProductVO.setProdArticle(_prodArticle);
		ProductVO.setProdSubPic1(_prodSubPic1);
		ProductVO.setProdSubPic2(_prodSubPic2);
		ProductVO.setProdSubPic3(_prodSubPic3);
		ProductVO.setProdKind(_prodKind);
		ProductVO.setProdCc(_prodCc);
		ProductVO.setProdCarrier(_prodCarrier);
		ProductVO.setProdControl(_prodControl);
		ProductVO.setProdPlate(_prodPlate);
		ProductVO.setProdStatus(_prodStatus);
		System.out.println();
		dao.edit(ProductVO);
		return ProductVO; 

	}
}
