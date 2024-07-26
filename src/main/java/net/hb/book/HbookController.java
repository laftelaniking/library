package net.hb.book;


import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.hb.book.HbookDTO;


@Controller
public class HbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(HbookController.class);
	
	@Autowired
	ServletContext application;
	
	@Autowired
	HbookDAO dao; 
	
	@RequestMapping(value = "/bookHope.do", method = RequestMethod.GET)
	public String bookhope() {
		logger.info("bookHope");	
		return "bookHope";
	}//end

	@RequestMapping("/bookHopeCommit.do")
	public String bookHopeCommit(HbookDTO dto) {
		System.out.println("Èñ¸Áµµ¼­Á¦¸ñ"+dto.hname);
		dao.hopebookInsert(dto); 
	  return "redirect:/hbookList.do";
	}//end
	
	@RequestMapping("/hbookList.do")
	public String HbookSelect(Model model, HttpServletRequest request) {
		 List<HbookDTO> hbk = dao.HbookSelect(); //ÆäÀÌÂ¡+°Ë»ö
		   model.addAttribute("hbk", hbk);
	  
	   return "hbookList";  
	}//end
  
  
}//class  END







