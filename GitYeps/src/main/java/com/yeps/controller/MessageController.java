package com.yeps.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MessageDTO;
import com.yeps.service.MessageMapper;
import com.yeps.service.YepsPager;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper yepsMessageMapper;

	public ModelAndView pagingMessageList(HttpServletRequest req, @RequestParam String lMode) {
		int count = yepsMessageMapper.getMessageCount();
		int lCount = yepsMessageMapper.getLockerCount();
		int mCount = count - lCount;
		int curPage = req.getParameter("curPage") != null ? Integer.parseInt(req.getParameter("curPage")) : 1;
		YepsPager yPager = new YepsPager(count, curPage);
		int start = yPager.getPageBegin();
		int end = yPager.getPageEnd();
		int pageSize = YepsPager.PAGE_SCALE;
		int num = count - pageSize * (curPage - 1) + 1;
		List<MessageDTO> list = yepsMessageMapper.messageList(start, end, lMode);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count);
		map.put("yepsPager", yPager);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mCount", mCount);
		mav.addObject("lCount", lCount);
		mav.addObject("count", count);
		mav.addObject("num", num);
		mav.addObject("map", map);
		mav.addObject("mode", "receive");
		mav.setViewName("message/yepsMessage");
		return mav;
	}

	@RequestMapping(value = "yeps_message")
	public ModelAndView yeps_message(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		String lMode = "allList";
		mav = pagingMessageList(req, lMode);
		return mav;
	}

	@RequestMapping(value = "message_locker")
	public ModelAndView message_locker(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		String lMode = "lockerList";
		mav = pagingMessageList(req, lMode);
		return mav;
	}

	@RequestMapping(value = "message_delete")
	public ModelAndView message_delete(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String msgNum = req.getParameter("msgNum");
		String msg = null, lMode = null;
		int res = 0;
		if (msgNum == null) {
			if (check == null) {
				msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
				lMode = "allList";
				mav = pagingMessageList(req, lMode);
				mav.addObject("msg", msg);
				return mav;
			}
			for (String num : check) {
				int msgnum = Integer.parseInt(num);
				res = yepsMessageMapper.deleteMessage(msgnum);
				if (res > 0) {
					msg = "메시지가 삭제 되었습니다.";
				} else {
					msg = "메시지 삭제에 실패하였습니다.";
				}
				mav.addObject("msg", msg);
			}
		} else {
			int msgnum = Integer.parseInt(msgNum);
			res = yepsMessageMapper.deleteMessage(msgnum);
			msg = "메시지가 삭제 되었습니다.";
			mav.addObject("msg", msg);
		}
		lMode = "allList";
		mav = pagingMessageList(req, lMode);
		return mav;
	}

	@RequestMapping(value = "message_send")
	public ModelAndView message_send(HttpServletRequest req, @ModelAttribute MessageDTO dto, HttpSession session,
			BindingResult result) throws Exception {
		if (result.hasErrors()) {
			dto.setMsgNum(0);
		}
		ModelAndView mav = new ModelAndView();
		String msg = null, lMode = null;

		/*
		 * int mnum = session.getAttribute("mnum"); String sender =
		 * yepsMessageMapper.getSender(mnum);//로그인시 로그인한 회원의 정보로 보내는 사람을 구한다.
		 */
		String sender = "who";
		dto.setSender(sender);
		int res = yepsMessageMapper.writeMessage(dto);
		if (res > 0) {
			msg = "쪽지를 보냈습니다.쪽지함으로 이동합니다.";
			lMode = "allList";
			mav.addObject("msg", msg);
			mav = pagingMessageList(req, lMode);

		} else {
			msg = "쪽지 보내기에 실패하였습니다.";
			mav = pagingMessageList(req, lMode);
		}
		req.setAttribute("msg", msg);
		return mav;
	}

	@RequestMapping(value = "message_reply")
	public ModelAndView message_reply(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		System.out.println("here?");
		String msg = null, url = null, box = null;
		box = req.getParameter("box");
		if (check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			if (box.equals("msgBox")) {
				url = "yeps_message";
			} else if (box.equals("locker")) {
				url = "message_locker";
			}
			mav.addObject("url", url);
			mav.addObject("msg", msg);
			mav.setViewName("message");
			return mav;
		}
		if (receiver == null) {
			List<String> list2 = new ArrayList<String>();
			for (String num : check) {
				int msgnum = Integer.parseInt(num);
				receiver = (String) yepsMessageMapper.getReceiver(msgnum);
				list2.add(receiver);
			}
			req.setAttribute("receiver", list2);
		} else {
			req.setAttribute("receiver", receiver);
		}
		mav.addObject("mode", "reply");
		mav.setViewName("message/yepsMessage");
		return mav;
	}

	@RequestMapping(value = "message_action")
	public ModelAndView message_search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mode = req.getParameter("filter");
		System.out.println(mode);
		String sender = null, lMode = null;
		String msg = null;
		if (mode.equals("allMsg")) {
			mav.setViewName("redirect:yeps_message");
			
		} else if (mode.equals("noneMsg")) {
			lMode = "noneMsg";
			mav = pagingMessageList(req, lMode);

		} else if (mode.equals("lockerList")) {
			mav.setViewName("redirect:message_locker");

		} else if (mode.equals("noneLocker")) {
			lMode = "noneLocker";
			mav = pagingMessageList(req, lMode);
			mav.setViewName("message/messageLocker");

		} else if (mode.equals("receive")) {
			lMode = "receiver";// 로그인시 로그인 회원을 receiver로.
			mav = pagingMessageList(req, lMode);

		} else if (mode.equals("send")) {
			lMode = "sender";// 로그인시 로그인 회원을 sender로.
			mav = pagingMessageList(req, lMode);
			mav.addObject("mode", "send");

		} else if (mode.equals("toLocker")) {
			mav.setViewName("redirect:message_locker");

		} else if (mode.equals("msgBoxList")) {
			lMode = "msgBoxList";
			mav = pagingMessageList(req, lMode);

		} else {
			msg = "error code:4007; 관리자에게 문의 하십시오.";
			mav.addObject("msg", msg);
			mav.setViewName("message/yepsMessage");
		}
		return mav;
	}

	@RequestMapping(value = "message_read") // 쪽지함에서 읽음 표시
	public ModelAndView message_read(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mNum = req.getParameter("read");
		int msgNum = 0, resRead = 0, readNum = 0, resDate = 0;
		if (mNum == null) {
			msgNum = Integer.parseInt(req.getParameter("msgnum"));
			readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
			if (readNum == 0) {
				resRead = yepsMessageMapper.updateReadNum1(msgNum);
				resDate = yepsMessageMapper.updateReadDate(msgNum);
				readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
				mav.addObject("readNum", readNum);
			} else {
				mav.setViewName("redirect:yeps_message");
			}
		} else {
			msgNum = Integer.parseInt(mNum);
			readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
			if (readNum == 0) {
				resRead = yepsMessageMapper.updateReadNum1(msgNum);
				resDate = yepsMessageMapper.updateReadDate(msgNum);
			} else {
				resRead = yepsMessageMapper.updateReadNum0(msgNum);
			}
		}
		String lMode = "allList";
		mav = pagingMessageList(req, lMode);
		return mav;
	}

	@RequestMapping(value = "message_readLocker") // 보관함에서의 읽음 표시
	public ModelAndView message_readLocker(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		int msgNum = Integer.parseInt(req.getParameter("read"));
		int rNum = 0;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		if (readNum == 0) {
			rNum = yepsMessageMapper.updateReadNum1(msgNum);
			int rDate = yepsMessageMapper.updateReadDate(msgNum);
		} else {
			rNum = yepsMessageMapper.updateReadNum0(msgNum);
		}
		String lMode = "lockerList";
		mav = pagingMessageList(req, lMode);
		mav.setViewName("message/messageLocker");
		return mav;
	}

	@RequestMapping(value = "message_moveToLocker")
	public ModelAndView message_moveToLocker(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null, lMode = "allList";
		if (check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			mav = pagingMessageList(req, lMode);
			mav.addObject("msg", msg);
			return mav;
		}
		for (String num : check) {
			int msgnum = Integer.parseInt(num);

			int res = yepsMessageMapper.moveToLocker(msgnum);

			if (res > 0) {
				msg = "보관함으로 이동 되었습니다. ";
				mav.addObject("msg", msg);
			} else {
				msg = "보관함 이동에 실패하였습니다.";
				mav.addObject("msg", msg);
			}
		}
		mav = pagingMessageList(req, lMode);
		return mav;
	}

	@RequestMapping(value = "message_lockerToMsgBox")
	public ModelAndView message_moveToMsgBox(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null, lMode = null;
		if (check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			req.setAttribute("mode", "receive");
			lMode = "allList";
			mav = pagingMessageList(req, lMode);
			mav.addObject("msg", msg);
			return mav;
		}
		for (String num : check) {
			int msgnum = Integer.parseInt(num);
			int res = yepsMessageMapper.lockerToMsgBox(msgnum);
			if (res > 0) {
				msg = "쪽지함으로 이동 되었습니다. ";
				mav.addObject("msg", msg);
			} else {
				msg = "쪽지함 이동에 실패하였습니다.";
				mav.addObject("msg", msg);
			}
		}
		lMode = "lockerList";
		mav = pagingMessageList(req, lMode);
		mav.setViewName("message/messageLocker");
		return mav;
	}

}
