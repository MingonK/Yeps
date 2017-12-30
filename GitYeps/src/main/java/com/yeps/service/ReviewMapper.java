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
		return sqlSession.selectOne("getReview", rvnum);
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

	public ReviewDTO review_mylist_info(int NBPmnum) {
		return sqlSession.selectOne("review_mylist_info", NBPmnum);
	}

	public int review_mylist_updatedata(int rvnum) {
		return sqlSession.update("review_mylist_updatedata", rvnum);
	}

	public int GetRestaurantName_Rv(int NBPmnum) {
		return sqlSession.selectOne("GetRestaurantName_Rv", NBPmnum);
	}

	public List<ReviewDTO> recentReviewInfo() {
		return sqlSession.selectList("recentReviewInfo");
	}

	public ReviewDTO numList(int reviewIntList) {
		return sqlSession.selectOne("numList", reviewIntList);
	}

	public List<ReviewDTO> previous_reviews_Num() {
		return sqlSession.selectList("previous_reviews_Num");
	}

	public List<ReviewDTO> previous_Rv() {
		return sqlSession.selectList("previous_Rv");
	}

	public List<ReviewDTO> review_keyword(String SearchKeyword) {
		return sqlSession.selectList("review_keyword", SearchKeyword);
	}

	public ReviewDTO getLastReview(int rnum) {
		return sqlSession.selectOne("getLastReview", rnum);
	}

	public int getReviewCount(int rnum) {
		return sqlSession.selectOne("getReviewCount", rnum);
	}

	public int getStarAvg(int rnum) {
		if (sqlSession.selectOne("getStarAvg", rnum) == null) {
			return 0;
		}
		return sqlSession.selectOne("getStarAvg", rnum);
	}

	public List<Integer> getSelectedRestaurant_Rv_M(int rnum) {
		return sqlSession.selectList("getSelectedRestaurant_Rv_M", rnum);
	}

	public List<ReviewDTO> listRestReview(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("listRestaurantReview", map);
	}

	public String Get_InsertReviewDate() {
		return sqlSession.selectOne("Get_InsertReviewDate");
	}
}
