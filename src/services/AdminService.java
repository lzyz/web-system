package services;

import Dao.AdminDao;
import bean.AdminInfo;

public class AdminService {
     
	private AdminDao adminDao;
    		
	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public AdminInfo findByName(String username)
	{
		return adminDao.findByName(username);
	}
}
