package com.xmu.sys.pojo;


/**
 * 
 * @author Administrator
 * @function  存在session中的用户信息
 */
public class UserSession {
	
	 
	private Long id ;      		//ID
	
	private String username;
	private String password;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


}
