package com.yeps.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		//최고평점을 index page로 보내주기 
		ModelAndView mav = new ModelAndView();
//		int NBPmnum = reviewMapper.new_BestGradePoint();
//		
//		MemberDTO review_of_the_day_memberDTO = memberMapper.mylist_info(NBPmnum);
//		ReviewDTO review_of_the_day_reviewDTO = reviewMapper.review_mylist_info(NBPmnum);
//		int GETrnum = reviewMapper.GetRestaurantName_Rv(NBPmnum);
//		RestaurantDTO review_of_the_day_restaurantDTO = restaurantMapper.GetRestaurantName_R(GETrnum);
//		
//		
//		
//		
//		//최근활동 리뷰/사진을 index page로 보내주기
//		//★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에  뿌려주기
//		//★미구현:file 부분 미구현 
//		List<ReviewDTO> recentReviewInfo = reviewMapper.recentReviewInfo();	//rvnum, gradepoint, content값 가져오는dto
//		reviewMapper.review_mylist_updatedata(NBPmnum);
//		
//		HashMap<Integer, List<ReviewDTO>> map = new HashMap<Integer, List<ReviewDTO>>(); 
//		for(int i=0; i<recentReviewInfo.size(); i++) {
//			map.put(i, reviewMapper.numList(recentReviewInfo.get(i).getRvnum()));
//		}
//		
//		List<MemberDTO> get_mname = new ArrayList<MemberDTO>();
//		for(int i=0; i < map.size(); i++) {
//			for(int j = 0; j < map.get(i).size(); j++) {
//				get_mname.add(memberMapper.memberName(map.get(i).get(j).getMnum()));
//			}
//		}
//		
//		mav.addObject("NBPmnum", NBPmnum);
//		mav.addObject("recentReviewInfo", recentReviewInfo);
//		mav.addObject("get_mnameList", get_mname);
//		mav.addObject("review_of_the_day_restaurantDTO", review_of_the_day_restaurantDTO);
//		mav.addObject("review_of_the_day_memberDTO", review_of_the_day_memberDTO);
//		mav.addObject("review_of_the_day_reviewDTO", review_of_the_day_reviewDTO);
		/*mav.addObject("get_rnameList", get_rname);*/
		
		mav.setViewName("mainPage");
		return mav;
	}
	
	@RequestMapping(value="/main")
	public ModelAndView main() {
		//최고평점을 index page로 보내주기 
		ModelAndView mav = new ModelAndView();
		int NBPmnum = reviewMapper.new_BestGradePoint();
		
		MemberDTO review_of_the_day_memberDTO = memberMapper.mylist_info(NBPmnum);
		ReviewDTO review_of_the_day_reviewDTO = reviewMapper.review_mylist_info(NBPmnum);
		int GETrnum = reviewMapper.GetRestaurantName_Rv(NBPmnum);
//		RestaurantDTO review_of_the_day_restaurantDTO = restaurantMapper.GetRestaurantName_R(GETrnum);
		
		
		
		
		//최근활동 리뷰/사진을 index page로 보내주기
		//★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에  뿌려주기
		//★미구현:file 부분 미구현 
		List<ReviewDTO> recentReviewInfo = reviewMapper.recentReviewInfo();	//rvnum, gradepoint, content값 가져오는dto
		reviewMapper.review_mylist_updatedata(NBPmnum);
		
		HashMap<Integer, List<ReviewDTO>> map = new HashMap<Integer, List<ReviewDTO>>(); 
		for(int i=0; i<recentReviewInfo.size(); i++) {
			map.put(i, reviewMapper.numList(recentReviewInfo.get(i).getRvnum()));
		}
		
		List<MemberDTO> get_mname = new ArrayList<MemberDTO>();
		for(int i=0; i < map.size(); i++) {
			for(int j = 0; j < map.get(i).size(); j++) {
				get_mname.add(memberMapper.memberName(map.get(i).get(j).getMnum()));
			}
		}
		
		mav.addObject("NBPmnum", NBPmnum);
		mav.addObject("recentReviewInfo", recentReviewInfo);
		mav.addObject("get_mnameList", get_mname);
//		mav.addObject("review_of_the_day_restaurantDTO", review_of_the_day_restaurantDTO);
		mav.addObject("review_of_the_day_memberDTO", review_of_the_day_memberDTO);
		mav.addObject("review_of_the_day_reviewDTO", review_of_the_day_reviewDTO);
		/*mav.addObject("get_rnameList", get_rname);*/
		
		mav.setViewName("mainPage");
		return mav;
	}
	
	
	
	@RequestMapping(value = "/getImage/{name:.+}")
	@ResponseBody
	public ResponseEntity<byte[]> profileImage(@PathVariable("name") String name) throws IOException {
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File(uploadPath + name))), header,
				HttpStatus.CREATED);
	}
	
}
