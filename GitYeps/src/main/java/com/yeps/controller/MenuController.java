package com.yeps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.LargeMenuDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.model.SmallMenuDTO;
import com.yeps.service.LargeMenuMapper;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.SmallMenuMapper;

@Controller
public class MenuController {
	
	@Autowired
	private LargeMenuMapper largeMenuMapper;
	@Autowired
	private SmallMenuMapper smallMenuMapper;
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	
	
	
	
	
	@RequestMapping(value = "/restaurant_insertMenu")
	public ModelAndView insertMenu(HttpServletRequest req,@ModelAttribute LargeMenuDTO large_dto,@ModelAttribute SmallMenuDTO small_dto) {
		String rnum=req.getParameter("rnum");
		String small_length=req.getParameter("small_length");
		
//		for(int i=0;i<large_dto.getLargeMenuList().size();i++) {
//			large_dto.setLarge_name(large_dto.getLargeMenuList().get(i).getLarge_name());
//			large_dto.setRnum(Integer.parseInt(rnum));
//			largeMenuMapper.insertLargeMenu(large_dto);
//			for(int j=0;j<small_dto.getSmallMenuList().size();j++) {

		
		
//				small_dto.setSmall_menuNum(large_dto.getLargeMenuList().get(i).getlarge_menunum());
//				small_dto.setSmall_name(small_dto.getSmallMenuList().get(j).getSmall_name());
//				small_dto.setSmall_content(small_dto.getSmallMenuList().get(j).getSmall_content());
//				small_dto.setSmall_price(small_dto.getSmallMenuList().get(j).getSmall_price());
//				smallMenuMapper.insertSmallMenu(small_dto);
//			}
//		}

		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("restaurant/restaurant_listMenu");
		return mav; 
	}
	
	
	@RequestMapping(value="/restaurant_listMenu")
	public ModelAndView listMenu(HttpServletRequest req) {
		int rnum=Integer.parseInt(req.getParameter("rnum"));
		RestaurantDTO dto=restaurantMapper.getRest(rnum);
		
		List<LargeMenuDTO> large=largeMenuMapper.listLargeMenu(rnum);
		List<SmallMenuDTO> small=null;
		
		for(int i=0;i<large.size();i++) {
			small=smallMenuMapper.listSmallMenu(large.get(i).getlarge_menunum());
		}

		
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("getRest",dto);
	    mav.addObject("large",large);
	    mav.addObject("small",small);
		mav.setViewName("restaurant/restaurant_listMenu");
		return mav;
	}
}
