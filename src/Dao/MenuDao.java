package Dao;

import java.util.List;

import org.hibernate.Query;


import bean.MenuInfo;


public class MenuDao extends BaseDao {
      
		
	public List<MenuInfo> getAll(String name)
	{
		String hql = "FROM MenuInfo e WHERE e.pid = ?";		
		String pid = getPid(name.trim());				
		System.out.println(pid);
		return getSession().createQuery(hql).setString(0,pid).list();
	}
	
	public String getPid(String name)
    {    	
    	String hql = "select e.id FROM MenuInfo e WHERE e.name = ?";
    	List id = getSession().createQuery(hql).setString(0,name.trim()).list();    	
    	System.out.println("size:"+id.size());
    	return (id.size()==0?"0":(String)id.get(0));
    }
}
