package com.member.model;

import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
  
public class MemService {
	public static final String KEY = "GoogoCarGoogoCar";
	private MemDAO_interface dao;

	public MemService() {
		dao = new MemDAO();
	}

	public MemVO addMem(String mem_account, String mem_pwd, String mem_name,Integer mem_gender,java.sql.Date mem_bdate,
			String mem_idnumber, String mem_tel,String mem_phone,String mem_address) {
		
		MemVO memVO = new MemVO();
		memVO.setMem_account(mem_account);
		String encrypedString = MemService.encryptString(mem_pwd);
		memVO.setMem_pwd(MemService.getMD5Endocing(encrypedString));
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

		MemVO memVO = new MemVO();

		String encrypedString = MemService.encryptString(mem_pwd);
		memVO.setMem_pwd(MemService.getMD5Endocing(encrypedString));
		memVO.setMem_name(mem_name);
		memVO.setMem_gender(mem_gender);
		memVO.setMem_bdate(mem_bdate);
		memVO.setMem_idnumber(mem_idnumber);
		memVO.setMem_tel(mem_tel);
		memVO.setMem_phone(mem_phone);
		memVO.setMem_address(mem_address);
		memVO.setMem_id(mem_id);
		dao.update(memVO);

		return memVO;
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
	
	/**
     * 依MD5演算法將參數字串message轉換為128位元(16個位元組)的資料。
     * 
     * @param message : 要加密的字串
     * @return : 128位元資料的16進位表示法所構成的字串
     */
	public static String getMD5Endocing(String message) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();
			
			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = (b & 0x7F) + (b < 0 ? 128 : 0);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	public static String encryptString(String message) 
    {
	//  DES : Data Encryption Standard, 一種對稱式加密演算法。
	//           美國聯邦政府於1976年定為聯邦資料處理標準(FIPS)，它的
	//           金鑰則必須是7個位元組、加密區塊(Cipher Block)固定為8個位元組。
	//           DES目前已被視為是一種不安全的演算法。
	//  AES : Advanced Encryption Standard, 一種對稱式加密演算法。
	//           (美國聯邦政府於2001年納入FIPS 140-2標準)，此種演算法
	//           的Cipher Block固定為16個位元組。金鑰則必須是16個位元組、
	//           24個位元組或32個位元組(即128個位元、192個位元或256個位元)。
	//  ECB : Electronic CookBook, 一種資料的加密方式，這種加密方式採取
	//           每個區塊(如8個或16個位元組)獨立加密，即加密任ㄧ區塊時與其它區塊
	//           無關。獨立壓縮有優點也有缺點。
	//           優點為可以由多個處理器來平行處理ㄧ個很大的資料。缺點為如果資料
	//           的內容有重複出現的部分，而且重複資料的長度剛好與加密區塊等長，
	//           則這些重複出現的部分經過加密後會出現相同的結果。
	//  PKCS5Padding: 如果要加密的資料不是8個(如DES加密演算法)或
	//           16個(如AES加密演算法)位元組的整數倍，則必須在欲加密資料的
	//           尾端加入若干個位元組來湊成整數倍。PKCS5Padding是一種
	//           補足不足位元組的方法。
		String encryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); 
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(message.getBytes()));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
		}
	
	public static String decryptString(String key, String stringToDecrypt){
		String decryptedString = "";
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); 
			SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKey);
			byte[] b = DatatypeConverter.parseBase64Binary(stringToDecrypt);
			decryptedString = new String(cipher.doFinal(b));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return decryptedString;
		}	

}
