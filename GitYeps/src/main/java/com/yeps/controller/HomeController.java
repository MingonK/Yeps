package com.yeps.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MemberDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.model.ReviewDTO;
import com.yeps.service.MemberMapper;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.ReviewMapper;

@Controller
public class HomeController {
	
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	
	@RequestMapping(value= "/main")
	public String main() {
		return "MainPage";
	}
	
	@RequestMapping(value = "/")
	public ModelAndView index() {
	
		//최고평점을 index page로 보내주기 
		int NBPmnum = reviewMapper.new_BestGradePoint();
		
		//최근활동 리뷰/사진을 index page로 보내주기
		//★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에  뿌려주기
		//★미구현:file 부분 미구현 
		List<ReviewDTO> recentReviewInfo = reviewMapper.recentReviewInfo();	//rvnum, gradepoint, content값 가져오는dto
		
//		System.out.println("recentReviewInfo의 SIze: " + recentReviewInfo.size());
		HashMap<Integer, List<ReviewDTO>> map = new HashMap<Integer, List<ReviewDTO>>(); 
		for(int i=0; i<recentReviewInfo.size(); i++) {
			map.put(i, reviewMapper.numList(recentReviewInfo.get(i).getRvnum()));
//			for(int j = 0; j < map.get(i).size(); j++) 
//				System.out.println("맵 안에 저장된 LIST의 데이터: " + map.get(i).get(j).getMnum() + " : " + map.get(i).get(j).getRnum());
		}
		
		List<MemberDTO> get_mname = new ArrayList<MemberDTO>();
		for(int i=0; i < map.size(); i++) {
			for(int j = 0; j < map.get(i).size(); j++) {
				get_mname.add(memberMapper.memberName(map.get(i).get(j).getMnum()));
			}
		}
		
		/*List<RestaurantDTO> get_rname = new ArrayList<RestaurantDTO>();
		for(int i=0; i < map.size(); i++) {
			for(int j = 0; j < map.get(i).size(); j++) {
				get_rname.add(restaurantMapper.restaurantRName(map.get(i).get(j).getRnum()));
			}
		}*/
		
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("NBPmnum", NBPmnum);
		mav.addObject("recentReviewInfo", recentReviewInfo);
		mav.addObject("get_mnameList", get_mname);
		/*mav.addObject("get_rnameList", get_rname);*/
		
		mav.setViewName("index");
		return mav;
		
		
		
	}
}
