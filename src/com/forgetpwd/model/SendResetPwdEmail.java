package com.forgetpwd.model;

import java.util.Date;

import com.company.model.CompanyVO;
import com.member.model.MemVO;
import com.util.SendMail;

public class SendResetPwdEmail {
/*	public static void sendResetEmail(String user_identity, String user_account,String ServerName, int LocalPort, String ContextPath){
		SendMail sendmail = new SendMail();
		String receiverAddress = user_account;
		String msg = generateResetPwdLink(ServerName, LocalPort, ContextPath);
		String subjectTitle = "Googo租車網會員密碼認證信函";
		String messageContent = "親愛的會員 您好:\n"
		                        +"這封認證信是由Googo租車網發出，用以處理您忘記密碼，當您收到本「認證信函」後，請直接點選下方連結重新設置您的密碼，無需回信。\n"
				                +msg
				                +"\n Googo團隊敬上";
		sendmail.send(receiverAddress, subjectTitle, messageContent);
		
	}
*/	
	
	public static void sendMemResetEmail(MemVO memVO,String ServerName,int LocalPort,String ContextPath){
		SendMail sendmail = new SendMail();
		String receiverAddress = memVO.getMem_account();
		System.out.println("receiverAddress = " + receiverAddress);
		String msg = generateMemResetLink(memVO, ServerName, LocalPort, ContextPath);
		String subjectTitle = "Googo租車網會員密碼認證信函";
		String messageContent = "親愛的會員 您好:\n"
		                        +"這封認證信是由Googo租車網發出，用以處理您忘記密碼，當您收到本「認證信函」後，請直接點選下方連結重新設置您的密碼，無需回信。\n"
				                + msg
				                +"\n Googo團隊敬上";
		sendmail.send(receiverAddress, subjectTitle, messageContent);
		
	}
	
	public static void sendComResetEmail(CompanyVO comVO,String ServerName,int LocalPort,String ContextPath){
		SendMail sendmail = new SendMail();
		String receiverAddress = comVO.getComAccount();
		System.out.println("receiverAddress = " + receiverAddress);
		String msg = generateComResetLink(comVO, ServerName, LocalPort, ContextPath);
		String subjectTitle = "Googo租車網會員密碼認證信函";
		String messageContent = "親愛的會員 您好:\n"
		                        +"這封認證信是由Googo租車網發出，用以處理您忘記密碼，當您收到本「認證信函」後，請直接點選下方連結重新設置您的密碼，無需回信。\n"
				                + msg
				                +"\n Googo團隊敬上";
		sendmail.send(receiverAddress, subjectTitle, messageContent);
		
	}
	

	public static String generateMemResetLink(MemVO memVO,String ServerName,int LocalPort,String ContextPath){
		String mem_qq = memVO.getMem_qq();
		System.out.println(memVO);
		System.out.println("mem_qq = " + mem_qq);
		System.out.println("產生Link :http://"+ServerName+":"+LocalPort+ContextPath+"/resetpwd.gg?qq="+mem_qq);
		return "http://"+ServerName+":"+LocalPort+ContextPath+"/resetpwd.gg?qq="+mem_qq ;
	}//end of generateMemResetLink()
	
	public static String generateComResetLink(CompanyVO comVO,String ServerName,int LocalPort,String ContextPath){
		String com_hashURL = comVO.getComHashURL();
		System.out.println(comVO);
		System.out.println("com_hashURL = " + com_hashURL);
		System.out.println("產生Link :http://"+ServerName+":"+LocalPort+ContextPath+"/resetpwd.gg?hash="+com_hashURL);
		return "http://"+ServerName+":"+LocalPort+ContextPath+"/resetpwd.gg?hash="+com_hashURL ;
	}//end of generateMemResetLink()
}
