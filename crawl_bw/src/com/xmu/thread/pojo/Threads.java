package com.xmu.thread.pojo;

import java.util.Date;

import com.xmu.core.pojo.Entity;

/**
 * 帖子主题实体类
 * 
 * @author Administrator
 */
public class Threads extends Entity {
	private String tid;//主题编号
	private String fid;//版块编号
	private String title;//标题
	private String dateline;//发布时间
	private String lastpost;//最后回复时间
	private int views;//点击
	private int replies;//回复
	private String turl;//帖子地址
	private boolean isupdate;//已更新
	private String taskid;// 所属任务	
	private String userid;
	private String username;
	private String url;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String message;// 主题的发帖内容，用于TRS入库
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title =title;
	}
	public String getDateline() {
		return dateline;
	}
	public void setDateline(String dateline) {
		this.dateline = dateline;
	}
	public String getLastpost() {
		return lastpost;
	}
	public void setLastpost(String lastpost) {
		this.lastpost = lastpost;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getReplies() {
		return replies;
	}
	public void setReplies(int replies) {
		this.replies = replies;
	}
	public String getTurl() {
		return turl;
	}
	public void setTurl(String turl) {
		this.turl = turl;
	}
	public boolean isIsupdate() {
		return isupdate;
	}
	public void setIsupdate(boolean isupdate) {
		this.isupdate = isupdate;
	}
	public String getTaskid() {
		return taskid;
	}
	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}
	public boolean equals(Object obj) {
		return this.tid.equals(((Threads)obj).tid);
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
