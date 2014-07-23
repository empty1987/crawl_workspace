package com.xmu.thread.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.xmu.core.actions.BaseAction;
import com.xmu.core.util.PageUtil;
import com.xmu.thread.pojo.Threads;
import com.xmu.thread.service.ThreadsService;

/**
 * @function 用户动作类
 * @author administrator
 */
public class ThreadsAction extends BaseAction implements ModelDriven<Threads> {

	public static Logger logger = Logger.getLogger(ThreadsAction.class);

	public static final long serialVersionUID = 1L;
	private Threads thread = new Threads();
	private ThreadsService threadsService;
	private int pageNo;
	
	public int getPageNo() {
		return pageNo;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public ThreadsService getThreadsService() {
		return threadsService;
	}


	public void setThreadsService(ThreadsService threadsService) {
		this.threadsService = threadsService;
	}


	public String list(){
		HttpServletRequest request = ServletActionContext.getRequest(); // 获得请求
		page.setPageNo(pageNo);
		page = threadsService.getPageList("Threads.getThreadsPageList", "Threads.getThreadsTotalCount", thread, page);
		
		// 分页连接
		String pageUrl = PageUtil.pageMultTag(request.getContextPath()
				+ "/thread/actions/threads!list.action", page, request
				.getParameterMap());
		request.setAttribute("pageUrl", pageUrl);
		return "list";
	}
	

	public Threads getModel() {
		return thread;
	}

	public Threads getThread() {
		return thread;
	}

	public void setThread(Threads thread) {
		this.thread = thread;
	}


}
