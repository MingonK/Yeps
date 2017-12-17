package com.yeps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<MessageDTO> messageList(int start,int end,String lMode){
		String sql = null;
		if(lMode.equals("allList")) {
			
		    sql = "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where rn between " + start + " and " +end;
		}else if(lMode.equals("lockerList")) {
			
			sql = "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where islocker=1 and rn between " + start +" and " + end ;
		}else if(lMode.equals("msgBoxList")) {
			
			sql = "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where islocker!=1 and rn between " + start +" and " + end;
		}else if(lMode.equals("receiver")) {
			
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where receiver=" + lMode + " and rn between " + start +" and " + end;
		}else if(lMode.equals("sender")) {
			
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where sender=" + lMode + " and rn between " + start +" and " + end;
		}else if(lMode.equals("noneMsg")) {
			
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where readNum=0 and islocker=0 and rn between " + start +" and " + end;
		}else if(lMode.equals("noneLocker")) {
			
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message order by msgNum desc)A) where readNum=0 and islocker=1 and rn between " + start +" and " + end;
		}
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("sql", sql);
		return sqlSession.selectList("messageList",map);
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
	
	public MemberDTO getMember(String name) {
		try {
		    return sqlSession.selectOne("getMember",name);
		}catch(Exception e) {
			return null;
		}
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
	
	public int getSendCount(String sender) {
		try {
			return sqlSession.selectOne("getSendCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int moveToLocker(int msgNum) {
		return sqlSession.update("moveToLocker", msgNum);
	}
	
	public int lockerToMsgBox(int msgnum) {
		return sqlSession.update("lockerToMsgBox",msgnum);
	}
	
}
