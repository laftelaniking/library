<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Acorn's Library</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="./resources/static/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./resources/static/css/styles.css" rel="stylesheet" /> 
    <!-- 추가 bootstrap carousel-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css"> 
	<!-- bootstrap js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owl.autoplay.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owl.navigation.js"></script>
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



<!-- index 시작 -->
  <header class="masthead">
        <div class="container position-relative">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="text-center text-white">
                        <h2 class="mb-7"> Welcome to Acorn's Library </h2>
                        <h3> MINI PROJECT </h3>
                    </div>
                </div>
            </div>
        </div>
    </header> 
    
    <style>
     #wrapper{
        width: 1500px;
        margin: auto; 
     }
  	</style>
     
     <div id="wrapper" >
        <div class="owl-carousel owl-theme" >
           <div class="item">
              <a href="bookDetail.do?idx=1000"><img src="./resources/images/돈키.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1001"><img src="./resources/images/불변.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1002"><img src="./resources/images/샌드위치.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1003"><img src="./resources/images/이태리.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1004"><img src="./resources/images/읽고 쓰고.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1005"><img src="./resources/images/자본주의.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1006"><img src="./resources/images/창조.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1007"><img src="./resources/images/총균쇠.jpg"></a>
           </div>
           <div class="item">
              <a href="bookDetail.do?idx=1008"><img src="./resources/images/행복.jpg"></a>
           </div>
        </div>
        
     </div>
  
  <script type="text/javascript">
     $(function(){
        $('.owl-carousel').owlCarousel({
           items: 4,
           margin: 50,
           loop: true,
           autoplay: true,
           autoplayTimeout: 3000,
           autoplayHoverPause: true
        });
     });
  </script>



    <!-- !!!!!!!!!!!!!!!!!!!!   자유게시판  !!!!!!!!!!!!!!!!!!!!-->
    <!-- Page Content-->
    <div class="container px-4 px-lg-5">
        <!-- Call to Action-->
        <div class="card text-white bg-primary my-5 py-10 text-center">
            <div class="card-body">
                <a href="boardList.do" class="btn btn-primary btn-lg">자유 게시판</a>
            </div>
        </div>

            <div class="row gx-5 justify-content-center">
                <!-- Pricing card free-->
                <div class="col-lg-6 col-xl-6">
                    <div class="card mb-5 mb-xl-0">
                        <div class="card-body p-10">

                            <div class="mb-3">
                                <span class="display-6 fw"> <i class="bi bi-info-circle-fill text-info"></i> 공지 사항
                                </span>

                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 2024년 서울형 책방 참여 지역서점 모집공고 </strong></li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> [서울야외도서관] 책읽는 서울광장 어린이날 행사 </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> Chat GPT를 활용한 글쓰기 강연 안내 </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 2024년 5월 휴무일 안내 </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 서울청년문화패스 소개 </strong> </li>
                            </ul>
                            <div class="d-grid">
                                <a class="btn btn-outline-primary" href="#">더보기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pricing card pro-->
                <div class="col-lg-6 col-xl-6">
                    <div class="card mb-5 mb-xl-0">
                        <div class="card-body p-10">
                            <div class="mb-3">
                                <span class="display-6 fw"> <i class="bi bi-info-circle-fill text-info"></i> 보도자료
                                </span>
                            </div>
                            <ul class="list-unstyled mb-4">
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 5월 가정의 달, 서울 전역 어린이날 행사 </strong></li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 서울시 도서관발전계획 평가 '우수기관' 선정 </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 책 읽어주는 사서 책으로 자라나는 우리! </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> ‘도서관의 날’ 기념, 「태도의 언어」 김지은 작가 만난다 </strong> </li>
                                <li class="mb-2"><i class="bi bi-check text-primary"></i> <strong> 당신의 서점, 우리 이웃이 모이는 문화공간으로 만들어보세요 </strong> </li>
                            </ul>
                            <div class="d-grid">
                                <a class="btn btn-outline-primary" href="#">더보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- Testimonials-->
	<br> <br>
    <section class="testimonials text-center bg-light">
        <div class="container">
            <h2 class="mb-5">Spring Project 를 함께한 전우</h2>
            <div class="row">
                <div class="col-lg-6">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <h5>KDY</h5>
                        <p class="font-weight-light mb-0">"헬스애호가"</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <h5>YJY</h5>
                        <p class="font-weight-light mb-0">"헬스애호가(예정)"</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <h5>JEJ</h5>
                        <p class="font-weight-light mb-0">"주술회전 제로 두번보세요"</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <h5>KYW</h5>
                        <p class="font-weight-light mb-0">"흥달쌤 사생팬"</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                        <h5>PSJ</h5>
                        <p class="font-weight-light mb-0">"아들천재"</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


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

</body>

</html>