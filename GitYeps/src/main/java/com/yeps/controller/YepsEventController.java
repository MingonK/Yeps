package com.yeps.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.EventDTO;
import com.yeps.service.YepsEventMapper;

@Controller
public class YepsEventController {

	@Autowired
	private YepsEventMapper yepsEventMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	public void yeps_date(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
	}

	/*@RequestMapping(value = "yeps_event")
	public ModelAndView yeps_event(Locale locale, Model model) {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		List<EventDTO> list = yepsEventMapper.eventList();
	
		mav.addObject("eventList",list);
		mav.setViewName("event/yepsEvent");
		return mav;
	}*/
	
	@RequestMapping(value = "event_list")
	public ModelAndView event_list(Locale locale, Model model) {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		List<EventDTO> list = yepsEventMapper.eventList();
		
		/*for(int i=0; i< list.size() ; i++) {
			list.get(i).setContent(list.get(i).getContent().substring(0,20));
		} 이벤트 내용중 앞부분 20자정도의 내용을 보여주기 위한 코드. 처음엔 됐었는데 에러가 떠서 주석처리중.*/
		mav.addObject("eventList",list);
		mav.setViewName("event/yepsEvent");
		return mav;
	}

	@RequestMapping(value = "event_content")
	public ModelAndView event_content(Locale locale, Model model,HttpServletRequest req) {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		int evnum = Integer.parseInt(req.getParameter("evnum"));
		EventDTO event = yepsEventMapper.getEvent(evnum);  
		mav.addObject("event", event);
		mav.setViewName("event/eventContent");
		return mav;
	}

	

	@RequestMapping(value = "event_regist")
	public ModelAndView event_regist(Locale locale, Model model) {
		yeps_date(locale,model);
		return new ModelAndView("event/eventRegForm");
	}

    @RequestMapping(value = "event_insert")
	public ModelAndView event_insert
	(HttpServletRequest req, @ModelAttribute EventDTO dto, BindingResult result,Locale locale, Model model)
			throws Exception {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			dto.setEvnum(0);
		}
		String msg = null;
		String passwd = req.getParameter("passwd");//패스워드를 받아 로그인 된 관리자의 패스워드와 비교후 이벤트를 관리한다.
		System.out.println(passwd);
		/*if(passwd.equals("logon.passwd")) { //임시로 넣어둔 관리자의 패스워드. 나중에 외래키를 받아 패스워드를 가져와 비교한다.
*/
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile("filename");
			String filename = mf.getOriginalFilename();
			
			if(filename != null ) {
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/files");
				File file = new File(upPath,filename);
				mf.transferTo(file);
			}
			dto.setFilename(filename);

			int filesize = 0;
			if (mf != null) {
				filesize = (int)mf.getSize();
			}
			dto.setFilesize(filesize);
			System.out.println(dto.getDiscount());
			System.out.println(dto.getPeriode2());
			int res = yepsEventMapper.insertEvent(dto);

			if(res>0) {
				msg = "이벤트 등록에 성공 하였습니다. 이벤트 목록으로 이동합니다.";

			}else {
				msg = "이벤트 등록에  실패하였습니다. 이벤트 목록으로 이동합니다.";
			}
			List<EventDTO> list = yepsEventMapper.eventList();
			mav.addObject("eventList",list);
			mav.addObject("msg", msg);
			mav.setViewName("event/yepsEvent");
		
	/*	}else {
			msg = "패스워드가 틀렸습니다. 다시 확인하세요.";
			mav.setViewName("event/RegForm");
		}*/
		return mav;
	}

    @RequestMapping(value = "event_delete")
	public ModelAndView event_delete(Locale locale, Model model, HttpServletRequest req) {
    	yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		int evnum = Integer.parseInt(req.getParameter("evnum"));
		int res = yepsEventMapper.deleteEvent(evnum);
		String msg = null;
		if(res>0) {
			msg = "이벤트가 삭제되었습니다. 이벤트 목록으로 이동합니다.";
		}else {
			msg = "이벤트 삭제에 실패하였습니다. 이벤트 목록으로 이동합니다.";
		}
		List<EventDTO> list = yepsEventMapper.eventList();
		mav.addObject("eventList",list);
		mav.addObject("msg", msg);
		mav.setViewName("event/yepsEvent");
		return mav;
	}

	@RequestMapping(value = "event_update")
	public ModelAndView event_update
	(HttpServletRequest req, @ModelAttribute EventDTO dto, BindingResult result,Locale locale, Model model)
			throws Exception {
		yeps_date(locale,model);
		ModelAndView mav = new ModelAndView();
		String msg = null;
		String passwd = req.getParameter("passwd");//패스워드를 받아 로그인 된 관리자의 패스워드와 비교후 이벤트를 관리한다.
		System.out.println(passwd);
		/*if(passwd.equals("logon.passwd")) { //임시로 넣어둔 관리자의 패스워드. 나중에 외래키를 받아 패스워드를 가져와 비교한다.
*/
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile("filename");
			String filename = mf.getOriginalFilename();
			
			if(filename != null ) {
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/files");
				File file = new File(upPath,filename);
				mf.transferTo(file);
			}
			dto.setFilename(filename);
            int filesize = 0;
			if (mf != null) {
				filesize = (int)mf.getSize();
			}
			dto.setFilesize(filesize);
			int res = yepsEventMapper.insertEvent(dto);

			if(res>0) {
				msg = "이벤트 수정에 성공 하였습니다. 이벤트 목록으로 이동합니다.";

			}else {
				msg = "이벤트 수정에  실패하였습니다. 이벤트 목록으로 이동합니다.";
			}
			
			List<EventDTO> list = yepsEventMapper.eventList();
			mav.addObject("eventList",list);
			mav.addObject("msg", msg);
			mav.setViewName("event/yepsEvent");
			return mav;
	/*	}else {
			msg = "패스워드가 틀렸습니다. 다시 확인하세요.";
			mav.setViewName("event/RegForm");
		}*/
		
	}

	@RequestMapping(value = "event_findEvent")
	public ModelAndView event_findList(@RequestParam String search, String SearchString){
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
