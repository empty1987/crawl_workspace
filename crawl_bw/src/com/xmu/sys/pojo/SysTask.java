
package com.xmu.sys.pojo;

import com.xmu.core.pojo.Entity;

/**
 * 
 * @function  用户实体类 
 * @author empty
 */

public class SysTask extends Entity {
	private static final long serialVersionUID = 1L;
		private long taskid;
		private String url;
		private String tname;
		private String type;
		private String lastdate;
		private int sleeptime;
		private String ucookies;
		private int encode;
		private  int aligntype;
		private String nextStart;
		private int maxthread;
		private String nowdate;
		private long webtype;
		private String url2;
		private long userid;
		
		private String addtime_start;
		private String addtime_end;
		private String addtime;
		
		public String getAddtime() {
			return addtime;
		}
		public void setAddtime(String addtime) {
			this.addtime = addtime;
		}
		public String getAddtime_start() {
			return addtime_start;
		}
		public void setAddtime_start(String addtime_start) {
			this.addtime_start = addtime_start;
		}
		public String getAddtime_end() {
			return addtime_end;
		}
		public void setAddtime_end(String addtime_end) {
			this.addtime_end = addtime_end;
		}
		public long getUserid() {
			return userid;
		}
		public void setUserid(long userid) {
			this.userid = userid;
		}
		public long getTaskid() {
			return taskid;
		}
		public void setTaskid(long taskid) {
			this.taskid = taskid;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getTname() {
			return tname;
		}
		public void setTname(String tname) {
			this.tname = tname;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getLastdate() {
			return lastdate;
		}
		public void setLastdate(String lastdate) {
			this.lastdate = lastdate;
		}
		public int getSleeptime() {
			return sleeptime;
		}
		public void setSleeptime(int sleeptime) {
			this.sleeptime = sleeptime;
		}
		public String getUcookies() {
			return ucookies;
		}
		public void setUcookies(String ucookies) {
			this.ucookies = ucookies;
		}
		public int getEncode() {
			return encode;
		}
		public void setEncode(int encode) {
			this.encode = encode;
		}
		public int getAligntype() {
			return aligntype;
		}
		public void setAligntype(int aligntype) {
			this.aligntype = aligntype;
		}
		public String getNextStart() {
			return nextStart;
		}
		public void setNextStart(String nextStart) {
			this.nextStart = nextStart;
		}
		public int getMaxthread() {
			return maxthread;
		}
		public void setMaxthread(int maxthread) {
			this.maxthread = maxthread;
		}
		public String getNowdate() {
			return nowdate;
		}
		public void setNowdate(String nowdate) {
			this.nowdate = nowdate;
		}
		public long getWebtype() {
			return webtype;
		}
		public void setWebtype(long webtype) {
			this.webtype = webtype;
		}
		public String getUrl2() {
			return url2;
		}
		public void setUrl2(String url2) {
			this.url2 = url2;
		}
		
} 