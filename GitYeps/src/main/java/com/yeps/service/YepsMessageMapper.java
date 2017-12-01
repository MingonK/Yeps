package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.MessageDTO;

@Service
public class YepsMessageMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MessageDTO getContent(int msgnum) {
		return sqlSession.selectOne("getContent", msgnum);
	}
	
	public int deleteMessage(int msgnum) {
		return sqlSession.delete("deleteMessage", msgnum);
	}
	
	public int writeMessage(MessageDTO dto) {
		return sqlSession.insert("writeMessage", dto);
	}
	
	public List<MessageDTO> messageList(){
		return sqlSession.selectList("messageList");
	}
	
	public List<MessageDTO> sendList(String sender){
		return sqlSession.selectList("sendList",sender);
	}
	
	public List<MessageDTO> receiveList(String receiver){
		return sqlSession.selectList("receiveList", receiver);
	}

	public String getReceiver(int msgnum){
		return sqlSession.selectOne("receiver", msgnum);
	}
	
	public int updateReadDate(int msgNum) {
		return sqlSession.update("updateReadDate", msgNum);
	}
	
	public int updateReadNum1(int msgNum) {
		return sqlSession.update("updateReadNum1",msgNum);
	}
	
	public int updateReadNum0(int msgNum) {
		return sqlSession.update("updateReadNum0",msgNum);
	}
	
	public int updateImptNum(int msgNum) {
		return sqlSession.update("updateImptNum",msgNum);
	}
	
	public List<MessageDTO> noReadMessage(){
	    return sqlSession.selectList("noReadMessage");	
	}
	
	public List<MessageDTO> importantMessage(){
		return sqlSession.selectList("importantMessage");
	}
	
	/*public int getCount() {
		return sqlSession.selectOne("getCount");
	}*/
}
