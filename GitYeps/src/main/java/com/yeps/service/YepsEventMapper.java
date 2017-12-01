package com.yeps.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.EventDTO;

@Service
public class YepsEventMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public EventDTO getEvent(int evnum) {
		return sqlSession.selectOne("getEvent", evnum);
	}
	
	public List<EventDTO> eventList(){
		return sqlSession.selectList("eventList");
	}
	
	public int insertEvent(EventDTO dto) {
		return sqlSession.insert("insertEvent", dto);
	}
	
	public int deleteEvent(int evnum) {
		return sqlSession.delete("deleteEvent", evnum);
	}
	
	public int getCount() {
		return sqlSession.selectOne("getCount");
	}

}
