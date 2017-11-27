package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.YepsMessageDBBean;

@Service
public class YepsMessageMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public YepsMessageDBBean getContent(int msgnum) {
		return sqlSession.selectOne("getContent", msgnum);
	}
	
	public int deleteMessage(int msgnum) {
		return sqlSession.delete("deleteMessage", msgnum);
	}
	
	public int writeMessage(YepsMessageDBBean dto) {
		return sqlSession.insert("writeMessage", dto);
	}
	
	public List<YepsMessageDBBean> messageList(){
		return sqlSession.selectList("messageList");
	}
	
	public List<YepsMessageDBBean> sendList(String sender){
		return sqlSession.selectList("sendList");
	}
	

	
}
