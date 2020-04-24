package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private DAO dao;

	public DAO getDvo() {
		return dao;
	}

	public void setDvo(DAO dao) {
		this.dao = dao;
	}

	@RequestMapping("signup.do")
	public ModelAndView signupCommand() {
		return new ModelAndView("member/signup");
	}

	// 아이디 비밀번호 찾기 화면으로 이동
	@RequestMapping("find.do")
	public ModelAndView findCommand() {
		return new ModelAndView("member/findip");
	}

	// 마이페이지 화면으로 이동
	@RequestMapping("mypage.do")
	public ModelAndView mypageCommand() {
		return new ModelAndView("member/mypage");
	}

}
