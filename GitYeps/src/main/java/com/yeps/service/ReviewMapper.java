package com.yeps.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.ReviewDTO;

@Service
public class ReviewMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<ReviewDTO> listReview() {
		return sqlSession.selectList("listReview");
	}

	public int insertReview(ReviewDTO dto) {
		return sqlSession.insert("insertReview", dto);
	}

	public int deleteReview(String rvnum) {
		return sqlSession.delete("deleteReview", rvnum);
	}

	public int updateReview(ReviewDTO dto) {
		return sqlSession.update("updateReview", dto);
	}

	public ReviewDTO getReview(int rvnum) {
		try {
			return sqlSession.selectOne("getReview", rvnum);
		 }catch(Exception e) {
			 return null;
		 }
	}

	public int new_BestGradePoint() {
		return sqlSession.selectOne("new_BestGradePoint");
	}
	
	public String getSelectedRestaurant_Rname(int rnum) {
		return sqlSession.selectOne("getgetSelectedRestaurant_Rname", rnum);
	}

	public List<ReviewDTO> getSelectedRestaurant_Rv(int rnum) {
		return sqlSession.selectList("getSelectedRestaurant_Rv", rnum);
	}
	
//	public List<Integer> getSelectedRestaurant_Rv_M(int rnum){
//		return sqlSession.selectList("getSelectedRestaurant_Rv_M", rnum);
//	}
	
//	public List<MemberDTO> getSelectedRestaurant_M(int rnum){
//		return sqlSession.selectList("getSelectedRestaurant_M", rnum);
//	}


	public ReviewDTO review_mylist_info(int NBPmnum) {
		return sqlSession.selectOne("review_mylist_info", NBPmnum);
	}

	public int review_mylist_updatedata(int NBPmnum) {
		return sqlSession.selectOne("review_mylist_updatedata", NBPmnum);
	}
	
	public int GetRestaurantName_Rv(int NBPmnum) {
		return sqlSession.selectOne("GetRestaurantName_Rv", NBPmnum);
	}
	
	public List<ReviewDTO> recentReviewInfo() {
			return sqlSession.selectList("recentReviewInfo");
	}

	public List<ReviewDTO> numList(int reviewIntList){
		return sqlSession.selectList("numList", reviewIntList);
	}
	
	public List<ReviewDTO> previous_reviews_Num(){
		return sqlSession.selectList("previous_reviews_Num");
	}
	
	public List<ReviewDTO> previous_Rv(){
		return sqlSession.selectList("previous_Rv");
	}
	
	public List<ReviewDTO> review_keyword(String SearchKeyword){
		return sqlSession.selectList("review_keyword", SearchKeyword);
	}

	
//	public int review_EstimateCount_update(int rvnum) {
//		return sqlSession.update("review_EstimateCount_update", rvnum);
//	}
	
	
	
}
