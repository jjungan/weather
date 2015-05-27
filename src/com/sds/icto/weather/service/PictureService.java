package com.sds.icto.weather.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.weather.domain.PictureVo;
import com.sds.icto.weather.repository.PictureDao;

@Service
public class PictureService {

	@Autowired
	PictureDao pictureDao;
	
	public List<PictureVo> getList() {
		return pictureDao.selectList();
	}
	public void add(PictureVo vo){
		pictureDao.insert(vo);
	}

}
