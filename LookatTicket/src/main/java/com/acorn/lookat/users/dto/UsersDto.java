package com.acorn.lookat.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String name;
	private int addrNum;
	private String addr;
	private String birth;
	private String phone;
	private String email;
	private String regdate;
	private String newPwd;
	
	public UsersDto(){}

	public UsersDto(String id, String pwd, String name, int addrNum, String addr, String birth, String phone,
			String email, String regdate, String newPwd) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.addrNum = addrNum;
		this.addr = addr;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
		this.newPwd = newPwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	
}
