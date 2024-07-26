package net.hb.book;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BookreplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookreplyController.class);
	
	@Autowired
	BookreplyDAO dao;
	
	@RequestMapping("/book_reply.do")  //idx�� å�ڵ�bcode  ������ list�� �����ϱ� ���Ƿ� ����
	public String book_replySelect(Model model, @RequestParam("idx") int idx) {  
		List<BookreplyDTO> BR = dao.bookreplySelect(idx);   
		model.addAttribute("BR", BR);
	    return "book_reply";
	}//end
	
	@RequestMapping("/bookreply_insert.do")
	public String book_replyInsert(BookreplyDTO dto) {
		dao.brInsert(dto);
		System.out.println("���޵� å�ڵ� " + dto.bcode);
		return "redirect:/bookDetail.do?idx=" + dto.getBcode();   //���߿� ������ �� idx�� dto.getBcode(); �־����
	}//end
	
	@RequestMapping(value="/bookreply_update.do", method=RequestMethod.GET)
	public String book_replyUpdate(BookreplyDTO dto) { //Ridx=num
		logger.info("������Ʈ " + dto.bcode + " num " + dto.num + " id " + dto.id);
		dao.brUpdate(dto);
		logger.info("������Ʈ123 ");
		return "redirect:/bookDetail.do?idx=" + dto.getBcode();
	}//end
	
	@RequestMapping(value="/bookreply_delete.do", method=RequestMethod.GET)
	public String book_replyDelete(@RequestParam("Ridx") int Ridx, @RequestParam("idx") int idx ) { //Ridx=num, idx=bcode
	  dao.brDelete(Ridx);
	  return "redirect:/bookDetail.do?idx="+idx;
	}//end
	
}//class BookController END




