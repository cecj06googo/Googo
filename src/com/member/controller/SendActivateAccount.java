package com.member.controller;

import com.member.model.MemVO;
import com.util.*;

public class SendActivateAccount {  
      
  public static void sendAccount(MemVO memVO,String ServerName,int LocalPort,String ContextPath) {  
	 
	    SendMail sendmail = new SendMail();
	    
	    String account =memVO.getMem_account();
		String name = memVO.getMem_name();
		String msg = generateActivateLink(memVO,ServerName,LocalPort,ContextPath);
		String recieverAdress = memVO.getMem_account();
		String subjectTitle = "Goo-go租車網_註冊成功";//信件主旨
		String messageContent = "親愛的"+name+"會員  您好,\n"//信件內容
				+ "註冊成功!\n"
				+ "請點選以下連結開通帳號,\n"
				+  msg 
				+ "\n Goo-go團隊敬上";
		sendmail.send(recieverAdress,subjectTitle, messageContent);
		
		
		String recieverAdress1 = "googocar@gmail.com";
		String subjectTitle1= "Goo-go租車網_新增一會員";//信件主旨
		String messageContent1 = "親愛的團隊們 \n"
				+ "又多一會員加入我們 \n"
				+ "帳號:" +account+"\n"
				+ "姓名:" +name+"\n"
				+ "\n Goo-go團隊敬上";
		sendmail.send(recieverAdress1,subjectTitle1, messageContent1);
		
		
		
	  	
	}
	  
  public static String generateActivateLink(MemVO memVO,String ServerName,int LocalPort,String ContextPath) { 
	  
	  String mem_qq = memVO.getMem_qq();
	  System.out.println("http://"+ServerName+":"+LocalPort+ContextPath+"/ActivateAccount?qq="+mem_qq);
	  return "http://"+ServerName+":"+LocalPort+ContextPath+"/ActivateAccount?qq="+mem_qq ;  
  }   

 }  
    
  
  
