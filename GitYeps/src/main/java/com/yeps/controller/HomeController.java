package com.yeps.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.RestaurantDTO;
import com.yeps.model.ReviewDTO;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.ReviewMapper;

@Controller
public class HomeController {

	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private RestaurantMapper restaurantMapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		// 최고평점을 index page로 보내주기
		ModelAndView mav = new ModelAndView();
		int NBPmnum = reviewMapper.new_BestGradePoint();
		ReviewDTO review_of_the_day_reviewDTO = reviewMapper.review_mylist_info(NBPmnum);
		RestaurantDTO review_of_the_day_restaurantDTO = null;
		if (review_of_the_day_reviewDTO != null) {
			reviewMapper.review_mylist_updatedata(review_of_the_day_reviewDTO.getRvnum());
			review_of_the_day_restaurantDTO = restaurantMapper
					.GetRestaurantName_R(review_of_the_day_reviewDTO.getRnum());
		}
		// // 최근활동 리뷰/사진을 index page로 보내주기
		// // ★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에 뿌려주기
		// // ★미구현:file 부분 미구현
		List<ReviewDTO> recentReviewInfoList = reviewMapper.recentReviewInfo(); // rvnum, gradepoint, content값 가져오는dto

		List<Integer> gethotAndNewReview = reviewMapper.gethotAndNewReview();
		Set<RestaurantDTO> hotAndNewSet = new LinkedHashSet<RestaurantDTO>();
		for (int i = 0; i < 3; i++) {
			hotAndNewSet.add(restaurantMapper.getHotAndNewRestaurant(gethotAndNewReview.get(i)));
		}

		List<Integer> reviewCount = new ArrayList<Integer>();
		List<Integer> starAvg = new ArrayList<Integer>();

		Iterator<RestaurantDTO> it = hotAndNewSet.iterator();
		while (it.hasNext()) {
			RestaurantDTO dto = it.next();
			reviewCount.add(reviewMapper.getRestaurantReviewCount(dto.getRnum()));
			starAvg.add(reviewMapper.getStarAvg(dto.getRnum()));
		}

		// restaurantMapper.getRandomImage();
		mav.addObject("recentReviewInfoList", recentReviewInfoList);
		mav.addObject("review_of_the_day_restaurantDTO", review_of_the_day_restaurantDTO);
		mav.addObject("review_of_the_day_reviewDTO", review_of_the_day_reviewDTO);

		// Hot & New
		mav.addObject("hotAndNewSet", hotAndNewSet);
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("starAvg", starAvg);
		mav.setViewName("mainPage");
		return mav;
	}

	@RequestMapping(value = "/main")
	public ModelAndView main() {
		// 최고평점을 index page로 보내주기
		ModelAndView mav = new ModelAndView();
		int NBPmnum = reviewMapper.new_BestGradePoint();
		ReviewDTO review_of_the_day_reviewDTO = reviewMapper.review_mylist_info(NBPmnum);
		
		RestaurantDTO review_of_the_day_restaurantDTO = null;
		if (review_of_the_day_reviewDTO != null) {
			reviewMapper.review_mylist_updatedata(review_of_the_day_reviewDTO.getRvnum());
			review_of_the_day_restaurantDTO = restaurantMapper
					.GetRestaurantName_R(review_of_the_day_reviewDTO.getRnum());
		}
		// // 최근활동 리뷰/사진을 index page로 보내주기
		// // ★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에 뿌려주기
		// // ★미구현:file 부분 미구현
		List<ReviewDTO> recentReviewInfoList = reviewMapper.recentReviewInfo(); // rvnum, gradepoint, content값 가져오는dto

		List<Integer> gethotAndNewReview = reviewMapper.gethotAndNewReview();
		Set<RestaurantDTO> hotAndNewSet = new LinkedHashSet<RestaurantDTO>();
		for (int i = 0; i < 3; i++) {
			hotAndNewSet.add(restaurantMapper.getHotAndNewRestaurant(gethotAndNewReview.get(i)));
		}

		List<Integer> reviewCount = new ArrayList<Integer>();
		List<Integer> starAvg = new ArrayList<Integer>();

		Iterator<RestaurantDTO> it = hotAndNewSet.iterator();
		while (it.hasNext()) {
			RestaurantDTO dto = it.next();
			reviewCount.add(reviewMapper.getRestaurantReviewCount(dto.getRnum()));
			starAvg.add(reviewMapper.getStarAvg(dto.getRnum()));
		}

		mav.addObject("recentReviewInfoList", recentReviewInfoList);
		mav.addObject("review_of_the_day_restaurantDTO", review_of_the_day_restaurantDTO);
		mav.addObject("review_of_the_day_reviewDTO", review_of_the_day_reviewDTO);

		// Hot & New
		mav.addObject("hotAndNewSet", hotAndNewSet);
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("starAvg", starAvg);
		mav.setViewName("mainPage");
		return mav;
	}

	@RequestMapping(value = "/test")
	public String test() {
		return "test";
	}

}
