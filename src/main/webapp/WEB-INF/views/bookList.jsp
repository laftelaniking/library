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
<title>Acorn's Library</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/static/css/styles2.css" rel="stylesheet" />
<style type="text/css">
	table, th, td {
  border: 1px solid lightgray;
}
</style>
</head>

<body>
        <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg bg-light static-top ">
        <div class="container px-5">
        			<%
					// 세션값 가져오기
					String id = (String) session.getAttribute("book"); // Object 타입이므로 다운캐스팅
					if (id == null){%>
                    <a class="navbar-brand" href="index.jsp">Acorn's Library</a>
                    <%}else{%>
                    <a class="navbar-brand" href="index.jsp">Acorn's Library</a>
                    <%}
					%>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <%
					// 세션값 가져오기
					if (id == null){%>
                    <li class="nav-item"><a class="nav-link" href="member_register.do">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
                    <%}else{%>
                    <li class="nav-item"><a class="nav-link" href="mypage.do?idx=<%=id %>">MyPage</a></li>
                    <li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
                    <%}
					%>

                </ul>
            </div>
        </div>
    </nav>
    <!-- Navigation-->
    <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
        <div class="container">
            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    도서 리스트
                </a>
                
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="bookList.do">전체 도서</a>
                    <a class="dropdown-item" href="bookTopList.do">인기 도서</a>
                    <a class="dropdown-item" href="bookNewList.do">신간 도서</a>
                </div>
            </div>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    신청 / 참여
                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <%
						// 세션값 가져오기
						if (id == null){%>
                    <a class="dropdown-item disabled" href="bookHope.do">희망 도서 신청</a>
                    <a class="dropdown-item" href="boardList.do">자유 게시판</a>
                    <%}else{%>
                    <a class="dropdown-item" href="bookHope.do">희망 도서 신청</a>
                    <a class="dropdown-item" href="boardList.do">자유 게시판</a>
                    <%}
					%>
                </div>
            </div>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    도서관 이용
                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">사서 추천 도서</a>
                    <a class="dropdown-item" href="#">신간 도서</a>
                </div>
            </div>

            <div class="dropdown show">
                <a class="btn dropdown-toggle" style="background-color: #e3f2fd; color: dodgerblue;" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    도서관 정보
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="bookMap.do">도서관 소개</a>
                    <a class="dropdown-item" href="#">공지 사항</a>
                </div>
            </div>
        </div>
    </nav>
    <!-- 위쪽 공통된 부분 -->
    
    
 <!-- Page Content-->
  <div class="container px-4 px-lg-5">
		<!-- Heading Row-->
	
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">도서 검색</h1>
					
		<!-- 검색창 -->
	     <form name="myform" action="bookList.do">
	  	  	  검색 :     
	  	  	 <select name="keyfield" onchange="clearText();">  
	  	  	 	<option value="">-----선택하세요----- </option>
	 	  	 	<option value="bname" <c:if test="${skey=='bname'}"> selected </c:if>> 책이름 </option>
	 	  	 	<option value="wname" <c:if test="${skey=='wname'}"> selected </c:if>> 저자 </option>
	 	  	 	<option value="genre" <c:if test="${skey=='genre'}"> selected </c:if>> 장르 </option>
	  	  	 </select>
	  	  	 <input type="text" name="keyword" size=10 value="${sval}">
	  	  	 <input type="submit" value="검색">
	  	 </form>
	  	  
	  <!-- <div class="card mb-4"> -->
	  	  
	  	<div class="card-body">
					  <table id="datatablesSimple" width="1000"  border=1   cellspacing="0">
					  	<thead>
					  	 <tr align="right" height=50>
					  	 	<td colspan="7"> 총 ${Stotal} 권 검색되었습니다.&nbsp;  </td>
					  	 </tr>
					     <tr>
						   	 <td>번호</td> <td>책</td> <td>제목</td>
      						 <td>저자</td> <td>출판사</td> <td>장르</td> <td>조회수</td>
					     </tr>
					    </thead>
		    
					    <tbody>
						    <c:forEach var="dto" items="${bk}">
							     <tr height=20>
							    	 <td>  ${dto.rn} </td>
							    	 <td align="center">
							    	  <a href="bookDetail.do?idx=${dto.bcode}"><img src ='./resources/${dto.poster}' width="150" height="200" border=0> </a>
							    	 </td>     
							    	 <td>  ${dto.bname} </td>
							    	 <td>  ${dto.wname} </td>
							    	 <td>  ${dto.publisher} </td>
							    	 <td>  ${dto.genre} </td>
    								 <td>  ${dto.hit} </td>
							     </tr> 
						    </c:forEach>
					   	</tbody>
		   
						   <tfoot>
						    <tr align="center">
						  	 <td colspan="7">
							  	  <!-- 이전 -->
								  	 <c:if test="${startpage>5}">
								  	 	<a href="bookList.do?idx=${endpage-5}${returnpage}">[prev]</a>
								  	 </c:if>
				  	 
							  	  <!-- 페이징 -->
							  	  <c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
							  	  <c:choose>
							  	  	<c:when test="${i==pageNUM}"><font style='color:darkred; font-weight:bold; font-size:14pt'>[${i}]</font></c:when>
							  	  	<c:otherwise><a href="bookList.do?idx=${i}${returnpage}">[${i}]</a></c:otherwise>
							  	  </c:choose>	
							  	  </c:forEach>
							  	  
							  	  <!-- 다음 -->
							  	 <c:if test="${endpage<pagecount}">
							  	 	<a href="bookList.do?idx=${startpage+5}${returnpage}">[next]</a>
							  	 </c:if>
			     			</td>
			    		</tr>
			   	  </tfoot>  
		  		</table>
				</div>
	  	</div>
	  </div>
	   </div>
	  
	  </main>
	  	
		<!-- Footer-->
	    <footer class="footer bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item"><a href="#!">도서관 소개</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">오시는 길</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">개인정보처리방침</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">영상정보처리기기 운영·관리 방침</a></li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; Acorn's Library 2024. All Rights Reserved.</p>
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
	
				<!-- Bootstrap core JS-->
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
				<!-- Core theme JS-->
				<script src="./resources/static/js/scripts.js"></script>
				<!--    회원 정의 추가용-->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
				<script
					src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"></script>
	
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
					crossorigin="anonymous"></script>
				<script src="js/scripts.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
					crossorigin="anonymous"></script>
				<script src="./resources/static/js/dataTables.js"></script>
			</div>
	</div>

</body>

</html>




