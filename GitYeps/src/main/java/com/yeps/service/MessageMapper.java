package com.yeps.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.MemberDTO;
import com.yeps.model.MessageDTO;

@Service
public class MessageMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MessageDTO getContent(int msgnum) {
		try {
		    return sqlSession.selectOne("getContent", msgnum);
		}catch(Exception e) {
			return null;
		}
	}
	
	public int deleteMessage(int msgnum) {
		return sqlSession.delete("deleteMessage", msgnum);
	}
	
	public int writeMessage(MessageDTO dto) {
		return sqlSession.insert("writeMessage", dto);
	}
	
	public List<MessageDTO> messageList(int start, int end){
		HashMap<String ,Integer> map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
		return sqlSession.selectList("messageList",map);
	}
	
	public List<MessageDTO> lockerList() {
		return sqlSession.selectList("lockerList");
	}
	
	public List<MessageDTO> sendList(String sender){
		return sqlSession.selectList("sendList",sender);
	}
	
	public List<MessageDTO> receiveList(String receiver){
		return sqlSession.selectList("receiveList", receiver);
	}

	public String getReceiver(int msgnum){
		try {
			return sqlSession.selectOne("receiver", msgnum);
		}catch(Exception e) {
			return null;
		}
	}
	
	public String getSender(int mnum) {
		try {
			return sqlSession.selectOne("sender",mnum);
		}catch(Exception e) {
			return null;
		}
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
	
	public List<MessageDTO> noReadMessage(){
	    return sqlSession.selectList("noReadMessage");	
	}
	
	public List<MessageDTO> noReadLocker(){
	    return sqlSession.selectList("noReadLocker");	
	}
	
	public List<MessageDTO> importantLocker(){
		return sqlSession.selectList("importantLocker");
	}
	
	public int getMessageCount() {
		try {
		    return sqlSession.selectOne("getMessageCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int getLockerCount() {
		try {
			return sqlSession.selectOne("getLockerCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int getTrashCount() {
		try {
			return sqlSession.selectOne("getTrashCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int getSendCount() {
		try {
			return sqlSession.selectOne("getSendCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int moveToLocker(int msgNum) {
		return sqlSession.update("moveToLocker", msgNum);
	}
	
	public int moveToMsgBox(int msgnum) {
		return sqlSession.update("moveToMsgBox",msgnum);
	}
	
	public MemberDTO getMember(String name) {
		try {
		    return sqlSession.selectOne("getMember",name);
		}catch(Exception e) {
			return null;
		}
	}
	
	
}
