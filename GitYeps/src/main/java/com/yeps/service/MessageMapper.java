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
	
	public List<MessageDTO> messageList(int start,int end,String lMode,String name){
		String sql = null;
		if(lMode.equals("allList")) {
			//로그인한 회원의 받은 쪽지를 전부 가져온다.
		    sql = "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name +"' order by msgNum desc)A)"
		    		+ " where  rn between " + start + " and " + end;
		}else if(lMode.equals("allLocker")) {
			//로그인한 회원의 보관함에 있는 쪽지를  가져온다.
			sql = "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name +"' and islocker=1 order by msgNum desc)A)"
					+ " where rn between " + start +" and " + end ;
		}else if(lMode.equals("msgBoxList")) {
			//로그인한 회원의 쪽지함에 있는 쪽지를 가져온다.
			sql = "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name + "' and islocker!=1 order by msgNum desc)A) "
					+ "where rn between " + start +" and " + end;
		}else if(lMode.equals("sender")) {
			//로그인한 회원의 보낸 쪽지 전부를 가져온다.
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message where sender='"+ name + "' order by msgNum desc)A) "
					+ "where rn between " + start +" and " + end;
		}else if(lMode.equals("readMsg")) {
			//읽은 쪽지중 쪽지함에 있는 쪽지
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name + "' and readNum=1 and islocker=0 order by msgNum desc)A)"
					+ " where rn between " + start +" and " + end;
		}else if(lMode.equals("readLocker")) {
			//읽은 쪽지중 보관함에 있는 쪽지
		    sql =  "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name +"' and readNum=1 and islocker=1 order by msgNum desc)A)"
		    		+ " where rn between " + start +" and " + end;
		}else if(lMode.equals("noneMsg")) {
			//안읽은 쪽지함 쪽지
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name +"' and readNum=0 and islocker=0 order by msgNum desc)A)"
					+ " where rn between " + start +" and " + end;
		}else if(lMode.equals("noneLocker")) {
			//안읽은 보관함 쪽지
			sql =  "select * from (select rownum rn, A.* from (select * from yeps_message where receiver='"+ name +"' and readNum=0 and islocker=1 order by msgNum desc)A) "
					+ "where rn between " + start +" and " + end;
		}
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("sql", sql);
		return sqlSession.selectList("messageList",map);
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
	
	public MemberDTO getMember(int mnum) {
		try {
		    return sqlSession.selectOne("getMember",mnum);
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
		System.out.println(sender+"9");
		try {
			return sqlSession.selectOne("getSendCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int getReceiveCount(String receiver) {
		try {
			return sqlSession.selectOne("getReceiveCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int noneMessageCount() {
		try {
			return sqlSession.selectOne("noneMessageCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int readMessageCount() {
		try {
			return sqlSession.selectOne("readMessageCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int noneLockerCount() {
		try {
			return sqlSession.selectOne("noneLockerCount");
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int readLockerCount() {
		try {
			return sqlSession.selectOne("readLockerCount");
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
