package com.yeps.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.LargeMenuDTO;


@Service
public class LargeMenuMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertLargeMenu(LargeMenuDTO dto) {
		return sqlSession.insert("insertLargeMenu",dto);
	}
	
}
