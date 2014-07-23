package com.xmu.sys.actions;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

import javax.enterprise.deploy.model.J2eeApplicationObject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ModelDriven;
import com.xmu.core.actions.BaseAction;
import com.xmu.core.util.Constants;
import com.xmu.core.util.PageUtil;
import com.xmu.core.util.Struts2Utils;
import com.xmu.sys.pojo.SysLogs;
import com.xmu.sys.pojo.SysTask;
import com.xmu.sys.pojo.SysUsers;
import com.xmu.sys.pojo.UserSession;
import com.xmu.sys.service.SysService;

/**
 * @function 用户动作类
 * @author administrator
 */
public class SysUsersAction extends BaseAction implements ModelDriven<SysUsers> {

	public static Logger logger = Logger.getLogger(SysUsersAction.class);

	public static final long serialVersionUID = 1L;

	public SysService sysService;
	
	public SysUsers sysUsers = new SysUsers();
	public SysTask task = new SysTask();
	
	public String tips;
	
	public int pageNo;
	
	private long id;
	
	private String tname;
	private String url;
	private String ucookies;
	private int webtype;
	private String addtime_start;
	private String addtime_end;
	
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

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUcookies() {
		return ucookies;
	}

	public void setUcookies(String ucookies) {
		this.ucookies = ucookies;
	}

	public int getWebtype() {
		return webtype;
	}

	public void setWebtype(int webtype) {
		this.webtype = webtype;
	}

	public SysTask getTask() {
		return task;
	}

	public void setTask(SysTask task) {
		this.task = task;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public String frame(){
		Struts2Utils.getRequest().getSession().removeAttribute("tips");
		tips = sysService.login(getRequest(), sysUsers);
		Struts2Utils.getRequest().getSession().setAttribute("tips", tips);
		if(StringUtils.equals(tips, "登录成功！")){
			return "index";
		}else{
			return "login";
		}
	}
	
	/**
	 * @function 展示task的试图
	 * @return 展示task的试图
	 * @throws UnsupportedEncodingException 
	 */
	public String taskList() throws UnsupportedEncodingException{
		UserSession usersession = (UserSession) Struts2Utils.getRequest().getSession().getAttribute(Constants.USERSESSION);
		HttpServletRequest request = ServletActionContext.getRequest(); // 获得请求
		if(tname != null && !tname.equals("")){
			String temp = new String(tname.getBytes("ISO-8859-1"), "UTF-8");
			task.setTname(temp);
		}
		if(addtime_start != null && !addtime_start.equals("")){
			task.setAddtime_start(addtime_start);
		}
		if(addtime_end != null && !addtime_end.equals("")){
			task.setAddtime_end(addtime_end);
		}
		task.setUserid(usersession.getId());
		page.setPageNo(pageNo);
		page = sysService.getPageList("SysUsers.getTaskPageList", "SysUsers.getTaskTotalCount",task, page);
		// 分页连接
		String pageUrl = PageUtil.pageMultTag(request.getContextPath()
				+ "/sys/actions/sys-users!taskList.action", page, request
				.getParameterMap());
		request.setAttribute("pageUrl", pageUrl);
		return "task";
	}
	public String deleteTask(){
		sysService.removeObject("SysUsers.deleteTaskById", id);
		tips="success";
		return JSON;
	}
	/**
	 * @funtion 修改获取信息
	 * @return
	 */
	public String editTask(){
		task = (SysTask) sysService.getObject("SysUsers.getTaskById" , id);
		return "editTask";
	}
	/**
	 * @funtion 修改
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings("deprecation")
	public String editTask2() throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(tname)){
			String temp = new String(tname.getBytes("ISO-8859-1"), "UTF-8");
			task.setTname(temp);
		}
		if(StringUtils.isNotEmpty(url)){
			task.setUrl(url);
		}
		if(StringUtils.isNotEmpty(ucookies)){
			task.setUcookies(ucookies);
		}
		if(webtype != 0){
			task.setWebtype(webtype);
		}
		task.setId(id);
		sysService.updateObject("SysUsers.updateTask", task);
		tips="success";
		return JSON;
	}
	
	/**
	 * @funtion 查看任务， id为标示
	 * @return
	 */
	public String showTask(){
		task = (SysTask) sysService.getObject("SysUsers.getTaskById" , id);
		return "showTask";
	}
	/**
	 * @funtion 添加任务
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String addTask() throws UnsupportedEncodingException{
		UserSession usersession = (UserSession) Struts2Utils.getRequest().getSession().getAttribute(Constants.USERSESSION);
		task.setUserid(usersession.getId());
		String temp = null;
		if(StringUtils.isNotEmpty(tname)){
			temp =  new String(tname.getBytes("ISO-8859-1"), "UTF-8");
			task.setTname(temp);
		}
		if(StringUtils.isNotEmpty(url)){
			temp =  new String(url.getBytes("ISO-8859-1"), "UTF-8");
			task.setUrl(url);
		}
		if(StringUtils.isNotEmpty(ucookies)){
			temp =  new String(ucookies.getBytes("ISO-8859-1"), "UTF-8");
			task.setUcookies(ucookies);
		}
		if(webtype != 0){
			task.setWebtype(webtype);
		}
		sysService.saveObject("SysUsers.addTask", task);
		return JSON;
	}
	
	public String list(){
		UserSession usersession = (UserSession) Struts2Utils.getRequest().getSession().getAttribute(Constants.USERSESSION);
		HttpServletRequest request = ServletActionContext.getRequest(); // 获得请求
		page.setPageNo(pageNo);
		page = sysService.getPageList("SysUsers.getUsersPageList", "SysUsers.getUsersTotalCount",sysUsers, page);
		// 分页连接
		String pageUrl = PageUtil.pageMultTag(request.getContextPath()
				+ "/sys/actions/sys-users!list.action", page, request
				.getParameterMap());
		request.setAttribute("pageUrl", pageUrl);
		
		SysLogs log = new SysLogs();
		log.setDetail("用户"+sysUsers.getUsername()+"查看用户列表");
		log.setOptype(1);
		log.setIpAddr(request.getRemoteAddr());
		log.setUserid(usersession.getId());
		sysService.saveObject("SysLogs.add", log);
		return "list";
	}
	
	public String addUsers(){
		UserSession usersession = (UserSession) Struts2Utils.getRequest().getSession().getAttribute(Constants.USERSESSION);
		sysService.saveObject("SysUsers.add", sysUsers);
		tips="success";
		SysLogs log = new SysLogs();
		log.setDetail("用户"+sysUsers.getUsername()+"新增用户"+sysUsers.getUsername());
		log.setOptype(1);
		log.setIpAddr(getRequest().getRemoteAddr());
		log.setUserid(usersession.getId());
		sysService.saveObject("SysLogs.add", log);
		return JSON;
	}
	
	public String deleteUsers(){
		sysService.removeObject("SysUsers.deleteUserById", id);
		UserSession usersession = (UserSession) Struts2Utils.getRequest().getSession().getAttribute(Constants.USERSESSION);
		SysLogs log = new SysLogs();
		log.setDetail("用户"+sysUsers.getUsername()+"删除用户"+sysUsers.getUsername());
		log.setOptype(1);
		log.setIpAddr(getRequest().getRemoteAddr());
		log.setUserid(usersession.getId());
		sysService.saveObject("SysLogs.add", log);
		return JSON;
	}
	
	public String getUsers(){
		sysUsers = (SysUsers) sysService.getObject("SysUsers.getUserById",id);
		return JSON;
	}
	
	public String editeUsers(){
		sysService.updateObject("SysUsers.updateUser", sysUsers);
		tips="success";
		return JSON;
	}
	
	
	
	public SysUsers getModel() {
		return sysUsers;
	}
	@JSON(serialize = false)
	public SysService getSysService() {
		return sysService;
	}
	@JSON(serialize = false)
	public void setSysService(SysService sysService) {
		this.sysService = sysService;
	}

	public SysUsers getSysUsers() {
		return sysUsers;
	}

	public void setSysUsers(SysUsers sysUsers) {
		this.sysUsers = sysUsers;
	}

}
