package com.sds.icto.weather.domain;

import java.sql.Date;

public class PictureVo {
	private long no;
	private String email;
	private String title;
	private String image;
	private String content;
	private String time;
	private String season;
	private String weather;
	private String location;
	private Date regdate;
	private int likes;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "PictureVo [no=" + no + ", email=" + email + ", title=" + title
				+ ", image=" + image + ", content=" + content + ", time="
				+ time + ", season=" + season + ", weather=" + weather
				+ ", location=" + location + ", regdate=" + regdate
				+ ", likes=" + likes + "]";
	}
	
	
	
}
