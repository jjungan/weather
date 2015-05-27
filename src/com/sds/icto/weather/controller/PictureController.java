package com.sds.icto.weather.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sds.icto.weather.domain.PictureVo;
import com.sds.icto.weather.service.PictureService;

@Controller
@RequestMapping("picture")
public class PictureController {
	
	@Autowired
	PictureService pictureService;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<PictureVo> list=pictureService.getList();
		model.addAttribute("list", list);
		return "picture/list";
	}
	
	/*update likes*/
	/*view picture*/
}
