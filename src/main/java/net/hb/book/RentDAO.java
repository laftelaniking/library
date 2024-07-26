package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class RentDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<BookreplyDTO> bookreplySelect(int idx) { //¿øº»
	 List<BookreplyDTO> list = temp.selectList("book_reply.selectAll", idx);
	 return list ;
  }//end
  
  public void reserveInsert(RentDTO dto) {
	temp.insert("rent.add", dto);
  }//end
  

}//class GuestDAO END
