package com.yeps.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.LargeMenuDTO;
import com.yeps.model.SmallMenuDTO;
import com.yeps.service.LargeMenuMapper;
import com.yeps.service.SmallMenuMapper;

@Controller
public class MenuController {
	
	@Autowired
	private LargeMenuMapper largeMenuMapper;
	@Autowired
	private SmallMenuMapper smallMenuMapper;
	
	@RequestMapping(value = "/restaurant_insertMenu")
	public ModelAndView insertMenu(HttpServletRequest req,@ModelAttribute LargeMenuDTO large_dto,@ModelAttribute SmallMenuDTO small_dto) {
		
		
		for(int i=0;i<large_dto.getLargeMenuList().size();i++) {
//			largeMenuMapper.insertLargeMenu()
			System.out.println(large_dto.getLargeMenuList().get(i).getLarge_name());
		}
		
		ModelAndView mav=new ModelAndView();
		return mav; 
	}
}
