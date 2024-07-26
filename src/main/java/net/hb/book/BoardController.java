 package net.hb.book;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardDAO dao;
	ServletContext application;
		
	@RequestMapping("/board_write.do")
	public String board_write() {
		
		return "board_write";
	}//end
	
	@RequestMapping("/board_writeSave.do")
	public String board_insert(BoardDTO dto) {
		System.out.println(dto.bid);
		
		dao.boardInsert(dto);
		return "redirect:/boardList.do";
	}//end
	
	@RequestMapping("/boardDetail.do")
	public String board_detail(Model model, @RequestParam("boardNUM") int bnum) {
		BoardDTO dto = dao.boardDetail(bnum);
		
		model.addAttribute("dto", dto);
		return "boardDetail";
	}//end
	
	
	@RequestMapping("/board_delete.do")
	public String board_delete(@RequestParam("boardNUM") int bnum) {
		dao.boardDelete(bnum);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardList.do")
	public String board_select(Model model, HttpServletRequest request) {
		//페이징 및 검색관련 변수
	  	String pnum = "1";
	  	int pageNUM, pagecount;
	  	int start, end;
	  	int startpage, endpage;
	  	int temp;
	  	
	  	String skey="", sval="";
	  	String returnpage="";
	  	
	  	skey = request.getParameter("keyfield");//검색필드선택 value기억
		sval = request.getParameter("keyword"); //검색어키워드 입력란
		if(skey==null || skey=="" || sval==null || sval==""){
		   skey="bid"; sval="";}
	  	
		returnpage = "&keyfield="+skey+"&keyword="+sval;//검색처리
		
		System.out.println(returnpage+"returnpage 변수확인");
		
	  	pnum = request.getParameter("idx");
		if(pnum==null || pnum==""){pnum="1";}
		
		pageNUM = Integer.parseInt(pnum);//[1]~[10] 혹은 페이지번호 숫자를 클릭하지 않으면 1
		start = (pageNUM*10)-9; //=(pageNUM*10)-9
		end = pageNUM*10;
		
		int Stotal = dao.boardCountSearch(skey, sval);
	  int Gtotal = dao.boardCount();
		
		if(Gtotal%5==0){
			pagecount = Gtotal/5;
		}else{
			pagecount = (Gtotal/5)+1;
		}
		
		if(Stotal%5==0){
			pagecount = Stotal/5;
		}else{
			pagecount = (Stotal/5)+1;
		}
		
		temp = (pageNUM-1)%5; 
		startpage = pageNUM-temp;
		endpage = startpage+4;
		if(endpage>pagecount){endpage=pagecount;}
		
		List<BoardDTO> board = dao.boardSelect(start, end, skey, sval);//페이징 검색
		model.addAttribute("Gtotal", Gtotal);
		model.addAttribute("Stotal", Stotal);
		model.addAttribute("board", board);
		model.addAttribute("pageNUM", pageNUM);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("returnpage", returnpage);
		model.addAttribute("sval", sval);
	    return "boardList"; 
	}//end
	

}//class BookController END




