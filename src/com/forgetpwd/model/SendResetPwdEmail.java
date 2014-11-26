package com.forgetpwd.model;

import com.util.SendMail;

public class SendResetPwdEmail {
	public static void sendResetEmail(String user_account,String ServerName, int LocalPort, String ContextPath){
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
	

	public static String generateResetPwdLink(String ServerName, int LocalPort, String ContextPath){
		return "http://"+ServerName+":"+LocalPort+ContextPath+"/_01_login/resetPwd.jsp";
		
	}

}
