package com.yeps.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.yeps.service.MemberMapper;
import com.yeps.service.RandomNum;
import com.yeps.service.SHA256Util;
import com.yeps.service.SendEmail;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper; 

	@Autowired
	private RandomNum randomNum;

	@Autowired
	private SendEmail sendEmail;

	@RequestMapping(value="/member_index")
	public ModelAndView indexMember() {
		return new ModelAndView("member/index");
	}

	@RequestMapping(value="/member_manager")
	public ModelAndView listMember(HttpServletRequest arg0) {

		List<MemberDTO> list = null;

		String search = arg0.getParameter("search");
		String searchString = arg0.getParameter("searchString"); 
		if(searchString == null || searchString.trim().equals("")) {
			list = memberMapper.listMember();
		}else {
			String sql = "select * from yeps_member where "+search + "='" +searchString + "'";
			list = memberMapper.findMember(sql);
		}


		ModelAndView mav = new ModelAndView();
		mav.addObject("listMember",list);
		mav.setViewName("member/memberManager");
		return mav;
	}

	@RequestMapping(value="/member_join", method=RequestMethod.GET)
	public ModelAndView joinMemberForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if(session.getAttribute("memberNum")!= null || session.getAttribute("memberEmail")!= null || session.getAttribute("memberName")!= null) {
			msg = "로그아웃을 먼저 해주세요.";
			url = "member_index";
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}
		return new ModelAndView("member/memberJoin");
	}

	@RequestMapping(value="/member_join", method=RequestMethod.POST)
	public ModelAndView joinMemberPro(HttpServletRequest arg0, @ModelAttribute MemberDTO dto, HttpSession session, BindingResult result){
		if(result.hasErrors()) { // 에러가 날 경우를 대비해 BindingResult result를 만들어주고 여기에서 초기값을 잡아주면 된다.
			dto.setMnum(0);
			dto.setReviewcount(0);
			dto.setImagecount(0);
		}

		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if(dto.getName()==null || dto.getName().trim().equals("") ) {
			msg = "회원가입페이지로 이동합니다";
			url = "member_join";
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		String ssn2 = dto.getSsn2();
		ssn2 = SHA256Util.getEncrypt(ssn2, "yeps");	// 주민번호 뒷자리는  salt값을 yeps로 줌
		dto.setSsn2(ssn2);

		boolean isExistJumin = memberMapper.checkJumin(dto);
		if(isExistJumin) {
			msg = "이미 가입된 회원입니다. 로그인 페이지로 이동합니다.";
			url = "member_login";
		}else {
			dto.setEmail(arg0.getParameter("email1")+"@"+arg0.getParameter("email2"));
			String salt = SHA256Util.generateSalt();
			dto.setSalt(salt);
			String passwd = dto.getPasswd();
			passwd = SHA256Util.getEncrypt(passwd, salt);
			dto.setPasswd(passwd);

			int res = memberMapper.insertMember(dto);

			if (res>0){
				msg = "회원등록성공!! 메인페이지로 이동합니다.";
				url = "member_index";

				MemberDTO dto2 = memberMapper.loginMember(dto);
				if(dto2.getIsmaster().equals("y")) {
					session.setAttribute("memberNum", "-1");
					session.setAttribute("memberEmail", "YEPSMaster");
					session.setAttribute("memberName", "YEPSMaster");
				}else if(dto2.getIsmanager().equals("y")) {
					session.setAttribute("memberNum", "-2");
					session.setAttribute("memberEmail", "YEPSManager");
					session.setAttribute("memberName", "YEPSManager");
				}else {
					session.setAttribute("memberNum", dto2.getMnum());
					session.setAttribute("memberEmail", dto2.getEmail());
					session.setAttribute("memberName", dto2.getName());
				}


			}else { 
				msg = "회원등록실패!! 회원가입페이지로 이동합니다";
				url = "member_login";
			}
		}
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		@RequestMapping(value="/member_confirmEmail", method=RequestMethod.GET)
		public ModelAndView confirmEmailForm(HttpServletRequest req) {
			String email= req.getParameter("email");
			if(email==null) {
				email = req.getParameter("email1")+"@"+req.getParameter("email2");
			}
			MemberDTO dto = memberMapper.confirmEmail(email);
			ModelAndView mav = new ModelAndView();
			if(dto==null) {
				mav.addObject("isMember",0);
			}else {
				mav.addObject("isMember",1);
			}
			mav.addObject("email", email);
			mav.setViewName("member/confirmEmail");
			return mav;
		}

		@RequestMapping(value="/member_delete")
		public ModelAndView deleteMember(@RequestParam String num) throws Exception {

			int mnum =  Integer.parseInt(num);
			ModelAndView mav = new ModelAndView();
			String msg = null , url = null;
			if (mnum==0){
				msg = "회원관리페이지로 이동합니다.";
				url = "member_manager";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}
			int res = memberMapper.deleteMember(mnum);
			if (res>0){
				msg = "회원삭제성공!! 회원목록보기페이지로 이동합니다.";
				url = "member_manager";
			}else{
				msg = "회원삭제실패!! 회원목록보기페이지로 이동합니다.";
				url = "member_manager";
			}
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		@RequestMapping(value="/member_login", method=RequestMethod.GET)
		public ModelAndView loginMemberForm(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			String msg = null, url = null;
			if(session.getAttribute("memberNum")!= null || session.getAttribute("memberEmail")!= null || session.getAttribute("memberName")!= null) {
				msg = "로그아웃을 먼저 해주세요.";
				url = "member_index";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}
			return new ModelAndView("member/memberLogin");
		}

		@RequestMapping(value="/member_login", method=RequestMethod.POST)
		public ModelAndView loginMemberPro(@ModelAttribute MemberDTO dto, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			String msg = null , url = null;
			if (dto.getEmail().trim().equals("") || dto.getPasswd().trim().equals("")){
				msg = "로그인페이지로 이동합니다.";
				url = "member_login";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}
			String salt = memberMapper.getSaltByEmail(dto);
			if(salt == null) {
				msg = "존재하지 않는 이메일 입니다.";
				url = "member_login";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}
			String passwd = dto.getPasswd();

			passwd = SHA256Util.getEncrypt(passwd, salt);
			dto.setPasswd(passwd);

			MemberDTO dto2 = memberMapper.loginMember(dto);
			if (dto2 != null){
				if(dto2.getIsmaster().equals("y")) {
					session.setAttribute("memberNum", "-1");
					session.setAttribute("memberEmail", "YEPSMaster");
					session.setAttribute("memberName", "YEPSMaster");
					msg = "마스터 아이디로 로그인 하셨습니다";
					url = "member_index";
				}else if(dto2.getIsmanager().equals("y")) {
					session.setAttribute("memberNum", "-2");
					session.setAttribute("memberEmail", "YEPSManager");
					session.setAttribute("memberName", "YEPSManager");
					msg = "관리자 아이디로 로그인 하셨습니다";
					url = "member_index";
				}else {
					session.setAttribute("memberNum", dto2.getMnum());
					session.setAttribute("memberEmail", dto2.getEmail());
					session.setAttribute("memberName", dto2.getName());
					mav.setViewName("member/index");
					return mav;
				}

			}else{
				msg = "비밀번호를 확인해주세요.";
				url = "member_login";
			}
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		@RequestMapping(value="/member_emailAuth")
		public ModelAndView emailAuth(HttpServletResponse resp,HttpServletRequest req) {
			String email = req.getParameter("email");
			String authNum="";	// RandomNum함수 호출해서 리턴값 저장

			authNum = randomNum.getKey(7, false);

			SendEmail.sendEmail(email.toString(), authNum);
			ModelAndView mav = new ModelAndView();
			String [] emailsplit = email.split("@");
			String email1 = emailsplit[0];
			String email2 = emailsplit[1];
			mav.setViewName("member/emailAuth");
			mav.addObject("email", email);
			mav.addObject("email1", email1);
			mav.addObject("email2", email2);
			mav.addObject("authNum", authNum);

			return mav;
		}

		@RequestMapping(value="/member_findEmail", method=RequestMethod.GET)
		public ModelAndView findEmailForm() {
			return new ModelAndView("member/findEmail");
		}

		@RequestMapping(value="/member_findEmail", method=RequestMethod.POST)
		public ModelAndView findEmailPro(@ModelAttribute MemberDTO dto) {
			ModelAndView mav = new ModelAndView();

			String msg = null , url = null;
			if (dto.getName().trim().equals("") || dto.getSsn1().trim().equals("") || dto.getSsn2().trim().equals("")){
				msg = "로그인페이지로 이동합니다.";
				url = "member_login";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}

			String ssn2 = dto.getSsn2();
			ssn2 = SHA256Util.getEncrypt(ssn2, "yeps");
			dto.setSsn2(ssn2);

			List<String> emailList = memberMapper.findMemberEmail(dto);
			if (emailList != null){
				mav.addObject("emailList", emailList);
			}
			
			System.out.println(emailList.size());
			mav.setViewName("member/findEmailOK");
			return mav;
		}

		@RequestMapping(value="/member_findPasswd", method=RequestMethod.GET)
		public ModelAndView findPasswdForm() {
			return new ModelAndView("member/findPasswd");
		}

		@RequestMapping(value="/member_findPasswd", method=RequestMethod.POST)
		public ModelAndView findPasswdPro(@ModelAttribute MemberDTO dto) {
			ModelAndView mav = new ModelAndView();

			String msg = null , url = null;
			if (dto.getName().trim().equals("") || dto.getSsn1().trim().equals("") || 
					dto.getSsn2().trim().equals("") || dto.getEmail().trim().equals("")){
				msg = "로그인페이지로 이동합니다.";
				url = "member_login";
				mav.setViewName("message");
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				return mav;
			}

			String ssn2 = dto.getSsn2();
			ssn2 = SHA256Util.getEncrypt(ssn2, "yeps");
			dto.setSsn2(ssn2);

			int res = memberMapper.findMemberPasswd(dto);
			if (res >0){
				String authNum="";	// RandomNum함수 호출해서 리턴값 저장
				authNum = randomNum.getKey(10, false);
				String passwd = authNum;

				String salt = memberMapper.getSaltByEmail(dto);
				passwd = SHA256Util.getEncrypt(passwd, salt);
				dto.setPasswd(passwd);

				int result = memberMapper.temporaryPasswd(dto);
				if(result >0) {
					String email = dto.getEmail();
					SendEmail.sendTemporaryPasswd(email.toString(), authNum);
					mav.addObject("temporaryPw", 1);
				}else {
					mav.addObject("temporaryPw", 0);
				}
			}else {
				mav.addObject("temporaryPw", -1);
			}
			mav.setViewName("member/findPasswdOK");
			return mav;
		}


		@RequestMapping(value="/member_logout", method=RequestMethod.GET)
		public ModelAndView logoutMemberForm(HttpSession session) {
			session.invalidate();
			return new ModelAndView("redirect:/member_index");
		}
		/*

	@RequestMapping(value="/edit.member")
	public ModelAndView editMember(@RequestParam String no) throws Exception {

		ModelAndView mav = new ModelAndView();
		String msg=null, url=null ;
		if(no==null || no.trim().equals("")) {
			msg = "회원관리페이지로 이동합니다";
			url = "index.member";
			mav.setViewName("message.jsp");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		MemberDTO dto = memberDAO.getMember(Integer.parseInt(no));
		return new ModelAndView("WEB-INF/member/member_edit.jsp","getMember",dto);	
	}
	@RequestMapping(value="/editOk.member")
	public ModelAndView editOkMember(HttpServletRequest arg0, @ModelAttribute MemberDTO dto)
			throws Exception {

		dto.setPasswd(arg0.getParameter("passwd"));

		String msg = null, url = null;

		ModelAndView mav = new ModelAndView();
		if(dto.getPasswd()==null || dto.getPasswd().trim().equals("")) {
			msg = "접근오류! 회원목록보기페이지로 이동합니다";
			url = "list.member";
			mav.setViewName("message.jsp");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}

		int res = memberDAO.updateMember(dto);

		if (res>0){
			msg = "회원정보 수정 성공!! 회원목록페이지로 이동합니다.";
			url = "list.member";
		}else { 
			msg = "회원정보 수정 실패!! 회원목록페이지로 이동합니다";
			url = "list.member";
		}
		mav.setViewName("message.jsp");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}


		 */
	}
