package com.sds.icto.weather.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.weather.domain.MemberVo;
import com.sds.icto.weather.domain.WeatherVo;
import com.sds.icto.weather.service.WeatherService;

@Controller
@RequestMapping("/weather")
public class WeatherController {

	@Autowired
	WeatherService weatherService;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public WeatherVo insert(WeatherVo vo, HttpSession session){
		MemberVo member = (MemberVo)session.getAttribute("authMember");
		if(member == null){
			return null;
		}
		vo.setEmail(member.getEmail());
		WeatherVo weatherVo = weatherService.getWeatherByEmail(member.getEmail());
		//해당 이메일로 저장된 weather가 없을 때는 인서트, 있을 때는 업데이트
		if(weatherVo == null){
			weatherService.addWeather(vo);
		}else{
			weatherService.modifyWeather(vo);
		}
		WeatherVo weatherDB = weatherService.getWeatherByEmail(member.getEmail());
		session.setAttribute("weather", weatherDB);
		return weatherDB;
	}
	
}
