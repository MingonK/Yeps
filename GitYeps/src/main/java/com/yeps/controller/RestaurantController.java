package com.yeps.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.FileDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.service.FileMapper;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.YepsPager;

@Controller
public class RestaurantController {
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Autowired
	private RestaurantMapper restaurantMapper;

	@Autowired
	private FileMapper fileMapper;

	@RequestMapping(value = "/jusoPopup")
	public String jusoRest() throws Exception {
		return "jusoPopup";
	}

	@RequestMapping(value = "/restaurant_insert", method = RequestMethod.GET)
	public String insertRest() throws Exception {
		return "restaurant/restaurant_insert";
	}

	@RequestMapping(value = "/restaurant_insert", method = RequestMethod.POST)
	public ModelAndView insertRest(HttpServletRequest req, @ModelAttribute RestaurantDTO dto, BindingResult result)
			throws Exception {
		String msg = null, url = null;

		// Map<String, MultipartFile> fileMap = mhsq.getFileMap();
		// for (MultipartFile multipartFile : fileMap.values()) {
		// String genId = UUID.randomUUID().toString();
		// String originalfileName=multipartFile.getOriginalFilename();
		// String saveFileName = genId + "." + getExtension(originalfileName);
		// String savePath = uploadPath + saveFileName; // 저장 될 파일 경로
		// multipartFile.transferTo(new File(savePath));
		// dto.setFilename(saveFileName);
		// }
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("filename");
		String origin_fileName = mf.getOriginalFilename();
		int fileSize = (int) mf.getSize();
		File file = new File(uploadPath, origin_fileName);
		try {
			mf.transferTo(file);
			dto.setFilename(origin_fileName);
		} catch (Exception e) {
			e.printStackTrace();
			origin_fileName = null;
			fileSize = 0;
			file = null;
			dto.setFilename("");
		}
		int res = restaurantMapper.insertRest(dto);
		if (res > 0) {
			msg = "레스토랑 등록 성공";
			url = "restaurant_list";
		} else {
			msg = "레스토랑 등록 실패";
			url = "restaurant_insert";
			file.delete();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}

	@RequestMapping(value = "/restaurant_upload", method = RequestMethod.POST)
	public ModelAndView uploadRest(HttpServletRequest req, @ModelAttribute FileDTO dto,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {
		String msg = null, url = null;
		String rnum = req.getParameter("rnum");

		Map<String, MultipartFile> fileMap = mhsq.getFileMap();
		for (MultipartFile multipartFile : fileMap.values()) {
			String genId = UUID.randomUUID().toString();
			String originalfileName = multipartFile.getOriginalFilename();
			String saveFileName = genId + "." + getExtension(originalfileName);
			String savePath = uploadPath + saveFileName; // 저장 될 파일 경로
			int fileSize = (int) multipartFile.getSize();
			multipartFile.transferTo(new File(savePath));
			dto.setRnum(Integer.parseInt(rnum));
			dto.setFilename(saveFileName);
			dto.setFile_content("");
			dto.setFilesize(fileSize);
			dto.setOrigin_filename(originalfileName);
		}

		// MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		// MultipartFile mf = mr.getFile("upload_file");
		// String genId = UUID.randomUUID().toString();
		// String origin_fileName = mf.getOriginalFilename();
		// String saveFileName = genId + "." + getExtension(origin_fileName);
		// int fileSize = (int) mf.getSize();
		// File file = new File(uploadPath, saveFileName);
		// try {
		// mf.transferTo(file);
		// dto.setFilename(saveFileName);
		// dto.setFile_content("");
		// dto.setFilesize(fileSize);
		// dto.setOrigin_filename(origin_fileName);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		int res = fileMapper.insertFile(dto);
		if (res > 0) {
			msg = "사진 등록 성공";
			url = "restaurant_content?rnum=" + rnum;
		} else {
			msg = "사진 등록 실패";
			url = "restaurant_list";
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("message");
	}

	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}

	@RequestMapping(value = "/restaurant_list")
	public ModelAndView listRest(@RequestParam(defaultValue = "1") int curPage) throws Exception {
		int count = restaurantMapper.getCount();
		int pageScale = 10;
		int blockScale = 10;
		// 페이지 나누기 관련 처리
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();

		List<RestaurantDTO> list = restaurantMapper.listRest(start, end);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("restaurant/restaurant_list");
		return mav;
	}

	@RequestMapping(value = "/restaurant_content")
	public ModelAndView contentRest(@RequestParam int rnum) {
		RestaurantDTO dto = restaurantMapper.getRest(rnum);
		List<FileDTO> uploadFileList = restaurantMapper.getFileList(rnum);
		int getImageCount = restaurantMapper.getImageCount(rnum);

		ModelAndView mav = new ModelAndView();
		mav.addObject("getRest", dto);
		mav.addObject("uploadFileList", uploadFileList);
		mav.addObject("getImageCount", getImageCount);
		mav.setViewName("restaurant/restaurant_content");
		return mav;
	}

	@RequestMapping(value = "/restaurant_photoList")
	public ModelAndView photoListRest(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage) {
		String rnum = req.getParameter("rnum");

		int count = restaurantMapper.getCount();
		int pageScale = 10;
		int blockScale = 10;
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();
		RestaurantDTO dto = restaurantMapper.getRest(Integer.parseInt(rnum));
		List<FileDTO> uploadFileList = restaurantMapper.getFileList(Integer.parseInt(rnum));
		ModelAndView mav = new ModelAndView();

		mav.addObject("getRest", dto);
		mav.addObject("uploadFileList", uploadFileList);
		mav.setViewName("restaurant/restaurant_photoList");
		return mav;

	}
}
