package com.sds.icto.weather.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.weather.domain.MemberVo;
import com.sds.icto.weather.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
 
	/* joinform으로 가는 메서드 */
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String joinForm(){
		return "join";
	}

	/* member insert를 위한 메서드 */
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo){
		memberService.joinMember(vo);
		return "joinsuccess";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(){
		return "login";
	}

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@ModelAttribute MemberVo vo, HttpSession session){
		MemberVo member = memberService.authMember(vo);
		if(member == null){
			return "redirect:/member/login?result=fail";
		}
		session.setAttribute("authMember", member);
		return "redirect:/index";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("authMember");
		session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping(value="/checkemail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkEmail(MemberVo vo){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVo m = memberService.selectMemberByEmail(vo);
		if(m == null){ //중복되는 이메일 없음
			map.put("flag", true);
			map.put("msg", "사용가능한 이메일입니다.");
		}else{ //중복되는 이메일있음
			map.put("flag", false);
			map.put("msg", "중복되는 이메일이 있습니다.");
		}
		return map;
	}
	
	
}
