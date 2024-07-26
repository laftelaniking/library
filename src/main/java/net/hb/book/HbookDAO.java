package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.hb.book.HbookDTO;


@Repository
public class HbookDAO { 
	
  @Autowired
  SqlSessionTemplate temp;
	  
	  
  	public void hopebookInsert(HbookDTO dto) {
		temp.insert("hopebook.add", dto);
		System.out.println("DAO hbookInsert(BookDTO) 저장 성공");
	  }//end
  
  
  	public List<HbookDTO> HbookSelect() { //원본
  		 List<HbookDTO> list = temp.selectList("hopebook.selectAll") ;
  		 return list ;
  	  }//end
  	  
  	  
  	 
  	
   
}//class BoardDAO END
