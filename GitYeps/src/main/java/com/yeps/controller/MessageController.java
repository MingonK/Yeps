package com.yeps.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.yeps.model.MessageDTO;
import com.yeps.service.YepsPager;
import com.yeps.service.MessageMapper;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper yepsMessageMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public ModelAndView pagingMessageList(HttpServletRequest req) {

		int count = yepsMessageMapper.getMessageCount();
		int curPage = req.getParameter("curPage")!=null?Integer.parseInt(req.getParameter("curPage")): 1 ;
		YepsPager boardPager = new YepsPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		int pageSize = boardPager.PAGE_SCALE;
		int num = count - pageSize * (curPage - 1) + 1;   
		List<MessageDTO> list = yepsMessageMapper.messageList(start, end);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); 
		map.put("boardPager", boardPager);
		ModelAndView mav = new ModelAndView();
		int lCount = yepsMessageMapper.getLockerCount();
		mav.addObject("lCount",lCount);
		mav.addObject("count", count);
		mav.addObject("num", num);
		mav.addObject("map", map); 
		mav.addObject("mode", "receive");
		mav.setViewName("message/yepsMessage");
		return mav;
	}

	public void yeps_date(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
	}

	@RequestMapping(value = "yeps_message")
	public ModelAndView yeps_message(Locale locale, Model model,HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		req.setAttribute("mode", "receive");
		mav = pagingMessageList(req);
		return mav;
	}

	@RequestMapping(value = "message_content")
	public ModelAndView message_insert(HttpServletRequest req, Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		System.out.println(msgNum);
		int	rNum = 0 ;int rDate = 0;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		if(readNum==0) {
			rNum = yepsMessageMapper.updateReadNum1(msgNum);
			rDate = yepsMessageMapper.updateReadDate(msgNum);
		}
		String readDate = req.getParameter("readDate");
		if(readDate.equals("0")) {
			rDate = yepsMessageMapper.updateReadDate(msgNum);
		}
		MessageDTO content = yepsMessageMapper.getContent(msgNum);
		mav.addObject("getContent", content);
		mav.setViewName("message/contentMessage");
		return mav;
	}

	@RequestMapping(value = "message_delete", method=RequestMethod.POST)
	public ModelAndView message_getMessage(HttpServletRequest req, Locale locale, Model model,String[] check) {
		ModelAndView mav = new ModelAndView();
		String msgNum = req.getParameter("msgNum");
		String msg = null;
		int res = 0;
		if(msgNum==null) {
			if(check == null) {
				msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
				req.setAttribute("mode", "receive");
				mav = pagingMessageList(req);
				mav.addObject("msg", msg);
				return mav;
			}
			for(String num : check) {
				int msgnum = Integer.parseInt(num);
				res = yepsMessageMapper.deleteMessage(msgnum);
				if(res>0) {
					msg = "메시지가 삭제 되었습니다.";

				}else {
					msg = "메시지 삭제에 실패하였습니다.";
				}
				mav.addObject("msg",msg);
			}
		}else {
			int msgnum = Integer.parseInt(msgNum);
			res = yepsMessageMapper.deleteMessage(msgnum);
			msg = "메시지가 삭제 되었습니다.";
			mav.addObject("msg",msg);
		}
		req.setAttribute("mode", "receive");
		mav = pagingMessageList(req);
		return mav;
	}

	@RequestMapping(value = "message_sendForm")
	public ModelAndView message_sendForm(Locale locale, Model model,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/sendMessageForm");
		return mav;
	}

	@RequestMapping(value = "message_send")
	public ModelAndView message_send
	(HttpServletRequest req,@ModelAttribute MessageDTO dto, HttpSession session, BindingResult result)
			throws Exception {
		if (result.hasErrors()) {
			dto.setMsgNum(0);
		}
		ModelAndView mav = new ModelAndView();
		String msg = null;

		/*	int mnum = session.getAttribute("mnum");
		String sender = yepsMessageMapper.getSender(mnum);//로그인시 로그인한 회원의 정보로 보내는 사람을 구한다.*/
		int res = yepsMessageMapper.writeMessage(dto);
		if(res>0) {
			msg = "쪽지를 보냈습니다.쪽지함으로 이동합니다.";
			String receiver = req.getParameter("receiver");
			int sCount = yepsMessageMapper.getSendCount("");
			req.setAttribute("mode", "receive");
			mav = pagingMessageList(req);
		}else {
			msg = "쪽지 보내기에 실패하였습니다.";
			mav = pagingMessageList(req);
		}
		req.setAttribute("msg", msg);
		return mav;
	}

	@RequestMapping(value = "message_receive")
	public ModelAndView message_receive(HttpServletRequest req,Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		List<MessageDTO> list = yepsMessageMapper.receiveList(receiver);
		req.setAttribute("messageList", list);
		req.setAttribute("mode", "receive");
		mav.setViewName("message/yepsMessage");
		return mav;
	}
	@RequestMapping(value = "message_reply")
	public ModelAndView message_reply(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		String msg = null;
		if(receiver==null) {
			if(check == null) {
				msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
				req.setAttribute("mode", "receive");
				mav = pagingMessageList(req);
				mav.addObject("msg", msg);
				return mav;
			}
			ArrayList list2 = new ArrayList() ;
			for(String num : check) {
				int msgnum = Integer.parseInt(num);
				receiver = (String)yepsMessageMapper.getReceiver(msgnum);
				list2.add(receiver);
			}
			req.setAttribute("receiver", list2 );
		}else {
			req.setAttribute("receiver", receiver);
		}
		mav.setViewName("message/yepsMessage.reply();");
		return mav;
	}

	@RequestMapping(value = "message_move")
	public ModelAndView message_move(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mode = req.getParameter("filter2");
		String msg = null;
		String sender = null;
		if(sender == null || sender.trim().equals("")) {
			msg = "로그인을 먼저 하세요.";
			mav.addObject("msg", msg);
			mav.setViewName("member_index");
		}
		if(mode.equals("receive")) {
			mav = pagingMessageList(req);
			msg = "받은 쪽지함으로 이동합니다.";
			mav.addObject("msg", msg);
		}else if(mode.equals("send")){
			msg = "보낸 쪽지함으로 이동합니다.";
			List<MessageDTO> list = yepsMessageMapper.sendList(sender);
			mav.addObject("messageList", list);
			mav.addObject("msg",msg);
			mav.addObject("mode",mode);
		}else if(mode.equals("locker")) {
			int lCount = yepsMessageMapper.getLockerCount();
			int count = yepsMessageMapper.getMessageCount();
			int mCount = count - lCount;
			System.out.println(mCount);
			mav.addObject("mCount", mCount);
			mav.addObject("count", count);
			List<MessageDTO> list = yepsMessageMapper.lockerList();
			mav = pagingMessageList(req);
			mav.addObject("lockerList", list);
			mav.setViewName("message/messageLocker");
		}else if(mode.equals("trash")) {
			mav.setViewName("message/trashMessage");
		}else if(mode.equals("msgBox")) {
			int count = yepsMessageMapper.getMessageCount();
			int curPage = req.getParameter("curPage")!=null?Integer.parseInt(req.getParameter("curPage")): 1 ;
			YepsPager boardPager = new YepsPager(count, curPage);
			int start = boardPager.getPageBegin();
			int end = boardPager.getPageEnd();
			List<MessageDTO> list = yepsMessageMapper.msgBoxList(start, end);
			mav.addObject("msgList", list);
			mav.addObject("mode", "receive");
			mav.setViewName("message/yepsMessage");
		}else {
			msg = "error code:4007; 관리자에게 문의 하십시오.";
			mav.addObject("msg", msg);
			mav.setViewName("message/yepsMessage");
		}
		return mav;
	}

	@RequestMapping(value = "message_search")
	public ModelAndView message_search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mode = req.getParameter("filter");

		if(mode.equals("allMsg")) {
			mav.setViewName("redirect:yeps_message");
		}else if(mode.equals("noneMsg")) {
			List<MessageDTO> list = yepsMessageMapper.noReadMessage();
			mav.addObject("messageList", list);
			req.setAttribute("mode", "receive");
			mav.setViewName("message/yepsMessage");

		}else if(mode.equals("allMsgl")) {
			List<MessageDTO> list = yepsMessageMapper.lockerList();
			mav.addObject("messageList", list);
			mav.setViewName("message/messageLocker");
		}else if(mode.equals("noneMsgl")) {
			List<MessageDTO> list = yepsMessageMapper.noReadLocker();
			mav.addObject("messageList", list);
			mav.setViewName("message/messageLocker");
		}
		return mav;
	}

	@RequestMapping(value = "message_read")//쪽지함에서 읽음 표시
	public ModelAndView message_read(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int msgNum = Integer.parseInt(req.getParameter("read")) ;
		int	rNum = 0 ;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		if(readNum==0) {
			rNum = yepsMessageMapper.updateReadNum1(msgNum);
			int	rDate = yepsMessageMapper.updateReadDate(msgNum);

		}else {
			rNum = yepsMessageMapper.updateReadNum0(msgNum);
		}
		mav = pagingMessageList(req);
		req.setAttribute("mode", "receive");
		return mav;
	}

	@RequestMapping(value = "message_readLocker")//보관함에서의 읽음 표시
	public ModelAndView message_readLocker(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int msgNum = Integer.parseInt(req.getParameter("read")) ;
		int	rNum = 0 ;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		if(readNum==0) {
			rNum = yepsMessageMapper.updateReadNum1(msgNum);
			int	rDate = yepsMessageMapper.updateReadDate(msgNum);
		}else {
			rNum = yepsMessageMapper.updateReadNum0(msgNum);
		}
		List<MessageDTO> list = yepsMessageMapper.lockerList();
		req.setAttribute("messageList", list);
		mav.setViewName("message/messageLocker");
		return mav;
	}

	@RequestMapping(value = "message_moveToLocker")
	public ModelAndView message_moveToLocker(HttpServletRequest req,String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null;
		if(check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			req.setAttribute("mode", "receive");
			mav = pagingMessageList(req);
			mav.addObject("msg", msg);
			return mav;
		}
		for(String num : check) {
			int msgnum = Integer.parseInt(num);
			int res = yepsMessageMapper.moveToLocker(msgnum);
			if (res>0) {
				msg = "보관함으로 이동 되었습니다. ";
			}else {
				msg = "보관함 이동에 실패하였습니다.";
			}
		}
		mav.addObject("msg", msg);
		mav = pagingMessageList(req);
		return mav;
	}

	@RequestMapping(value = "message_moveToMsgBox")
	public ModelAndView message_moveToMsgBox(HttpServletRequest req,String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null;
		if(check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			req.setAttribute("mode", "receive");
			mav = pagingMessageList(req);
			mav.addObject("msg", msg);
			return mav;
		}
		for(String num : check) {
			int msgnum = Integer.parseInt(num);
			int res = yepsMessageMapper.moveToMsgBox(msgnum);
			if (res>0) {
				msg = "쪽지함으로 이동 되었습니다. ";
				mav.addObject("msg", msg);
			}else {
				msg = "쪽지함 이동에 실패하였습니다.";
				mav.addObject("msg", msg);
			}
		}
		List<MessageDTO> list = yepsMessageMapper.lockerList();
		int lCount = yepsMessageMapper.getLockerCount();
		int count = yepsMessageMapper.getMessageCount();
		int mCount = count - lCount;
		mav.addObject("mCount", mCount);
		mav.addObject("count", count);
		mav.addObject("messageList", list);
		mav.setViewName("message/messageLocker");
		return mav;
	}

}








