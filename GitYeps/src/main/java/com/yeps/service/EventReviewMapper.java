package com.yeps.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.EventReviewDTO;

@Service
public class EventReviewMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<EventReviewDTO> listEventReview(int evnum) {
		return sqlSession.selectList("listEventReview", evnum);
	}
	
	public int insertEventReview(int evnum, int mnum, String eventReview_content, String ip) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("evnum", evnum);
		map.put("mnum", mnum);
		map.put("eventReview_content", eventReview_content);
		map.put("ip", ip);
		return sqlSession.insert("insertEventReview", map);
	}
}
