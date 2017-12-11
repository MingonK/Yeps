package com.yeps.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.YepsMessageDBBean;
import com.yeps.service.YepsMessageMapper;

@Controller
public class YepsMessageController {
	
	@Autowired
	private YepsMessageMapper yepsMessageMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public void yeps_date(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
	}
	
	@RequestMapping(value = "yeps_message")
	public ModelAndView yeps_message(Locale locale, Model model) {
		yeps_date(locale, model);
		return new ModelAndView("message/yepsMessage");
	}
	
	@RequestMapping(value = "message_content")
		public ModelAndView message_insert(HttpServletRequest req, @ModelAttribute YepsMessageDBBean dto, Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		yeps_date(locale, model);
//		int msgnum = Integer.parseInt(req.getParameter("msgnum"));
//		YepsMessageDBBean content = yepsMessageMapper.getContent(msgnum);
//		mav.addObject("getContent", content);
		mav.setViewName("message/contentMessage");
		return mav;
	}
	
	@RequestMapping(value = "message_allReply")
	public ModelAndView message_delete(Locale locale, Model model) {
		yeps_date(locale, model);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageBox");
		return mav;
	}
	
	@RequestMapping(value = "message_delete", method=RequestMethod.POST)
	public ModelAndView message_getMessage(HttpServletRequest req, @ModelAttribute YepsMessageDBBean dto, @RequestParam int mnum) {
	    ModelAndView mav = new ModelAndView();
		int msgnum = Integer.parseInt(req.getParameter("msgnum"));
		int res = yepsMessageMapper.deleteMessage(msgnum);
		String msg = null;
		if(res>0) {
			msg = "메시지가 삭제 되었습니다.";
			
		}else {
			
			msg = "메시지 삭제에 실패하였습니다.";
		}
		mav.addObject("msg",msg);
		mav.setViewName("message/yepsMessage");
		return mav;
	}
	
	@RequestMapping(value = "message_locker")
	public ModelAndView message_receiveList(Locale locale, Model model) {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageLocker");
		return mav;
	}
	
	@RequestMapping(value = "message_sendMsgList")
	public ModelAndView message_sendMsgList(@RequestParam int msgnum, int mnum) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
