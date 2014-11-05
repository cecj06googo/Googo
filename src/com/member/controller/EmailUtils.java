package com.member.controller;

import com.member.model.MemVO;
import com.util.SendMail;

public class EmailUtils {  
      
  public static void sendAccountActivateEmail(MemVO memVO) {  
	 try{
	    SendMail sendmail = new SendMail();
	    String username = "antai0926test@gmail.com";//寄信者信箱地址
		String password = "abc123456";//收件者郵件地址(此為假的密碼不可登入)
		String senderAdress = "antai0926test@gmail.com";//寄信者信箱地址
		
		
		String msg = generateActivateLink(memVO);
		String recieverAdress = memVO.getMem_account();
		String subjectTitle = "Goo-go租車網_註冊成功";//信件主旨
		String messageContent = "親愛的會員您好,\n"//信件內容
				+ "註冊成功!\n"
				+ "請點選以下連結開通帳號,\n"
				+ msg
				+ "\n Goo-go團隊敬上";
		sendmail.send(username, password, senderAdress, recieverAdress,
				subjectTitle, messageContent);
	  	}catch (Exception e) {
	  		e.printStackTrace(System.err);
		}
	}
	  
  public static String generateActivateLink(MemVO memVO) { 
	  
	  String mem_qq = memVO.getMem_qq();
	  
      return "http://localhost:8081/Googo/OpenAccount?mem_qq="+mem_qq ;  
  }   

 }  
    
  
  
