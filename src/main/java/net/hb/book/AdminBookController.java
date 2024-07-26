 package net.hb.book;


import java.io.BufferedReader;
import java.io.File;
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
import net.hb.book.BookDTO;

@Controller
public class AdminBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminBookController.class);
	
	@Autowired
	BookDAO dao;
	ServletContext application;
	
	@RequestMapping(value = "/adminbookWrite.do")
	public String book_write() {
		logger.info("bookWrite.do ¿µ¿ª");
		return "admin_book_add"; 
	}//end
	
	@RequestMapping("/adminbookWriteSave.do")
	public String admin_book_insert(BookDTO dto) {
        dao.adminbookInsert(dto); 
		return "admin_book_add";
	}//end
	
}//class BookController END





