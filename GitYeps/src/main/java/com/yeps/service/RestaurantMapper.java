package com.yeps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.FileDTO;
import com.yeps.model.RestaurantDTO;

@Service
public class RestaurantMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<RestaurantDTO> listRest(int start,int end,String mode){
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("start", start);
	    map.put("end", end);
	    if(mode.equals("delivery")) {
	    	return sqlSession.selectList("listRestaurant_delivery",map);
	    }else if(mode.equals("reserv")) {
	    	return sqlSession.selectList("listRestaurant_reserv",map);
	    }else if(mode.equals("takeout")) {
	    	return sqlSession.selectList("listRestaurant_takeout",map);
	    }
	    return sqlSession.selectList("listRestaurant",map);
	}

	public int insertRest(RestaurantDTO dto) {
		return sqlSession.update("insertRestaurant", dto);
	}

	public RestaurantDTO getRest(int rnum) {
		return sqlSession.selectOne("getRest", rnum);
	}
	
	public RestaurantDTO getNewRestaurant() {
		return sqlSession.selectOne("getNewRestaurant");
	}
	
	public int getCount() {
		return sqlSession.selectOne("getCount");
	}

	public int getImageCount(int rnum) {
		return sqlSession.selectOne("getImageCount", rnum);
	}

	public List<FileDTO> getFileList(int rnum) {
		return sqlSession.selectList("uploadFileList", rnum);
	}

	// ------------------------------------------------------------------

	public String review_write_getrname(int rnum) {
		return sqlSession.selectOne("review_write_getrname", rnum);
	}
	
	public RestaurantDTO GetRestaurantName_R(int GETrnum) {
		return sqlSession.selectOne("GetRestaurantName_R", GETrnum);
	}
	
	public List<RestaurantDTO> review_restaurantIMG() {
	      return sqlSession.selectList("review_restaurantIMG");
	}

}
