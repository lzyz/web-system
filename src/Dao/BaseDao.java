package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class BaseDao {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		System.out.println("����");
	}
	
	/*public static SessionFactory getSessionFactory(){
        //��֤SessionFactoryΪ����
        if (sessionFactory == null ||sessionFactory.isClosed()) {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
    }
	*/
	public Session getSession(){
		System.out.println("��ȡSessionFactory");
		return this.sessionFactory.getCurrentSession();
	}
	
}
