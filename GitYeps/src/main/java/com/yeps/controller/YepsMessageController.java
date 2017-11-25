package com.yeps.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
	public ModelAndView yeps_message(Locale locale, Model model,HttpServletRequest req) {
		yeps_date(locale, model);
		ModelAndView mav = new ModelAndView();
		List<YepsMessageDBBean> list = yepsMessageMapper.messageList();
		req.setAttribute("messageList", list);
		return new ModelAndView("message/yepsMessage");
	}

	@RequestMapping(value = "message_content")
	public ModelAndView message_insert(HttpServletRequest req, @ModelAttribute YepsMessageDBBean dto, Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		yeps_date(locale, model);
		String msgNum = req.getParameter("msgNum");
		YepsMessageDBBean content = yepsMessageMapper.getContent(Integer.parseInt(msgNum));
		mav.addObject("getContent", content);
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
		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		int res = yepsMessageMapper.deleteMessage(msgNum);
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

	@RequestMapping(value = "message_sendForm")
	public ModelAndView message_sendForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/sendMessageForm");
		return mav;
	}

	@RequestMapping(value = "message_send")
	public ModelAndView message_send(HttpServletRequest req,@ModelAttribute YepsMessageDBBean dto) {

		/*		if (result.hasErrors()) {
			dto.setMsgnum(0);
		}*/
		ModelAndView mav = new ModelAndView();
		int res = yepsMessageMapper.writeMessage(dto);
		String msg = null;
		String url = null;
		if(res>0) {
			msg = "쪽지를 보냈습니다.보낸 쪽지함으로 이동합니다.";

		}else {
			msg = "쪽지 보내기가 실패하였습니다.";

		}
		req.setAttribute("msg", msg);
		mav.setViewName("message/yepsMessage");
		return mav;
	}
	@RequestMapping(value = "message_reply")
	public ModelAndView message_reply(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String msgNum = req.getParameter("msgNum");
//		String sender = req.getParameter("name");//로그인시 회원이름 혹은 이메일 불러오기
		String receiver = yepsMessageMapper.getContent(Integer.parseInt(msgNum)).getSender();
        mav.addObject("receiver", receiver);
        mav.setViewName("message/sendMessageForm");
        return mav;
	}

}
