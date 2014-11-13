package com.orders.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;



public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 
		
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Timestamp today = Timestamp.valueOf(df.format(new Date()));
		
		System.out.println(df.format(new Date().getTime()));
		System.out.println(df.format(today));
		
		System.out.println(today);
		
		
		
		
//		String _mem_account = "ggyy40706@abc.com.tw";
//		
//		StringBuilder mem_account = new StringBuilder().append(_mem_account);
//		
//		int index= mem_account.indexOf("@");
//		StringBuilder ago = new StringBuilder().append(mem_account.substring(0,index));
//		int length = ago.length()-2;
//		
//		StringBuilder ago_first = new StringBuilder().append(mem_account.substring(0,1));
//		StringBuilder ago_last = new StringBuilder().append(mem_account.substring(index-1));
//
//		
//		
//		
//		
//
//		StringBuilder newAccount = new StringBuilder();
//		newAccount.append(ago_first);
//		for(int i = 0; i < length; i++){
//			newAccount.append("*");
//		}
//		newAccount.append(ago_last);
//		System.out.println(newAccount);
//		System.out.println(ago.length());

		
//		String aa="012345".substring(4);
//		System.out.println(aa);
	}

}
