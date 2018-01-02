package com.yeps.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.SmallMenuDTO;


@Service
public class SmallMenuMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertSmallMenu(SmallMenuDTO dto) {
		return sqlSession.insert("insertSmallMenu",dto);
	}
	
}
