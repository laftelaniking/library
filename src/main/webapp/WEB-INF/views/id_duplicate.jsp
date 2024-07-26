<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> testID.jsp </title>

<script type="text/javascript">
   opener.document.getElementById('dupli_num').value = '1';

   function first() {
	  //document.subform.userid.focus();	
	  document.subform.btn.focus();	
   }//first( )end
</script>
</head>
<body bgcolor="lightblue" onload="first()">
  
 <% 
   String data = request.getParameter("idx") ; 
   //testIDSave.jsp단독실행에러 참고용 test테이블꺼라서
 %>

  <div align="center">
  <h2> ID 중복확인 </h2>
	<form name="subform" action="id_duplicate_Commit.do">
	  아이디: 
	    <input type=text   name="id"  value="<%=data%>" >
	    <input type=submit name="btn"  value="확인" > 
	</form>
  </div>
</body>
</html>




















