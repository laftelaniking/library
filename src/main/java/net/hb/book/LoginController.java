package net.hb.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
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
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginDAO  dao ; 
	
	 @RequestMapping("/login.do")
	 public String login() { 
	    return "login";    
	 }//end
	
	 
	@RequestMapping(value = "/loginCommit.do")
	public String  loginprocess(LoginDTO dto, HttpServletResponse response, HttpServletRequest request , HttpSession session)  throws ServletException, IOException   {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("\n�α�����Ʈ��ó���� �Ѿ��userid=" + dto.getUserid() );
		System.out.println("�α�����Ʈ��ó���� �Ѿ��pwd=" + dto.getPwd());
		
		String result = dao.login(dto);	
		System.out.println("�α�����Ʈ��ó���� ����userid=" + result);
		if(result==null || result=="" ){
			out.println("<div align=center style='margin-top:30px'> <img src='./resources/images/a1.png' width='700'></div>"); 
			out.append("<script>");
			out.append("alert('���̵� ��й�ȣ�� ��ġ�����ʽ��ϴ�');");
			out.append("location.href='loginWrite.do';"); 
		    out.append("</script>");
		    out.flush();
		}	
		
		session.setAttribute("book",result ); 
		System.out.println("LoginController���� �����̸�=book");
		
	    out.println("<script language='javascript'>");
	    out.println("alert('�α����� �����߽��ϴ�');");
	    out.println("location.href ='"+request.getParameter("from")+"'");
	    out.println("</script>");
	    
	    return "redirect:/index.jsp";
	}//end

	
   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
	  session.invalidate(); //session null 
	  return "redirect:/index.jsp"; 
   }//end
	
   @RequestMapping("/mypage.do")
   public String myPage(Model model, @RequestParam("idx") String idx) {
	 System.out.println(" ����������    "+idx);
	 List<LoginDTO> mhlist = dao.hopebooks(idx);
	 List<LoginDTO> mrlist = dao.reservebooks(idx);
	 
	 System.out.println(mhlist);
	 System.out.println(mrlist);
	 model.addAttribute("mhlist", mhlist);
	 model.addAttribute("mrlist", mrlist);
  	 return "mypage";
   }
}//class LoginController END






