package com.sds.icto.weather.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.weather.domain.PictureVo;

@Repository
public class PictureDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public List<PictureVo> selectList() {
		return sqlMapClientTemplate.queryForList("picture.selectList");
	}
	public void insert(PictureVo vo){
		sqlMapClientTemplate.insert("picture.insert",vo);
	}

}
