package com.ict.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.model.Paging;
import com.ict.service.BVO;
import com.ict.service.DAO;
import com.ict.service.MemberVO;





@Controller
public class MyController {
	@Autowired
	private DAO dao;
	@Autowired
	private Paging paging;
	
	
	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	

	//메인화면으로 이동
	@RequestMapping("start.do")
	public ModelAndView startCommand() {
		return new ModelAndView("views/main");
	}
	
	//로그인 화면으로 이동
	@RequestMapping("login.do")
	public ModelAndView loginCommand() {
		return new ModelAndView("views/login");
	}
	
	@RequestMapping("login_ok.do")
	public ModelAndView login_okCommand(MemberVO m_vo, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			// 로그인 처리
			MemberVO mvo = dao.getLogin(m_vo);
			
			// 로그인 성공
			if(mvo != null) {
				session.setAttribute("mvo", mvo);
				session.setAttribute("login", "ok");
				
				// 관리자
				if(mvo.getMem_id().equals("movie92") 
						&& mvo.getMem_pw().equals("m1111")) {
						session.setAttribute("admin", "ok");
						mv.setViewName("redirect:admin.do");
						return mv;
				}
				mv.setViewName("redirect:start.do");
			}else {
				mv.setViewName("redirect:login.do");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	
	// 로그 아웃하기
	@RequestMapping("logout.do")
	public ModelAndView logoutCommand(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:start.do");
	}
	// 관리자페이지 창으로 이동
	@RequestMapping("admin.do")
	public ModelAndView adminCommand() {
			return new ModelAndView("admin/admin");
	}
	
	@RequestMapping("moviebox.do")
	public ModelAndView movieBoxCommand() {
		return new ModelAndView("views/boxoffice");
	}
	
	//리뷰페이지
	@RequestMapping("list.do")
	public ModelAndView listCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("reviews/reviewpage");
		try {
			// 1. 전체 게시물의 수
			int count = dao.getTotalCount();
			paging.setTotalRecord(count);
			
			// 2. 전체 게시물의 수를 가지고 전체 페이지의 수를 구하자.
			// 전체 게시물의 수가 getNumPerPage(5) 보다 작거나 같으면 전체 페이지의 수는 1페이지
			if(paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			}else {
				paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPage());
				// 나눠서 나머지가 0이 아니면 현재 페이지에서 한페이지 증가 시키자 
				if(paging.getTotalRecord()%paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage()+1);
				}
			}
			
			String cPage = request.getParameter("cPage");
			// index에서 넘어오면 cPage의 무조건 null이다.
			// 나머지는 list에 넘어올때 무조건 cPage값을 넣어줘야 한다.
			// cPage가 현재 페이지(nowPage)로 변경
			if(cPage == null) {
				paging.setNowPage(1);
			}else {
				paging.setNowPage(Integer.parseInt(cPage));
			}
			
			// 시작번호, 끝번호 
			paging.setBegin((paging.getNowPage()-1)*paging.getNumPerPage()+1);
			paging.setEnd((paging.getBegin()-1) + paging.getNumPerPage());
			
		    // 시작 블록과 끝블록
			paging.setBeginBlock((int)((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1);
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
			
			
			// 주의사항 : endBlock이 totalPage보다 클수 있다.
			// 이때는  endBlock를 totalPage에 맞춰 주세요
			if(paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}
			System.out.println(request.getParameter("idx"));
			List<BVO> list = dao.getList(paging.getBegin(), paging.getEnd());
			System.out.println(request.getParameter("idx"));
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	@RequestMapping("write.do")
	public ModelAndView writeCommand() {
		return new ModelAndView("reviews/review_write");
	}
	
	@RequestMapping(value="write_ok.do", method = RequestMethod.GET)
	public ModelAndView write_OKCommand() {
		return new ModelAndView("reviews/review_write");
	}
	
	@RequestMapping(value="write_ok.do", method = RequestMethod.POST)
	public ModelAndView write_OKCommand_POST(BVO bvo, HttpSession session ) {
		ModelAndView mv = new ModelAndView("redirect:list.do");
		try {
			String path = session.getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bvo.getFile();
			
			if(file.isEmpty()) {
				bvo.setFile_name("");
			}else {
				bvo.setFile_name(file.getOriginalFilename());
			}
			int result = dao.getInsert(bvo);
			if(result >0) {
				file.transferTo(new File(path + "/" + bvo.getFile_name()));
			}
		} catch (Exception e) {
			System.out.println(e);
			
		}
		return mv;
	}
	
	@RequestMapping("view.do")
	public ModelAndView viewCommand(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("reviews/review_view");
		try {
			String idx = request.getParameter("idx");
			String cPage = request.getParameter("cPage");
			
			// hit update
			  dao.getHitUpdate(idx);
			  
			// 상세보기
			  BVO bvo = dao.getOneList(idx);
			  
			// 수정과 삭제를 위해서 세션에 저장
			 request.getSession().setAttribute("bvo", bvo); 
			 
			 mv.addObject("cPage", cPage);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	@RequestMapping("download.do")
	public void FileDown(@RequestParam("file_name") String file_name, HttpServletRequest request, HttpServletResponse response) {
		try {
			//경로 설정
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+file_name);
			
			//브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(file_name,"utf-8"));
			
			//실제 저장
			File file = new File(new String(path.getBytes()));
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream in = new BufferedInputStream(fis);
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	@RequestMapping("update_go.do")
	public ModelAndView updateCommand(@ModelAttribute("cPage")String cPage) {
		return new ModelAndView("reviews/review_update");
	}
	

	@RequestMapping("delete_ok")
	public ModelAndView delete_OKCommand(
			@ModelAttribute("cPage")String cPage,
			@RequestParam("idx")String idx) {
		try {
			dao.getDelete(idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("redirect:list.do");
	}
	
	@RequestMapping(value="update_ok.do", method = RequestMethod.GET)
	public ModelAndView update_OkCommand_GET(
			@ModelAttribute("cPage")String cPage){
		return new ModelAndView("reviews/review_update");
	}
	
	@RequestMapping(value="update_ok.do", method = RequestMethod.POST)
	public ModelAndView update_OkCommand_POST(
			@ModelAttribute("cPage")String cPage,
			BVO bvo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:view.do?idx="+bvo.getIdx());
		try {
			String path = session.getServletContext().getRealPath("/resources/upload");
			MultipartFile file = bvo.getFile();
			if(file.isEmpty()) {
				bvo.setFile_name("");
			}else {
				bvo.setFile_name(file.getOriginalFilename());
			}
			
			int result = dao.getUpdate(bvo);
			if(result>0) {
				file.transferTo(new File(path+"/"+bvo.getFile_name()));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	
	

	
}