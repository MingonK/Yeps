package com.yeps.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.RestaurantDTO;

@Service
public class RestaurantMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<RestaurantDTO> listRest(int start, int end, String mode, List<Integer> prices) {
		String sql=null;
//		String pricesSql = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		if(prices.get(0)!=0) {
//			for(int i=0;i<prices.size();i++) {
//				if(prices.size()==0) {
					sql = "and price=";
					sql+=String.valueOf(prices.get(0));
//				}else {
//					pricesSql = "or price = ";
//					pricesSql+=String.valueOf(prices.get(i));
//				}
//			}
			map.put("sql", sql);
//			map.put("pricesSql", pricesSql);
			return sqlSession.selectList("listRestaurant_"+mode+"",map);
		}else {
			if (mode.equals("delivery")) {
				return sqlSession.selectList("listRestaurant_delivery", map);
			} else if (mode.equals("reserv")) {
				return sqlSession.selectList("listRestaurant_reserv", map);
			} else if (mode.equals("takeout")) {
				return sqlSession.selectList("listRestaurant_takeout", map);
			}
			return sqlSession.selectList("listRestaurant_mode", map);
		}
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

	public RestaurantDTO getHotAndNewRestaurant(int rnum) {
		return sqlSession.selectOne("getHotAndNewRestaurant", rnum);
	}

	// -------------- 이벤트랑 레스토랑 연결 ---------------------------
	public RestaurantDTO findRestaurant(String zipNo, String roadAddrPart1, String roadAddrPart2, String addrDetail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("zipNo", zipNo);
		map.put("roadAddrPart1", roadAddrPart1);
		map.put("roadAddrPart2", roadAddrPart2);
		map.put("addrDetail", addrDetail);
		return sqlSession.selectOne("findRestaurant", map);
	}

	// 메인페이지 랜덤 사진 가져오기



	//////////////1월 4일 상우추가 
	public int get_review_restaurantFind_Count(String SearchFind){
		return sqlSession.selectOne("get_review_restaurantFind_Count", SearchFind);
	}



	public List<RestaurantDTO> review_restaurantFind(int start, int end, String SearchFind) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("SearchFind", SearchFind);
		return sqlSession.selectList("review_restaurantFind", map);
	}
	
	//---------------1월 5일 민우 추가
	public int getCountBySearchMap(HashMap<String,Object> searchMap) {
		if(searchMap.get("category") != null) {
			if(searchMap.get("location") != null) {
				if(searchMap.get("searchword") != null) {
					// category, location, searchword 셋 다 널이 아닐 경우
					return sqlSession.selectOne("getCountByCLS", searchMap);
				}else {
					//  category, location 널이 아닐 경우
					return sqlSession.selectOne("getCountByCL", searchMap);
				}
			}else {
				if(searchMap.get("searchword") != null) {
					// category, searchword 널이 아닐 경우
					return sqlSession.selectOne("getCountByCS", searchMap);
				}else {
					// category 널이 아닐 때
					return sqlSession.selectOne("getCountByC", searchMap);
				}
			}
		}else {
			if(searchMap.get("location") != null ) {
				if(searchMap.get("searchword") != null ) {
					//  location, searchword 널이 아닐 경우
					return sqlSession.selectOne("getCountByLS", searchMap);
				}else {
					//  location 널이 아닐 경우
					return sqlSession.selectOne("getCountByL", searchMap);
				}
			}else {
				if(searchMap.get("searchword") != null ) {
					//  searchword 널이 아닐 경우
					return sqlSession.selectOne("getCountByS", searchMap);
				}else {
					//  전부 널일 경우	
					return sqlSession.selectOne("getCount");
				}
			}
		}
	}
	
	public List<RestaurantDTO> listRestBySearchMap(int start, int end, HashMap<String,Object> searchMap){
		searchMap.put("start", start);
		searchMap.put("end", end);
		
		if(searchMap.get("category") != null) {
			if(searchMap.get("location") != null) {
				if(searchMap.get("searchword") != null) {
					// category, location, searchword 셋 다 널이 아닐 경우
					return sqlSession.selectList("listRestByCLS", searchMap);
				}else {
					//  category, location 널이 아닐 경우
					return sqlSession.selectList("listRestByCL", searchMap);
				}
			}else {
				if(searchMap.get("searchword") != null) {
					// category, searchword 널이 아닐 경우
					return sqlSession.selectList("listRestByCS", searchMap);
				}else {
					// category 널이 아닐 때
					return sqlSession.selectList("listRestByC", searchMap);
				}
			}
		}else {
			if(searchMap.get("location") != null) {
				if(searchMap.get("searchword") != null) {
					//  location, searchword 널이 아닐 경우
					return sqlSession.selectList("listRestByLS", searchMap);
				}else {
					//  location 널이 아닐 경우
					return sqlSession.selectList("listRestByL", searchMap);
				}
			}else {
				if(searchMap.get("searchword") != null) {
					//  searchword 널이 아닐 경우
					return sqlSession.selectList("listRestByS", searchMap);
				}else {
					//  전부 널일 경우	
					return sqlSession.selectList("listRestaurant", searchMap);
				}
			}
		}
	}

}
