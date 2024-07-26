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
public class BoardreplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardreplyController.class);
	
	@Autowired
	BoardreplyDAO dao;
	
	@RequestMapping("/board_reply.do")  //idx�� å�ڵ�bcode  ������ list�� �����ϱ� ���Ƿ� ����
	public String board_replySelect(Model model, @RequestParam("boardNUM") int boardNUM) {  
		
		List<BoardreplyDTO> BN = dao.boardreplySelect(boardNUM);   
		
		model.addAttribute("bnum", boardNUM);
		model.addAttribute("BN", BN);
	    return "board_reply";
	}//end
	
	@RequestMapping("/boardreply_insert.do")
	public String board_replyInsert(BoardreplyDTO dto) {
		dao.brInsert(dto);
		
		return "redirect:/boardDetail.do?boardNUM=" + dto.getBnum();   //���߿� ������ �� idx�� dto.getBcode(); �־����
	}//end
	
	@RequestMapping(value="/boardreply_delete.do")
	public String board_replyDelete(@RequestParam("Ridx") int Ridx, @RequestParam("idx") int idx ) { //Ridx=num, idx=bcode
		
		dao.brDelete(Ridx);
	  return "redirect:/boardDetail.do?boardNUM="+idx;
	}//end
	
	@RequestMapping(value="/boardreply_update.do", method=RequestMethod.GET)
	public String board_replyUpdate(BoardreplyDTO dto) { //Ridx=num
		System.out.println("dnum " + dto.dnum );
		System.out.println("bnum " + dto.bnum );
		dao.brUpdate(dto);
		logger.info("�Խ��� ���");
		return "redirect:/boardDetail.do?boardNUM="+dto.getBnum();
	}//end
	
}//class BookController END




