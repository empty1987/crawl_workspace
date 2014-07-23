/** 
  *SysUsersAction.java 2009-11-25 xujb
  */
package com.xmu.sys.actions;

 
import com.opensymphony.xwork2.ModelDriven;
import com.xmu.core.actions.BaseAction;
import com.xmu.core.util.Constants;
import com.xmu.sys.pojo.SysLogs;
import com.xmu.sys.service.SysService;

/**
 * @function 系统日志模块
 * @author xujb
 */
public class SysLogsAction extends BaseAction implements ModelDriven<SysLogs>{
	
 
	
	private static final long serialVersionUID = 1L;
	 
	private SysService sysService;        
	
	private SysLogs sysLogs = new SysLogs();
  
	private String tips = "";  //提示消息
	
 

	/**
	 * 
	 * @function 列表
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public String list(){
		
		page = sysService.getPageList("SysLogs.getPageList", "SysLogs.getTotalCount", sysLogs, page);   
		 
		return "list";
	} 
	 
	/**
	 * 
	 * @function 导出所有列表
	 * @return String
	 */
	public String export(){ 
		
		page.setPageNo(1);
		page.setPageSize(Constants.ExportMaxRow);
		page = sysService.getPageList("SysLogs.getPageList", "SysLogs.getTotalCount", sysLogs, page);   
		return "export";
	} 
	
	public void setSysLogs(SysLogs sysLogs) {
		this.sysLogs = sysLogs;
	}

	/**
	 * 
	 * @function 删除
	 * @return String
	 */
	public String delete(){ 
		 
		sysService.removeObject("SysLogs.delete", sysLogs.getId()); 
		return JSON;
	} 

	public String getTips() {
		return tips;
	}
  
	public void setTips(String tips) {
		this.tips = tips;
	}
 
	 
	/**
	 * 实现接口ModelDriven方法
	 */
	
	public SysLogs getModel() {
		 
		return sysLogs;
	}
	
	/**
	 * 
	 * @function spring注入service接口方法
	 * @param sysService void
	 */
	public void setSysService(SysService sysService) {
		this.sysService = sysService;
	}

	public SysLogs getSysLogs() {
		return sysLogs;
	}

 

}
