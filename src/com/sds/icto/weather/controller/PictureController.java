package com.sds.icto.weather.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam String keyword, Model model){
		System.out.println(keyword);
		List<PictureVo> list=pictureService.searchByKeyword(keyword);
		System.out.println(list);
		model.addAttribute("list", list);
		return "picture/searchlist";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertForm(){
		return "picture/insert";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(){
		return null;
	}
}
