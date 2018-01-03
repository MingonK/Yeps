package com.yeps.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.yeps.service.SHA256Util;

@Controller
public class SearchController {

	@Autowired
	private ContsMapper contsMapper;

	@Autowired
	private Jaso jaso;

	@RequestMapping(value = "/search_auto_complete", method = RequestMethod.POST)
	@ResponseBody
	public List<String> searchAutoComplete(@RequestParam(value="searchData") String searchData) {

		ContsSingleton conts = ContsSingleton.getContsSingletonObject();
		List<ContsDTO> contsList = conts.getContsList();
		String initial = jaso.getInitial(searchData);

		List<String> autoCompleteList = new ArrayList<String>();

		if(contsList != null) {
			if(!initial.trim().equals("")) {
				for(ContsDTO contsDTO : contsList) {
					if(contsDTO.getConts_nm_div().contains(initial)) {
						autoCompleteList.add(contsDTO.getConts_nm());
					}
					if(autoCompleteList.size() >=5) {
						break;
					} 
				}
			}
		}
		return autoCompleteList;
	}
	
	@RequestMapping(value = "/yeps_main_saerch", method = RequestMethod.POST)
	public ModelAndView MainSearchPro(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		String searchword = req.getParameter("searchword");
		if(searchword == null || searchword.trim().equals("")) {
			//검색어 없을 경우
		}else {
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
