package actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import bean.UserBean;
import services.UserServiceImpl;
import utils.MD5Util;
import utils.StringUtil;

public class UserAction extends ActionSupport implements SessionAware,RequestAware,
ModelDriven<UserBean>, Preparable{	
    
	private UserServiceImpl userService;
	
	private String userId;
	
	private int status = 0;
	
	private String username;
	
	private String password;
	
	private Map<String, Object> request;
	
	private Map<String, Object> sessionMap;
    
	private static final long serialVersionUID = 1L;
	
	private UserBean model;
	
	
	
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
		
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
    
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setModel(UserBean model) {
		this.model = model;
	}

	public UserServiceImpl getUserService() {
		return userService;
	}
	
    public void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	
    public UserAction(UserServiceImpl userService) {
    	this.userService = userService;
    }
	
    public UserAction() {//无参构造器必须有				
	}
	
    public String findByNameAndPass()
    {   	
    	model = userService.findByNameAndPass(username);   	
    	if(model==null)
    	{
    		status = 0;
    		return "fail";
    	}
    	else
    	{    		
    		if(model.getPassword().equals(MD5Util.getMD5Code(MD5Util.getMD5Code(password)+model.getSalt())))
    		{  	
    			sessionMap.put("userBean",model);
    			return "success";
    		}
    		else
    		{
    			status = 1;
    			return "fail";   	
    		}
    	}	
    }
    public String register() throws SQLException
    {
    	String salt = StringUtil.getRandomString(10);
		String md5pwd = MD5Util.getMD5Code(MD5Util.getMD5Code(model.getPassword())+salt);
		model.setSalt(salt);
		model.setPassword(md5pwd);
    	status = userService.save(model);    	
    	return "register";
    }
    public void prepareRegister(){
		if(userId == null){
			model = new UserBean();			
		}
		/*else{
			model = userService.get(updateId);
		}*/
	}
    
    @Override
	public void prepare() throws Exception {}

	@Override
	public UserBean getModel() {		
		return model;
	}		

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.sessionMap = arg0;
	}
    
    
    /*public static void Upassword(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException
    {
    	String password = request.getParameter("inputPassword");
    	UserBean UserBean = (UserBean) request.getSession().getAttribute("userBean");
    	String salt = StringUtil.getRandomString(10);
		String md5pwd = MD5Util.getMD5Code(MD5Util.getMD5Code(password)+salt);
		UserBean.setPassword(md5pwd);
		UserBean.setSalt(salt);
		if(UserDao.update(UserBean)>0)
		{
			response.sendRedirect(request.getContextPath()+"/public/password.jsp?sta=1");
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/public/password.jsp?sta=2");
		}
    }
	*/
	
}
