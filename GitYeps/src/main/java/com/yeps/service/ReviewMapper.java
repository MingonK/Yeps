package com.yeps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.ReviewDTO;

@Service
public class ReviewMapper {

	@Autowired
	private SqlSession sqlSession;

	//페이징처리 getReviewCount와 PageReviewList
//	public int getReviewCount(){
//		return sqlSession.selectOne("getReviewCount");
//	} 
//
//	public List<ReviewDTO> PageReviewList(int start, int end){
//		String sql = null;	
//		sql = "select *from(select rownum rn, A.* from(select *from (select *from yeps_review order by rvnum)A) where rn between start and end";	
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("sql", sql);
//		return sqlSession.selectList("PageReviewList",map);
//	}



	
	
	
	
	
	public List<ReviewDTO> listReview() {
		// sqlSession - selectList, selectOne, insert, update, delete
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
		try {
			return sqlSession.selectOne("new_BestGradePoint");
		} catch (Exception e) {
			return 0;
		}
	}

	public List<ReviewDTO> getSelectedRestaurant_Rv(int rnum) {
		return sqlSession.selectList("getSelectedRestaurant_Rv", rnum);
	}

	public List<Integer> getSelectedRestaurant_Rv_M(int rnum){
		return sqlSession.selectList("getSelectedRestaurant_Rv_M", rnum);
	}

	//	public List<MemberDTO> getSelectedRestaurant_M(int rnum){
	//		return sqlSession.selectList("getSelectedRestaurant_M", rnum);
	//	}


	public ReviewDTO review_mylist_info2(int NBPmnum) {
		try {
			return sqlSession.selectOne("review_mylist_info2", NBPmnum);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int review_mylist_updatedata(int NBPmnum) {
		try {
			return sqlSession.update("review_mylist_updatedata", NBPmnum);
		} catch (Exception e) {
			return 0;
		}
	}

	public int GetRestaurantName_Rv(int NBPmnum) {
		try {
			return sqlSession.selectOne("GetRestaurantName_Rv", NBPmnum);
		}catch(Exception e) {
			return 0;
		}
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

	public String Get_InsertReviewDate() {
		return sqlSession.selectOne("Get_InsertReviewDate");
	}

}
