package com.xmu.core.util;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServlet;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import cn.banny.util.io.Util;

import com.xmu.core.pojo.SystemParam;

@SuppressWarnings("unchecked")
public class Constants extends HttpServlet {
	private static Logger logger = Logger.getLogger(Constants.class);

	private static final long serialVersionUID = 1L;

	public static final String USERSESSION = "UserSession";

	public static Map titleMap = new HashMap();
	
	public static Map stamp = new HashMap(); // 存放时间戳

	private static FileFilter filefilter = new FileFilter() {
		public boolean accept(File file) {
			if (file.getName().startsWith("title"))
				return true;
			else
				return false;
		}
	};


	public static String mysqlUrl = "";

	public static String mysqlUser = "";

	public static String mysqlPassword = "";

	public static int ExportMaxRow = 20000;

	public static String TrsServer;

	public static String TrsPort;

	public static String TrsUser;

	public static String TrsPassword;

	public static String TrsChatViewName;

	static {
		initParam();
		disposeSQL();
	}

	private static void initSysParam() {

		String classpath = Constants.class.getResource("/").getPath()
				.replaceAll("%20", " ");
		String filePath = classpath + "database.properties";

		Properties props = new Properties();
		try {
			FileInputStream istream = new FileInputStream(filePath);
			props.load(istream);
			istream.close();
			PropertyConfigurator.configure(props);

			mysqlUrl = props.getProperty("jdbc.url");
			mysqlUser = props.getProperty("jdbc.user", mysqlUser);
			mysqlPassword = props.getProperty("jdbc.password", mysqlPassword);

			TrsServer = props.getProperty("TrsServer", "");
			TrsPort = props.getProperty("TrsPort", "");
			TrsUser = props.getProperty("TrsUser", "");
			TrsPassword = props.getProperty("TrsPassword", "");
			TrsChatViewName = props.getProperty("TrsChatViewName", "");

		} catch (IOException e) {
			System.out.println("Could not read configuration file [" + filePath
					+ "].");
			System.out.println("Ignoring configuration file [" + filePath
					+ "].");
		}

	}

	/**
	 * 
	 * @function
	 */
	private static void disposeSQL() {
		
		String classPath = Constants.class.getResource("/").getPath().replaceAll("%20", " ").substring(1);
		String filePath = classPath + "update.sql";
		File file = new File(filePath);
		if(file.exists())
		{
			String dataUrl = classPath + "database.properties";
			Properties props = new Properties();
			FileInputStream istream;
			try {
				istream = new FileInputStream(dataUrl);
				props.load(istream);
				istream.close();
				PropertyConfigurator.configure(props);
				mysqlUser = props.getProperty("jdbc.user", mysqlUser);
				mysqlPassword = props.getProperty("jdbc.password", mysqlPassword);
				File datFile = new File(classPath+"update.bat");
				if(!datFile.exists())
				{
					datFile.createNewFile();
					StringBuffer sb = new StringBuffer();
					sb.append("@echo off\n");
					sb.append("cd mysql/bin\n");
					sb.append("mysql -u").append(mysqlUser).append(" ");
					sb.append("-p"+mysqlPassword).append(" " + "qqdb < ");
					sb.append(filePath+"\n").append(":end");
					FileOutputStream out= new FileOutputStream(datFile);
					out.write(sb.toString().getBytes());
					out.flush();
					out.close();
				}
				Runtime run = Runtime.getRuntime();
				String command = "cmd /c ";
				command += datFile.getAbsolutePath();
				run.exec(command);
				file.delete();
			} catch (IOException e) {
				System.out.println("Could not read configuration file [" + filePath
						+ "].");
				System.out.println("Ignoring configuration file [" + filePath
						+ "].");
			}
			
		}else
			return;
	}


	private static void initParam() {

		initSysParam();
	}

	public static void saveINI(SystemParam systemParam) {

		String filePath = Constants.class.getResource("/").getPath()
				.replaceAll("%20", " ");
		filePath = filePath + "database.properties";

		Properties props = new Properties();
		FileInputStream istream = null;
		FileOutputStream o = null;
		try {
			istream = new FileInputStream(filePath);
			props.load(istream);

			props.setProperty("jdbc.url", StringUtils.trim(systemParam
					.getMysqlUrl()));
			props.setProperty("jdbc.user", StringUtils.trim(systemParam
					.getMysqlUser()));
			props.setProperty("jdbc.password", StringUtils.trim(systemParam
					.getMysqlPassword()));
			props.setProperty("TrsServer", StringUtils.trim(systemParam
					.getTrsServer()));
			props.setProperty("TrsUser", StringUtils.trim(systemParam
					.getTrsUser()));
			props.setProperty("TrsPassword", StringUtils.trim(systemParam
					.getTrsPassword()));
			PropertyConfigurator.configure(props);
			o = new FileOutputStream(filePath);
			props.save(o, "");
			initParam();
		} catch (IOException e) {
			System.out.println("Could not read configuration file [" + filePath
					+ "].");
			System.out.println("Ignoring configuration file [" + filePath
					+ "].");
		} finally {
			try {
				istream.close();
				o.close();
			} catch (IOException e) {
				istream = null;
				o = null;
			}

		}
	}


	public Object getBean(String beanName) {
		return ContextLookup.getBean(getServletContext(), beanName);
	}
}