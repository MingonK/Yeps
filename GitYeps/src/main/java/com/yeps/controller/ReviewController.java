package com.yeps.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MemberDTO;
import com.yeps.model.MemberPhotoDTO;
import com.yeps.model.RestaurantDTO;
import com.yeps.model.ReviewDTO;
import com.yeps.service.MemberMapper;
import com.yeps.service.RestaurantMapper;
import com.yeps.service.ReviewMapper;
import com.yeps.service.YepsPager;

@Controller
public class ReviewController {

	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private RestaurantMapper restaurantMapper;

	@RequestMapping(value = "/review_list")
	public ModelAndView review_list() {
		List<ReviewDTO> list = reviewMapper.listReview();

		ModelAndView mav = new ModelAndView();
		mav.addObject("set", "review");
		mav.addObject("reviewList", list);
		mav.setViewName("review/list");
		return mav;
	}

	@RequestMapping(value = "/review_delete")
	public ModelAndView review_delete(HttpServletRequest req) {
		String rvnum = req.getParameter("rvnum");
		int res = reviewMapper.deleteReview(rvnum);
		ModelAndView mav = new ModelAndView();
		String msg;
		String url;

		if (res > 0) {
			msg = "리뷰 삭제성공!!";
			url = "review_list";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
		} else {
			msg = "리뷰 삭제실패!!";
			url = "review_list";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
		}
		return mav;
	}

	@RequestMapping(value = "/review_update", method = RequestMethod.GET)
	public String review_updatePro(HttpServletRequest req, @RequestParam String rvnum) {
		ReviewDTO dto = reviewMapper.getReview(Integer.parseInt(rvnum));
		req.setAttribute("getReview", dto);
		return "review/update";
	}

	@RequestMapping(value = "/review_update", method = RequestMethod.POST)
	public ModelAndView updateForm(HttpServletRequest req, @ModelAttribute ReviewDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setRvnum(0);
		}
		reviewMapper.updateReview(dto);

		return new ModelAndView("redirect:review_list");
	}

	@RequestMapping(value = "/guidelines")
	public String review_guideview() {
		return "review/guidelines";
	}


	@RequestMapping(value = "/restaurant_qna")
	public String restaurant_qna() {
		return "/qna/restaurant_qna";
	}

	@RequestMapping(value="/review_keyword")
	public ModelAndView review_keyword(HttpServletRequest req, @RequestParam(defaultValue = "1") int curPage) {
		String SearchKeyword = req.getParameter("SearchKeyword");
		String rnum = req.getParameter("rnum");

		int count = reviewMapper.review_keywordCount(SearchKeyword);
		int pageScale = 10;
		int blockScale = 10;
		YepsPager YepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count); // 레코드의 갯수
		map.put("YepsPager", YepsPager);

		List<ReviewDTO> SearchedDTO_Rv= reviewMapper.review_keyword(SearchKeyword, Integer.parseInt(rnum), start, end);
		RestaurantDTO getRest = restaurantMapper.getRest(Integer.parseInt(rnum));

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.addObject("rnum", rnum);
		mav.addObject("getRest", getRest);
		mav.addObject("selectedDataRV", SearchedDTO_Rv); //한 페이지에서 변수명에 따라 다른값보여주기위해서
		mav.setViewName("restaurant/restaurant_content");
		return mav;

	}
	// @RequestMapping(value="/review_EstimateCount_update")
	// public String review_EstimateCount_update(HttpServletRequest req) {
	// String rvnum = req.getParameter("rvnum");
	// int res = reviewMapper.review_EstimateCount_update(Integer.parseInt(rvnum));
	// return "review/";
	// }

	@RequestMapping(value = "/review_write")
	public ModelAndView review_write(HttpServletRequest req) {
		String rnum = req.getParameter("rnum");
		String rname = restaurantMapper.review_write_getrname(Integer.parseInt(rnum));
		String star = req.getParameter("star");

		// ★EDIT부분★ 위에 받아온 파라미터값 rnum을 통해서 방금 작성한 리뷰의 정보들을 가져와서 write페이지에 뿌려주면됨.

		ModelAndView mav = new ModelAndView();
		mav.addObject("rnum", rnum);
		mav.addObject("rname", rname);
		mav.addObject("star", star);
		mav.setViewName("review/write");
		return mav;
	}

	@RequestMapping(value = "/review_restaurantIMG")
	public ModelAndView review_restaurantIMG() {
		// rnum을 가지고 가서 식당 목록을 뿌려주기 //최근 식당으로 등록된것 가져오기 쿼리문 작성해서 갖고오기
		// ★최근 식당목록으로 뽑아온것이 아니라, 일단은 식당등록이 먼저된것에서부터 19개의 식당목록을 가져왔음! ->20개로 바꿀예정임

		List<RestaurantDTO> rlist = restaurantMapper.review_restaurantIMG();
		System.out.println("rlist 출력1" + rlist);
		ModelAndView mav = new ModelAndView();
		mav.addObject("set", "review");
		mav.addObject("rlist", rlist);
		mav.setViewName("review/restaurantIMG");
		return mav;
	}

	@RequestMapping(value = "/review_insert")
	public ModelAndView review_insert(HttpServletRequest req, HttpSession session) {
		// ★dto에 값 입력 내가 하는부분은 나중에 수정해야 할 부분임

		// ★ if (res > 0)일때 /식당명/이름/위치(Korea, Seoul)/friend/리뷰수/별점/작성일/내용 가지고 가기!

		// 로그인했을때의 그 이름을 통해서 나머지 값들을 꺼내서 보여줘야함
		ReviewDTO rvdto = new ReviewDTO();

		MemberDTO mdto = (MemberDTO) session.getAttribute("memberinfo");
		MemberPhotoDTO mpdto = (MemberPhotoDTO) session.getAttribute("mainPhoto");
		int mnum = mdto.getMnum();
		// reviewcount 구하기 추가 부분
		int beforeReviewcount = memberMapper.getMemberReviewCount(mnum);
		int nowReviewcount = beforeReviewcount + 1;
		memberMapper.updateReviewCount(mnum, nowReviewcount);
		// ===============================
		
		String nickname = mdto.getNickname();
		String email = mdto.getEmail();
		String filename = mpdto.getFilename();
		String rnum = req.getParameter("rnum");
		String rname = req.getParameter("rname");
		String gradepoint = req.getParameter("gradepoint");
		String content = req.getParameter("content");

		String Get_InsertReviewDate = reviewMapper.Get_InsertReviewDate();

		rvdto.setRnum(Integer.parseInt(rnum));
		rvdto.setMnum(mnum);
		rvdto.setContent(content);
		rvdto.setGradepoint(Integer.parseInt(gradepoint));
		rvdto.setFilenum(3);
		rvdto.setIp(req.getRemoteAddr());
		rvdto.setRecentreview("n");

		int res = reviewMapper.insertReview(rvdto);
		ModelAndView mav = new ModelAndView();
		String msg;
		String url;

		// 리뷰 작성했을때 위에 프로필과함께 작성한리뷰 restaurantIMG페이지에 띄워주기
		List<RestaurantDTO> rlist = restaurantMapper.review_restaurantIMG();
		System.out.println("rlist 출력2" + rlist);

		if (res > 0) {
			mav.addObject("rnum", rnum);
			// reviewcount 담아주기 ============================
			mdto.setReviewcount(nowReviewcount);
			mav.addObject("reviewcount", nowReviewcount);
			// ===========================================
			mav.addObject("nickname", nickname);
			mav.addObject("email", email);
			mav.addObject("filename", filename);
			mav.addObject("rname", rname);
			mav.addObject("gradepoint", gradepoint);
			mav.addObject("content", content);
			mav.addObject("joindate", Get_InsertReviewDate);

			mav.addObject("mode", "write");
			mav.addObject("rlist", rlist);
			mav.setViewName("review/restaurantIMG");
			return mav;
		} else {
			msg = "리뷰 등록 실패!!";
			url = "review_write";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
			return mav;
		}

	}



	///////////////////1월3일 상우가 추가한 부분 
	
	
	@RequestMapping(value="/previous_reviews")
	public ModelAndView previous_reviews(@RequestParam(defaultValue = "1") int curPage) {

		//페이징처리하기위해서 갯수 가져오는곳 
		int count = reviewMapper.getPreviousReviewCount();

		int pageScale = 10;
		int blockScale = 10;
		YepsPager yepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = yepsPager.getPageBegin();
		int end = yepsPager.getPageEnd();
		
		int num = count - pageScale * (curPage - 1) + 1;
		//recentreview가 y인 reviewDTO를 꺼내왔음 
		List<ReviewDTO> rvdto_y = reviewMapper.previous_Rv(start, end);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count);
		map.put("start", start);
		map.put("end", end);
		map.put("yepsPager", yepsPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("map", map);
		mav.addObject("rvdto_y", rvdto_y);
		mav.setViewName("review/previous_reviews");
		return mav;
	}
	


}
