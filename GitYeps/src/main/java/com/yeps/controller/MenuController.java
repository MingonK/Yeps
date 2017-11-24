package com.yeps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yeps.model.MenuDTO;
import com.yeps.service.MenuMapper;

@Controller
public class MenuController {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@RequestMapping(value = "/menu_list")
	public ModelAndView listMenu() {
		List<MenuDTO> list = menuMapper.listMenu();
		return new ModelAndView("menu/menu_list", "menuList", list);
	}
}
