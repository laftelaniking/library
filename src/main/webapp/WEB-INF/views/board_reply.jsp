<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

   //댓글수정
   function re_edit(num, content, id){//댓글수정 <a href=# onclick="re_edit(1,2,3)">
  	 reply_form.bt_save.value = "댓글수정";
  	 alert("aa " + content );
  	 reply_form.dnum.value = num ;
 	 reply_form.dcontent.value = content ; 
  	 reply_form.bid.value = id ;

   }//end
   
   //댓글저장   임시 책코드 1234
   function re_save(bnum){
 	  var bt = reply_form.bt_save.value ;
 	  alert(bt + " 버튼이름");
 	  var dcontent = reply_form.dcontent.value ;
 	  var bid = reply_form.bid.value ; 
 	  var dnum = reply_form.dnum.value ; 
 	  var bnum = reply_form.bnum.value ; 
 	  
 	  if(bt=="댓글저장"){
  		if( bid=="" || bid==null || dcontent=="" || dcontent==null ){
  			alert("저자와 내용을 입력해주세요")
  			return;
  		}	
        var msg="boardreply_insert.do?bid="+bid+"&dcontent="+dcontent+"&bnum="+bnum;		  
 		 document.reply_form.action=msg; 
 		 document.reply_form.method="get";
 		 document.reply_form.submit();  
 		alert("댓글이 등록되었습니다")
 	  }else if(bt=="댓글수정"){
 		 alert(" dnum " + dnum + " bnum " + bnum + " dcontent " + dcontent + " bid " + bid);
 		 reply_form.bt_save.value="댓글저장";
 		alert(" dnum " + dnum + " bnum " + bnum + " dcontent " + dcontent + " bid " + bid);
 		 var msg="boardreply_update.do?bnum="+bnum+"&bid="+bid+"&dcontent="+dcontent+"&dnum="+dnum;		  
 		 document.reply_form.action=msg;
 		 document.reply_form.method="get";
 		 document.reply_form.submit();  //<input type=submit>  
 	  }
    }//end
</script>
</head>

<body>
    <!-- Responsive navbar-->

           			<%
					String id = (String) session.getAttribute("book"); // Object 타입이므로 다운캐스팅
					if (id == null){%>
       
                    <%}else{%>
             
                    <%}	%>
		
        <div class="container mt-5">         
            <div class="row">
                <div class="col-lg-8">                   

                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">

                  
                  
                   
		
					
					 <%if (id == null){%>

                    <%}else{%>
             				       						<!-- 							댓글 추가 창 -->
                                <div class="mb-3">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="text-center font-weight-light my-2">댓글</h3>
                                        </div>
                                        <div class="card-body">
                                        
                                            <form name="reply_form" action="boardreply_insert.do" >
                                            
			                                        <input type="hidden" name="dnum" value="1">
			                                        <input type="hidden" name="bnum" value="${bnum}">
                                                
                                              <div class="form-group">
                                                  <textarea class="form-control" id="inputCommentContent" placeholder="댓글을 입력해주세요." rows="3" name="dcontent"></textarea>
                                              </div>
                                              <div id="inputCommentContentCount">(0 / 1000)</div>
																								<input type="hidden" name="bid" value="<%=id %>">
												
                                              <div class="mt-4 mb-0">
                                              <div class="d-grid">
                                               	<input type="button" id="bt_save" name="bt_save" class="btn btn-primary btn-block" onClick="re_save(${bnum});" value="댓글저장"/>
                                              </div>
                                              </div>
                                              
                                            </form>
                                        </div>
                                    </div>
                                </div>
             
                    <%}%>
			
                                

                                <!--                             댓글 나오는 창-->
                                <c:forEach var="dto" items="${BN}">
                                <div class="d-flex mb-4 ">
                                    <!-- Parent comment-->
                                    <div class="ms-3">
                                        <div class="fw-bold">${dto.bid}</div>
                                        ${dto.dcontent}
                                    </div>
                                    <td align="right"> 
             		<%if (id == null){
             		
             		}else{
             		%>
							       		<a href="#" onclick="re_edit('${dto.dnum}','${dto.dcontent}','${dto.bid}')"> [댓글수정]</a>
							       		<a href="#" onclick="location.href='boardreply_delete.do?Ridx=${dto.dnum}&idx=${dto.bnum}'"> [댓글삭제] </a>  &nbsp;&nbsp; 
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
        </div>

        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    
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
        <!-- <!-- Bootstrap core JS 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	Core theme JS <script type="text/javascript"
		src="js/scripts.js"></script>    사용자 정의 추가용 <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
	   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />

	       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	<script src="/js/scripts.js"></script> <script src="/js/dataTables.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>  -->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script> <!--    회원 정의 추가용-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>-->
        <!--    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css" rel="stylesheet" />-->

        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">-->
        <!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="./resources/static/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/dataTables.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.1.8/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </c>
</body>

</html>
