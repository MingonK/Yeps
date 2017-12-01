package com.yeps.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MessageDTO;
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

		List<MessageDTO> list = yepsMessageMapper.messageList();
		req.setAttribute("messageList", list);
		req.setAttribute("mode", "receive");
		return new ModelAndView("message/yepsMessage");
	}

	@RequestMapping(value = "message_content")
	public ModelAndView message_insert(HttpServletRequest req, Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		yeps_date(locale, model);
		int msgNum = Integer.parseInt(req.getParameter("msgNum"));
		int	rNum = 0 ;int rDate = 0;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		System.out.println(readNum);
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
		yeps_date(locale, model);
		ModelAndView mav = new ModelAndView();
		String msg = null;
		if(check == null) {
			msg = "선택된 메시지가 없습니다. 메시지를 선택하세요.";
			req.setAttribute("msg", msg);
			req.setAttribute("mode", "receive");
			List<MessageDTO> list = yepsMessageMapper.messageList();
			req.setAttribute("messageList", list);
			mav.setViewName("message/yepsMessage");
			return mav;
		}

		for(String num : check) {
			int msgNum = Integer.parseInt(num);
			int res = yepsMessageMapper.deleteMessage(msgNum);
			if(res>0) {
				msg = "메시지가 삭제 되었습니다.";

			}else {
				msg = "메시지 삭제에 실패하였습니다.";
			}
			mav.addObject("msg",msg);
			mav.setViewName("message/yepsMessage");
		}
		List<MessageDTO> list = yepsMessageMapper.messageList();
		req.setAttribute("messageList", list);
		req.setAttribute("mode", "receive");

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
	public ModelAndView message_sendForm(Locale locale, Model model) {
		yeps_date(locale, model);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/sendMessageForm");
		return mav;
	}

	@RequestMapping(value = "message_send")
	public ModelAndView message_send
	(Locale locale, Model model, HttpServletRequest req,@ModelAttribute MessageDTO dto,BindingResult result)
			throws Exception {
		yeps_date(locale, model);
		if (result.hasErrors()) {
			dto.setMsgNum(0);
		}
		ModelAndView mav = new ModelAndView();
	
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
	      Iterator<String> it = mr.getFileNames();
	      String fileName = null;
	      int fileSize = 0;
	      
	      while(it.hasNext()) {
	         it.next();
	         MultipartFile mf = mr.getFile("filename");
	         fileName = mf.getOriginalFilename();
	         fileSize = (int) mf.getSize();
	         HttpSession session = req.getSession();
	         String upPath = session.getServletContext().getRealPath("/files");
	         File file = new File(upPath, fileName);
	         if(mf.getSize() != 0) {
	            mf.transferTo(file);
	         }
	      }
	      dto.setFilename(fileName);
	      dto.setFilesize(fileSize);
		/*if(mnum!=null) {
        int mnum = Integer.parseInt(req.getParameter("mnum"));
        sender = yepsMessageMapper.getSender(mnum);
        }*///로그인 되어있는 회원이 보낸사람으로 보낸쪽지함 목록 생성
	    String msg = null;
		int res = yepsMessageMapper.writeMessage(dto);

		if(res>0) {
			msg = "쪽지를 보냈습니다.보낸 쪽지함으로 이동합니다.";
		 	String sender = req.getParameter("sender");
			List<MessageDTO> list = yepsMessageMapper.sendList(sender);
			req.setAttribute("messageList", list);
			req.setAttribute("mode", "send");
			mav.setViewName("message/yepsMessage");
		}else {
			msg = "쪽지 보내기에 실패하였습니다.쪽지쓰기 페이지로 이동합니다.";
			mav.setViewName("message/sendMessageForm");
		}
		req.setAttribute("msg", msg);
		return mav;
	}

	@RequestMapping(value = "message_receive")
	public ModelAndView message_receive(HttpServletRequest req,Locale locale, Model model) {
		yeps_date(locale, model);
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		List<MessageDTO> list = yepsMessageMapper.receiveList(receiver);
		req.setAttribute("messageList", list);
		req.setAttribute("mode", "receive");
		mav.setViewName("message/yepsMessage");
		return mav;
	}
	@RequestMapping(value = "message_reply")
	public ModelAndView message_reply(HttpServletRequest req, String[] check,@ModelAttribute MessageDTO dto) {
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		System.out.println(receiver);
		String msg = null;
		if(check == null) {
			msg = "쪽지쓰기 페이지로 이동합니다.";
			req.setAttribute("receiver", receiver);
			req.setAttribute("msg", msg);
			mav.setViewName("message/sendMessageForm");
		    return mav;
		}
		if(receiver==null) {
			ArrayList list2 = new ArrayList() ;
			for(String num : check) {
				int msgnum = Integer.parseInt(num);
				receiver = (String)yepsMessageMapper.getReceiver(msgnum);
				list2.add(receiver);
				System.out.println(receiver);
			}
			req.setAttribute("receiver", list2 );
		}else {
			req.setAttribute("receiver", receiver);
		}
		mav.setViewName("message/sendMessageForm");
		return mav;
	}

	@RequestMapping(value = "message_move")
	public ModelAndView message_move(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mode = req.getParameter("messageBox");
		String msg = null;
		String sender = null;
		if(mode.equals("locker")) {
			msg = "보관함으로 이동합니다.";
			mav.addObject("msg", msg);
			mav.setViewName("message/messageLocker");
		}else if(mode.equals("receive")) {
			msg = "받은 편지함으로 이동합니다.";
			List<MessageDTO> list = yepsMessageMapper.messageList();
			req.setAttribute("mode", "receive");
			req.setAttribute("messageList", list);
			mav.addObject("msg", msg);
			mav.setViewName("message/yepsMessage");
		}else if(mode.equals("send")) {
			msg = "보낸 편지함으로 이동합니다.";
			mav.addObject("msg", msg);
	      /*로그인을 한다면 로그인 정보로 sender를 구한후 리스트를 가져와 페이지를 이동한다
			List<MessageDTO> list = yepsMessageMapper.sendList(sender);
			req.setAttribute("messageList", list);*/
			req.setAttribute("mode", "send");
			mav.setViewName("message/yepsMessage");
		}else {
			msg = "error code:4007; 관리자에게 문의 하십시오.";
			mav.addObject("msg", msg);
			mav.setViewName("message/yepsMessage");
		}
		return mav;
	}

	@RequestMapping(value = "message_address")
	public ModelAndView message_address(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		/*List<MessageDTO> addr = yepsMessageMapper.messageList();*/
		mav.setViewName("message/address");
		return mav;
	}

	@RequestMapping(value = "input_addr", method=RequestMethod.POST)
	public ModelAndView address_input
	(HttpServletRequest req, @RequestParam int msgnum, String name, String email, String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/sendMessageForm");
		return mav;
	}

	@RequestMapping(value = "message_search")
	public ModelAndView message_search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mode = req.getParameter("filter");
		System.out.println(mode);
		if(mode.equals("allMsg")) {
			mav.setViewName("redirect:yeps_message");
		}else if(mode.equals("noneMsg")) {
			List<MessageDTO> list = yepsMessageMapper.noReadMessage();
			mav.addObject("messageList", list);
			req.setAttribute("mode", "receive");
			mav.setViewName("message/yepsMessage");
		}else if(mode.equals("impMsg")) {
			List<MessageDTO> list = yepsMessageMapper.importantMessage();
			mav.addObject("messageList", list);
			req.setAttribute("mode", "receive");
			mav.setViewName("message/yepsMessage");
		}
		return mav;
	}

	@RequestMapping(value = "message_read")
	public ModelAndView message_read(HttpServletRequest req,@ModelAttribute MessageDTO dto) {
		ModelAndView mav = new ModelAndView();
		int msgNum = Integer.parseInt(req.getParameter("read")) ;
		System.out.println(msgNum);
		int	rNum = 0 ;
		int readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
		System.out.println(readNum);
		if(readNum==0) {
			rNum = yepsMessageMapper.updateReadNum1(msgNum);
			int	rDate = yepsMessageMapper.updateReadDate(msgNum);

		}else {
			rNum = yepsMessageMapper.updateReadNum0(msgNum);
			
        }
		List<MessageDTO> list = yepsMessageMapper.messageList();
		req.setAttribute("messageList", list);
		req.setAttribute("mode", "receive");
		mav.setViewName("message/yepsMessage");
		return mav;
	}

}
