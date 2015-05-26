package com.sds.icto.weather.domain;

public class MemberVo {
	
	private String email;
	private String password;
	private String name;
	private String location;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "MemberVo [email=" + email + ", password=" + password
				+ ", name=" + name + ", location=" + location + "]";
	}
	
	

}
