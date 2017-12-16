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
		return sqlSession.selectOne("getEvnum", map);
	}
	
	public boolean RedundancyCheck(String eventName) {
		EventDTO dto = sqlSession.selectOne("RedundancyCheck", eventName);
		if(dto == null) {
			return true;
		} else {
			return false; 
		}
	}
	
	public int updateFilenum(int filenum, int evnum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("filenum", filenum);
		map.put("evnum", evnum);
		return sqlSession.update("updateFilenum", map);
	}
	
	public List<EventDTO> getThisWeek_EventList() {
		return sqlSession.selectList("getThisWeek_EventList");
	}
}
