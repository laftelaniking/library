package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class BoardreplyDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<BoardreplyDTO> boardreplySelect(int boardNUM) { //¿øº»
	 List<BoardreplyDTO> list = temp.selectList("board_reply.selectAll", boardNUM);
	 return list ;
  }//end
  
  public void brInsert(BoardreplyDTO dto) {
	temp.insert("board_reply.add", dto);
  }//end
  
  public void brDelete(int data) {
	 temp.delete("board_reply.delete", data);
  }//end
  
  public void brUpdate(BoardreplyDTO dto) {
		temp.update("board_reply.update", dto);
	  }//end
}//class GuestDAO END
