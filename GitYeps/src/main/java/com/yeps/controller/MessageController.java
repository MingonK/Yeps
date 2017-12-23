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

import org.apache.ibatis.annotations.Param;
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

import com.yeps.model.MemberDTO;
import com.yeps.model.MessageDTO;
import com.yeps.service.YepsPager;
import com.yeps.service.MemberMapper;
import com.yeps.service.MessageMapper;

@Controller
public class MessageController {

	@Autowired
	private MessageMapper yepsMessageMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	public ModelAndView pagingMessageList(HttpServletRequest req ,@RequestParam String lMode, String name) {
	    //각각의 메시지 총 수를 구한다.
        int cnt = 0;
		int count = yepsMessageMapper.getMessageCount();//총 메시지 카운트. 하지만 보여지는 페이지에선 나오지 않을듯
		int lCount = yepsMessageMapper.getLockerCount();//보관함 쪽지 개수
		int sCount = yepsMessageMapper.getSendCount(name);//보낸 쪽지 개수
		int mCount = yepsMessageMapper.getReceiveCount(name);//받은 쪽지 개수
	   
		int curPage = req.getParameter("curPage")!=null?Integer.parseInt(req.getParameter("curPage")): 1 ;
		//lMode로 여러 종류의 리스트를 구분하여 카운트를 설정한다.  
		if(lMode==null) {
	    lMode = req.getParameter("lMode")!=null?req.getParameter("lMode"):"msgBoxList";
	        cnt = mCount;
		}
		if(lMode.equals("allLocker")) {
			cnt = lCount;
		}else if(lMode.equals("msgBoxList")) {
			cnt = mCount;
		}else if(lMode.equals("allList")) {
		    cnt = count;
		}else if(lMode.equals("noneMsg")) {
			
			cnt = yepsMessageMapper.noneMessageCount();
		}else if(lMode.equals("readMsg")) {
			
			cnt = yepsMessageMapper.readMessageCount();
		}else if(lMode.equals("noneLocker")) {
			
			cnt = yepsMessageMapper.noneLockerCount();
		}else if(lMode.equals("readLocker")) {
			
			cnt = yepsMessageMapper.readLockerCount();
		}else if(lMode.equals("sender")) {
			
			cnt = sCount;
		}
		
		int pageScale = 10, blockScale = 5;
		YepsPager yPager = new YepsPager(cnt, curPage, pageScale, blockScale );
		int start = yPager.getPageBegin();
		int end = yPager.getPageEnd();
		int pageSize = yPager.PAGE_SCALE;
		int num = count - pageSize * (curPage - 1) + 1; 
		
		System.out.println("2" + lMode);
		
		//페이징처리된 리스트를 구한다.
		List<MessageDTO> list = yepsMessageMapper.messageList(start, end, lMode, name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lMode", lMode);
		map.put("list", list); // list
		map.put("count", count); 
		map.put("yepsPager", yPager);
		
		ModelAndView mav = new ModelAndView();
	    mav.addObject("mCount",mCount);
		mav.addObject("lCount",lCount);
		mav.addObject("sCount",sCount);
		mav.addObject("count", count);
		mav.addObject("num", num);
		mav.addObject("map", map); 
		//로그인 회원이 마스터나 매니져인지 확인후 권한 주기
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		String key = null;
		if(member.getIsmaster().equals('y') || member.getIsmanager().equals('y')) {
		    key = "almighty";
		}else {
			key = "ordinary";
		}
		
		//lMode에 따라 보내질 페이지를 구분한다.
		if(lMode.equals("allLocker") || lMode.equals("readLocker") || lMode.equals("noneLocker")) {
			mav.setViewName("message/messageLocker");
			
		}else{
			String mode = req.getParameter("mode");
			if(mode==null) {
				mav.addObject("mode", "receive");
			}else {
				mav.addObject("mode", mode);
			}
			mav.setViewName("message/yepsMessage");
		}
		mav.addObject("set", "message");
		mav.addObject("key", key);
		return mav;
	}

	@RequestMapping(value = "yeps_message")
	public ModelAndView yeps_message(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null, key = null;
		String lMode = req.getParameter("lMode");
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			msg = "로그인 먼저 해주세요. 로그인 페이지로 이동합니다.";
			mav.addObject("msg", msg);
			mav.setViewName("redirect:member_login?mode=login");
	        return mav;
		}
		if(member.getIsmaster().equals('y') || member.getIsmanager().equals('y')) {
		    key = "almighty";
		}else {
			key = "ordinary";
		}
        String name = member.getName().trim();
		mav = pagingMessageList(req, lMode, name);
		mav.addObject("set", "message");
		mav.addObject("key", key);
		return mav;
	}
	
	@RequestMapping(value = "message_locker")
	public ModelAndView message_locker(HttpServletRequest req)throws Exception{
		ModelAndView mav = new ModelAndView();
		String lMode = "allLocker";
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		int mnum = member.getMnum();
		String name = member.getName();
		mav = pagingMessageList(req,lMode, name);
		mav.addObject("set", "message");
		return mav;
	}

	@RequestMapping(value = "message_delete")
	public ModelAndView message_delete(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String msgNum = req.getParameter("msgNum");
		String msg = null, lMode = null, box = null;
		box = req.getParameter("box");
		int res = 0;
		if(msgNum==null) {
			if(check == null) {
				msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
				if(box.equals("msgBox")) {
					mav.setViewName("redirect:yeps_message");
				}else if(box.equals("locker")) {
					mav.setViewName("redirect:message_locker");
				}
				req.setAttribute("msg", msg);
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
				req.setAttribute("msg", msg);
			}
		}else {
			int msgnum = Integer.parseInt(msgNum);
			res = yepsMessageMapper.deleteMessage(msgnum);
			msg = "메시지가 삭제 되었습니다.";
			req.setAttribute("msg", msg);
		}
		if(box.equals("msgBox")) {
			
			mav.setViewName("redirect:yeps_message");
		}else if(box.equals("locker")) {
			
			mav.setViewName("redirect:message_locker");
		}
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
		String msg = null, lMode = null;
        MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
        if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		int mnum = member.getMnum();
		dto.setMnum(mnum);
		String name = member.getName();//로그인시 로그인한 회원의 정보로 보내는 사람을 구한다.*/
		dto.setSender(name);
		String receiver = dto.getReceiver().trim();
		dto.setReceiver(receiver);
//		List<MemberDTO> memberList = memberMapper.listMember();
//		for(int i=0; i < memberList.size(); i++) {
//			String who = memberList.get(i).getName();
//			if(who.equals(receiver.trim())) {
//		    	 dto.setReceiver(who);
//		    }
//		}
		  int res = yepsMessageMapper.writeMessage(dto);
	  		if(res>0) {
	  			msg = "쪽지를 보냈습니다.쪽지함으로 이동합니다.";
	  			lMode = "msgBoxList";
	  			mav = pagingMessageList(req, lMode,  name);
	  			
	  		}else {
	  			msg = "쪽지 보내기에 실패하였습니다.";
	  			mav = pagingMessageList(req, lMode,  name);
	  		}
	    mav.addObject("msg", msg);
		return mav;
	}

/*	@RequestMapping(value = "message_reply")
	public ModelAndView message_reply(HttpServletRequest req, String[] check) {
		ModelAndView mav = new ModelAndView();
		String receiver = req.getParameter("receiver");
		String msg = null, box = null;
		box = req.getParameter("box");
        if(check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			if(box.equals("msgBox")) {
				mav.setViewName("redirect: yeps_message");
			}else if(box.equals("locker")) {
				mav.setViewName("redirect: message_locker");
			}
			
			mav.addObject("msg", msg);
			return mav;
		}
		if(receiver==null) {
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
		mav.addObject("mode", "reply");
		mav.addObject("set", "message");
		mav.setViewName("message/yepsMessage");
		return mav;
	}*/

	@RequestMapping(value = "message_action")
	public ModelAndView message_search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String filterMode = req.getParameter("filter");
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		int mnum = member.getMnum();
		String name = member.getName();
        String lMode = null;
        String msg = null;
        System.out.println("#" + filterMode);
		if(filterMode.equals("allMsg")) {
         
			mav.setViewName("redirect:yeps_message");
			
		}else if(filterMode.equals("noneMsg")) {
			lMode = "noneMsg";
			mav = pagingMessageList(req, lMode,  name);
			
		}else if(filterMode.equals("readMsg")) {
			lMode = "readMsg";
			mav = pagingMessageList(req, lMode, name);
		
        }else if(filterMode.equals("allLocker")) {
			
            mav.setViewName("redirect:message_locker");
        }else if(filterMode.equals("readLocker")) {
			lMode = "readLocker";
			mav = pagingMessageList(req, lMode, name);
			mav.setViewName("message/messageLocker");
			
		}else if(filterMode.equals("noneLocker")) {
			lMode = "noneLocker";
			mav = pagingMessageList(req, lMode, name);
			mav.setViewName("message/messageLocker");
			
		}else if(filterMode.equals("sender")){
		
			lMode = filterMode;
			mav = pagingMessageList(req, lMode, name);
		    mav.addObject("mode","send");
		
		}else if(filterMode.equals("msgBoxList")) {
			mav.setViewName("redirect:yeps_message");
			
		}else {
			msg = "error code:4007; 관리자에게 문의 하십시오.";
			mav.setViewName("message/yepsMessage");
			mav.addObject("msg", msg);
		}
		return mav;
	}

	@RequestMapping(value = "message_read")//쪽지함에서 읽음 표시
	public ModelAndView message_read(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		String name = member.getName();
		
		String mNum = req.getParameter("read") ;
		String lMode = req.getParameter("lMode");
		System.out.println("1" + lMode);
		int msgNum = 0 ,resRead = 0 , readNum = 0,	resDate=0;
		if(mNum==null) {
			msgNum = Integer.parseInt(req.getParameter("msgnum"));
			readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
			if(readNum==0) {
				resRead = yepsMessageMapper.updateReadNum1(msgNum);
				resDate = yepsMessageMapper.updateReadDate(msgNum);
				readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
				mav.addObject("readNum", readNum);
				mav = pagingMessageList(req,lMode,name);
			}else {
				mav = pagingMessageList(req,lMode,name);
				
			}
			return mav;
		}else {
			msgNum = Integer.parseInt(mNum);
			readNum = yepsMessageMapper.getContent(msgNum).getReadNum();
			if(readNum==0) {
				resRead = yepsMessageMapper.updateReadNum1(msgNum);
				resDate = yepsMessageMapper.updateReadDate(msgNum);
			}else {
				resRead = yepsMessageMapper.updateReadNum0(msgNum);
			}
		}
		mav = pagingMessageList(req, lMode, name);
		return mav;
	}

	@RequestMapping(value = "message_moveToLocker")
	public ModelAndView message_moveToLocker(HttpServletRequest req,String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null, lMode = null, url = null;
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		String name = member.getName();
		int mnum = member.getMnum();
		if(check == null) {
			lMode = "msgBoxList";
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
		    mav = pagingMessageList(req,lMode, name);
			mav.addObject("msg", msg);
			return mav;
		}
		for(String num : check) {
			int msgnum = Integer.parseInt(num);
		    int res = yepsMessageMapper.moveToLocker(msgnum);
		    if (res>0) {
				
				msg = "보관함으로 이동 되었습니다. ";
				lMode = "msgBoxList";
				mav = pagingMessageList(req,lMode, name);
				mav.addObject("msg", msg);
			}else {
				msg = "보관함 이동에 실패하였습니다.";
				mav.addObject("msg", msg);
				mav.setViewName("redirect:yeps_message");
			}
		}
	    return mav;
	}

	@RequestMapping(value = "message_lockerToMsgBox")
	public ModelAndView message_moveToMsgBox(HttpServletRequest req,String[] check) {
		ModelAndView mav = new ModelAndView();
		String msg = null, lMode = null;
		MemberDTO member = (MemberDTO)req.getSession().getAttribute("memberinfo");
		if(member==null) {
			mav.setViewName("MainPage");
			return mav;
		}
		String  name = member.getName();
		int mnum = member.getMnum();
		if(check == null) {
			msg = "선택된 메시지가 없습니다. 다시 확인하세요.";
			req.setAttribute("mode", "receive");
			lMode = "allLocker";
			mav = pagingMessageList(req, lMode, name);
			mav.addObject("msg", msg);
			mav.setViewName("message/messageLocker");
			return mav;
		}
		for(String num : check) {
			int msgnum = Integer.parseInt(num);
			int res = yepsMessageMapper.lockerToMsgBox(msgnum);
			if (res>0) {
				msg = "쪽지함으로 이동 되었습니다. ";
				mav.addObject("msg", msg);
			}else {
				msg = "쪽지함 이동에 실패하였습니다.";
				mav.addObject("msg", msg);
			}
		}
		lMode = "allLocker";
		mav = pagingMessageList(req, lMode, name);
		mav.setViewName("message/messageLocker");
		return mav;
	}
	
	@RequestMapping(value = "message_alert")
	public ModelAndView message_alert(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageAlert");
		return mav;
	}
}








