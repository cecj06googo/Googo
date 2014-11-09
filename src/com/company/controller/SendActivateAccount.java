package com.company.controller;


import com.company.model.CompanyVO;
import com.util.*;

public class SendActivateAccount {  
      
  public static void sendAccount(CompanyVO comVO,String ServerName,int LocalPort,String ContextPath) {  
	 
	    SendMail sendmail = new SendMail();
	    
	    String account =comVO.getComAccount();
		String name = comVO.getComName();
		String msg = generateActivateLink(comVO,ServerName,LocalPort,ContextPath);
		String recieverAdress = comVO.getComAccount();
		String subjectTitle = "Goo-go租車網_註冊成功";//信件主旨
		String messageContent = "親愛的"+name+"商家  您好,\n"//信件內容
				+ "註冊成功!\n"
				+ "請點選以下連結開通帳號,\n"
				+  msg 
				+ "\n Goo-go團隊敬上";
		sendmail.send(recieverAdress,subjectTitle, messageContent);
		
		
		String recieverAdress1 = "googocar@gmail.com";
		String subjectTitle1= "Goo-go租車網_新增一商家";    //信件主旨
		String messageContent1 = "親愛的團隊們 \n"
				+ "又多一商家加入我們 \n"
				+ "帳號:" +account+"\n"
				+ "姓名:" +name+"\n"
				+ "\n Goo-go團隊敬上";
		sendmail.send(recieverAdress1,subjectTitle1, messageContent1);
		
		
		
	  	
	}
	  
  public static String generateActivateLink(CompanyVO comVO,String ServerName,int LocalPort,String ContextPath) { 
	  
	  String comURL = comVO.getComHashURL();
	  System.out.println("http://"+ServerName+":"+LocalPort+ContextPath+"/ActivateAccount?v="+comURL);
	  return "http://"+ServerName+":"+LocalPort+ContextPath+"/ActivateAccount?v="+comURL ;  
  }   

 }  
    
  
  
