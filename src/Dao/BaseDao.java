package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class BaseDao {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		System.out.println("加载");
	}
	
	/*public static SessionFactory getSessionFactory(){
        //保证SessionFactory为单例
        if (sessionFactory == null ||sessionFactory.isClosed()) {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
    }
	*/
	public Session getSession(){
		System.out.println("获取SessionFactory");
		return this.sessionFactory.getCurrentSession();
	}
	
}
