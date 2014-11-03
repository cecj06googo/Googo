package com.forgetpwd.model;

public interface MemberDAO {
    public abstract boolean update(String mem_pwd);
	
	public abstract MemberBean select(int mem_id);

}
