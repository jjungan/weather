package com.sds.icto.weather.domain;

public class WeatherVo {
	private long no;
	private String email;
	private int x;
	private int y;
	private String address;
	private String climate;
	private String temp;
	private String time;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getClimate() {
		return climate;
	}
	public void setClimate(String climate) {
		this.climate = climate;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "WeatherVo [no=" + no + ", email=" + email + ", x=" + x + ", y="
				+ y + ", address=" + address + ", climate=" + climate
				+ ", temp=" + temp + ", time=" + time + "]";
	}
	

}
