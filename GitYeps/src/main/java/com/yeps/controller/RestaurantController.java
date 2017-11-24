package com.yeps.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.RestaurantDTO;
import com.web.service.RestaurantMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@RequestMapping(value="/restaurant_sample")
	public String sampleRest() throws Exception{
		return "restaurant/Sample";
	}
	@RequestMapping(value="/restaurant_jusoPopup")
	public String jusoRest() throws Exception{
		return "restaurant/jusoPopup";
	}
	@RequestMapping(value="/result")
	public String result() throws Exception{
		return "restaurant/result";
	}
	
	@RequestMapping(value="/restaurant_insert", method=RequestMethod.GET)
	public String insertRest() throws Exception {
		return "restaurant/restaurant_insert";
	}
	@RequestMapping(value="/restaurant_insert", method=RequestMethod.POST)
	public ModelAndView insertRest(HttpServletRequest req,@ModelAttribute RestaurantDTO dto,BindingResult result) throws Exception {
		String msg=null,url=null;
		
		int res=restaurantMapper.insertRest(dto);
		if(res>0) {
			msg="레스토랑 등록 성공";
			url="restaurant_list";
		}else {
			msg="레스토랑 등록 실패";
			url="restaurant_insert";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("restaurant/message");
	}
	
}
