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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sds.icto.weather.domain.MemberVo;
import com.sds.icto.weather.domain.PictureVo;
import com.sds.icto.weather.domain.WeatherVo;
import com.sds.icto.weather.service.PictureService;

@Controller
@RequestMapping("/picture")
public class PictureController {
	
	@Autowired
	PictureService pictureService;
	
	/* 사진전체리스트 보여주는 메서드 */
	@RequestMapping("/list")
	public String list(Model model){
		List<PictureVo> list=pictureService.getList();
		model.addAttribute("list", list);
		return "picture/list";
	}
	
	/* 내가 올린 사진리스트 보여주는 메서드 */
	@RequestMapping("/mylist")
	public String mylist(Model model, HttpSession session){
		MemberVo member=(MemberVo)session.getAttribute("authMember");
		List<PictureVo> list=pictureService.getMyList(member.getEmail());
		model.addAttribute("list", list);
		return "picture/mylist";
	}
	
	/* 좋아요 누르면 업데이트되는 메서드 */
	@RequestMapping("/like")
	@ResponseBody
	public PictureVo like(@RequestParam long no){
		pictureService.modifyLike(no);
		PictureVo picture=pictureService.getOnePicture(no);
		return picture;
	}
	
	/* content내용 검색하는 메서드 */
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam String keyword, Model model){
		List<PictureVo> list=pictureService.searchByKeyword(keyword);
		model.addAttribute("list", list);
		return "picture/searchlist";
	}
	
	/* 사진 insertform으로 가는 메서드 */
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertForm(){
		return "picture/insert";
	}
	
	/* 사진 insert하는 메서드 */
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
	
	/* 경로에 파일을 쓰는 메서드 */
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
