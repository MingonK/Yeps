package com.yeps.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.EventDTO;
import com.yeps.model.EventReviewDTO;
import com.yeps.model.FileDTO;
import com.yeps.model.MemberDTO;
import com.yeps.service.EventMapper;
import com.yeps.service.EventReviewMapper;
import com.yeps.service.FileMapper;
import com.yeps.service.MemberMapper;
import com.yeps.service.YepsPager;

@Controller
public class EventController {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private EventReviewMapper eventReviewMapper;
	@Autowired
	private MemberMapper memberMapper;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/event_list")
	public ModelAndView listEvent(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		int curPage = req.getParameter("curPage") != null ? Integer.parseInt(req.getParameter("curPage")) : 1;

		int count = 0;
		YepsPager yepsPager = null;
		int start = 0;
		int end = 0;

		if (mode == null || mode.trim().equals("") || mode.trim().equals("recently")) {
			count = eventMapper.getEventCount("normal");
			yepsPager = new YepsPager(count, curPage, 15, 10);
			start = yepsPager.getPageBegin();
			end = yepsPager.getPageEnd();
		} else if (mode.equals("free")) {
			count = eventMapper.getEventCount("free");
			yepsPager = new YepsPager(count, curPage, 15, 10);
			start = yepsPager.getPageBegin();
			end = yepsPager.getPageEnd();
		} else if (mode.equals("date")) {
			count = eventMapper.getEventCount("normal");
			yepsPager = new YepsPager(count, curPage, 15, 10);
			start = yepsPager.getPageBegin();
			end = yepsPager.getPageEnd();
		} else {
			count = eventMapper.getEventCount(mode);
			yepsPager = new YepsPager(count, curPage, 15, 10);
			start = yepsPager.getPageBegin();
			end = yepsPager.getPageEnd();
		}

		List<EventDTO> eventList = eventMapper.listEvent(mode, start, end);
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		for (int i = 0; i < eventList.size(); i++) {
			FileDTO dto = fileMapper.getFYIEventFile(eventList.get(i).getEvnum());
			if(dto == null) {
				FileDTO dtoForNull = new FileDTO();
				dtoForNull.setFilename("nothing");
				dtoForNull.setEvnum(eventList.get(i).getEvnum());
				fileList.add(dtoForNull);
			} else {
				fileList.add(dto);
			}
		}
		
		List<EventDTO> thisWeek_random_eventList = eventMapper.getRandom_EventList();
		List<FileDTO> thisWeek_random_fileList = new ArrayList<FileDTO>();
		for (int i = 0; i < thisWeek_random_eventList.size(); i++) {
			FileDTO dto = fileMapper.getFYIEventFile(thisWeek_random_eventList.get(i).getEvnum());
			if(dto == null) {
				FileDTO dtoForNull = new FileDTO();
				dtoForNull.setFilename("nothing");
				dtoForNull.setEvnum(thisWeek_random_eventList.get(i).getEvnum());
				thisWeek_random_fileList.add(dtoForNull);
			} else {
				thisWeek_random_fileList.add(dto);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mode", mode);
		mav.addObject("set", "events");
		mav.addObject("fileList", fileList);
		mav.addObject("eventList", eventList);
		mav.addObject("thisWeek_random_eventList", thisWeek_random_eventList);
		mav.addObject("thisWeek_random_fileList", thisWeek_random_fileList);
		mav.addObject("curPage", curPage);
		mav.addObject("count", count);
		mav.addObject("yepsPager", yepsPager);
		mav.setViewName("event/event_list");
		return mav;
	}

	@RequestMapping(value = "/event_write")
	public ModelAndView writeEvent(HttpServletRequest req) {
		// 로그인 했을 때만 이동해야함.
		ModelAndView mav = new ModelAndView();
		mav.addObject("set", "events");
		mav.setViewName("event/event_writeForm");
		return mav;
	}

	@RequestMapping(value = "/event_jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}

	@RequestMapping(value = "/event_insert")
	public ModelAndView insertEvent(HttpServletRequest req, @ModelAttribute EventDTO dto, BindingResult result) {
		dto.setIp(req.getRemoteAddr());
		dto.setStart_date(dto.getStart_date() + ", " + getDateDay(dto.getStart_date()));
		dto.setEnd_date(dto.getEnd_date() + ", " + getDateDay(dto.getEnd_date()));
		
		if (dto.getEventname() == null || dto.getEventname().trim().equals("") || dto.getEvent_content() == null
				|| dto.getEvent_content().trim().equals("") || dto.getDiscount() == null
				|| dto.getDiscount().trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		boolean check = eventMapper.RedundancyCheck(dto.getEventname());
		if (check) {
			int res = eventMapper.insertEvent(dto);
			if (res > 0) {
				int evnum = eventMapper.getEvnum(dto.getEventname(), dto.getStore_address());
				mav.addObject("url", "event_update_photo?evnum=" + evnum);
				mav.setViewName("usingOnlyURL");
				return mav;
			} else {
				mav.addObject("msg", "이벤트 등록에 실패했습니다.");
				mav.addObject("url", "event_list");
				mav.setViewName("message");
				return mav;
			}
		} else {
			mav.addObject("msg", "이미 등록된 이벤트입니다.");
			mav.setViewName("historyBack");
			return mav;
		}
	}
	
	
	public String getDateDay(String date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date parsingDate = null;
		try {
			parsingDate = formatter.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		} // 날짜 입력하는곳 .
		parsingDate = new Date(parsingDate.getTime() + (1000 * 60 * 60 * 24 - 1)); // 날짜에 하루를 더한 값
		// 하루를 뺄려면 (1000*60*60*24*-1) 해주시면 됩니다.

		Calendar cal = Calendar.getInstance();
		cal.setTime(parsingDate); // 하루더한 날자 값을 Calendar 넣는다.

		int dayNum = cal.get(Calendar.DAY_OF_WEEK); // 요일을 구해온다.

		String convertedString = "";

		switch (dayNum) {
		case 1:
			convertedString = "일요일";
			break;
		case 2:
			convertedString = "월요일";
			break;
		case 3:
			convertedString = "화요일";
			break;
		case 4:
			convertedString = "수요일";
			break;
		case 5:
			convertedString = "목요일";
			break;
		case 6:
			convertedString = "금요일";
			break;
		case 7:
			convertedString = "토요일";
			break;
		}
		return convertedString;
	}
	

	@RequestMapping(value = "/event_update_photo")
	public ModelAndView insertPhoto_Event(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		if (evnum == null || evnum.trim().equals("")) {
			// 이 때 404 페이지 띄워야 함.
			return new ModelAndView("redirect: event_list");
		}

		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		ModelAndView mav = new ModelAndView();
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		if (eventDTO == null) {
			mav.setViewName("redirect: event_write");
			return mav;
		}
		List<FileDTO> myUploadFileList = fileMapper.getfileListForMe(eventDTO.getEvnum(), memberDTO.getMnum());
		mav.addObject("myUploadFileList", myUploadFileList);
		mav.addObject("eventDTO", eventDTO);
		mav.addObject("set", "events");
		mav.setViewName("event/event_update_photo");
		return mav;	
	}

	@RequestMapping(value = "/event_fileUpLoad")
	@ResponseBody
	public HashMap<String, Object> fileUpLoad_event(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		if (evnum == null || evnum.trim().equals("")) {
			// 404페이지 띄워야함.. jsp페이지에서 처리해주자
			return null;
		}
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = mr.getFileNames();
		String origin_fileName = null;
		int fileSize = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		map.put("uploadPath", uploadPath);
		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		
		while (it.hasNext()) {
			MultipartFile mf = mr.getFile(it.next());
			origin_fileName = mf.getOriginalFilename();
			fileSize = (int) mf.getSize();
			String genId = UUID.randomUUID().toString();
			String saveFileName = genId + "." + getExtension(origin_fileName);
			File file = new File(uploadPath, saveFileName);

			if (mf.getSize() != 0) {
				try {
					mf.transferTo(file);

					FileDTO fileDTO = new FileDTO();
					fileDTO.setEvnum(Integer.parseInt(evnum));
					fileDTO.setMnum(memberDTO.getMnum());
					fileDTO.setFilename(saveFileName);
					fileDTO.setOrigin_filename(origin_fileName);
					fileDTO.setFilesize(fileSize);
					int result = fileMapper.insertFile(fileDTO);
					if (result > 0) {
						FileDTO insert_after_getFileDTO = fileMapper.getFile(saveFileName, 0);
						fileList.add(insert_after_getFileDTO);
					} else {
						fileMapper.deleteFileToFilename(saveFileName);
						map.put("failed", "파일 등록에 실패했습니다. 잠시후 다시 시도해주세요.");
						file.delete();
					}
				} catch (Exception e) {
					e.printStackTrace();
					origin_fileName = null;
					fileSize = 0;
					file = null;
					map.put("created_fail", "파일 생성 실패, 잠시 후 다시 시도하세요.");
				}
			} else {
				map.put("upload_failed", "업로드할 수 없는 파일이 존재합니다.");
			}
		}
		map.put("evnum", Integer.parseInt(evnum));
		map.put("fileList", fileList);
		return map;
	}

	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}
	
	@RequestMapping(value = "/event_delete_photo")
	public ModelAndView DeletePhoto_Event(HttpServletRequest req) {
		String filename = req.getParameter("filename");
		String evnum = req.getParameter("evnum");
		
		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		
		if (filename == null || filename.trim().equals("") || evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_update_photo");
		}
		
		ModelAndView mav = new ModelAndView();
		
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		if (eventDTO == null) {
			mav.setViewName("redirect: event_write");
			return mav;
		}
		
		File file = new File(uploadPath, filename);
		List<FileDTO> myUploadFileList = null;
		if(file.exists()) {
			int result = fileMapper.deleteFileToFilename(filename);
			file.delete();
			if(result > 0) {
				myUploadFileList = fileMapper.getfileListForMe(Integer.parseInt(evnum), memberDTO.getMnum());
				mav.addObject("delete", "delete");
			}
		}
		
		mav.addObject("eventDTO", eventDTO);
		mav.addObject("myUploadFileList", myUploadFileList);
		mav.setViewName("event/event_update_photo");
		return mav;
	}

	@RequestMapping(value = "/event_content")
	public ModelAndView contentEvent(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		if (evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		List<FileDTO> fileList = fileMapper.getTargetEventFiles(Integer.parseInt(evnum));
		
		List<EventDTO> thisWeek_EventList = eventMapper.getThisWeek_EventList();
		List<FileDTO> thisWeek_EventFileList = new ArrayList<FileDTO>();
		if(thisWeek_EventList != null) {
			for (int i = 0; i < thisWeek_EventList.size(); i++) {
				FileDTO dto = fileMapper.getFYIEventFile(thisWeek_EventList.get(i).getEvnum());
				if(dto == null) {
					FileDTO dtoForNull = new FileDTO();
					dtoForNull.setFilename("nothing");
					dtoForNull.setEvnum(thisWeek_EventList.get(i).getEvnum());
					thisWeek_EventFileList.add(dtoForNull);
				} else {
					thisWeek_EventFileList.add(dto);
				}
			}
		}
		
		List<EventReviewDTO> eventReview_list = eventReviewMapper.listEventReview(Integer.parseInt(evnum));

		HashSet<MemberDTO> eventReview_writer_list = new HashSet<MemberDTO>();
		for (int i = 0; i < eventReview_list.size(); i++) {
			eventReview_writer_list.add(memberMapper.getMemberProfile(eventReview_list.get(i).getMnum()));
		}

		mav.addObject("eventReview_writer_list", eventReview_writer_list);
		mav.addObject("eventReview_list", eventReview_list);
		mav.addObject("fileList", fileList);
		mav.addObject("eventDTO", eventDTO);
		mav.addObject("thisWeek_EventList", thisWeek_EventList);
		mav.addObject("thisWeek_EventFileList", thisWeek_EventFileList);
		mav.addObject("set", "events");
		mav.setViewName("event/event_contentForm");
		return mav;
	}

	@RequestMapping(value = "/event_updatePro_photo")
	public ModelAndView insertPro_Photo_Event(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		String mnum = req.getParameter("mnum");
		String filenum = req.getParameter("filenum");
		String filecontent = req.getParameter("filecontent");

		if (evnum == null || evnum.trim().equals("") || filenum == null || filenum.trim().equals("") || mnum == null
				|| mnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		int result = fileMapper.updateFileContent(Integer.parseInt(filenum), filecontent);
		if (result > 0) {
			EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
			List<FileDTO> fileList = fileMapper.getTargetEventFiles(Integer.parseInt(evnum));

			List<EventDTO> thisWeek_EventList = eventMapper.getThisWeek_EventList();

			List<FileDTO> thisWeek_EventFileList = new ArrayList<FileDTO>();
			for (int i = 0; i < thisWeek_EventList.size(); i++) {
				thisWeek_EventFileList.add(fileMapper.getFile(null, thisWeek_EventList.get(i).getFilenum()));
			}

			mav.addObject("thisWeek_EventList", thisWeek_EventList);
			mav.addObject("thisWeek_EventFileList", thisWeek_EventFileList);
			mav.addObject("fileList", fileList);
			mav.addObject("eventDTO", eventDTO);
			mav.addObject("set", "events");
			mav.setViewName("event/event_contentForm");
		} else {
			mav.addObject("msg", "사진 등록 오류발생.");
			mav.addObject("url", "event_update_photo?evnum=" + evnum);
			mav.setViewName("message");
		}
		return mav;
	}

	@RequestMapping(value = "/event_browseAll_photo")
	public ModelAndView eventBrowseAll() {
		return null;
	}

	@RequestMapping(value = "/event_report")
	public ModelAndView eventReport() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("historyBack");
		return mav;
	}
}
