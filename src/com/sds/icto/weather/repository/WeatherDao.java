package com.sds.icto.weather.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.weather.domain.WeatherVo;

@Repository
public class WeatherDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(WeatherVo vo){
		sqlMapClientTemplate.insert("weather.insert",vo);
	}

	public void update(WeatherVo vo){
		sqlMapClientTemplate.insert("weather.update",vo);
	}

	public WeatherVo selectByEmail(String email){
		WeatherVo weather = (WeatherVo) sqlMapClientTemplate.queryForObject("weather.selectByEmail",email);
		return weather;
	}
	

}
