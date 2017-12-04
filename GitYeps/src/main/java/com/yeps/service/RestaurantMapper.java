package com.yeps.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.RestaurantDTO;


/**
 * This is not a best practices class.  It's just an example
 * to give you an idea of how iBATIS works.  For a more complete
 * example, see JPetStore 5.0 at http://www.ibatis.com.
 */
@Service
public class RestaurantMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<RestaurantDTO> listRest(){
		return sqlSession.selectList("listRestaurant");
	}

	public int insertRest(RestaurantDTO dto) {
		return sqlSession.update("insertRestaurant",dto);
	}
	
	public RestaurantDTO getRest(int rnum) {
		RestaurantDTO dto=sqlSession.selectOne("getRest",rnum);
		return dto;
	}

	public int fileUpload(String originalfileName, String saveFileName, long fileSize,int rnum) {
	    HashMap<String, Object> hm = new HashMap<String, Object>();
	    hm.put("originalfileName", originalfileName);
	    hm.put("saveFileName", saveFileName);
	    hm.put("fileSize", fileSize);
	    hm.put("rnum", rnum);
	    return sqlSession.update("uploadFile",hm);
	}
	public List<uploadFileVO> getFileList(int rnum) {
		return sqlSession.selectList("uploadFileList",rnum);
	}
	





}
















