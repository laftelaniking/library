<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Acorn's Library</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./resources/static/css/styles2.css" rel="stylesheet" />
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
    	<div class="row gx-4 gx-lg-5 align-items-center my-5">
            <div class="col-lg-7"><img src="./resources/images/library.jpg" width="600" /></div>
            <div class="col-lg-5">
                <h1 class="font-weight-light">Acorn's Library<br /> My Page</h1>
                <p>
                <%=id %>님 안녕하세요! <br /> 
                <%=id %>님의 행복한 하루를 기원합니다.<br /> <br /> 
                저희 도서관은 정상 반납한 횟수와 연체 반납 횟수를 종합해 계산하여 회원님이 대여하실 수 있는 도서의 권수를 조정해드립니다.
                </p>
            </div>
        </div>
	    
        <!-- Heading Row-->

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">대여 도서</h1>


                    <div class="card mb-4">
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>해당 도서 제목</th>
                                        <th>대여 날짜</th>
                                        <th>반납 만기 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="checkOutDTO" items="${checkOutList}">
                                        <tr>
                                            <td>${checkOutDTO.checkOutTitle}</td>
                                            <td>${checkOutDTO.checkOutRentalDate}</td>
                                            <td>${checkOutDTO.checkOutReturnDueDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="row gx-5 justify-content-center">
                <!-- 예매-->
                <div class="col-lg-6 col-xl-6">
                    <div class="card mb-5 mb-xl-0">
                        <div class="card-body p-10">

                           <div class="mb-3">
                                <span class="display-4 fw-bold"> 예매도서
                                </span>
								<hr>
                            </div>
                            
                            
                            <form>
								<label for="inputReturnEmail">
								</label>	
								
								
                                  <c:forEach var="dto" items="${mrlist}">
									<h3 class="display-5 fw-bolder">${dto.bname}</h3>
									<p class="lead">
										저자 : ${dto.wname}<br /> 출판사 : ${dto.publisher}<br /> 
									</p>								
                               	  </c:forEach>
                            </form>
                            
                        </div>
                    </div>
                </div>
                <!-- 연장 -->
                <div class="col-lg-6 col-xl-6">
                    <div class="card mb-5 mb-xl-0">
                        <div class="card-body p-10">

                            <div class="mb-3">
                                <span class="display-4 fw-bold"> 희망도서
                                </span>
								<hr>
                            </div>
                            
                            <form>
								<label for="inputReturnEmail">
								</label>	
                                  <c:forEach var="dto" items="${mhlist}">
									<h3 class="display-5 fw-bolder">${dto.hname}</h3>
									<p class="lead">
										저자 : ${dto.hwname}<br /> 출판사 : ${dto.hpublisher}<br /> 가격 : ${dto.hprice}<br />
									</p>								
                               	  </c:forEach>
                            </form>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
                
                

            </main>


            <!-- 안 예뻐 ...-->
            <!-- Footer-->
            <footer class="footer bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                            <ul class="list-inline mb-2">
                                <li class="list-inline-item"><a href="#!">About</a></li>
                            </ul>
                            <p class="text-muted small mb-4 mb-lg-0">&copy; MinGW's Library 2021. All Rights Reserved.</p>
                        </div>
                        <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item me-4">
                                    <a href="#!"><i class="bi-facebook fs-3"></i></a>
                                </li>
                                <li class="list-inline-item me-4">
                                    <a href="#!"><i class="bi-twitter fs-3"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#!"><i class="bi-instagram fs-3"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <!-- <script src="js/scripts.js"></script> -->
            <!--    회원 정의 추가용-->
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
        </div>
    </div>


</body>

</html>