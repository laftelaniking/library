package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class BoardDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  public List<BoardDTO> boardSelect() { //원본
	 List<BoardDTO> list = temp.selectList("board.selectAll") ;
	 return list ;
  }//end

  public List<BoardDTO> boardSelect(int start, int end, String skey, String sval) {//페이징+검색
	  	 BoardDTO dto = new BoardDTO();
	  	 dto.setStart(start);
	  	 dto.setEnd(end);
	  	 dto.setSkey(skey);
		 dto.setSval(sval);
		 List<BoardDTO> list = temp.selectList("board.selectAll", dto) ;
		 return list ;
	  }//end
	  
  public int boardCountSearch(String skey, String sval) { //검색개수
	 BoardDTO dto = new BoardDTO();
	 dto.setSkey(skey);
	 dto.setSval(sval);
	 return temp.selectOne("board.countAllSearch", dto);
  	}//end

  public int boardCount() { //전체개수
		 return temp.selectOne("board.countAll");
	  }//end
  
  public void boardInsert(BoardDTO dto) {
  	temp.insert("board.add", dto);
  }//end
  
  public BoardDTO boardDetail(int bnum) {
  	return temp.selectOne("board.detail", bnum);
  }//end
  
  public void boardDelete(int bnum) {
	  temp.delete("board.delete", bnum);
  }//end



}//class GuestDAO END
