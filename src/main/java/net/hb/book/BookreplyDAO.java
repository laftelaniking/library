package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class BookreplyDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<BookreplyDTO> bookreplySelect(int idx) { //¿øº»
	 List<BookreplyDTO> list = temp.selectList("book_reply.selectAll", idx);
	 return list ;
  }//end
  
  public void brInsert(BookreplyDTO dto) {
	temp.insert("book_reply.add", dto);
  }//end
  
  public void brDelete(int data) {
	 temp.delete("book_reply.delete", data);
  }//end

  public void brUpdate(BookreplyDTO dto) {
	temp.update("book_reply.update", dto);
  }//end
}//class GuestDAO END
