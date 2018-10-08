package actions;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import Dao.AdminDaoTest;
import bean.AdminInfo;
import bean.UserBean;
import services.AdminService;
import utils.MD5Util;

public class AdminAction extends ActionSupport implements SessionAware,RequestAware,
ModelDriven<AdminInfo>, Preparable{

	private AdminService adminService;
	
	private AdminInfo model;
	
    private String userId;
	
	private int status = 0;
	
	private String username;
	
	private String password;
	
	private Map<String, Object> sessionMap;
		
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getStatus() {
		return status;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}


	public String findByNameAndPass()
    {   	
    	model = adminService.findByName(username);   
    	AdminDaoTest a = new AdminDaoTest();
    	a.testFindByName(username);
    	if(model==null)
    	{
    		status = 0;
    		return "fail";
    	}
    	else
    	{    		
    		if(model.getPassword().equals(MD5Util.getMD5Code(MD5Util.getMD5Code(password)+model.getSalt())))
    		{  	
    			sessionMap.put("adminInfo",model);
    			return "success";
    		}
    		else
    		{
    			status = 1;
    			return "fail";   	
    		}
    	}	
    }
		
	@Override
	public void prepare() throws Exception {}

	@Override
	public AdminInfo getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub		
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.sessionMap = arg0;
	}

}
