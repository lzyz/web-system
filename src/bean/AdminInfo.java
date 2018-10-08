package bean;

/**
 * AdminInfo entity. @author MyEclipse Persistence Tools
 */

public class AdminInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String name;
	private String phone;
	private String password;
	private String salt;

	// Constructors

	/** default constructor */
	public AdminInfo() {
	}

	/** full constructor */
	public AdminInfo(Integer id, String username, String name, String phone, String password, String salt) {
		this.id = id;
		this.username = username;
		this.name = name;
		this.phone = phone;
		this.password = password;
		this.salt = salt;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return this.salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

}