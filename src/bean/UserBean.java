package bean;


public class UserBean {
	
	int id;
	
    private String username,name,password,salt,phone,address,identify,postcode,company,field;
          
    	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", username=" + username + ", name=" + name + ", password=" + password + ", salt="
				+ salt + ", phone=" + phone + ", address=" + address + ", identify=" + identify + ", postcode="
				+ postcode + ", company=" + company + ", field=" + field + "]";
	}	

	public UserBean()
	{
	}
	
	public UserBean(int id, String username, String name, String password, String salt, String phone, String address,
			String identify, String postcode, String company, String field) {
		super();
		this.id = id;
		this.username = username;
		this.name = name;
		this.password = password;
		this.salt = salt;
		this.phone = phone;
		this.address = address;
		this.identify = identify;
		this.postcode = postcode;
		this.company = company;
		this.field = field;		
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
