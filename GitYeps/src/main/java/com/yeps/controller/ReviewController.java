package com.yeps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.ReviewDBBean;
import com.yeps.service.ReviewMapper;

@Controller
public class ReviewController {

	@Autowired
	private ReviewMapper reviewMapper;

	@RequestMapping(value = "/yreview_list")
	public ModelAndView yreview_list() {
		List<ReviewDBBean> list = reviewMapper.listReview();
		ModelAndView mav = new ModelAndView();
		mav.addObject("yreviewList", list);
		mav.setViewName("yreview/list");
		return mav;
	}

	@RequestMapping(value = "/yreview_write")
	public ModelAndView yreview_write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yreview/write");
		return mav;
	}

	@RequestMapping(value = "/yreview_insert")
	public ModelAndView yreview_insert(HttpServletRequest req) {
		ReviewDBBean dto = new ReviewDBBean();
		dto.setNo1(1);
		dto.setNo2(2);
		dto.setWriter("writer");
		dto.setContent(req.getParameter("content"));
		dto.setGradepoint(1);
		dto.setFilenum(3);
		dto.setIp(req.getRemoteAddr());

		int res = reviewMapper.insertReview(dto);
		if (res == 1) {

		} else {
			ModelAndView mav = new ModelAndView();

		}

		return new ModelAndView("redirect:yreview_list");
	}

}
