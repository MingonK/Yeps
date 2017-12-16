package com.yeps.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.EventDTO;
import com.yeps.model.FileDTO;
import com.yeps.service.EventMapper;
import com.yeps.service.FileMapper;

@Controller
public class EventController {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private FileMapper fileMapper;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/event_list")
	public ModelAndView listEvent() {
		List<EventDTO> list = eventMapper.listEvent();
		ModelAndView mav = new ModelAndView();
		mav.addObject("set", "events");
		mav.addObject("eventList", list);
		mav.setViewName("event/event_list");
		return mav;
	}

	@RequestMapping(value = "/event_write")
	public ModelAndView writeEvent(HttpServletRequest req) {
		// 로그인 했을 때만 이동해야함.
		
		ModelAndView mav = new ModelAndView();
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

		if(dto.getEventname() == null || dto.getEventname().trim().equals("") || dto.getEvent_content() == null 
				|| dto.getEvent_content().trim().equals("") || dto.getDiscount() == null || dto.getDiscount().trim().equals("")) {
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

	@RequestMapping(value = "/event_update_photo")
	public ModelAndView insertPhoto_Event(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		String mode = req.getParameter("mode");
		String filename = req.getParameter("filename");
		
		//로그인 안되어있으면 로그인 페이지로 이동시켜야함!!
		
		if (evnum == null || evnum.trim().equals("")) {
			//이 때 404 페이지 띄워야 함.
			return new ModelAndView("redirect: event_list");
		}
		
		if(filename != null) {
			FileDTO dto = fileMapper.getFile(filename, 0);
			if(dto != null) {
				File file = new File(uploadPath, dto.getOrigin_filename());
				fileMapper.deleteFile(dto.getFilenum());
				if (file.exists()) {
					file.delete();
				}
			}
		}

		EventDTO dto = eventMapper.getEventContent(Integer.parseInt(evnum));
		ModelAndView mav = new ModelAndView();
		if (dto == null) {
			mav.setViewName("redirect: event_write");
			return mav;
		}

		mav.addObject("eventDTO", dto);
		mav.addObject("set", "events");
		mav.addObject("mode", mode);
		mav.setViewName("event/event_update_photo");
		return mav;
	}
	

	@RequestMapping(value = "/event_fileUpLoad")
	@ResponseBody
	public HashMap<String, Object> fileUpLoad_event(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");
		
		if(evnum == null || evnum.trim().equals("")) {
			// 404페이지 띄워야함.. jsp페이지에서 처리해주자
			return null;
		}
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		
		MultipartFile mf = mr.getFile("filename");
		String origin_fileName = mf.getOriginalFilename();
		int fileSize = (int) mf.getSize();
		
		File file = new File(uploadPath, origin_fileName);
		try {
			mf.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			origin_fileName = null;
			fileSize = 0;
			file = null;
		}

		FileDTO dto = new FileDTO();
		String genId = UUID.randomUUID().toString();
		String saveFileName = genId + "." + getExtension(origin_fileName);
		dto.setEvnum(Integer.parseInt(evnum));
		dto.setFilename(saveFileName);
		dto.setOrigin_filename(origin_fileName);
		dto.setFilesize(fileSize);
		
		// 추가적으로 구현해야할 것은 mnum을 받아서 현재 로그인 한 유저의 아이디 정보를 보여줄 수 있도록 jsp페이지에서 처리해야함
		// 그래야 사진추가할 때 유저 아이디를 출력해줄 수 있음.
		
		int result = fileMapper.insertFile(dto);
		HashMap<String, Object> map = new HashMap<String, Object>();
		dto = fileMapper.getFile(saveFileName, 0);
		if(result > 0) {
			eventMapper.updateFilenum(dto.getFilenum(), Integer.parseInt(evnum));
			map.put("filenum", dto.getFilenum());
			map.put("uploadPath", uploadPath);
			map.put("origin_filename", origin_fileName);
			map.put("filename", saveFileName);
		} else {
			fileMapper.deleteFile(dto.getFilenum());
			map.put("failed", "failed");
			file.delete();
		}
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
		for(int i = 0; i < thisWeek_EventList.size(); i++) {
			thisWeek_EventFileList.add(fileMapper.getFile(null, thisWeek_EventList.get(i).getFilenum()));
		}
		
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
		
		if(evnum == null || evnum.trim().equals("") || filenum == null || filenum.trim().equals("") /*|| mnum == null || mnum.trim().equals("")*/) {
			return new ModelAndView("redirect: event_list");
		}
		
		ModelAndView mav = new ModelAndView();
		int result = fileMapper.updateFileContent(Integer.parseInt(filenum), filecontent);
		if(result > 0) {
			EventDTO eventDTO = eventMapper.getEventContent(Integer.parseInt(evnum));
			List<FileDTO> fileList = fileMapper.getTargetEventFiles(Integer.parseInt(evnum));
			
			List<EventDTO> thisWeek_EventList = eventMapper.getThisWeek_EventList();

			List<FileDTO> thisWeek_EventFileList = new ArrayList<FileDTO>();
			for(int i = 0; i < thisWeek_EventList.size(); i++) {
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/getImage/{name:.+}")
	@ResponseBody
	public ResponseEntity<byte[]> profileImage(@PathVariable("name") String name) throws IOException {
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(
				IOUtils.toByteArray(new FileInputStream(new File(uploadPath + "/" + name))), header,
				HttpStatus.CREATED);
	}
}
