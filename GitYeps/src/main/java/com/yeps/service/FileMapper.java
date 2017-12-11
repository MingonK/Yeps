package com.yeps.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.FileDTO;

@Service
public class FileMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertFile(FileDTO dto) {
		return sqlSession.insert("insertFile", dto);
	}
}
