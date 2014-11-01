package com.util;

public class SendMailTestMain {

	public static void main(String[] args) {
		 /*用法:目前此方法只能用在Gmail，username 與 password 是寄信者的Gmial帳號與密碼
		  * senderAdress是寄信者信箱地址 ， recieverAdress是收件者郵件地址，
		  * subjectTitle 是信件主旨，messageContent 是信件內容，以上都是String宣告 用法詳見SendMailTestMain.java
		  * */
		SendMail sendmail = new SendMail();
		String username = "antai0926test@gmail.com";//寄信者信箱地址
		String password = "abc123456";//收件者郵件地址(此為假的密碼不可登入)
		String senderAdress = "antai0926test@gmail.com";//寄信者信箱地址
		String recieverAdress = "raniantheone@gmail.com,"//收件者郵件地址
				+ "e810616@yahoo.com.tw,a99402351@gmail.com,irischou07@gmail.com,ggyy40706@yahoo.com.tw,"
				+ "davidfinal25@gmail.com,jeffreykuo0327@gmail.com,"
				+ "antai0926@gmail.com,antai0926test@gmail.com";
		String subjectTitle = "JavaMail Test";//信件主旨
		String messageContent = "親愛的收信者您好,\n"//信件內容
				+ "此封信件為如何使用SendMail範例,\n"
				+ "直接new SendMail class就可以使用,\n"
				+ "把相關的參數填好，呼叫send方法就可以寄信,\n"
				+ "寄件結果將會顯示於Console,\n"
				+ "相關程式在com.util的package,請參考SendMailTestMain.java\n"
				+ "實作方法可參考:http://www.tutorialspoint.com/javamail_api/javamail_api_sending_simple_email.htm\n"
				+ "CECJ06專題小組";
		sendmail.send(username, password, senderAdress, recieverAdress,
				subjectTitle, messageContent);

	}

}
