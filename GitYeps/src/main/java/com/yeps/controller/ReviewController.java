package com.yeps.controller;
import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
		mav.addObject("list", list);
		mav.setViewName("review/list");
		return mav;
	}

	@RequestMapping(value = "/review_delete")
	public ModelAndView review_delete(HttpServletRequest req, HttpSession session) {
		String rvnum = req.getParameter("rvnum");
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		System.out.println(rvnum);
		int res = reviewMapper.deleteReview(Integer.parseInt(rvnum));
		ModelAndView mav = new ModelAndView();
		String msg;
		String url;

		if (res > 0) {
			int beforeReviewcount = memberMapper.getMemberReviewCount(mnum);
			int nowReviewcount = beforeReviewcount - 1;
			memberMapper.updateReviewCount(mnum, nowReviewcount);
			MemberDTO mdto = (MemberDTO) session.getAttribute("memberinfo");
			mdto.setReviewcount(nowReviewcount);
			System.out.println(nowReviewcount);
			msg = "리뷰 삭제성공!!";
			url = "member_details";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("message");
		} else {
			msg = "리뷰 삭제실패!!";
			url = "member_detalis";
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
		map.put("count", count); 
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
		if(rnum == null || rnum.trim().equals("")) {
			return new ModelAndView("redirect: restaurant_list");
        }
		
		String rname = restaurantMapper.review_write_getrname(Integer.parseInt(rnum));
		String star = req.getParameter("star");
		String mode = req.getParameter("mode");
		String where = req.getParameter("where");

		// ★EDIT부분★ 위에 받아온 파라미터값 rnum을 통해서 방금 작성한 리뷰의 정보들을 가져와서 write페이지에 뿌려주면됨.
		String updatemode = req.getParameter("updatemode");
		String contentUpdate = req.getParameter("contentUpdate");
		
		ModelAndView mav = new ModelAndView();
		if(updatemode != null) {
			mav.addObject("contentUpdate", contentUpdate);
		}

		mav.addObject("mode", mode);
		mav.addObject("rnum", rnum);
		mav.addObject("where", where);
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
		// ★ if (res > 0)일때 /식당명/이름/위치(Korea, Seoul)/friend/리뷰수/별점/작성일/내용 가지고 가기!
		// 로그인했을때의 그 이름을 통해서 나머지 값들을 꺼내서 보여줘야함
		ReviewDTO rvdto = new ReviewDTO();

		MemberDTO mdto = (MemberDTO) session.getAttribute("memberinfo");	
		MemberPhotoDTO mpdto = (MemberPhotoDTO) session.getAttribute("mainPhoto");
		int mnum = mdto.getMnum(); 
		
		String contentUpdate = req.getParameter("contentUpdate");
		int gradepoint = Integer.parseInt(req.getParameter("gradepoint"));
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		if(contentUpdate != null) {
			//업데이트 쿼리문 작성 해주면 됨.★★★
			int res = reviewMapper.review_write_update(contentUpdate, gradepoint, rnum);
			System.out.println("리뷰수정 결과값 출력:" + res);
		}

		// ===============================
		String mode = req.getParameter("mode");
		String where = req.getParameter("where");
		String nickname = mdto.getNickname();
		String email = mdto.getEmail();
		String filename = mpdto.getFilename();
		String rname = req.getParameter("rname");
		String content = req.getParameter("content");
		String Get_InsertReviewDate = reviewMapper.Get_InsertReviewDate();

		// reviewcount 구하기 추가 부분
		int beforeReviewcount = memberMapper.getMemberReviewCount(mnum);
		int nowReviewcount = beforeReviewcount + 1;
		if(mode.equals("write")) {
			memberMapper.updateReviewCount(mnum, nowReviewcount);
		}

		rvdto.setRnum(rnum);
		rvdto.setMnum(mnum);
		rvdto.setContent(content);
		rvdto.setGradepoint(gradepoint);
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
		System.out.println("mode=" + mode);
		System.out.println("where=" + where);
		if (res > 0) {
			mav.addObject("rnum", rnum);
			// reviewcount 담아주기 ============================
			if(mode.equals("write")) {

				mdto.setReviewcount(nowReviewcount);
			}else if(mode.equals("update") || mode == null){

				mdto.setReviewcount(beforeReviewcount);
			}
			// ===========================================
			mav.addObject("mode", "write");
			mav.addObject("nickname", nickname);
			mav.addObject("email", email);
			mav.addObject("filename", filename);
			mav.addObject("rname", rname);
			mav.addObject("gradepoint", gradepoint);
			mav.addObject("content", content);
			mav.addObject("reg_date", Get_InsertReviewDate);
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


	@RequestMapping(value="/review_member_ajax")
	@ResponseBody
	public HashMap<String, Object> review_member(HttpServletRequest req, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
		String smnum = req.getParameter("mnum");

		int mnum = 0;
		if(smnum==null) {
			MemberDTO mdto = (MemberDTO) session.getAttribute("memberinfo");
			
			if(mdto == null) {
				map.put("msg", "로그인 먼저 해주세요.");
				return map;
			}
			mnum = mdto.getMnum();
			
		}else {
			mnum = Integer.parseInt(smnum);
		}
		int curPage = req.getParameter("curPage") != null ? Integer.parseInt(req.getParameter("curPage")) : 1;
		int reviewcount = memberMapper.getMemberReviewCount(mnum);
		int pageScale = 10;
		int blockScale = 5;
		YepsPager YepsPager = new YepsPager(reviewcount, curPage, pageScale, blockScale);
		int start = YepsPager.getPageBegin();
		int end = YepsPager.getPageEnd();
		int num = reviewcount - pageScale * (curPage - 1) + 1;
		
	   /* int photocount = memberMapper.*/
		List<ReviewDTO> memberReview = reviewMapper.getMemberReview(mnum,start,end);
		map.put("mnum",mnum);
		map.put("num", num);
		map.put("count", reviewcount); 
		map.put("YepsPager", YepsPager);
		map.put("memberReview", memberReview);
		return map;
	}


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
	
	
	///////////////////1월 4일 상우 
	@RequestMapping(value="/review_restaurantFind")
	public ModelAndView review_restaurantFind(HttpServletRequest req, 
			@RequestParam(defaultValue = "1") int curPage) {

		//★일단 Find값으로만 검색했을때의 값을 불러오게 만들어놨음 
		//Near도 같이 검색되게끔해야하는데 디폴트값을 Korea, Seoul로 해놨기때문에 굳이 near은 검색안해될것같긴함.
		String SearchFind = req.getParameter("SearchFind");
		//String SearchNear = req.getParameter("SearchNear");
		
		int count = 0;
		if(SearchFind == null || SearchFind.trim().equals("")) {
				count = 0;
	      }else {
	         count = restaurantMapper.get_review_restaurantFind_Count(SearchFind);
	         System.out.println("count 출력후 :" + count);
	     }
		
		int pageScale = 10;
		int blockScale = 10;
		YepsPager yepsPager = new YepsPager(count, curPage, pageScale, blockScale);
		int start = yepsPager.getPageBegin();
	    int end = yepsPager.getPageEnd();
	    
	    int num = count - pageScale * (curPage - 1) + 1;
		List<RestaurantDTO> Find_Restaurant_Review_Get_rdto = restaurantMapper.review_restaurantFind(start, end, SearchFind);
		
		//System.out.println("rest_filename출력:" +Find_Restaurant_Review_Get_rdto.get(0).getRest_filename());
		
		//getRnumList reviewCount StarAvg 

		List<Integer> reviewCount = new ArrayList<Integer>();
		List<Integer> StarAvg = new ArrayList<Integer>();
		for(int i=0; i<Find_Restaurant_Review_Get_rdto.size(); i++) {
			reviewCount.add(reviewMapper.getRestaurantReviewCount(Find_Restaurant_Review_Get_rdto.get(i).getRnum()));
			StarAvg.add(reviewMapper.getStarAvg(Find_Restaurant_Review_Get_rdto.get(i).getRnum()));
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Find_Restaurant_Review_Get_rdto", Find_Restaurant_Review_Get_rdto);
		map.put("count", count);
		map.put("start", start);
		map.put("end", end);
		map.put("yepsPager", yepsPager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);			
		mav.addObject("map", map);			
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("StarAvg", StarAvg);
		mav.addObject("SearchFind", SearchFind);
		mav.setViewName("/review/restaurantFind");
		return mav;
	}


}
