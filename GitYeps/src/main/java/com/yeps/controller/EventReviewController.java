package com.yeps.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.EventDTO;
import com.yeps.model.EventReviewDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.model.ReviewDTO;
import com.yeps.service.EventMapper;
import com.yeps.service.EventReviewMapper;
import com.yeps.service.YepsPager;

@Controller
public class EventReviewController {

	@Autowired
	private EventReviewMapper eventReviewMapper;
	
	@Autowired
	private EventMapper eventMapper;

	@RequestMapping(value = "/eventReview_insert")
	public ModelAndView insertEventReviewForm(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		String mnum = req.getParameter("mnum");
		String eventReview_content = req.getParameter("eventReview_content");
		String ip = req.getRemoteAddr();

		ModelAndView mav = new ModelAndView();
		if (eventReview_content == null || eventReview_content.trim().equals("")) {
			mav.setViewName("redirect: event_content?evnum=" + evnum + "&mode=empty_content");
			return mav;
		}

		int result = eventReviewMapper.insertEventReview(Integer.parseInt(evnum), Integer.parseInt(mnum),
				eventReview_content, ip);
		if (result > 0) {
			mav.setViewName("redirect: event_content?evnum=" + evnum + "&mode=insert_eventReview");
		} else {
			mav.addObject("msg", "잠시후 다시 시도해주세요.");
			mav.addObject("url", "event_content?evnum=" + evnum);
			mav.setViewName("message");
		}
		return mav;
	}
	
	@RequestMapping(value = "/eventReview_list")
	public ModelAndView eventReview_list(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();
		int count = eventReviewMapper.eventReviewCount();
		int pageScale = 10;
		int blockScale = 10;
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<EventReviewDTO> list = eventReviewMapper.eventReviewList(start,end);
		
		map.put("count", count); 
		map.put("YepsPager", YepsPager);
		mav.addObject("map", map);
		mav.addObject("eventReviewList", list);
		mav.setViewName("manager/eventReview");
		return mav;
	}
	
	@RequestMapping(value = "/eventReview_delete")
	public ModelAndView eventReview_delete(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int eventReview_num = Integer.parseInt(req.getParameter("eventReview_num"));
		int res = eventReviewMapper.deleteEventReview(eventReview_num);
		String msg = null, url = null;
		if(res > 0) {
			msg = "이벤트 리뷰를 삭제하였습니다.";
			url = "manager/eventReview";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
		}else {
			msg = "이벤트 리뷰 삭제에 실패하엿습니다.";
			url = "manager/eventReview";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
		}
		return mav;
	}
	
	@RequestMapping(value = "/eventReview_edit", method = RequestMethod.GET)
	public ModelAndView eventReview_edit(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int eventReview_num = Integer.parseInt(req.getParameter("eventReview_num"));
		List<EventReviewDTO> list = eventReviewMapper.getEventReview(eventReview_num);
		mav.addObject("eventReview", list);
		mav.setViewName("manager/eventReview_edit");
		return mav;
	}
	
	@RequestMapping(value = "/eventReview_edit", method = RequestMethod.POST)
	public ModelAndView eventReview_edit_input(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
