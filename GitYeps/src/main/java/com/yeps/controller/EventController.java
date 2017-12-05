package com.yeps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.CategoryDTO;
import com.yeps.model.EventDTO;
import com.yeps.service.CategoryMapper;
import com.yeps.service.EventMapper;

@Controller
public class EventController {
	
	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	
	@RequestMapping(value="/event_list")
	public ModelAndView listEvent() {
		List<EventDTO> list = eventMapper.listEvent();
		return new ModelAndView("event/event_list", "eventList", list);
	}
	
	@RequestMapping(value="/event_write")
	public ModelAndView writeEvent() {
		List<CategoryDTO> list = categoryMapper.listCategory();
		return new ModelAndView("event/event_writeForm", "categoryList", list);
	}
	
	@RequestMapping(value="/event_jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}
	
	@RequestMapping(value="/event_insert")
	public ModelAndView insertEvent() {
		return new ModelAndView("event/event_insert");
	}
}
