package com.forgetpwd.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) {
/*		java.text.Format formatter=new java.text.SimpleDateFormat("yyyy-MM-dd EE hh:mm:ss");  
		java.util.Date now=new java.util.Date();  
		long mmstwentyfourhoirlater=(now.getTime()/1000)+60*60*24;  
		now.setTime(mmstwentyfourhoirlater*1000);  
		String twentyfourlater=formatter.format(now);  
		System.out.println(twentyfourlater);
*/
		Format format = new SimpleDateFormat("yyyy-MM-dd EE hh:mm:ss");
		Date sendMailTime = new Date();
		long millisecondsPlusTwentyFourHour = (sendMailTime.getTime()/1000)+24*60*60;
		sendMailTime.setTime(millisecondsPlusTwentyFourHour*1000);
		System.out.println(sendMailTime.toString());
	}

}
