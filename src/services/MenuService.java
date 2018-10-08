package services;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao.MenuDao;
import bean.MenuInfo;

public class MenuService {
      private MenuDao menuDao;

	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
    
	public String getOptions(String name) throws JsonProcessingException
	{
		 List<MenuInfo> menus = menuDao.getAll(name.trim());
		 ObjectMapper mapper = new ObjectMapper();
		 String result = mapper.writeValueAsString(menus);
		 return result;
	}
}
