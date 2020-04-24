package com.ict.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MemberVO;

@RestController
@RequestMapping("/Ajax")
public class AjaxController {
	@Autowired
	private DAO dao;

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("signup_ok.do")
	public String signup_okCommand(MemberVO mvo)  {
		String result = "";
		try {
			if(dao.getSignupOK(mvo) == 1) {
				result = "y";
			}else {
				result = "n";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	@RequestMapping("idchk.do")
	public String idck_go(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("mem_id");
		System.out.println("id 값 : "+id);
		String result = "";
		
		if(dao.getIdCheak(id).size()==0){
			result = "y";
		}else{
			result = "n";
		}
		 				
		return result;
	}
	
	@RequestMapping("find_id.do")
	public String find_idCommand(MemberVO mvo, HttpServletRequest request, HttpServletResponse response) {
		String result ="";
		String name = request.getParameter("find_name");
		String email = request.getParameter("find_email");
		System.out.println("입력한 name : "+ name);
		System.out.println("입력한 email : "+ email);
		try {
			MemberVO mvo_id = dao.getFindId(mvo);
			if(mvo_id != null) {
				result = "y";
			}else if(mvo_id == null){
				result = "n";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	} 
	
	@RequestMapping(value="movieboxOffice.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String BoxOffice() {
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
					+ "?key=167311dd020ae58e91f6d8ed3dbb88e2"
					+ "&targetDt=20200415");
			URLConnection conn = url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			String msg = "";
			while ((msg=br.readLine())!=null) {
				sb.append(msg);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return sb.toString();
	}
	
	
}
