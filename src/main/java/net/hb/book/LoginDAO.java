package net.hb.book;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class LoginDAO {

 @Autowired
 SqlSessionTemplate temp;
	
 public List<LoginDTO> dbSelect( ){
	  List<LoginDTO> list=temp.selectList("login.selectAll");
	  return list;
 }//end
 
 public String login(LoginDTO dto){
	String dtoRest=temp.selectOne("login.selectDetail",dto);
	return  dtoRest;
 }//end
 
 public List<LoginDTO> hopebooks(String idx) {
	 List<LoginDTO> list = temp.selectList("login.hbookselectAll", idx);
	 return list;
 }//end

 public List<LoginDTO> reservebooks(String idx) {
	 List<LoginDTO> list = temp.selectList("login.rbookselectAll", idx);
	 return list;
 }//end 
}//LoginDAO end
