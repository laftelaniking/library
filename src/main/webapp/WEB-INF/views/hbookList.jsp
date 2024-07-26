<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>[List.jsp]</title>
   <style type="text/css">
  	*{font-weight: bold; }
    a{text-decoration:none;   color:blue ;}
    a:hover{font-size: 14pt;  text-decoration:underline; color:green ;  }
     
     #span_rcnt{font-size: 12pt; color:red; }
  </style>
  
  <script type="text/javascript">	
	 function clearText(){
		document.myform.keyword.value="";
		document.myform.keyword.focus();
	 }
  </script>

</head>
<body>
 <font color=blue>[views폴더 guestList.jsp]</font> <br>
    
  <table width="800"  border=1   cellspacing="0">
  	 <tr align="right" height=50>
  	 	<td colspan="4">
  	 		
  	 	    
  	 	 </td>
  	 </tr>
  
     <tr bgcolor=lightgreen height=50>
      <td>도서제목</td> <td>저자</td> 
      <td>출판사</td> <td>가격</td> 
     </tr>
     
   <c:forEach var="dto" items="${hbk}">
     <tr height=20>
        <td>  ${dto.hname} </td>
        <td>  ${dto.hwname} </td>
    	<td>  ${dto.hpublisher} </td>
    	<td>  ${dto.hprice} </td>
     </tr> 
  </c:forEach>
   
  
  	  
  
</table>

 <p>
 <p style="margin-bottom:120px"></p>
</body>
</html>




