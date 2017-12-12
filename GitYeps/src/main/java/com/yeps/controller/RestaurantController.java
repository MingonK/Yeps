package com.yeps.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
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

import com.yeps.model.RestaurantDTO;
import com.yeps.model.uploadFileVO;
import com.yeps.service.BoardPager;
import com.yeps.service.RestaurantMapper;

@Controller
public class RestaurantController {
	@Resource(name = "uploadPath")
	private String uploadPath;
		
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	@RequestMapping(value="/test")
	public String test(){
		return "restaurant/test";
	}

	@RequestMapping(value="/jusoPopup")
	public String jusoRest() throws Exception{
		return "restaurant/jusoPopup";
	}
	@RequestMapping(value="/view")
	public String view() throws Exception{
		return "restaurant/result";
	}

	@RequestMapping(value="/restaurant_insert", method=RequestMethod.GET)
	public String insertRest() throws Exception {
		return "restaurant/restaurant_insert";
	}
	@RequestMapping(value="/restaurant_insert", method=RequestMethod.POST)
	public ModelAndView insertRest(HttpServletRequest req,@ModelAttribute RestaurantDTO dto,BindingResult result,MultipartHttpServletRequest mhsq) throws Exception {
		String msg=null,url=null;
		String upPath = "D:/spring02/upload/";
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		Iterator<String> it = mr.getFileNames();
		String fileName = null;

		while(it.hasNext()) {
			it.next();
			MultipartFile mf = mr.getFile("filename");
			fileName = mf.getOriginalFilename();
			File file = new File(upPath, fileName);
			if(mf.getSize() != 0) {
				mf.transferTo(file);
				dto.setFilename(fileName);
			}else {
				dto.setFilename("");
			}
		}
		int res=restaurantMapper.insertRest(dto);
		if(res>0) {
			msg="레스토랑 등록 성공";
			url="restaurant_list";
		}else {
			msg="레스토랑 등록 실패";
			url="restaurant_insert";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("restaurant/message");
	}

	@RequestMapping(value="/restaurant_uploadForm2")
	public String uploadForm() {
		return "restaurant/restaurant_uploadForm2";
	}

	@RequestMapping(value="/restaurant_upload")
	public ModelAndView uploadRest(HttpServletRequest req,@ModelAttribute RestaurantDTO dto, MultipartHttpServletRequest mhsq) throws IllegalStateException,IOException{
		String msg=null,url=null;
		String rnum=req.getParameter("rnum");
		String realFolder = "D:/spring02/upload/";

		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		Map<String, MultipartFile> fileMap = mhsq.getFileMap();

		for (MultipartFile multipartFile : fileMap.values()) {
			String genId = UUID.randomUUID().toString();
			String originalfileName=multipartFile.getOriginalFilename();
			String saveFileName = genId + "." + getExtension(originalfileName);
			String savePath = realFolder + saveFileName; // 저장 될 파일 경로
			long fileSize = multipartFile.getSize();
			multipartFile.transferTo(new File(savePath));
			int res=restaurantMapper.fileUpload(originalfileName, saveFileName, fileSize,Integer.parseInt(rnum));
			if(res>0) {
				msg="사진 등록 성공";
				url="restaurant_content?rnum="+rnum;
			}else {
				msg="사진 등록 실패";
				url="restaurant_list";
			}
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return new ModelAndView("restaurant/message");
	}
	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}


	@RequestMapping(value="/restaurant_list")
	public ModelAndView listRest(@RequestParam(defaultValue="1") int curPage) throws Exception{
	    int count = restaurantMapper.getCount();
	    // 페이지 나누기 관련 처리
	    BoardPager boardPager = new BoardPager(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
	    
		List<RestaurantDTO> list = restaurantMapper.listRest(start, end);
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("list", list); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("boardPager", boardPager);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("map", map); 
		mav.setViewName("restaurant/restaurant_list");
		return mav;
	}

	@RequestMapping(value="/restaurant_content")
	public ModelAndView contentRest(@RequestParam int rnum){
		RestaurantDTO dto = restaurantMapper.getRest(rnum);
		List<uploadFileVO> uploadFileList = restaurantMapper.getFileList(rnum);

		ModelAndView mav = new ModelAndView();
		mav.addObject("getRest", dto);
		mav.addObject("uploadFileList", uploadFileList);
		mav.setViewName("restaurant/restaurant_content");
		return mav; 
	}
	
	@RequestMapping(value="/getImage/{name:.+}",method=RequestMethod.GET)
	@ResponseBody
	    public ResponseEntity<byte[]> profileImage(@PathVariable("name") String name) throws IOException {
	        HttpHeaders header = new HttpHeaders();
	        header.setContentType(MediaType.IMAGE_JPEG);
	        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(new File(uploadPath+name))), header, HttpStatus.CREATED);
	    }







	    
	    
//	    //추가함(상우) 
//	    @RequestMapping(value="/restaurant_list")
//		public ModelAndView restaurant_list() {
//			List<RestaurantDTO> list = restaurantMapper.listrestaurant();
//			
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("restaurantlist", list);
//			mav.setViewName("restaurant/list");
//			return mav;
//		}







}
