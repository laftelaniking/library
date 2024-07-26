<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
  
  <style type="text/css">
  table {
		box-sizing:border-box;
		outline:none;	/*focus했을때 테두리 나오게 */
		font-family:'Noto Sans KR', sans-serif;
		font-size:14px;
		background-color:#f5f6f7;
		line-height:1.5em;
		color:#222;
		margin:0;
	}
	
	.joinform {
		width:400px;
		margin:auto;	/*가운데 정렬*/
		padding:0 20px;
		margin-bottom:20px;
	}
	
	.joinform .field {
		margin:5px 0;
		margin-bottom: 10px;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: left;
	}
	
	.joinform b {
		display:block;	/*수직 정렬*/
		margin-bottom:5px;
	}
	
	.joinform input[type=button] {
		background-color:DarkRed;
		color:#fff;	
	}
	
	.joinform input:focus {
		border:1px solid DarkRed;
	}

  text1{font-size:13pt;
          }
    
  input[type=text]{padding-left:10px;
                     width:330px;
                     height:37px;
                     border-radius:15px;}
    
  #btn1 {
  	width:100px;
  	height:35px;
 	  padding: 1px 2px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  color: White;
	  background: #a29bd5;
  }

  #btn2 {
  	width:100px;
  	height:35px;
 	  padding: 1px 2px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  color: White;
	  background: red;
  }

  #btn3 {
   	width:100px;
  	height:35px;
  	border-radius: 0.3rem;
  	padding: 1px 2px;
	  border: 0 none;
	  border-radius: 0.3rem;
	  font-weight: bold;
	 
  }
    
   
  </style>
   <link href="./resources/css/style.css" rel="stylesheet" />  
  
</head>

<body >
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
  <br>
   <div align="center">
 <font color=yellowgreen size="15"><b>희망도서 신청</b></font> 
 </div>
 <br>

<table>
  <div class="joinform">
  <form action="bookHopeCommit.do" >
  
  <div class="field">
  <b><text1>도서 제목</text1></b>
       <input type="text" name="hname" placeholder="도서 제목 입력" > <br>
  </div>
      
      <div class="field">
      <b><text1>저자</text1></b>
       <input type="text" name="hwname" placeholder="저자 입력"> <br>
      </div>
      
      <div class="field">
      <b><text1>출판사</text1></b>
      <input type="text" name="hpublisher" placeholder="출판사 입력" > <br>
      </div>
      
      <div class="field">
      <b><text1>가격</text1></b>
       <input type="text" name="hprice"  placeholder="가격 입력"> <br>
       </div>
       
        <div class="field">
      <b><text1></text1></b>
       <input type="hidden" name="hid"  placeholder="작성자" value="<%=id %>"> <br>
       </div>
       
       <div align="center">
      <input type="submit" id="btn2" value="희망도서 저장">
     
      
      
      <input type="reset"  id="btn1" value="입력취소">
      </div>
  </form>  
  </div>
  </table>
  
  
  


</body>
</html>
