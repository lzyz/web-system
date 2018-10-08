package Dao;


import bean.UserBean;

import utils.MD5Util;

import org.hibernate.Query;

public class UserDao extends BaseDao{
		
	 public int saveOrUpdate(UserBean userBean)
	 {
	    	try {
	    		getSession().saveOrUpdate(userBean);  	
	    		return 1;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return 0;
			}	    	
	 }
	 	
	 public UserBean findByNameAndPass(String username) {
		    String hql = "FROM UserBean as e WHERE e.username = ?";
		    System.out.println("UserName:"+username);
		    Query query = getSession().createQuery(hql).setString(0,username);
		    UserBean userBean = (UserBean) query.uniqueResult();		    
		    /*if(userBean!=null)
		    {
		    	System.out.println(userBean.getUsername());
		    }
		    else
		    {
		    	System.out.println("空");
		    }*/
		    return userBean;		   	
	 }
	
	/*public boolean checkReg(String name) throws SQLException
    {   	
    	String sql = "select * from UserInfo where username = ?";
    	QueryRunner qRunner = new QueryRunner();
    	UserBean userbean = qRunner.query(con, sql, new BeanHandler(UserBean.class),name);
        if(userbean!=null)
        {
        	return false;
        }
        return true;
    }
    public static UserBean getById(int id)
    {
    	String sql = "select * from UserInfo where id = "+id+"";
    	Connection con = DBUtil.getConnection();
    	Statement state = null;
    	ResultSet rs = null;
    	UserBean Userbean = null;
    	try {
			state = con.createStatement();
			rs = state.executeQuery(sql);
			while(rs.next())
			{
				Userbean = getBean(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, state, con);
		}
    	return Userbean;
    }
    public static UserBean getBean(ResultSet rs) throws SQLException
    {
    	UserBean Userbean = new UserBean();
    	Userbean.setId(rs.getInt("id"));
    	Userbean.setName(rs.getString("name"));
    	Userbean.setPassword(rs.getString("password"));
    	Userbean.setPhone(rs.getString("phone"));
    	Userbean.setSalt(rs.getString("salt"));
    	Userbean.setUsername(rs.getString("username"));
    	Userbean.setAddress(rs.getString("address"));
    	Userbean.setIdentify(rs.getString("identify"));
    	Userbean.setCompany(rs.getString("company"));
    	return Userbean;
    }
    public static List<String> getNames(String info)
    {
    	DBUtil2 db = new DBUtil2();
    	String sql = "select name from UserInfo where name like ?";
    	String[] params = {info};
    	List<String> names = db.getList1(sql, params);
    	return names;
    }
    public static UserBean checkLogin(String username) throws SQLException
    {
    	String sql = "select * from UserInfo where username = ?";
    	con = DBUtil.getConnection();
    	String[] params = {username};
    	QueryRunner qRunner = new QueryRunner();
    	UserBean userbean = (UserBean)qRunner.query(con, sql,new BeanHandler(UserBean.class),username);
    	DbUtils.closeQuietly(con);
    	return userbean;
    }
    public static int update(UserBean Userbean) throws UnsupportedEncodingException, SQLException
    {
    	String sql = "update UserInfo set username=?,name=?,password=?"+",salt=?,phone=?"
    			+ ",company=?,address=?,identify=?,postcode=? where id = ?";
        Connection con = DBUtil.getConnection();
        QueryRunner qRunner = new QueryRunner();
        int n = qRunner.update(con,sql,Userbean.getUsername(),Userbean.getName(),Userbean.getPassword(),Userbean.getSalt()
        		,Userbean.getPhone(),Userbean.getCompany(),Userbean.getAddress(),Userbean.getIdentify(),
        		Userbean.getPostcode(),Userbean.getId());
        System.out.println("成功更新" + n + "条数据！");
        DbUtils.closeQuietly(con);
        return n;
    }*/
   
}
