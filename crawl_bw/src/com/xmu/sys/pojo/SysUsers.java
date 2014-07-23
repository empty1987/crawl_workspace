
package com.xmu.sys.pojo;

import com.xmu.core.pojo.Entity;

/**
 * 
 * @function  用户实体类 
 * @author administrator
 */

public class SysUsers extends Entity {
	private static final long serialVersionUID = -5555359858614713550L;
	private String username;
	private String password;
	private String flag;
	private String aliveTime;
	private String addtime;
	private String addtime_start;
	private String addtime_end;
	private String role;
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getAliveTime() {
		return aliveTime;
	}
	public void setAliveTime(String aliveTime) {
		this.aliveTime = aliveTime;
	}
	public String getAddtime_start() {
		return addtime_start;
	}
	public void setAddtime_start(String addtimeStart) {
		addtime_start = addtimeStart;
	}
	public String getAddtime_end() {
		return addtime_end;
	}
	public void setAddtime_end(String addtimeEnd) {
		addtime_end = addtimeEnd;
	}
} 