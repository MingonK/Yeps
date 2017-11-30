package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.EventDTO;

@Service
public class EventMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<EventDTO> listEvent() {
		return sqlSession.selectList("listEvent");
	}
}