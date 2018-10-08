package services;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import Dao.AdminDao;

public class AdminServiceTest {
	
	public AdminDao admindao = new AdminDao();

	@Before
	public void setUp() throws Exception {
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testFindByName() {
		admindao.findByName("hyz");
	}

}
