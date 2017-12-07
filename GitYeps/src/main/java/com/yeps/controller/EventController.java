package com.yeps.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.CategoryDTO;
import com.yeps.model.EventDTO;
import com.yeps.service.CategoryMapper;
import com.yeps.service.EventMapper;

@Controller
public class EventController {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/event_list")
	public ModelAndView listEvent() {
		List<EventDTO> list = eventMapper.listEvent();
		return new ModelAndView("event/event_list", "eventList", list);
	}

	@RequestMapping(value = "/event_write")
	public ModelAndView writeEvent() {
		List<CategoryDTO> list = categoryMapper.listCategory();
		return new ModelAndView("event/event_writeForm", "categoryList", list);
	}

	@RequestMapping(value = "/event_jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}

	@RequestMapping(value = "/event_insert")
	public ModelAndView insertEvent(HttpServletRequest req, @ModelAttribute EventDTO dto, BindingResult result) {
		String categorySet = req.getParameter("categorySet");
		String[] category = categorySet.split("\\+");
		dto.setCategory(category[0]);
		dto.setCnum(Integer.parseInt(category[1]));
		dto.setIp(req.getRemoteAddr());

		/*
		 * MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		 * MultipartFile mf = mr.getFile("filename"); String fileName =
		 * mf.getOriginalFilename(); int fileSize = (int) mf.getSize(); File file = new
		 * File(uploadPath, fileName); try { mf.transferTo(file); } catch (Exception e)
		 * { fileSize = 0; file = null; }
		 */
		// FileDTO불러와서 fileName이랑 fileSize 입력해야 함.

		ModelAndView mav = new ModelAndView();
		if (dto.getCategory().equals("cateEmpty")) {
			mav.addObject("msg", "카테고리를 먼저 등록해야 합니다. 관리자에게 문의하시기 바랍니다.");
			mav.addObject("url", "event_list");
			mav.setViewName("message");
			return mav;
		}

		/*
		 * FileDTO file_dto = new FileDTO(); file_dto.setEvnum(dto.getEvnum());
		 * file_dto.setOrigin_filename(fileName);
		 * file_dto.setFilename(String.valueOf(UUID.randomUUID()));
		 * file_dto.setFilesize(fileSize); int file_upload =
		 * fileMapper.insertFile(file_dto);
		 */
		int res = eventMapper.insertEvent(dto);
		if (res > 0) {
			mav.addObject("msg", "이벤트를 등록하였습니다.");
			mav.addObject("url", "event_list");
			mav.setViewName("message");
			return mav;
		} else {
			mav.addObject("msg", "이벤트 등록에 실패했습니다.");
			mav.addObject("url", "event_list");
			mav.setViewName("message");
			return mav;
		}
	}

	@RequestMapping(value = "/event_content")
	public ModelAndView contentEvent(HttpServletRequest req) {
		String evnum = req.getParameter("evnum");

		if (evnum == null || evnum.trim().equals("")) {
			return new ModelAndView("redirect: event_list");
		}

		EventDTO dto = eventMapper.getEventContent(Integer.parseInt(evnum));
		return new ModelAndView("event/event_content", "eventDTO", dto);
	}

	@RequestMapping(value = "/getYelp_Logo")
	@ResponseBody
	public ResponseEntity<byte[]> profileImage() throws IOException {
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity<byte[]>(
				IOUtils.toByteArray(new FileInputStream(new File(uploadPath + "/Yelp_Logo.png"))), header,
				HttpStatus.CREATED);
	}
}
