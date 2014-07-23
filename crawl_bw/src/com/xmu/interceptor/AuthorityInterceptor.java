package com.xmu.interceptor;

import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.xmu.core.util.Constants;
import com.xmu.sys.pojo.UserSession;
/** 
 *Copyright(C):	
 *@n
 *@n File:			AuthorityInterceptor.java
 *@n Function:		struts2 权限验证
 *@n Author:		xjb整合	 2009-7-1
 */
public class AuthorityInterceptor extends AbstractInterceptor
{
    private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation invocation)
		throws Exception
	{
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		UserSession userSession = (UserSession)session.get(Constants.USERSESSION); 
		if (userSession != null)			//若sesson不为空则执行
		{
			return invocation.invoke();
		}else{ 							  //若session为空，则只允许执行登录操作
			
			String url = ServletActionContext.getRequest().getRequestURL().toString();
			int url_loginIndex = url.indexOf("sys/actions/sys-users!frame.action");  
			if(url_loginIndex >= 0){
				return invocation.invoke();
			}
			
		}
		ctx.put("tip" , "您没有执行该操作的权限，请先登录系统！");
		return "sessionOutTime";
    }
}
