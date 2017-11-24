package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.yeps.model.ReviewDBBean;

@Service
public class ReviewMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ReviewDBBean> listReview(){
		//sqlSession안의 중요 메소드
		//selectList, selectOne, insert, update, delete
		return sqlSession.selectList("listReview");
	}
	
	public int insertReview(ReviewDBBean dto) {
		return sqlSession.insert("insertReview", dto);
	}
}
