package com.yeps.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.ContsDTO;
import com.yeps.model.MemberDTO;
import com.yeps.service.ContsMapper;
import com.yeps.service.ContsSingleton;
import com.yeps.service.Jaso;
import com.yeps.service.RandomNum;

@Controller
public class SearchController {

	@Autowired
	private ContsMapper contsMapper;

	@Autowired
	private Jaso jaso;

	@Autowired
	private RandomNum randomNum;

	@RequestMapping(value = "/search_auto_complete", method = RequestMethod.POST)
	@ResponseBody
	public List<String> searchAutoComplete(@RequestParam(value = "searchData") String searchData) {

		ContsSingleton conts = ContsSingleton.getContsSingletonObject();
		List<ContsDTO> contsList = conts.getContsList();
		String initial = jaso.getInitial(searchData);

		List<String> autoCompleteList = new ArrayList<String>();

		if (contsList != null) {
			if (!initial.trim().equals("")) {
				for (ContsDTO contsDTO : contsList) {
					if (contsDTO.getConts_nm_div().contains(initial)) {
						autoCompleteList.add(contsDTO.getConts_nm());
					}
					if (autoCompleteList.size() >= 5) {
						break;
					}
				}
			}
		}
		return autoCompleteList;
	}

	@RequestMapping(value = "/recent_location_list", method = RequestMethod.POST)
	@ResponseBody
	public List<String> nearLocation(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		List<String> locationList = new ArrayList<String>();
		if(cookies!=null) {
			int j = 0;
			for (int i = cookies.length-1 ; i>=0; i--) {
				String name = cookies[i].getName(); 
				try {
					String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
					if(name.contains("location")) {
						locationList.add(value);
						j+=1;
						if(j == 5) {
							break;
						}
					}
				}catch(Exception e) {
					System.out.println("불러오기 실패");
				}


			}
			return locationList;
		}else {
			return null;
		}
	}

	@RequestMapping(value = "/yeps_main_saerch", method = RequestMethod.POST)
	public ModelAndView MainSearchPro(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		
		String category = req.getParameter("category");
		String location = req.getParameter("location");
		String searchword = req.getParameter("searchword");
		
		if(location != null && !location.equals("Home")) {
			Cookie[] cookies = req.getCookies();
			boolean isExistLocation = false;
			if(cookies!=null) {
				for (Cookie cookie : cookies) {
					String name = cookie.getName(); 
					try {
						String value = URLDecoder.decode(cookie.getValue(),"utf-8");
						if(name.contains("location") && value.equals(location)) {
							isExistLocation = true;
							break;
						}
					}catch(Exception e) {
						System.out.println("출력 실패");
					}
				}
			}
			if(!isExistLocation) {
				String authNum = ""; // RandomNum함수 호출해서 리턴값 저장
				authNum = randomNum.getKey(7, false);
				try {
					Cookie cookie = new Cookie("location"+authNum, URLEncoder.encode(location, "UTF-8"));
					cookie.setMaxAge(60*60*24*30);	// 쿠키 유지 기간 - 30일
					cookie.setPath("/");			// 모든 경로에서 접근 가능하도록 
					resp.addCookie(cookie);			// 쿠키저장
				}catch(Exception e){
					System.out.println("쿠키 저장 실패");
				}

			}
		}
			MemberDTO memberDTO =  (MemberDTO) session.getAttribute("memberinfo");
			if(memberDTO != null && location != null && location.equals("Home")) {
				String[] addr = memberDTO.getAddress().split(" ");
				location = addr[1] + " " + addr[2] + " " +addr[3];
				System.out.println(location);
			}

		if (searchword == null || searchword.trim().equals("")) {
			// 검색어 없을 경우
		} else {
			ContsSingleton conts = ContsSingleton.getContsSingletonObject();
			ContsDTO contsDTO = new ContsDTO();
			String initial = jaso.getInitial(searchword);
			contsDTO.setConts_nm(searchword);
			contsDTO.setConts_nm_div(initial);
			conts.addContsUploadList(contsDTO);
		}
		return mav;
	}


}
