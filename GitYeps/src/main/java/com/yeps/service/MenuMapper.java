package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.MenuDTO;

@Service
public class MenuMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MenuDTO> listMenu() {
		return sqlSession.selectList("menuList");
	}
}
