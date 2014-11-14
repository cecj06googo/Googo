package com.scheduler.model;

public class SchedulerDAO {
	
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=GGDB";
	String userid = "sa";
	String passwd = "P@ssw0rd";

	private static final String UPDATE = 
		"UPDATE Ord_item set prod_id=? where item_id = ?";
	private static final String GET_ONE_STMT = 
		"SELECT mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address,mem_status FROM Member where mem_id = ?";
	private static final String GET_ALL_STMT = 
		"SELECT mem_account,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address FROM Member order by empno";

}
