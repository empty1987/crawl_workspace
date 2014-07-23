package com.xmu.core.pojo;

import com.xmu.core.util.Constants;


public class SystemParam {
	 
	private String mysqlUrl = Constants.mysqlUrl;
	private String mysqlUser  = Constants.mysqlUser;
	private String mysqlPassword = Constants.mysqlPassword;
	private String trsServer = Constants.TrsServer;
	private String trsUser = Constants.TrsUser;
	private String trsPassword = Constants.TrsPassword;
	
	public String getMysqlUrl() {
		return mysqlUrl;
	}
	public void setMysqlUrl(String mysqlUrl) {
		this.mysqlUrl = mysqlUrl;
	}
	public String getMysqlUser() {
		return mysqlUser;
	}
	public void setMysqlUser(String mysqlUser) {
		this.mysqlUser = mysqlUser;
	}
	public String getMysqlPassword() {
		return mysqlPassword;
	}
	public void setMysqlPassword(String mysqlPassword) {
		this.mysqlPassword = mysqlPassword;
	}
	public String getTrsServer() {
		return trsServer;
	}
	public void setTrsServer(String trsServer) {
		this.trsServer = trsServer;
	}
	public String getTrsUser() {
		return trsUser;
	}
	public void setTrsUser(String trsUser) {
		this.trsUser = trsUser;
	}
	public String getTrsPassword() {
		return trsPassword;
	}
	public void setTrsPassword(String trsPassword) {
		this.trsPassword = trsPassword;
	}
}
