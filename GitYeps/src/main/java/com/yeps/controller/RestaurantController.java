package com.yeps.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.FileDTO;
import com.yeps.model.MemberDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.model.ReviewDTO;
import com.yeps.service.FileMapper;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.ReviewMapper;
import com.yeps.service.S3Connection;
import com.yeps.service.YepsPager;

@Controller
public class RestaurantController {
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Autowired
	private RestaurantMapper restaurantMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private ReviewMapper reviewMapper;

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
		String genId = UUID.randomUUID().toString();
		String saveFileName = genId + "." + getExtension(origin_fileName);
		int fileSize = (int) mf.getSize();
		File file = new File(uploadPath, saveFileName);
		try {
			mf.transferTo(file);
			dto.setRest_filename(saveFileName);
		} catch (Exception e) {
			e.printStackTrace();
			dto.setRest_filename("");
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

	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}

	@RequestMapping(value = "/restaurant_list")
	public ModelAndView listRest(@RequestParam(defaultValue = "1") int curPage) {
		int count = restaurantMapper.getCount();
		int pageScale = 10;
		int blockScale = 10;
		// 페이지 나누기 관련 처리
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();

		List<RestaurantDTO> list = restaurantMapper.listRest(start, end, "mode");

		List<Integer> reviewCount = new ArrayList<Integer>();
		List<Integer> StarAvg = new ArrayList<Integer>();

		List<ReviewDTO> LastReview = new ArrayList<ReviewDTO>();
		for (int i = 0; i < list.size(); i++) {
			LastReview.add(reviewMapper.getLastReview(list.get(i).getRnum()));
			reviewCount.add(reviewMapper.getRestaurantReviewCount(list.get(i).getRnum()));
			StarAvg.add(reviewMapper.getStarAvg(list.get(i).getRnum()));
		}

		// RestaurantDTO test = restaurantMapper.getNewRestaurant();
		// System.out.println(test.getRnum());

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);
		map.put("LastReview", LastReview);
		map.put("reviewCount", reviewCount);
		map.put("StarAvg", StarAvg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("restaurant/restaurant_list");
		return mav;
	}

	@RequestMapping(value = "/restaurant_ajax")
	@ResponseBody
	public HashMap<String, Object> listRestRefresh(@RequestParam(value = "mode") String mode,
			@RequestParam(defaultValue = "1") int curPage) {
		int count = restaurantMapper.getCount();
		int pageScale = 10;
		int blockScale = 10;
		// 페이지 나누기 관련 처리
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();

		List<RestaurantDTO> list = restaurantMapper.listRest(start, end, mode);

		List<Integer> reviewCount = new ArrayList<Integer>();
		List<Integer> StarAvg = new ArrayList<Integer>();

		List<ReviewDTO> LastReview = new ArrayList<ReviewDTO>();
		for (int i = 0; i < list.size(); i++) {
			LastReview.add(reviewMapper.getLastReview(list.get(i).getRnum()));
			reviewCount.add(reviewMapper.getRestaurantReviewCount(list.get(i).getRnum()));
			StarAvg.add(reviewMapper.getStarAvg(list.get(i).getRnum()));
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);
		map.put("LastReview", LastReview);
		map.put("reviewCount", reviewCount);
		map.put("StarAvg", StarAvg);
		return map;
	}

	@RequestMapping(value = "/restaurant_content")
	public ModelAndView contentRest(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage) {
		String rnum = req.getParameter("rnum");
		
		
		
		if(rnum == null || rnum.trim().equals("")) {
			return new ModelAndView("redirect: restaurant_list");
		}

		int count = reviewMapper.getRestaurantReviewCount(Integer.parseInt(rnum));
		int pageScale = 10;
		int blockScale = 10;
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);
		
		HttpSession session = req.getSession();
		MemberDTO loginMember = (MemberDTO) session.getAttribute("memberinfo");
		ModelAndView mav = new ModelAndView();
		
		RestaurantDTO getRest = restaurantMapper.getRest(Integer.parseInt(rnum));// 가게 1개 정보
		List<FileDTO> uploadFileList = fileMapper.getAllRestaurantFiles(Integer.parseInt(rnum));// 가게 업로드 파일
		

		ReviewDTO existMyReview = null;
		if(loginMember != null) {
			existMyReview = reviewMapper.findMyReview(Integer.parseInt(rnum), loginMember.getMnum());
		}
		
		if(existMyReview != null) {
			mav.addObject("myReview", existMyReview);
		}
		
		List<ReviewDTO> reviewList = reviewMapper.getSelectedRestaurant_Rv(Integer.parseInt(rnum), start, end);// 가게 리뷰
		List<ReviewDTO> highlightReview = reviewMapper.getRandomRestaurant_Rv(Integer.parseInt(rnum));
		int starAvg = reviewMapper.getStarAvg(Integer.parseInt(rnum));

		
		mav.addObject("map", map);
		mav.addObject("getRest", getRest);
		mav.addObject("uploadFileList", uploadFileList);
		mav.addObject("getImageCount", uploadFileList.size());
		mav.addObject("reviewCount", count);
		mav.addObject("highlightReview", highlightReview);
		mav.addObject("starAvg", starAvg);
		mav.addObject("selectedDataRV", reviewList);
		mav.setViewName("restaurant/restaurant_content");
		return mav;
	}

	@RequestMapping(value = "/restaurant_content_ajax")
	@ResponseBody
	public HashMap<String, Object> listContentRefresh(HttpServletRequest req) {
		String rnum = req.getParameter("rnum");
		String SearchKeyword = req.getParameter("SearchKeyword");
		int curPage = req.getParameter("curPage") != null ? Integer.parseInt(req.getParameter("curPage")) : 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(rnum == null || rnum.trim().equals("")) {
			map.put("error", "다시 시도해주세요.");
			return map;
		}
		
		int pageScale = 10;
		int blockScale = 10;
		int count = 0;
		int start = 0;
		int end = 0;
		List<ReviewDTO> targetRestaurant_reviews = null;
		
		YepsPager YepsPager = null;
		if (SearchKeyword == null || SearchKeyword.trim().equals("")) {
			count = reviewMapper.getRestaurantReviewCount(Integer.parseInt(rnum));
			YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
			start = YepsPager.getPageBegin();
			end = YepsPager.getPageEnd();
			targetRestaurant_reviews = reviewMapper.getSelectedRestaurant_Rv(Integer.parseInt(rnum), start, end);
		} else {
			count = reviewMapper.review_keywordCount(SearchKeyword);
			YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
			start = YepsPager.getPageBegin();
			end = YepsPager.getPageEnd();
			targetRestaurant_reviews = reviewMapper.review_keyword(SearchKeyword, Integer.parseInt(rnum), start, end);
			map.put("SearchKeyword", SearchKeyword);
		}

		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);
		map.put("rnum", rnum);
		map.put("selectedDataRV", targetRestaurant_reviews); // 한 페이지에서 변수명에 따라 다른값보여주기위해서
		return map;
	}

	@RequestMapping(value = "/restaurant_update_photo")
	public ModelAndView updateRestaurantPhoto(HttpServletRequest req) {
		String rnum = req.getParameter("rnum");

		if (rnum == null || rnum.trim().equals("")) {
			return new ModelAndView("redirect: restaurant_list");
		}

		RestaurantDTO restaurantDTO = restaurantMapper.getRest(Integer.parseInt(rnum));
		HttpSession session = req.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		ModelAndView mav = new ModelAndView();

		if (memberDTO.getIsmanager().equals("y") || memberDTO.getIsmaster().equals("y")
				|| restaurantDTO.getMnum() == memberDTO.getMnum()) {
			List<FileDTO> allUploadFileList = fileMapper.getAllRestaurantFiles(restaurantDTO.getRnum());
			mav.addObject("uploadFileList", allUploadFileList);
		} else {
			List<FileDTO> myUploadFileList = fileMapper.getRest_fileListForMe(restaurantDTO.getRnum(),
					memberDTO.getMnum());
			mav.addObject("uploadFileList", myUploadFileList);
		}

		mav.addObject("restaurantDTO", restaurantDTO);
		mav.setViewName("restaurant/restaurant_update_photo");
		return mav;
	}

	@RequestMapping(value = "/restaurant_fileUpLoad")
	@ResponseBody
	public HashMap<String, Object> fileUpLoad_event(HttpServletRequest req) {
		String rnum = req.getParameter("rnum");
		if (rnum == null || rnum.trim().equals("")) {
			// 404페이지 띄워야함.. jsp페이지에서 처리해주자
			return null;
		}

		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		HttpSession session = req.getSession();
		return uploadFileLoop(mr, session, Integer.parseInt(rnum));
	}

	public HashMap<String, Object> uploadFileLoop(MultipartHttpServletRequest mr, HttpSession session, int rnum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Iterator<String> it = mr.getFileNames();
		String origin_fileName = null;
		int fileSize = 0;
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		
		int imageCount = 0;
		while (it.hasNext()) {
			imageCount++;
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
					fileDTO.setRnum(rnum);
					fileDTO.setMnum(memberDTO.getMnum());
					fileDTO.setFilename(saveFileName);
					fileDTO.setOrigin_filename(origin_fileName);
					fileDTO.setFilesize(fileSize);
					boolean isExistMainPhoto = fileMapper.isExistRestaurantMainPhoto(rnum);
					int result = 0;
					if (!isExistMainPhoto) {
						result = fileMapper.insertFile(fileDTO, "main");
					} else {
						result = fileMapper.insertFile(fileDTO, "not");
					}

					if (result > 0) {
						FileDTO insert_after_getFileDTO = fileMapper.getFile(saveFileName, 0);
						fileList.add(insert_after_getFileDTO);
					} else {
						fileMapper.deleteFileToFilename(saveFileName);
						S3Connection.getInstance().deleteObject("yepsbucket", "images/" + saveFileName);
						map.put("failed", "파일 등록에 실패했습니다. 잠시후 다시 시도해주세요.");
						imageCount--;
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
		memberDTO.setImagecount(memberDTO.getImagecount()+imageCount);
		session.setAttribute("memberinfo", memberDTO);
		map.put("fileList", fileList);
		map.put("update", "사진을 등록하였습니다.");
		return map;
	}
	
	@RequestMapping(value="/restaurant_delete_ajax")
	@ResponseBody
	public HashMap<String, Object> deleteRestaurantPhoto(HttpServletRequest req) {
		String rnum = req.getParameter("rnum");
		String filename = req.getParameter("filename");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		
		if(rnum == null || rnum.trim().equals("") || filename == null || filename.trim().equals("")) {
			map.put("url", "restaurant_list");
			return map;
		}
		
		if (session == null) {
			map.put("url", "member_login");
			return map;
		}
		
		S3Connection.getInstance().deleteObject("yepsbucket", "images/" + filename);
		fileMapper.deleteRestaurantFile(filename, Integer.parseInt(rnum));
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberinfo");
		memberDTO.setImagecount(memberDTO.getImagecount()-1);
		session.setAttribute("memberinfo", memberDTO);
		map.put("success", "success");
		return map;
	}
	


	@RequestMapping(value = "/restaurant_photoList")
	public ModelAndView photoListRest(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage) {
		int rnum = Integer.parseInt(req.getParameter("rnum"));

		if (rnum == 0) {
			return new ModelAndView("redirect: restaurant_list");
		}

		int count = fileMapper.getAllFileCount(rnum);
		int pageScale = 10;
		int blockScale = 30;
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();
		RestaurantDTO dto = restaurantMapper.getRest(rnum);
		List<FileDTO> uploadFileList = fileMapper.getPagedFileList(rnum, start, end);
		int reviewCount = reviewMapper.getRestaurantReviewCount(rnum);
		int starAvg = reviewMapper.getStarAvg(rnum);

		ModelAndView mav = new ModelAndView();

		mav.addObject("getRest", dto);
		mav.addObject("starAvg", starAvg);
		mav.addObject("curPage", curPage);
		mav.addObject("yepsPager", YepsPager);
		mav.addObject("uploadFileList", uploadFileList);
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("photoCount", count);
		mav.setViewName("restaurant/restaurant_photoList");
		return mav;

	}


}
