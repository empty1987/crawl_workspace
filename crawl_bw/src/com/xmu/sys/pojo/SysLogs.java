package com.xmu.sys.pojo;
import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;

import com.xmu.core.pojo.Entity;
public class SysLogs  extends Entity { 

	private static final long serialVersionUID = 3685343803243974053L;
	private long userid; 
     private String time;//操作时间
     private int optype; //1为登录日志 2为搜索日志
     private String detail; //操作具体内容
     private String ipAddr; //操作IP
     
     //DTO
     private String userName;
     private String timeStart;
     private String timeEnd;
     //   构造函数
     public SysLogs(){
     	
     } 
 	 public SysLogs(long userid,int optype,String detail,String ipAddr){
 		 
 		 
 		 this.userid = userid;
 		 this.optype = optype;
 		 this.detail = detail;
 		 this.ipAddr = ipAddr;
 		 this.time = DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss");
 	 }
 	 
     public String getTimeEnd() {
		return timeEnd;
	}
	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}
	public String getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	 
	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public void setTime(String time) {
     this.time = time;
     }
     public String getTime() {
     return time;
     }
     public void setOptype(int optype) {
     this.optype = optype;
     }
     public int getOptype() {
     return optype;
     }
     public void setDetail(String detail) {
     this.detail = detail;
     }
     public String getDetail() {
     return detail;
     }

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

}