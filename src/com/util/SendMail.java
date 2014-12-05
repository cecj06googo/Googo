package com.util;
 
import java.util.Properties;
 

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMail {
 /*用法:目前此方法只能用在Gmail，username 與 password 是寄信者的Gmial帳號與密碼
  * senderAdress是寄信者信箱地址 ， recieverAdress是收件者郵件地址，
  * subjectTitle 是信件主旨，messageContent 是信件內容，以上都是String宣告 用法詳見SendMailTestMain.java
  * */
	public final String username ="googocar@gmail.com";
	public final String password ="googo123";
	public final String senderAdress ="googocar@gmail.com";
	
	public void send(String recieverAdress,String subjectTitle,String messageContent) {
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setContent(subjectTitle, "text/html;charset=UTF-8");//將文字轉碼
			message.setContent(messageContent, "text/html;charset=UTF-8");//將文字轉碼
			
			message.setFrom(new InternetAddress(senderAdress)); //from adress
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(recieverAdress)); //to adress		
			message.setSubject(subjectTitle);
			message.setText(messageContent);
			Transport.send(message);
 
			System.out.println("寄件成功");
 
		} catch (MessagingException e) {
			System.out.println("寄件錯誤");
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}