package actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.opensymphony.xwork2.ActionSupport;

import Dao.MenuDao;
import services.MenuService;

public class MenuAction extends ActionSupport{
    
	private MenuService menuService;
	
	private String name;
	
	private String nextid;
	
	public String getNextid() {
		return nextid;
	}

	public void setNextid(String nextid) {
		this.nextid = nextid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
    
	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String listOptions() throws JsonProcessingException, UnsupportedEncodingException
	{		
		System.out.println("ok");
		inputStream = new ByteArrayInputStream(menuService.getOptions(name.trim()).getBytes("UTF-8"));
		return "ajax-success";
	}
}
