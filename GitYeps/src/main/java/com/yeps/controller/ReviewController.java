package com.yeps.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MemberDTO;
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
		
		

		//★★ 임시용 1★★
		@RequestMapping(value="/gradepoint")
		public String gradepoint() {
			return "gradepoint";
		}
		
		//★★ 임시용 2★★
		@RequestMapping(value="/view")
		public ModelAndView view (HttpServletRequest req) {
			//String rating = req.getParameter("rating");
			String rnum = req.getParameter("rnum");
			String star = req.getParameter("star");
			//System.out.println("star값 넘어온거:" + rating);
			ModelAndView mav = new ModelAndView();
			//mav.addObject("rating", rating);
			mav.addObject("rnum", rnum);
			mav.addObject("star", star);
			mav.setViewName("view");
			return mav;
		}
		
		//★★ 임시용 1★★
		@RequestMapping(value="/top_review_write")
		public String top_review_write() {
			return "top_review_write";
		}
		
		
		//★★ 페이징처리 ★★
//		@RequestMapping(value="/show")
//		public ModelAndView pagingReviewList(HttpServletRequest req){
//			
//			int count = reviewMapper.getReviewCount();	//리뷰의 총 갯수 
//			int curPage = req.getParameter("curPage")!=null?Integer.parseInt(req.getParameter("curPage")): 1 ;
//			YepsPager yPager = new YepsPager(count, curPage);
//			int start = yPager.getPageBegin();
//			int end = yPager.getPageEnd();
//			int pageSize = yPager.PAGE_SCALE;
//			int num = count - pageSize * (curPage - 1) + 1;
//			List<ReviewDTO> list = reviewMapper.PageReviewList(start, end);	//리뷰총수중에 한페이지의 처음과 끝 목록 가져오기
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("list", list);  //list
//			map.put("count", count);
//			map.put("yepsPager", yPager);
//			ModelAndView mav = new ModelAndView();
//		    mav.addObject("count", count);
//		    mav.addObject("num", num);
//		    mav.addObject("map", map); 
//		    //mav.addObject("mode", "receive");
//		    mav.setViewName("/show");
//		    return mav;
//			
//		}
		

		@RequestMapping(value="/start")
		public String start() {
			return "start";
		}
	
		
		@RequestMapping(value = "/review_index")
		public ModelAndView index() {
		
			//최고평점을 index page로 보내주기 
			int NBPmnum = reviewMapper.new_BestGradePoint();
			
			//최근활동 리뷰/사진을 index page로 보내주기
			//★미구현:설정된 위치지역일때의 정보들을 꺼내서 index에  뿌려주기
			//★미구현:file 부분 미구현 
			List<ReviewDTO> recentReviewInfo = reviewMapper.recentReviewInfo();	//rvnum, gradepoint, content값 가져오는dto
			
//			System.out.println("recentReviewInfo의 SIze: " + recentReviewInfo.size());
			HashMap<Integer, List<ReviewDTO>> map = new HashMap<Integer, List<ReviewDTO>>(); 
			for(int i=0; i<recentReviewInfo.size(); i++) {
				map.put(i, reviewMapper.numList(recentReviewInfo.get(i).getRvnum()));
//				for(int j = 0; j < map.get(i).size(); j++) 
//					System.out.println("맵 안에 저장된 LIST의 데이터: " + map.get(i).get(j).getMnum() + " : " + map.get(i).get(j).getRnum());
			}
			
			List<MemberDTO> get_mname = new ArrayList<MemberDTO>();
			for(int i=0; i < map.size(); i++) {
				for(int j = 0; j < map.get(i).size(); j++) {
					get_mname.add(memberMapper.memberName(map.get(i).get(j).getMnum()));
				}
			}
			
			List<RestaurantDTO> get_rname = new ArrayList<RestaurantDTO>();
			for(int i=0; i < map.size(); i++) {
				for(int j = 0; j < map.get(i).size(); j++) {
					get_rname.add(restaurantMapper.restaurantRName(map.get(i).get(j).getRnum()));
				}
			}
			
		
			ModelAndView mav = new ModelAndView();
			mav.addObject("NBPmnum", NBPmnum);
			mav.addObject("recentReviewInfo", recentReviewInfo);
			mav.addObject("get_mnameList", get_mname);
			mav.addObject("get_rnameList", get_rname);
			
			mav.setViewName("/review/index");
			return mav;
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(value="/review_list")
		public ModelAndView review_list() {
			List<ReviewDTO> list = reviewMapper.listReview(); 
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("reviewList", list);
			mav.setViewName("review/list");
			return mav;
	}
		
		
		@RequestMapping(value="/review_write")
		public ModelAndView review_write(HttpServletRequest req) {
			String rnum = req.getParameter("rnum");
			String rname = restaurantMapper.review_write_getrname(Integer.parseInt(rnum));
			System.out.println("review_write에서의 rname출력:" + rname);
			String star = req.getParameter("star");
			
			//★EDIT부분★ 위에 받아온 파라미터값 rnum을 통해서 방금 작성한 리뷰의 정보들을 가져와서 write페이지에 뿌려주면됨. 
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("rnum", rnum);
			mav.addObject("rname", rname);
			mav.addObject("star", star);
			mav.setViewName("review/write");
			return mav;
		}
		
		@RequestMapping(value="/review_insert")
		public ModelAndView review_insert(HttpServletRequest req){
			//★dto에 값 입력 내가 하는부분은 나중에 수정해야 할 부분임
			
			//★ if (res > 0)일때 /식당명/이름/위치(Korea, Seoul)/friend/리뷰수/별점/작성일/내용 가지고 가기!
			
			//로그인했을때의 그 이름을 통해서 나머지 값들을 꺼내서 보여줘야함  
			ReviewDTO rvdto = new ReviewDTO();
			
			HttpSession session = req.getSession();
			MemberDTO mdto = (MemberDTO)session.getAttribute("memberinfo");
			int mnum = mdto.getMnum();
			int reviewcount = mdto.getReviewcount();
			String name = mdto.getName();
			
			String rnum = req.getParameter("rnum");
			String rname = req.getParameter("rname");
			String gradepoint = req.getParameter("gradepoint");
			String content = req.getParameter("content");
			
			String Get_InsertReviewDate = reviewMapper.Get_InsertReviewDate();
			
			rvdto.setRnum(0);
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
			
			
			//리뷰 작성했을때 위에 프로필과함께 작성한리뷰 restaurantIMG페이지에 띄워주기 
			List<RestaurantDTO> rlist = restaurantMapper.restaurant_restaurantIMG();
			System.out.println("rlist 출력2" + rlist);
			
			if(res > 0) {
				mav.addObject("rnum", rnum);
				mav.addObject("reviewcount", reviewcount);
				mav.addObject("name", name);
				mav.addObject("rname", rname);
				mav.addObject("gradepoint", gradepoint);
				mav.addObject("content", content);
				mav.addObject("joindate", Get_InsertReviewDate); 
				
				
				mav.addObject("mode","write");
				mav.addObject("rlist", rlist);
				mav.setViewName("restaurant/restaurantIMG");
				return mav;
			}else {
				msg = "리뷰 등록 실패!!";
				url = "review_write";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("message");
				return mav;
			}
			
		}
		
		@RequestMapping(value="/review_delete")
		public ModelAndView review_delete(HttpServletRequest req) {
			String rvnum = req.getParameter("rvnum");
			int res = reviewMapper.deleteReview(rvnum);
			ModelAndView mav = new ModelAndView();
			String msg;
			String url;

			if(res > 0) {
				msg = "리뷰 삭제성공!!";
				url = "review_list";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("message");
			}else{
				msg = "리뷰 삭제실패!!";
				url = "review_list";
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				mav.setViewName("message");
			}
			return mav;
		}
		

		@RequestMapping(value="/review_update", method=RequestMethod.GET)
		public String review_updatePro(HttpServletRequest req, @RequestParam String rvnum) {
			ReviewDTO dto = reviewMapper.getReview(Integer.parseInt(rvnum));
			req.setAttribute("getReview", dto);
			return "review/update";
		}
		
		@RequestMapping(value="/review_update", method=RequestMethod.POST)
		public ModelAndView updateForm(HttpServletRequest req, @ModelAttribute ReviewDTO dto, BindingResult result) {
			if(result.hasErrors()) {
				dto.setRvnum(0);
			}
			int res= reviewMapper.updateReview(dto);
			
			return new ModelAndView("redirect:review_list");
		}
		
		@RequestMapping(value="/review_mylist")
		public ModelAndView review_mylist(HttpServletRequest req) {
			String NBPmnum = req.getParameter("NBPmnum");
			//NBPmnum = NewBestGradepoint
			
			MemberDTO mylist_member = memberMapper.mylist_info1(Integer.parseInt(NBPmnum));
			ReviewDTO mylist_review = reviewMapper.review_mylist_info2(Integer.parseInt(NBPmnum));
			//★ 미구현 : FileDTO mylist_file = reviewMapper.review_info3(Integer.parseInt());
			
			//여기에 올라오는 글들은 recentreview칼럼의 데이터값이 y로 변경되게 쿼리문 작성해주기 
			int res = reviewMapper.review_mylist_updatedata(Integer.parseInt(NBPmnum));
			
			//여기에 올라오는 식당명을 출력해주기
			int GETrnum = reviewMapper.GetRestaurantName_Rv(Integer.parseInt(NBPmnum));
			//String RestaurantName = restaurantMapper.GetRestaurantName_R(GETrnum);
			List<RestaurantDTO> getRnameAndRnum = new ArrayList<RestaurantDTO>();
			getRnameAndRnum = restaurantMapper.GetRestaurantName_R(GETrnum);
			
			//System.out.println("받아온 getRnameAndRnum값 출력:" + getRnameAndRnum);
			
			int i;
			for(i=0; i<getRnameAndRnum.size(); i++) {
				//System.out.println("getRnameAndRnum 출력:" + getRnameAndRnum.get(i));
			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("NBPmnum", NBPmnum);
			mav.addObject("getRnameAndRnum", getRnameAndRnum);
			mav.addObject("mylist_member", mylist_member);
			mav.addObject("mylist_review", mylist_review);
			//★ 미구현 : mav.addObject("mylist_file", mylist_file);
			mav.setViewName("review/mylist");
			return mav;
		}
		
		@RequestMapping(value="/guidelines")
		public String review_guideview(){
			return "review/guidelines";
		}
		
		@RequestMapping(value="/restaurant_restaurantIMG")
		public ModelAndView restaurant_restaurantIMG(){
			//rnum을 가지고 가서 식당 목록을 뿌려주기 //최근 식당으로 등록된것 가져오기 쿼리문 작성해서 갖고오기 
			//★최근 식당목록으로 뽑아온것이 아니라, 일단은 식당등록이 먼저된것에서부터 19개의 식당목록을 가져왔음! ->20개로 바꿀예정임 
			
			List<RestaurantDTO> rlist = restaurantMapper.restaurant_restaurantIMG();
			System.out.println("rlist 출력1" + rlist);
			ModelAndView mav = new ModelAndView();
			mav.addObject("rlist", rlist);
			mav.setViewName("restaurant/restaurantIMG");
			return mav;
		}
		
		@RequestMapping(value="/review_selectedres")
		public ModelAndView review_selectedres(HttpServletRequest req){
			
			//받아온 rnum을 가지고 가서 rnum과 같은 식당의 리뷰들을 뿌려주기  
			String rnum = req.getParameter("rnum");
			String rname = req.getParameter("rname");
			//★ 미구현 : List<FileDTO> fileList = fileMapper.getSelectedRestaurant_f(Integer.parseInt(rnum));
			//file은 위에서 받아온 rnum과 fileDTO안에 있는 rnum이 일치할때에 파일정보들을 가져와서 뿌려주게 해주면됨.(Mapper부분 구현만 하면됨.)
			
			List<ReviewDTO> reviewList = reviewMapper.getSelectedRestaurant_Rv(Integer.parseInt(rnum));
			List<Integer> rvmnumList = reviewMapper.getSelectedRestaurant_Rv_M(Integer.parseInt(rnum));
			
			List<MemberDTO> memberList = new ArrayList<MemberDTO>();
			for(int i=0; i<rvmnumList.size(); i++) {
				int mnum = rvmnumList.get(i);
				memberList.addAll(memberMapper.getSelectedRestaurant_M(mnum));
			}

			//선택된 식당에 리뷰를 작성한 member의 정보 가져오기 
			ModelAndView mav = new ModelAndView();
			mav.addObject("rnum", rnum);
			mav.addObject("rname", rname);
			mav.addObject("selectedDataM", memberList);
			mav.addObject("selectedDataRV", reviewList);
			mav.setViewName("review/selectedres");
			return mav;
		}
		
		@RequestMapping(value="/previous_reviews")
		public ModelAndView previous_reviews() {
			//rnum,mnum값을 뽑아서 각각의 Mapper를 통해 값을 받아와서 previous_review.jsp페이지에 출력
			
			List<ReviewDTO> numList = reviewMapper.previous_reviews_Num();
			for(int i=0; i<numList.size(); i++) {
//				System.out.println("numList Size 출력:" + numList.size());
//				System.out.println("getMnum 출력:"+numList.get(i).getMnum());
//				System.out.println("getRnum 출력:"+numList.get(i).getRnum());
			}
			//recentreview가 y인 reviewDTO를 꺼내왔음 
			List<ReviewDTO> rvdto_y = reviewMapper.previous_Rv();
			
			List<MemberDTO> mdto_y = new ArrayList<MemberDTO>();
			for(int i=0; i<numList.size(); i++) {
				int mnum = numList.get(i).getMnum();
				mdto_y.addAll(memberMapper.previous_M(mnum));	//rvnum 이 일치할때 restaurantDTO를 한줄씩 꺼내와서 저장함.
			}
			
			List<RestaurantDTO> rdto_y = new ArrayList<RestaurantDTO>();
			for(int i=0; i<numList.size(); i++) {
				int rnum = numList.get(i).getRnum();
				rdto_y.addAll(restaurantMapper.previous_R(rnum));
			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("rvdto_y", rvdto_y);
			mav.addObject("mdto_y", mdto_y);
			mav.addObject("rdto_y", rdto_y);
			System.out.println(rvdto_y.size());
			System.out.println(mdto_y.size());
			System.out.println(rdto_y.size());
			mav.setViewName("review/previous_reviews");
			return mav;
		}
		
		
		
		@RequestMapping(value="/restaurant_qna")
		public String restaurant_qna() {
			return "/qna/restaurant_qna";
		}
		
		@RequestMapping(value="/review_keyword")
		public ModelAndView review_keyword(HttpServletRequest req) {
			String SearchKeyword = req.getParameter("SearchKeyword");
			String rname = req.getParameter("rname");
			List<ReviewDTO> SearchedDTO_Rv= reviewMapper.review_keyword(SearchKeyword);
			
			List<MemberDTO> SearchedDTO_M = new ArrayList<MemberDTO>();
			for(int i=0; i<SearchedDTO_Rv.size(); i++) {
				int mnum = SearchedDTO_Rv.get(i).getMnum();
				SearchedDTO_M.addAll(memberMapper.SearchedDTO_M(mnum));
			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("rname", rname);
			mav.addObject("selectedDataRV", SearchedDTO_Rv); //한 페이지에서 변수명에 따라 다른값보여주기위해서 selectedDataRV적었음
			mav.addObject("selectedDataM", SearchedDTO_M); //한 페이지에서 변수명에 따라 다른값보여주기위해서 selectedDataRV적었음
			mav.setViewName("review/selectedres");
			return mav;
			
		}
		
		
//		@RequestMapping(value="/review_EstimateCount_update")
//		public String review_EstimateCount_update(HttpServletRequest req) {
//			String rvnum = req.getParameter("rvnum");
//			int res = reviewMapper.review_EstimateCount_update(Integer.parseInt(rvnum));
//			return "review/";
//		}
		
		
}
