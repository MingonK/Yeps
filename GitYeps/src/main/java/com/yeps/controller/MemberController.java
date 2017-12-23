package com.yeps.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.yeps.service.YepsPager;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private RandomNum randomNum;

	@Autowired
	private SendEmail sendEmail;

	@RequestMapping(value = "/member_index")
	public ModelAndView indexMember() {
		return new ModelAndView("member/index");
	}

	@RequestMapping(value = "/member_manager")
	public ModelAndView listMember(HttpServletRequest req, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage) {

		MemberDTO dto = (MemberDTO) session.getAttribute("memberinfo");
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if (!dto.getIsmaster().equals("y")) {
			msg = "회원관리권한이 없습니다.";
			url = "main";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}

		String mnum = req.getParameter("mnum");
		MemberDTO memberProfile = null;
		if (mnum != null) {
			try {
				memberProfile = memberMapper.getMemberProfile(Integer.parseInt(mnum));
			} catch (Exception e) {
				memberProfile = null;
			}
		}

		if (memberProfile == null || mnum == null || mnum.trim().equals("")) {
			List<MemberDTO> list = null;
			String search = req.getParameter("search");
			String searchString = req.getParameter("searchString");

			int count = 0;
			if (searchString == null || searchString.trim().equals("") || search == null || search.trim().equals("")) {
				count = memberMapper.getMemberCount();
			} else {
				count = memberMapper.getSearchMemberCount(search, searchString);
			}
			// 페이지 나누기 관련 처리
			YepsPager yepsPager = new YepsPager(count, curPage, 20, 10);
			int start = yepsPager.getPageBegin();
			int end = yepsPager.getPageEnd();

			if (searchString == null || searchString.trim().equals("") || search == null || search.trim().equals("")) {
				list = memberMapper.listMember(start, end);
			} else {
				list = memberMapper.findMember(start, end, search, searchString);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("listMember", list); // list
			map.put("count", count); // 레코드의 갯수
			map.put("yepsPager", yepsPager);
			map.put("search", search);
			map.put("searchString", searchString);
			mav.addObject("map", map);
			mav.setViewName("member/memberManager");
		} else {
			mav.addObject("memberProfile", memberProfile);
			mav.setViewName("member/memberManager");
		}

		return mav;
	}

	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public ModelAndView joinMemberForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if (session.getAttribute("memberinfo") != null) {
			msg = "로그아웃을 먼저 해주세요.";
			url = "main";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		return new ModelAndView("member/memberJoin");
	}

	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public ModelAndView joinMemberPro(HttpServletRequest req, @ModelAttribute MemberDTO dto, HttpSession session,
			BindingResult result) {
		if (result.hasErrors()) { // 에러가 날 경우를 대비해 BindingResult result를 만들어주고 여기에서 초기값을 잡아주면 된다.
			dto.setMnum(0);
			dto.setReviewcount(0);
			dto.setImagecount(0);
		}

		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if (dto.getName() == null || dto.getName().trim().equals("")) {
			msg = "회원가입페이지로 이동합니다";
			url = "member_login?mode=signup";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}

		String ssn2 = dto.getSsn2();
		ssn2 = SHA256Util.getEncrypt(ssn2, "yeps"); // 주민번호 뒷자리는 salt값을 yeps로 줌
		dto.setSsn2(ssn2);

		boolean isExistJumin = memberMapper.checkJumin(dto);
		if (isExistJumin) {
			msg = "이미 가입된 회원입니다. 로그인 페이지로 이동합니다.";
			url = "member_login";
		} else {
			dto.setEmail(req.getParameter("email1") + "@" + req.getParameter("email2"));
			String salt = SHA256Util.generateSalt();
			dto.setSalt(salt);
			String passwd = dto.getPasswd();
			passwd = SHA256Util.getEncrypt(passwd, salt);
			dto.setPasswd(passwd);

			int res = memberMapper.insertMember(dto);

			if (res > 0) {
				msg = "회원등록성공!! 메인페이지로 이동합니다.";
				url = "main";

				MemberDTO dto2 = memberMapper.loginMember(dto);
				if (dto2.getIsmaster().equals("y")) {
					session.setAttribute("memberinfo", dto2);
					msg = "마스터 아이디로 로그인 하셨습니다";
					url = "main";
				} else if (dto2.getIsmanager().equals("y")) {
					session.setAttribute("memberinfo", dto2);
					msg = "관리자 아이디로 로그인 하셨습니다";
					url = "main";
				} else {
					session.setAttribute("memberinfo", dto2);
				}

			} else {
				msg = "회원등록실패!! 회원가입페이지로 이동합니다";
				url = "member_login?mode=";
			}
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	@RequestMapping(value = "/member_confirmEmail", method = RequestMethod.GET)
	public ModelAndView confirmEmailForm(HttpServletRequest req) {
		String email = req.getParameter("email");
		if (email == null) {
			email = req.getParameter("email1") + "@" + req.getParameter("email2");
		}
		MemberDTO dto = memberMapper.confirmEmail(email);
		ModelAndView mav = new ModelAndView();
		if (dto == null) {
			mav.addObject("isMember", 0);
		} else {
			mav.addObject("isMember", 1);
		}
		mav.addObject("email", email);
		mav.setViewName("member/confirmEmail");
		return mav;
	}

	@RequestMapping(value = "/member_delete")
	public ModelAndView deleteMember(HttpServletRequest req, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;

		MemberDTO dto = (MemberDTO) session.getAttribute("memberinfo");
		if (!dto.getIsmaster().equals("y")) {
			msg = "회원관리권한이 없습니다.";
			url = "main";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		String num = req.getParameter("mnum");
		int mnum = 0;
		try {
			mnum = Integer.parseInt(num);
		} catch (Exception e) {
			mnum = 0;
		}
		if (mnum == 0) {
			msg = "회원관리페이지로 이동합니다.";
			url = "member_manager";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		int res = memberMapper.deleteMember(mnum);
		if (res > 0) {
			msg = "회원삭제성공!! 회원목록보기페이지로 이동합니다.";
			url = "member_manager";
		} else {
			msg = "회원삭제실패!! 회원목록보기페이지로 이동합니다.";
			url = "member_manager";
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	@RequestMapping(value = "/member_login", method = RequestMethod.GET)
	public ModelAndView loginMemberForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if (session.getAttribute("memberinfo") != null) {
			msg = "로그아웃을 먼저 해주세요.";
			url = "main";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		return new ModelAndView("member/memberLogin");
	}

	@RequestMapping(value = "/member_login", method = RequestMethod.POST)
	public ModelAndView loginMemberPro(@ModelAttribute MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		if (dto.getEmail().trim().equals("") || dto.getPasswd().trim().equals("")) {
			msg = "로그인페이지로 이동합니다.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		String salt = memberMapper.getSaltByEmail(dto);
		if (salt == null) {
			msg = "존재하지 않는 이메일 입니다.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		String passwd = dto.getPasswd();

		passwd = SHA256Util.getEncrypt(passwd, salt);
		dto.setPasswd(passwd);

		MemberDTO dto2 = memberMapper.loginMember(dto);
		if (dto2 != null) {
			if (dto2.getIsmaster().equals("y")) {
				session.setAttribute("memberinfo", dto2);
				msg = "마스터 아이디로 로그인 하셨습니다";
				url = "main";
			} else if (dto2.getIsmanager().equals("y")) {
				session.setAttribute("memberinfo", dto2);
				msg = "관리자 아이디로 로그인 하셨습니다";
				url = "main";
			} else {
				session.setAttribute("memberinfo", dto2);
				mav.setViewName("mainPage");
				return mav;
			}

		} else {
			msg = "비밀번호를 확인해주세요.";
			url = "member_login";
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	@RequestMapping(value = "/member_emailAuth")
	public ModelAndView emailAuth(HttpServletResponse resp, HttpServletRequest req) {
		String email = req.getParameter("email");
		String authNum = ""; // RandomNum함수 호출해서 리턴값 저장

		authNum = randomNum.getKey(7, false);

		SendEmail.sendEmail(email.toString(), authNum);
		ModelAndView mav = new ModelAndView();
		String[] emailsplit = email.split("@");
		String email1 = emailsplit[0];
		String email2 = emailsplit[1];
		mav.setViewName("member/emailAuth");
		mav.addObject("email", email);
		mav.addObject("email1", email1);
		mav.addObject("email2", email2);
		mav.addObject("authNum", authNum);

		return mav;
	}

	@RequestMapping(value = "/member_findEmail", method = RequestMethod.GET)
	public ModelAndView findEmailForm() {
		return new ModelAndView("member/findEmail");
	}

	@RequestMapping(value = "/member_findEmail", method = RequestMethod.POST)
	public ModelAndView findEmailPro(@ModelAttribute MemberDTO dto) {
		ModelAndView mav = new ModelAndView();

		String msg = null, url = null;
		if (dto.getName().trim().equals("") || dto.getSsn1().trim().equals("") || dto.getSsn2().trim().equals("")) {
			msg = "로그인페이지로 이동합니다.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}

		String ssn2 = dto.getSsn2();
		ssn2 = SHA256Util.getEncrypt(ssn2, "yeps");
		dto.setSsn2(ssn2);

		List<String> emailList = memberMapper.findMemberEmail(dto);
		if (emailList != null) {
			mav.addObject("emailList", emailList);
		}

		System.out.println(emailList.size());
		mav.setViewName("member/findEmailOK");
		return mav;
	}

	@RequestMapping(value = "/member_findPasswd", method = RequestMethod.GET)
	public ModelAndView findPasswdForm() {
		return new ModelAndView("member/findPasswd");
	}

	@RequestMapping(value = "/member_findPasswd", method = RequestMethod.POST)
	public ModelAndView findPasswdPro(@ModelAttribute MemberDTO dto) {
		ModelAndView mav = new ModelAndView();

		String msg = null, url = null;
		if (dto.getName().trim().equals("") || dto.getSsn1().trim().equals("") || dto.getSsn2().trim().equals("")
				|| dto.getEmail().trim().equals("")) {
			msg = "로그인페이지로 이동합니다.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}

		String ssn2 = dto.getSsn2();
		ssn2 = SHA256Util.getEncrypt(ssn2, "yeps");
		dto.setSsn2(ssn2);

		int res = memberMapper.findMemberPasswd(dto);
		if (res > 0) {
			String authNum = ""; // RandomNum함수 호출해서 리턴값 저장
			authNum = randomNum.getKey(10, false);
			String passwd = authNum;

			String salt = memberMapper.getSaltByEmail(dto);
			passwd = SHA256Util.getEncrypt(passwd, salt);
			dto.setPasswd(passwd);

			int result = memberMapper.temporaryPasswd(dto);
			if (result > 0) {
				String email = dto.getEmail();
				SendEmail.sendTemporaryPasswd(email.toString(), authNum);
				mav.addObject("temporaryPw", 1);
			} else {
				mav.addObject("temporaryPw", 0);
			}
		} else {
			mav.addObject("temporaryPw", -1);
		}
		mav.setViewName("member/findPasswdOK");
		return mav;
	}

	@RequestMapping(value = "/member_logout", method = RequestMethod.GET)
	public ModelAndView logoutMemberForm(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/main");
	}

	@RequestMapping(value = "/member_profile", method = RequestMethod.GET)
	public ModelAndView profileMemberForm() {
		return new ModelAndView("member/memberProfile");
	}

	@RequestMapping(value = "/member_profile", method = RequestMethod.POST)
	public ModelAndView profileMemberPro(HttpServletRequest req, @ModelAttribute MemberDTO dto2, HttpSession session,
			BindingResult result) {
		if (result.hasErrors()) {
			dto2.setMnum(0);
			dto2.setReviewcount(0);
			dto2.setImagecount(0);
		}

		String mnum = req.getParameter("mnum");
		String name = req.getParameter("name");
		if (name == null || name.trim().equals("")) {
			return new ModelAndView("member/memberProfile");
		}

		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;
		MemberDTO dto = (MemberDTO) session.getAttribute("memberinfo");
		int res = 0;
		if (mnum != null) {
			if (!dto.getIsmaster().equals("y")) {
				msg = "회원관리권한이 없습니다.";
				url = "main";
				mav.setViewName("message");
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				return mav;
			} else {
				dto2.setIsmanager("n");
				dto2.setControlcate("n");
				dto2.setControlevent("n");
				dto2.setControlmember("n");
				dto2.setControlreview("n");
				dto2.setControlstore("n");
				String[] controlckbox = req.getParameterValues("controlckbox");

				if (controlckbox != null) {
					dto2.setIsmanager("y");
					for (int i = 0; i < controlckbox.length; i++) {
						if (controlckbox[i].equals("controlcate")) {
							dto2.setControlcate("y");
						} else if (controlckbox[i].equals("controlevent")) {
							dto2.setControlevent("y");
						} else if (controlckbox[i].equals("controlmember")) {
							dto2.setControlmember("y");
						} else if (controlckbox[i].equals("controlreview")) {
							dto2.setControlreview("y");
						} else if (controlckbox[i].equals("controlstore")) {
							dto2.setControlstore("y");
						}
					}
				}
				res = memberMapper.updateMemberProfileByMaster(dto2);
				if (res > 0) {

					msg = "회원 프로필 정보 수정 성공!";
					url = "member_manager?mnum=" + dto2.getMnum();
				} else {
					msg = "회원 프로필 정보 수정 실패!";
					url = "member_manager?mnum=" + dto2.getMnum();
				}
			}
		} else {
			int memberNum = dto.getMnum();
			res = memberMapper.updateMemberProfile(memberNum, name);
			if (res > 0) {
				msg = "프로필 정보 수정 성공!";
				url = "member_profile?mode=profile";
				dto.setName(name);
				session.setAttribute("memberinfo", dto);
			} else {
				msg = "프로필 정보 수정 실패!";
				url = "member_profile?mode=profile";
			}
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);

		return mav;
	}

	@RequestMapping(value = "/member_password", method = RequestMethod.POST)
	public ModelAndView PasswordMemberPro(HttpSession session, HttpServletRequest req) {
		String passwd = req.getParameter("passwd");
		String passwd1 = req.getParameter("passwd1");
		if (passwd == null || passwd.trim().equals("") || passwd1 == null || passwd1.trim().equals("")) {
			return new ModelAndView("member/memberProfile");
		}

		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;

		MemberDTO dto = (MemberDTO) session.getAttribute("memberinfo");

		String salt = memberMapper.getSaltByEmail(dto);
		if (salt == null) {
			msg = "존재하지 않는 이메일 입니다. 다시 로그인 해주세요.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		passwd = SHA256Util.getEncrypt(passwd, salt);
		passwd1 = SHA256Util.getEncrypt(passwd1, salt);

		if (passwd.equals(passwd1)) {
			msg = "변경하고자 하는 비밀번호와 이전 비밀번호와 같습니다.";
			url = "member_profile?mode=passwd";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}

		int res = memberMapper.updateMemberPasswd(dto.getMnum(), passwd, passwd1);

		if (res > 0) {
			msg = "비밀번호 변경 성공!";
			url = "member_profile?mode=passwd";
		} else {
			msg = "비밀번호 변경 실패! 비밀번호를 다시 확인해주세요.";
			url = "member_profile?mode=passwd";
			mav.addObject("mode", "passwd");
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);

		return mav;
	}

	@RequestMapping(value = "/member_leave", method = RequestMethod.POST)
	public ModelAndView LeaveMemberPro(HttpSession session, HttpServletRequest req) {
		String passwd = req.getParameter("passwd");
		if (passwd == null || passwd.trim().equals("")) {
			return new ModelAndView("member/memberProfile");
		}

		ModelAndView mav = new ModelAndView();
		String msg = null, url = null;

		MemberDTO dto = (MemberDTO) session.getAttribute("memberinfo");
		String salt = memberMapper.getSaltByEmail(dto);
		if (salt == null) {
			msg = "존재하지 않는 이메일 입니다. 다시 로그인 해주세요.";
			url = "member_login";
			mav.setViewName("message");
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			return mav;
		}
		passwd = SHA256Util.getEncrypt(passwd, salt);
		dto.setPasswd(passwd);
		int res = memberMapper.leaveMember(dto);

		if (res > 0) {
			msg = "회원 탈퇴 성공!";
			session.invalidate();
			url = "main";
		} else {
			msg = "회원 탈퇴 실패! 비밀번호를 다시 확인해주세요.";
			url = "member_profile?mode=memberleave";
		}
		mav.setViewName("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);

		return mav;
	}

}