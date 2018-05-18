package cn.sicnu.edu.test5.entity;
/**
*@author:  Ming
*@version :2018年5月16日下午9:31:51
*/
public class User {
	private String account;
	private String name;
	private String password;
	private String email;
	public User(String account, String name, String password, String email, String describe) {
		super();
		this.account = account;
		this.name = name;
		this.password = password;
		this.email = email;
		this.describe = describe;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getDescribe() {
		return describe;
	}


	public void setDescribe(String describe) {
		this.describe = describe;
	}


	private String describe;
	

	public User() {
		// TODO Auto-generated constructor stub
	}

}
