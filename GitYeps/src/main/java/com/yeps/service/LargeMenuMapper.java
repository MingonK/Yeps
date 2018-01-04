package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.LargeMenuDTO;

@Service
public class LargeMenuMapper {

	@Autowired
	private SqlSession sqlSession;

	public int insertLargeMenu(LargeMenuDTO dto) {
		return sqlSession.insert("insertLargeMenu", dto);
	}

	public int getLastLargeMenu() {
		return sqlSession.selectOne("getLastLargeMenu");
	}

	public List<LargeMenuDTO> listLargeMenu(int rnum) {
		return sqlSession.selectList("listLargeMenu", rnum);
	}
}
