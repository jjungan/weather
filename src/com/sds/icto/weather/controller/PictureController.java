package com.sds.icto.weather.controller;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sds.icto.weather.domain.MemberVo;
import com.sds.icto.weather.domain.PictureVo;
import com.sds.icto.weather.domain.WeatherVo;
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
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertForm(){
		return "picture/insert";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute PictureVo vo, @RequestParam("file")MultipartFile file, HttpSession session){
        String fileOriginalName = file.getOriginalFilename();
        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
        String fileName = file.getName();
        Long size = file.getSize();
        
        //저장 파일 이름 만들기.
        String saveFileName = "";
        Calendar calendar = Calendar.getInstance();
        
        saveFileName += calendar.get( Calendar.YEAR );
        saveFileName += calendar.get( Calendar.MONTH );
        saveFileName += calendar.get( Calendar.DATE );
        saveFileName += calendar.get( Calendar.HOUR );
        saveFileName += calendar.get( Calendar.MINUTE );
        saveFileName += calendar.get( Calendar.SECOND );
        saveFileName += calendar.get( Calendar.MILLISECOND );
        saveFileName += ( "." + extName );


        writeFile( file, "c:\\temp", saveFileName );
        
        vo.setImage(saveFileName);
        MemberVo m = (MemberVo)session.getAttribute("authMember");
        WeatherVo w = (WeatherVo)session.getAttribute("weather");
        vo.setEmail(m.getEmail());
        vo.setLocation(w.getAddress());
        pictureService.add(vo);
        
		return "redirect:/picture/list";
	}

	private void writeFile( MultipartFile file, String path, String fileName ) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + "\\" + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}	
}
