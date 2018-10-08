package Dao;

import org.hibernate.Query;

import bean.AdminInfo;
import bean.UserBean;

public class AdminDao extends BaseDao{
      
	public AdminInfo findByName(String username)
	{
		String hql = "FROM AdminInfo as e WHERE e.username = ?";
	    Query query = getSession().createQuery(hql).setString(0,username);
	    AdminInfo adminInfo = (AdminInfo) query.uniqueResult();		    
	    /*if(adminInfo!=null)
	    {
	    	System.out.println(adminInfo.getUsername());
	    }
	    else
	    {
	    	System.out.println("Пе");
	    }*/
	    return adminInfo;	
	}
}
