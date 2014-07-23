package com.xmu.post.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.xmu.core.actions.BaseAction;
import com.xmu.core.util.PageUtil;
import com.xmu.post.pojo.Posts;
import com.xmu.post.service.Postsservice;
import com.xmu.thread.pojo.Threads;
import com.xmu.thread.service.ThreadsService;

/**
 * @function 用户动作类
 * @author administrator
 */
public class PostsAction extends BaseAction implements ModelDriven<Posts> {

	public static Logger logger = Logger.getLogger(PostsAction.class);

	public static final long serialVersionUID = 1L;
	private Posts post = new Posts();
	private Postsservice postsService;
	private int pageNo;
	
	




	public String list(){
		HttpServletRequest request = ServletActionContext.getRequest(); // 获得请求
		page.setPageNo(pageNo);
		page = postsService.getPageList("Posts.getPostsPageList", "Posts.getPostsTotalCount", post, page);
		
		// 分页连接
		String pageUrl = PageUtil.pageMultTag(request.getContextPath()
				+ "/post/actions/posts!list.action", page, request
				.getParameterMap());
		request.setAttribute("pageUrl", pageUrl);
		return "list";
	}

	
	
	
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public Posts getPost() {
		return post;
	}
	public void setPost(Posts post) {
		this.post = post;
	}
	public Postsservice getPostsService() {
		return postsService;
	}
	public void setPostsService(Postsservice postsService) {
		this.postsService = postsService;
	}
	public Posts getModel() {
		return post;
	}

}
