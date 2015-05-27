package com.sds.icto.weather.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.weather.domain.WeatherVo;
import com.sds.icto.weather.repository.WeatherDao;

@Service
public class WeatherService {
	
	@Autowired
	WeatherDao weatherDao;
	
	public void addWeather(WeatherVo vo){
		weatherDao.insert(vo);
	}

	public void modifyWeather(WeatherVo vo){
		weatherDao.update(vo);
	}

	public WeatherVo getWeatherByEmail(String email){
		return weatherDao.selectByEmail(email);
	}


}
