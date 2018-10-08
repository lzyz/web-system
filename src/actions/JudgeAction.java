package actions;

import com.opensymphony.xwork2.ActionSupport;

public class JudgeAction extends ActionSupport{
    
	private String username;
	
	private String password;	

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
	
	public String judge()
	{
		if(username.length()>4)
		{
			
		}
		return "";
	}
}
