package Dao;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.orm.hibernate4.SessionHolder;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import bean.UserBean;


@Configuration(value = "classpath:conf/db.properties") 
public class UserDaoTest {

	public UserDao userDao = new UserDao();
	
	private ApplicationContext ac;

	private Object applicationContext; 
	
	//InputStream in;
	
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("*.xml");
		/*Properties properties = new Properties();
		in = new FileInputStream("E:/myeclipse保存/Demand/conf/db.properties");
		properties.load(in);*/
		/*BeanFactory bf = new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/config/applicationContext*.xml");//spring配置文件位置
		SessionFactory sf = (SessionFactory) bf.getBean("sessionFactory");//取出hibernate的session工厂
*/	}

	@After
	public void tearDown() throws Exception {
		//in.close();
	}

	/*@Test
	public void testSaveOrUpdate() {
		fail("Not yet implemented");
	}*/

	@Test
	public void testFindByNameAndPass() {
		userDao.findByNameAndPass("lzyz");
	}

}
