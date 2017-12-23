package com.yeps.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.service.EventReviewMapper;


@Controller
public class EventReviewController {
	
	@Autowired
	private EventReviewMapper eventReviewMapper;
	
	@RequestMapping(value="/eventReview_insert")
	public ModelAndView insertEventReviewForm(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		String mnum = req.getParameter("mnum");
		String eventReview_content = req.getParameter("eventReview_content");
		String ip = req.getRemoteAddr();
		
		ModelAndView mav = new ModelAndView();
		if(eventReview_content == null || eventReview_content.trim().equals("")) {
			mav.setViewName("redirect: event_content?evnum=" + evnum + "&mode=empty_content");
			return mav;
		}
		
		int result = eventReviewMapper.insertEventReview(Integer.parseInt(evnum), Integer.parseInt(mnum), eventReview_content, ip);
		if(result > 0) {
			mav.setViewName("redirect: event_content?evnum=" + evnum + "&mode=insert_eventReview");
		} else {
			mav.addObject("msg", "잠시후 다시 시도해주세요.");
			mav.addObject("url", "event_content?evnum=" + evnum);
			mav.setViewName("message");
		}
		return mav;
	}
}
