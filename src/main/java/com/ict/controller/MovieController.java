package com.ict.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.BVO;
import com.ict.service.DAO;
import com.ict.service.MovieVO;

@Controller
public class MovieController {
	@Autowired
	private DAO dao;

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("nowmovie.do")
	public ModelAndView nowMovieCommand(HttpServletRequest request) {
		ModelAndView mv=  new ModelAndView("views/nowmovie");
		try {
			
			List<MovieVO> mvlist = dao.getmovieList();
			mv.addObject("mvlist", mvlist);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("soonmovie.do")
	public ModelAndView soonMovieCommand(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("views/soonmovie");
		try {
			
			List<MovieVO> mvlist2 = dao.getmovieListsoon();
			mv.addObject("mvlist2", mvlist2);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("mvinsert.do")
	public ModelAndView nowMovieInsertCommand() {
		return new ModelAndView("admin/movie_insert");
	}
	
	
	@RequestMapping(value = "mvinsert_ok.do", method = RequestMethod.GET)
	public ModelAndView nowMovieInsertokCommandGet() {
		return new ModelAndView("admin");
	}
	
	@RequestMapping(value = "mvinsert_ok.do", method = RequestMethod.POST)
	public ModelAndView nowMovieInsertokCommandPost(MovieVO movievo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:admin.do");
		try {
			String path = session.getServletContext().getRealPath("/resources/upload/mvposter");
			MultipartFile m_file = movievo.getM_file();
			
			if(m_file.isEmpty()) {
				movievo.setFile_name("");
			}else {
				movievo.setFile_name(m_file.getOriginalFilename());
			}
			
			int result = dao.getMovieInsert(movievo);
			if(result >0) {
				m_file.transferTo(new File(path + "/" + movievo.getFile_name()));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	@RequestMapping("nowview.do")
	public ModelAndView nowviewCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("views/detailmovienow");
		try {
			String idx = request.getParameter("idx");
			
			
			// 상세보기
			  MovieVO movievo = dao.getOnenowList(idx);
			  
			// 수정과 삭제를 위해서 세션에 저장
			 request.getSession().setAttribute("movievo", movievo); 
			 
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	@RequestMapping("soonview.do")
	public ModelAndView soonviewCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("views/detailmovienow");
		try {
			String idx = request.getParameter("idx");
			
			// 상세보기
			  MovieVO movievo2 = dao.getOnenowList2(idx);
			  
			// 수정과 삭제를 위해서 세션에 저장
			 request.getSession().setAttribute("movievo2", movievo2); 
			 System.out.println(movievo2.getFile_name());
			 System.out.println(movievo2.getIdx());
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
}
