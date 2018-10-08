package Dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import bean.AdminInfo;


public class AdminDaoTest {
	
	//public AdminDao admindao;
	
	//AdminInfo adminInfo;
	@Before
	public void setUp() throws Exception {
		
		/*adminInfo = new AdminInfo();
		adminInfo.setId(1);
		adminInfo.setName("ºÂÒ»Ôó");
		adminInfo.setPassword("26c82eff449a390d4a39104abdc6db99");
		adminInfo.setPhone("13028689507");
		adminInfo.setSalt("c5tgno1n0k");
		adminInfo.setUsername("hyz");*/
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testFindByName(String name) {
		//String name="hyz";
		AdminDao admindao = new AdminDao();
		AdminInfo admininfo = admindao.findByName("hyz");
		//assertEquals("hyz",admininfo.getUsername());
		System.out.println(admininfo.getName());
		Assert.assertEquals(admininfo.getName(),"hyz");
		
	}

}
