package services;

import java.sql.SQLException;

import Dao.UserDao;
import Interfaces.BaseService;
import bean.UserBean;

public class UserServiceImpl{
    private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public int  save(UserBean userBean) throws SQLException
	{
		return userDao.saveOrUpdate(userBean);
	}
	
	public UserBean findByNameAndPass(String username) {
		
		return userDao.findByNameAndPass(username.trim());
	}
}
