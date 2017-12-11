package com.yeps.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.MemberDTO;

@Service
public class MemberMapper {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private SqlSession sqlSession;

	public List<MemberDTO> listMember() {
		return sqlSession.selectList("listMember");
	}

	public List<MemberDTO> findMember(String sql){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sql", sql);
		return sqlSession.selectList("findMember",map);
	}

	public int insertMember(MemberDTO dto) {
		int res = sqlSession.insert("insertMember",dto);
		return res;
	}

	public MemberDTO confirmEmail(String email) {
		HashMap map = new HashMap();
		map.put("email", email);
		try {
			return sqlSession.selectOne("confirmEmail", map);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int deleteMember(int mnum) {
		return sqlSession.delete("deleteMember",mnum);
	}

	public MemberDTO loginMember(MemberDTO dto) {
		try {
			return sqlSession.selectOne("loginMember", dto);
		}catch(Exception e) {
			return null;
		}
	}

	public String getSaltByEmail(MemberDTO dto) {
		try {
			return sqlSession.selectOne("getSaltByEmail", dto);
		}catch(Exception e) {
			return null;
		}
	}
	
	public List<String> findMemberEmail(MemberDTO dto) {
		try {
			return sqlSession.selectList("findMemberEmail", dto);
		}catch(Exception e) {
			return null;
		}
	}
	
	public int findMemberPasswd(MemberDTO dto) {
		try {
			return sqlSession.selectOne("findMemberPasswd", dto);
		}catch(Exception e) {
			return 0;
		}
	}
	
	public int temporaryPasswd(MemberDTO dto) {
		return sqlSession.update("temporaryPasswd", dto);
	}
	/*

	 public static MemberDTO checkMember(HashMap map) {
		 SqlSession session = sqlMapper.openSession();
		 try {
			 MemberDTO dto = session.selectOne("checkMember", map);
			 return dto;
		 }finally {
			 session.close();
		 }
	 }

	 public static MemberDTO getMember(int no) {
		 SqlSession session = sqlMapper.openSession();
		 try {
			 MemberDTO dto = session.selectOne("getMember",no);
			 return dto;
		 }finally {
			 session.close();
		 }
	 }

	 public static int updateMember(MemberDTO dto) {
		 SqlSession session = sqlMapper.openSession();
		 try {
			 int res = session.update("updateMember", dto);
			 session.commit();
			 return res;
		 }finally {
			 session.close();
		 }
	 }

	 */
}
