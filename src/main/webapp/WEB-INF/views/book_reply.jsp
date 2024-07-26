<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MINGW's Library</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/static/css/styles2.css" rel="stylesheet" />
<script>
   var gnum ; //전역변수
   var gflag = false; //전역변수

   //댓글수정
   function re_edit(num, id, content){//댓글수정 <a href=# onclick="re_edit(1,2,3)">
  	 reply_form.bt_save.value = "댓글수정";
  	 reply_form.num.value = num ;
  	 reply_form.id.value = id ;
  	 reply_form.content.value = content ; 

   }//end
   
   //댓글저장   임시 책코드 1234
   function re_save(code){
 	  var bt = reply_form.bt_save.value ;
 	  alert(bt + " 댓글 댓글");
 	  var num = reply_form.num.value ;
 	  var id = reply_form.id.value ;
 	  var content = reply_form.content.value ; 
 	  alert(bt + " " + num + " " + id + " " + content + " " + code);
 	  if(bt=="댓글저장"){
  	if( id=="" || id==null || content=="" || content==null ){
  			alert("저자와 내용을 입력해주세요")
  			return;
  	}	
        var msg="bookreply_insert.do?id="+id+"&content="+content+"&bcode="+code;		  
 		 document.reply_form.action=msg; 
 		 document.reply_form.method="get";
 		 document.reply_form.submit();  
 		alert("댓글이 등록되었습니다")
 	  }else if(bt=="댓글수정"){
 		 reply_form.bt_save.value="댓글저장";
 		alert(" num " + num + " id " + id + " content " + content + " bcode " + code);
 		 var msg="bookreply_update.do?num="+num+"&id="+id+"&content="+content+"&bcode="+code;		  
 		 document.reply_form.action=msg;
 		 document.reply_form.method="get";
 		 document.reply_form.submit();  //<input type=submit>  
 	  }
    }//end
</script>
</head>

<!--         boardreply에 있던 내용           -->


<body >
    <!-- Responsive navbar-->

		
        <div class="container mt-5" >         
            <div class="row" >
                <div class="col-lg-8" >                   

                    <!-- Comments section-->
                    <section class="mb-5" >
                        <div class="card bg-light">

                  
										 <%
										 String id = (String) session.getAttribute("book");
										 if (id == null){
										 %>
                    <%}else{%>
             				       						<!-- 							댓글 추가 창 -->
                                <div class="mb-3">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="text-center font-weight-light my-2">댓글</h3>
                                        </div>
                                        <div class="card-body" >
                                        
                                            <form name="reply_form" action="bookreply_insert.do" >
                                            
		                                        	<input type="hidden" name="bcode" value="${dto.bcode}" size=30 readonly> </td>
		                                        	
                                              <div class="form-group">
                                              	<textarea class="form-control" id="inputCommentContent" placeholder="댓글을 입력해주세요." rows="3"  name="content"></textarea>
                                              </div>
                                              
                                              <div id="inputCommentContentCount">(0 / 1000)</div>
																								<input type="hidden" name="id" value="<%=id %>" size=30> </td>
													                      <input type="hidden" name="num" value="1" size=30>
                                              <div class="mt-4 mb-0">
                                              
                                              <div class="d-grid">
                                              	<input type="button" id="bt_save" name="bt_save" onClick="re_save(${dto.bcode});" value="댓글저장">
                                              </div>
                                              </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
             
                    <%}%>
			
                                

                                <!--                             댓글 나오는 창-->
                                 <c:forEach var="rdto" items="${BR}">
                                		<div class="d-flex mb-4 ">
                                    
	                                    <div class="ms-3">
		                                    <div class="fw-bold">${rdto.id}</div>
		                                    ${rdto.content}
	                                    </div>
                                    <td align="right"> 
								             		<%if (id == null){
								             		
								             		}else{
								             		%>
												       			<a href="#" onclick="re_edit('${rdto.num}','${rdto.id}','${rdto.content}')"> [댓글수정]</a>
					       										<a href="#" onclick="location.href='bookreply_delete.do?Ridx=${rdto.num}&idx=${rdto.bcode}'"> [댓글삭제] </a>  &nbsp;&nbsp;  
															<%}%>
							   										</td>
                                	</div>
                                </c:forEach>
                                <!-- Single comment-->
                            </div>
                        </div>
                    </section>

                </div>

            </div>
        

        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                        <ul class="list-inline mb-2">
                            <li class="list-inline-item"><a href="#!">About</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Contact</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
                            2021. All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item me-4"><a href="#!"><i class="bi-facebook fs-3"></i></a></li>
                            <li class="list-inline-item me-4"><a href="#!"><i class="bi-twitter fs-3"></i></a></li>
                            <li class="list-inline-item"><a href="#!"><i class="bi-instagram fs-3"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>





<!-- 원래 bookreply에 있던 내용     -->


    <!-- 댓글 나오는 창-->
  <c:forEach var="rdto" items="${BR}">
    <tr>
   		<td width=250>  ${rdto.name}   </td>
   		<td width=250>  ${rdto.content}   </td>
   		<td align="right"> 
   		<%if (id == null){
             		
             		}else{
             		%>
       		<a href="#" onclick="re_edit('${rdto.num}','${rdto.id}','${rdto.content}')"> [댓글수정]</a>
       		<a href="#" onclick="location.href='bookreply_delete.do?Ridx=${rdto.num}&idx=${rdto.bcode}'"> [댓글삭제] </a>  &nbsp;&nbsp; 
       	<% } %>
				   		</td>
                                </div>
                                </c:forEach>
                                <!-- Single comment-->
                            </div>
                        </div>
                    </section>

                </div>

            </div>
        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/static/js/scripts.js"></script> <!--    회원 정의 추가용-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>-->
        <!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />-->

        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">-->
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/dataTables.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.1.8/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </c>
</body>

</html>




