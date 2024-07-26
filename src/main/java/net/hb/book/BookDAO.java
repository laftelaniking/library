package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class BookDAO {
	
  @Autowired
  SqlSessionTemplate temp;
  
  
  public void bookInsert(BookDTO dto) {
	temp.insert("book.add", dto);
	System.out.println("DAO bookInsert(BookDTO) ���� ����");
  }//end
  
  public List<BookDTO> booktopSelect() { //�α⵵��
		 List<BookDTO> list = temp.selectList("book.selectAlltop") ;
		 return list ;
	  }//end
	  
  public List<BookDTO> booknewSelect() { //�űԵ���
		 List<BookDTO> list = temp.selectList("book.selectAllnew") ;
		 return list ;
	  }//end

  public List<BookDTO> bookSelect(int start, int end, String skey, String sval) {//����¡+�˻�
	  	 BookDTO dto = new BookDTO();
	  	 dto.setStart(start);
	  	 dto.setEnd(end);
	  	 dto.setSkey(skey);
		 dto.setSval(sval);
		 List<BookDTO> list = temp.selectList("book.selectAll", dto) ;
		 return list ;
	  }//end
	  
  public int bookCountSearch(String skey, String sval) { //�˻�����
	 BookDTO dto = new BookDTO();
	 dto.setSkey(skey);
	 dto.setSval(sval);
	 return temp.selectOne("book.countAllSearch", dto);
  	}//end

  public int bookCount() { //��ü����
		 return temp.selectOne("book.countAll");
	  }//end
  
  public int reserveCount(int data) {
	  return temp.selectOne("book.reserveCountALL", data);
  }//end
  
 
  public BookDTO bookDetail(int data) {
	  	 BookDTO dto = temp.selectOne("book.detail", data) ;
		 return dto ;
	  }//end
  
  //ȸ������
  public void memberInsert(BookDTO dto) {
		temp.insert("book.insert", dto); // book=namespace, insert=id
		System.out.println("DAO memberInsert(BookDTO) ���� ����");
	  }//end

  public String idduplicatecommit(BookDTO dto){
		String dtoRest=temp.selectOne("book.idduplicate",dto);
		return  dtoRest;
	 }//end

  public void bookUpdateHit(BookDTO dto) {//��ȸ��
		temp.update("book.updateHit", dto);
	  }//end

  public void adminbookInsert(BookDTO dto) {
		temp.insert("book.admin_insert", dto); // book=namespace, insert=id
		System.out.println("DAO memberInsert(BookDTO) ���� ����");
     }//end

}//class GuestDAO END
