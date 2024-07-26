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
public class RentController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentController.class);
	
	@Autowired
	RentDAO dao;
	
	@RequestMapping("/memberDetail.do") 
	public String member_detail(Model model) {
		logger.info("RentController ");
	 	//BookDTO dto = dao.bookDetail(idx);
	 	//int cnt = dao.reserveCount(idx);
	 	
		//model.addAttribute("dto", dto);  //request랑 다를게 없다
		//model.addAttribute("cnt", cnt);
		return "memberDetail";
	}//end
	
	@RequestMapping("/reserveBook_Insert.do") 
	public String reserve_insert(Model model, RentDTO dto){
		System.out.println(dto.id);
		dao.reserveInsert(dto);
		return "redirect:/bookDetail.do?idx="+dto.bcode;
	}
}//class BookController END




