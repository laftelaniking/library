<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<title>Acorn's Library</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/static/css/styles.css" rel="stylesheet" />

<script>
	function save(cnt){
		alert("대출예약에 성공하셨습니다")
		alert("대출예약이 완료되었습니다. (예약순번: "+cnt+"번)")
	}
</script>
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
    
 <!-- Product section-->

		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="./resources/${dto.poster}" alt="..." />
					</div>
					<div class="col-md-6">
						<div class="small mb-1">${dto.genre}</div>
						<h1 class="display-5 fw-bolder">${dto.bname}</h1>
						<div class="fs-5 mb-5">
							<span class="">도서 재고 : </span> <span>${dto.bookcount}</span>
						</div>
						<p class="lead">
							저자 : ${dto.wname}<br /> 출판사 : ${dto.publisher}<br />${dto.booksummary}
						</p>
						<div class="d-flex">
						
						<%
							//대여는 무조건 로그인 했을 때만 떠라!
							if (id != null){%>
							
							<a href="reserveBook_Insert.do?bcode=${dto.bcode}&id=<%=id %>" >
								<input type="button" onclick="save(${cnt})" value="예약하기"  class="btn btn-outline-dark flex-shrink-0">
							</a> 	
								
						
							<%}
						%>
							<!-- <input class="btn btn-outline-dark flex-shrink-0" type="submit" value="대여하기" /> -->
							<!-- 이거 작은 카트 모양 이미지인데 input 태그 안에 어떻게 넣는지 모르겠어용 -->
							<!-- <i class="bi-cart-fill me-1"></i> 대여 하기 </input> -->
						</div>
					</div>
				</div>
			</div>
		</section>
  
    


<c:import url="/book_reply.do" />

<p style="margin-bottom:70px"></p>

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