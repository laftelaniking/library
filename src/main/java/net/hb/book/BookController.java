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
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	BookDAO dao;
	ServletContext application;
	
	@RequestMapping(value = "/bookWrite.do")
	public String book_write() {
		logger.info("bookWrite.do ����");
		return "bookWrite"; 
	}//end
	
	@RequestMapping("/bookWriteSave.do")
	public String book_insert(BookDTO dto) {
		dao.bookInsert(dto); 
		return "redirect:/bookList.do";
	}//end
	
	@RequestMapping("/bookList.do")
	public String guest_select(Model model, HttpServletRequest request) {
		//����¡ �� �˻����� ����
	  	String pnum = "1";
	  	int pageNUM, pagecount;
	  	int start, end;
	  	int startpage, endpage;
	  	int temp;
	  	
	  	String skey="", sval="";
	  	String returnpage="";
	  	
	  	skey = request.getParameter("keyfield");//�˻��ʵ弱�� value���
		sval = request.getParameter("keyword"); //�˻���Ű���� �Է¶�
		if(skey==null || skey=="" || sval==null || sval==""){
		   skey="bname"; sval="";}
	  	
		returnpage = "&keyfield="+skey+"&keyword="+sval;//�˻�ó��
		
		System.out.println(returnpage+"returnpage ����Ȯ��");
		
	  	pnum = request.getParameter("idx");
		if(pnum==null || pnum==""){pnum="1";}
		
		pageNUM = Integer.parseInt(pnum);//[1]~[10] Ȥ�� ��������ȣ ���ڸ� Ŭ������ ������ 1
		start = (pageNUM-1)*5+1; //=(pageNUM*10)-9
		end = pageNUM*5;
		
		int Stotal = dao.bookCountSearch(skey, sval);
	  	int Gtotal = dao.bookCount();
		
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
		
		List<BookDTO> bk = dao.bookSelect(start, end, skey, sval);//����¡ �˻�
		model.addAttribute("Gtotal", Gtotal);
		model.addAttribute("Stotal", Stotal);
		model.addAttribute("bk", bk);
		model.addAttribute("pageNUM", pageNUM);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("returnpage", returnpage);
		model.addAttribute("sval", sval);
		//model.addAttribute("skey", skey);
		//model.addAttribute("pageNUM", pageNUM);
	    return "bookList";  //WEB-INF/views/guestList.jsp
	}//end
	
	
	@RequestMapping("/bookDetail.do") 
	public String book_detail(Model model, @RequestParam("idx") int idx) {
	 	BookDTO dto = dao.bookDetail(idx);
	 	int cnt = dao.reserveCount(idx);
	 	dao.bookUpdateHit(dto);
		model.addAttribute("dto", dto);  //request�� �ٸ��� ����
		model.addAttribute("cnt", cnt);  //cnt= ����Ǽ�
		return "bookDetail";
	}//end
	
	//ȸ������
	@RequestMapping(value = "/member_register.do")
	public String member_write() {
	  logger.info("guestWrite.do����"); 	
	  return "member_register"; 
	}//end
	
	@RequestMapping("/memberWriteSave.do")
	public String member_insert(BookDTO dto) {
		dao.memberInsert(dto); 
		return "login";
	}//end
	
	@RequestMapping(value = "/id_duplicate.do")
	public String id_duplicate() {
		logger.info("id_duplicate.do ����");
		return "id_duplicate"; 
	}//end
	
	
	@RequestMapping(value = "/id_duplicate_Commit.do")
	public void  idduplicatecommit(BookDTO dto, HttpServletResponse response, HttpServletRequest request , HttpSession session)  throws ServletException, IOException   {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String result = dao.idduplicatecommit(dto);	
		System.out.println("�α�����Ʈ��ó���� ����userid=" + result);
		if(result==null || result=="" ){
			out.println("<div align=center style='margin-top:30px'> <img src='./resources/images/a1.png' width='700'></div>"); 
			out.append("<script>");
			out.append("alert('���̵� �������� �ʽ��ϴ�. ����ϼŵ� �����ϴ�.');");
			out.append("window.close();"); 
		    out.append("</script>");
		    out.flush();
		}	
		else
		{
			out.println("<script language='javascript'>");
			out.println("alert('������� ���̵��Դϴ�. �ٽ� �Է��� �ֽñ� �ٶ��ϴ�.')");
			out.append("location.href='id_duplicate.do';");
			out.println("</script>");
		}
	}//end
	
	@RequestMapping("/bookTopList.do")
	   public String booktop_select(Model model) {
	      List<BookDTO> tp = dao.booktopSelect();
	      model.addAttribute("tp", tp);
	      return "bookTopList";
	}//end
	
	@RequestMapping("/bookNewList.do")
	   public String booknew_select(Model model) {
	      List<BookDTO> nw = dao.booknewSelect();
	      model.addAttribute("nw", nw);
	      return "bookNewList";
	}//end
	
	@RequestMapping(value = "/bookMap.do")
	   public String bookmap() {
	      
	      return "bookMap"; 
	   }//end
	
	
}//class BookController END




