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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.EventDTO;
import com.yeps.model.EventReviewDTO;
import com.yeps.model.FileDTO;
import com.yeps.model.MemberDTO;
import com.yeps.model.MemberPhotoDTO;
import com.yeps.service.EventMapper;
import com.yeps.service.EventReviewMapper;
import com.yeps.service.FileMapper;
import com.yeps.service.MemberMapper;
import com.yeps.service.MemberPhotoMapper;
import com.yeps.service.S3Connection;
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
	@Autowired
	private MemberPhotoMapper memberPhotoMapper;

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
			if (dto == null) {
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
			if (dto == null) {
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
		if (dto.getEnd_date() != null) {
			dto.setEnd_date(dto.getEnd_date() + ", " + getDateDay(dto.getEnd_date()));
		}
		HttpSession session = req.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("memberinfo");
		dto.setMnum(loginMember.getMnum());

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
				mav.addObject("set", "events");
				mav.addObject("url", "event_update_photo?evnum=" + evnum);
				mav.setViewName("usingOnlyURL");
			} else {
				mav.addObject("msg", "이벤트 등록에 실패했습니다.");
				mav.addObject("url", "event_list");
				mav.addObject("set", "events");
				mav.setViewName("message");
			}
		} else {
			mav.addObject("msg", "이미 등록된 이벤트입니다.");
			mav.setViewName("historyBack");
		}
		return mav;
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

	@RequestMapping(value = "/event_delete")
	public ModelAndView deleteEvent(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		if (evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		List<FileDTO> fileList = fileMapper.getTargetEventFiles(Integer.parseInt(evnum));
		for (int i = 0; i < fileList.size(); i++) {
			S3Connection.getInstance().deleteObject("yepsbucket", "images/" + fileList.get(i).getFilename());
		}
		int result = fileMapper.deleteAllFile(Integer.parseInt(evnum));
		if (result > 0) {
			result = eventMapper.deleteEvent(Integer.parseInt(evnum));
			if (result > 0) {
				mav.addObject("url", "event_list");
				mav.setViewName("usingOnlyURL");
			}
		} else {
			mav.addObject("msg", "파일삭제에 문제가 발생하였습니다. 같은 문제가 지속된다면 관리자에게 문의하십시오.");
			mav.addObject("url", "event_list");
			mav.setViewName("message");
		}
		mav.addObject("set", "events");
		return mav;
	}

	@RequestMapping(value = "/event_edit", method = RequestMethod.GET)
	public ModelAndView EditEvent(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		if (evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		EventDTO getEventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		String[] start_date = getEventDTO.getStart_date().split(",");
		String[] end_date = getEventDTO.getEnd_date().split(",");
		getEventDTO.setStart_date(start_date[0]);
		getEventDTO.setEnd_date(end_date[0]);

		mav.addObject("getEventDTO", getEventDTO);
		mav.addObject("set", "events");
		mav.setViewName("event/event_editForm");
		return mav;
	}

	@RequestMapping(value = "/event_edit", method = RequestMethod.POST)
	public ModelAndView EditProEvent(HttpServletRequest req, @ModelAttribute EventDTO dto, BindingResult result) {
		dto.setStart_date(dto.getStart_date() + ", " + getDateDay(dto.getStart_date()));
		if (dto.getEnd_date() != null) {
			dto.setEnd_date(dto.getEnd_date() + ", " + getDateDay(dto.getEnd_date()));
		}

		HttpSession session = req.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("memberinfo");
		dto.setMnum(loginMember.getMnum());

		if (dto.getEventname() == null || dto.getEventname().trim().equals("") || dto.getEvent_content() == null
				|| dto.getEvent_content().trim().equals("") || dto.getDiscount() == null
				|| dto.getDiscount().trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		ModelAndView mav = new ModelAndView();
		int res = eventMapper.updateEvent(dto);
		if (res > 0) {
			int evnum = eventMapper.getEvnum(dto.getEventname(), dto.getStore_address());
			mav.addObject("url", "event_update_photo?evnum=" + evnum);
			mav.setViewName("usingOnlyURL");
			return mav;
		} else {
			mav.addObject("set", "events");
			mav.addObject("msg", "이벤트 수정을 실패하였습니다.");
			mav.addObject("url", "event_list");
			mav.setViewName("message");
			return mav;
		}

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
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		ModelAndView mav = new ModelAndView();

		if (eventDTO == null) {
			mav.setViewName("redirect: event_write");
			return mav;
		}

		if (memberDTO.getIsmanager().equals("y") || memberDTO.getIsmaster().equals("y")
				|| eventDTO.getMnum() == memberDTO.getMnum()) {
			List<FileDTO> allUploadFileList = fileMapper.getTargetEventFiles(eventDTO.getEvnum());
			List<MemberDTO> registMemberList = new ArrayList<MemberDTO>();
			for (int i = 0; i < allUploadFileList.size(); i++) {
				registMemberList.add(memberMapper.getMemberProfile(allUploadFileList.get(i).getMnum()));
			}
			mav.addObject("registMemberList", registMemberList);
			mav.addObject("uploadFileList", allUploadFileList);
		} else {
			List<FileDTO> myUploadFileList = fileMapper.getfileListForMe(eventDTO.getEvnum(), memberDTO.getMnum());
			mav.addObject("uploadFileList", myUploadFileList);
		}

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
		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");

		boolean isExistMainPhoto = fileMapper.isExistEventMainPhoto(Integer.parseInt(evnum));
		if (!isExistMainPhoto) {
			return uploadFileLoop(mr, memberDTO, Integer.parseInt(evnum), "main");
		} else {
			return uploadFileLoop(mr, memberDTO, Integer.parseInt(evnum), "notmain");
		}
	}

	public HashMap<String, Object> uploadFileLoop(MultipartHttpServletRequest mr, MemberDTO memberDTO, int evnum,
			String mode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Iterator<String> it = mr.getFileNames();
		String origin_fileName = null;
		int fileSize = 0;
		List<FileDTO> fileList = new ArrayList<FileDTO>();

		while (it.hasNext()) {
			MultipartFile mf = mr.getFile(it.next());
			origin_fileName = mf.getOriginalFilename();
			fileSize = (int) mf.getSize();
			String genId = UUID.randomUUID().toString();
			String contentType = getExtension(origin_fileName);
			String saveFileName = genId + "." + contentType;

			File file = new File(saveFileName);
			if (mf.getSize() != 0) {
				try {
					mf.transferTo(file);
					S3Connection.getInstance().putObjectAsync("yepsbucket", "images/" + saveFileName, file,
							"image/" + contentType);

					FileDTO fileDTO = new FileDTO();
					fileDTO.setEvnum(evnum);
					fileDTO.setMnum(memberDTO.getMnum());
					fileDTO.setFilename(saveFileName);
					fileDTO.setOrigin_filename(origin_fileName);
					fileDTO.setFilesize(fileSize);
					int result = fileMapper.insertFile(fileDTO, mode);
					if (result > 0) {
						FileDTO insert_after_getFileDTO = fileMapper.getFile(saveFileName, 0);
						fileList.add(insert_after_getFileDTO);
					} else {
						fileMapper.deleteFileToFilename(saveFileName);
						S3Connection.getInstance().deleteObject("yepsbucket", "images/" + saveFileName);
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

		map.put("evnum", evnum);
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
		String isMainPhoto = req.getParameter("ismainphoto");
		
		HttpSession session = req.getSession();
		if(session == null) {
			return new ModelAndView("redirect: member_login");
		}
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");

		if (filename == null || filename.trim().equals("") || evnum == null || evnum.trim().equals("")
				|| isMainPhoto == null || isMainPhoto.trim().equals("")) {
			return new ModelAndView("redirect: event_update_photo");
		}

		ModelAndView mav = new ModelAndView();
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
		if (eventDTO == null) {
			mav.setViewName("redirect: event_write");
			return mav;
		}

		List<FileDTO> myUploadFileList = null;
		S3Connection.getInstance().deleteObject("yepsbucket", "images/" + filename);
		fileMapper.deleteFile(filename, Integer.parseInt(evnum), isMainPhoto);

		if (memberDTO.getIsmanager().equals("y") || memberDTO.getIsmaster().equals("y")
				|| eventDTO.getMnum() == memberDTO.getMnum()) {
			List<FileDTO> allUploadFileList = fileMapper.getTargetEventFiles(eventDTO.getEvnum());
			List<MemberDTO> registMemberList = new ArrayList<MemberDTO>();
			for (int i = 0; i < allUploadFileList.size(); i++) {
				registMemberList.add(memberMapper.getMemberProfile(allUploadFileList.get(i).getMnum()));
			}
			mav.addObject("registMemberList", registMemberList);
			mav.addObject("uploadFileList", allUploadFileList);
		} else {
			myUploadFileList = fileMapper.getfileListForMe(eventDTO.getEvnum(), memberDTO.getMnum());
			mav.addObject("uploadFileList", myUploadFileList);
		}
		mav.addObject("mode", "delete");

		mav.addObject("set", "events");
		mav.addObject("eventDTO", eventDTO);
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
		FileDTO photoInMap = fileMapper.getFYIEventFile(Integer.parseInt(evnum));

		List<EventDTO> thisWeek_EventList = eventMapper.getThisWeek_EventList();
		List<FileDTO> thisWeek_EventFileList = new ArrayList<FileDTO>();
		if (thisWeek_EventList != null) {
			for (int i = 0; i < thisWeek_EventList.size(); i++) {
				FileDTO dto = fileMapper.getFYIEventFile(thisWeek_EventList.get(i).getEvnum());
				if (dto == null) {
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
		List<MemberPhotoDTO> eventReview_writer_profileList = new ArrayList<MemberPhotoDTO>();
		for (int i = 0; i < eventReview_list.size(); i++) {
			eventReview_writer_list.add(memberMapper.getMemberProfile(eventReview_list.get(i).getMnum()));
			eventReview_writer_profileList.add(memberPhotoMapper.getMemberMainPhoto(eventReview_list.get(i).getMnum()));
		}

		mav.addObject("eventReview_writer_profileList", eventReview_writer_profileList);
		mav.addObject("eventReview_writer_list", eventReview_writer_list);
		mav.addObject("eventReview_list", eventReview_list);
		mav.addObject("photoInMap", photoInMap);
		mav.addObject("fileList", fileList);
		mav.addObject("eventDTO", eventDTO);
		mav.addObject("thisWeek_EventList", thisWeek_EventList);
		mav.addObject("thisWeek_EventFileList", thisWeek_EventFileList);
		mav.addObject("set", "events");
		mav.setViewName("event/event_contentForm");
		return mav;
	}

	@RequestMapping(value = "/event_main_photo")
	public ModelAndView eventMainPhoto(HttpServletRequest req, HttpSession session) {
		String evnum = req.getParameter("evnum");
		String filenum = req.getParameter("filenum");
		String mnum = req.getParameter("mnum");

		if (evnum == null || evnum.trim().equals("") || filenum == null || filenum.trim().equals("") || mnum == null
				|| mnum.trim().equals("")) {
			return new ModelAndView("redirect: event_update_photo?evnum=" + evnum);
		}

		ModelAndView mav = new ModelAndView();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("memberinfo");
		EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));

		if (loginMember.getMnum() == Integer.parseInt(mnum) || loginMember.getIsmanager().equals("y")
				|| loginMember.getIsmaster().equals("y")) {
			int result = fileMapper.changeEventMainPhoto(Integer.parseInt(evnum), Integer.parseInt(filenum));
			List<FileDTO> myUploadFileList = null;

			if (result > 0) {
				if (loginMember.getIsmanager().equals("y") || loginMember.getIsmaster().equals("y")
						|| eventDTO.getMnum() == loginMember.getMnum()) {
					List<FileDTO> allUploadFileList = fileMapper.getTargetEventFiles(eventDTO.getEvnum());
					List<MemberDTO> registMemberList = new ArrayList<MemberDTO>();

					for (int i = 0; i < allUploadFileList.size(); i++) {
						registMemberList.add(memberMapper.getMemberProfile(allUploadFileList.get(i).getMnum()));
					}
					mav.addObject("registMemberList", registMemberList);
					mav.addObject("uploadFileList", allUploadFileList);
				} else {
					myUploadFileList = fileMapper.getfileListForMe(eventDTO.getEvnum(), loginMember.getMnum());
					mav.addObject("uploadFileList", myUploadFileList);
				}
				mav.addObject("mode", "update");
			}
		}

		mav.addObject("set", "events");
		mav.addObject("eventDTO", eventDTO);
		mav.setViewName("event/event_update_photo");
		return mav;
	}

	// @RequestMapping(value = "/event_updatePro_photo")
	// public ModelAndView insertPro_Photo_Event(HttpServletRequest req) {
	// String evnum = req.getParameter("evnum");
	// String mnum = req.getParameter("mnum");
	// String filenum = req.getParameter("filenum");
	// String filecontent = req.getParameter("filecontent");
	// System.out.println("데이터 확인: " + evnum + ", " + mnum + ", " + filenum + ", " +
	// filecontent);
	//
	// if (evnum == null || evnum.trim().equals("") || filenum == null ||
	// filenum.trim().equals("") || mnum == null
	// || mnum.trim().equals("")) {
	// System.out.println("1");
	// return new ModelAndView("redirect: event_list");
	// }
	// System.out.println("2");
	// ModelAndView mav = new ModelAndView();
	// int result = fileMapper.updateFileContent(Integer.parseInt(filenum),
	// filecontent);
	// if (result > 0) {
	// System.out.println("3");
	// EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
	// List<FileDTO> myUploadFileList =
	// fileMapper.getfileListForMe(eventDTO.getEvnum(), Integer.parseInt(mnum));
	// mav.addObject("eventDTO", eventDTO);
	// mav.addObject("myUploadFileList", myUploadFileList);
	// mav.addObject("set", "events");
	// mav.setViewName("event/event_update_photo");
	// } else {
	// System.out.println("4");
	// mav.addObject("msg", "사진 등록 오류발생.");
	// mav.addObject("url", "event_update_photo?evnum=" + evnum);
	// mav.setViewName("message");
	// }
	// System.out.println("5");
	// return mav;
	// }

	@RequestMapping(value = "/event_browseAll_photo")
	public ModelAndView eventBrowseAll(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");

		if (evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		List<FileDTO> fileList = fileMapper.getTargetEventFiles(Integer.parseInt(evnum));

		return null;
	}

	@RequestMapping(value = "/event_report")
	public ModelAndView eventReport() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("historyBack");
		return mav;
	}
}
