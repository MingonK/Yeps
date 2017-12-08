package com.yeps.service;

import java.util.HashMap;
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
	
	public int insertEvent(EventDTO dto) {
		return sqlSession.insert("insertEvent", dto);
	}
	
	public EventDTO getEventContent(int evnum) {
		return sqlSession.selectOne("getEventContent", evnum);
	}
	
	public int getEvnum(String eventName, String store_address) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("eventname", eventName);
		map.put("store_address", store_address);
		int evnum = sqlSession.selectOne("getEvnum", map);
		return evnum;
	}
	
	public boolean RedundancyCheck(String eventName, String store_address) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("eventname", eventName);
		map.put("store_address", store_address);
		EventDTO dto = sqlSession.selectOne("RedundancyCheck", map);
		if(dto == null) {
			return true;
		} else {
			return false; 
		}
	}
}
