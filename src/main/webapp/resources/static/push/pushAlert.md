## PUSH 목록

2020-05-31:
  * databasesTable.md - 추천 도서 테이블 sql
  * admin_alarm_good_add, delete.jsp - 추천 도서 목록 출력, 도서 목록 출력
  * AdminGoodController.java - 추천 도서 추가, 삭제
  * GoodDAO.java - 추천 도서 추가, 삭제
  * GoodDTO.java - 추천 도서 DTO
  * GoodService - 추천 도서 추가, 삭제
  * CheckOutDTO.java - 대여 도서 DTO
  * AdminController.java - 주석 처리
  * MemberDAO.java - 모든/블랙리스트 회원 조회 기능
  * MemberDTO.java - Getter/Setter 추가
  * admin_member_show.jsp - 회원 목록 조회, 블랙리스트 회원 조회 페이지로 가는 링크 수정
  * AdminMemberController.java - 회원 조회, 블랙리스트 회원 조회 페이지 매핑
  * admin_index.jsp - 이미지 이름 살짝 수정
  	* alarm_freeBoard -> alarm_free_board
  	* member_blackList -> member_black_show
  * admin_member_black_show.jsp - 블랙리스트 회원 조회 페이지
  * admin_member_reset.jsp - 블랙리스트 회원 조회 페이지로 가는 링크 수정
  * admin_index.jsp - 블랙리스트 회원 조회 페이지로 가는 링크 수정 및 썸네일 이미지 이름 수정

2021-05-31:

   * 관리자 페이지
      * 각 기능 설명 세팅 완료  

   * 희망 도서
      * src/main/java/com/libraryManage/Controller/AdminController.java - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_index.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_member_black_show.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_member_hope.jsp - 희망 도서 페이지 생성
      * src/main/webapp/WEB-INF/VIEWS/admin_member_reset.jsp - 초기화 페이지 삭제
      * src/main/webapp/WEB-INF/VIEWS/admin_member_show.jsp - 경로 추가

   * 연체 도서
      * src/main/webapp/WEB-INF/VIEWS/admin_book_overdue.jsp - 연체 도서 페이지 생성
      * src/main/webapp/WEB-INF/VIEWS/admin_book_add.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_book_delete.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_book_update.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_index.jsp -경로 추가
      * src/main/java/com/libraryManage/Controller/AdminController.java - 경로 추가 

   * 도서 상세 페이지
      * src/main/resources/static/assets/img/1.jpg - 테스트 이미지
      * src/main/resources/static/assets/img/2.jpg - 테스트 이미지
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp - 도서상세 페이지
      * src/main/java/com/libraryManage/Controller/MainController.java - 경로 추가

   * 회원 블랙리스트 랭크 관리
      * src/main/webapp/WEB-INF/VIEWS/admin_member_black_show.jsp - 계정 랭크 수정 기능 추가  
      
   * 도서 추가 페이지 기능 추가
      * src/main/webapp/WEB-INF/VIEWS/admin_book_add.jsp
      * src/main/webapp/WEB-INF/VIEWS/admin_book_update.jsp
      * src/main/java/com/libraryManage/Controller/AdminBookController.java
      * src/main/java/com/libraryManage/DAO/BookDAO.java - 현재 Update 가 안됨 고쳐주세요 
      * src/main/java/com/libraryManage/DTO/BookDTO.java

   * 추천 도서 테이블 변경으로 인한 페이지 변경
      * src/main/webapp/WEB-INF/VIEWS/admin_alarm_good_add.jsp
      * src/main/webapp/WEB-INF/VIEWS/admin_alarm_good_delete.jsp
      * **JSP bookDTO 파트 부분 변경 필요!**

2021-05-31:

   * 연체 도서
      * src/main/java/com/libraryManage/DAO/CheckOutDAO.java - 연체 도서 데이터 가져오기
      * src/main/webapp/WEB-INF/VIEWS/admin_book_overdue.jsp - 연체 도서 목록 출력
   
   * 주석 처리
      * src/main/java/com/libraryManage/DTO/BookDTO.java - 빈 줄 삭제
      * src/main/resources/static/sql/databasesTable.md - SQL 문단 처리
      * src/main/java/com/libraryManage/Controller/AdminBookController.java - 어떤 부분인지 주석 추가
      * src/main/java/com/libraryManage/Controller/AdminBoardController.java - 관리자 게시판 부분 
      * src/main/java/com/libraryManage/Controller/AdminController.java - 어떤 부분인지 주석 추가
      * src/main/java/com/libraryManage/Controller/AdminGoodController.java - 어떤 부분인지 주석 추가
      * src/main/java/com/libraryManage/Controller/AdminMemberController.java - 어떤 부분인지 주석 추가
      * src/main/java/com/libraryManage/Controller/AdminNoticeController.java - 어떤 부분인지 주석 추가
   
   * 주소 매핑
      * src/main/java/com/libraryManage/Controller/AdminBookController.java - 주소 매핑
      * src/main/java/com/libraryManage/Controller/AdminController.java - 주소 매핑
      * src/main/java/com/libraryManage/Controller/AdminMemberController.java - 주소 

   * 회원 랭크 수정
      * src/main/webapp/WEB-INF/VIEWS/admin_member_black_show.jsp - 블랙리스트 회원 출력
      * src/main/java/com/libraryManage/Controller/AdminMemberController.java - 블랙리스트 회원 랭크 변경 처리
      * src/main/java/com/libraryManage/Controller/AdminGoodController.java - 블랙리스트 회원 랭크 변경 처리
      * src/main/java/com/libraryManage/Service/MemberService.java - 블랙리스트 회원 랭크 변경 
   
   * BookDTO 파트 변경 때문에 일어난 오류 처리
      * src/main/java/com/libraryManage/Controller/AdminGoodController.java
      * src/main/java/com/libraryManage/DAO/GoodDAO.java
      * src/main/java/com/libraryManage/DTO/GoodDTO.java
      * src/main/webapp/WEB-INF/VIEWS/admin_alarm_good_add.jsp
      * src/main/webapp/WEB-INF/VIEWS/admin_alarm_good_delete.jsp

   * 게시판 공개 설정 여부
     * src/main/java/com/libraryManage/Controller/AdminBoardController.java
     * src/main/java/com/libraryManage/DAO/BoardDAO.java
     * src/main/webapp/WEB-INF/VIEWS/admin_alarm_board_update.jsp - 구현 완료

   * 경로 지정 및 컨트롤러 분배
     * src/main/java/com/libraryManage/Controller/MainController.java
     * src/main/webapp/WEB-INF/VIEWS/index.jsp
     * src/main/java/com/libraryManage/Controller/BookController.java
     * src/main/webapp/WEB-INF/VIEWS/book_unified_search.jsp
     * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp

   * 도서 상세 페이지 이미지 처리 막힘
     * src/main/java/com/libraryManage/Controller/AdminBookController.java
     * src/main/java/com/libraryManage/DAO/BookDAO.java
     * src/main/java/com/libraryManage/DTO/BookDTO.java

   * 공지사항 목록 페이지 및 공지 사항 디테일 간단 구현
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/resources/static/js/scripts.js
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_unified_search.jsp
 
2021-06-01:
   * 줄바꿈 문자 살려서 저장하고 출력
      * src/main/java/com/libraryManage/Controller/AdminBookController.java
      * src/main/java/com/libraryManage/Controller/AdminGoodController.java
      * src/main/java/com/libraryManage/Controller/AdminNoticeController.java
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp

   * 메인 페이지로 경로 지정
      * src/main/webapp/WEB-INF/VIEWS/admin_book_add.jsp

   * 경로 저장하는 게 너무 길다고 해서 이름만 저장
      * src/main/java/com/libraryManage/Controller/AdminBookController.java

   * 이미지 이름 출력
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp

   * 자유 게시판 경로 세팅 및 목록 창과 세부창 구현
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/index.jsp 

   * 도서 대여 기능
      * src/main/java/com/libraryManage/Controller/BookController.java
      * src/main/java/com/libraryManage/Controller/MemberController.java
      * src/main/java/com/libraryManage/DAO/CheckOutDAO.java
      * src/main/java/com/libraryManage/Service/BookService.java
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp
      * src/main/java/com/libraryManage/Exception/NotLoginException.java

   * 도서관 소개 페이지
      * src/main/webapp/WEB-INF/VIEWS/library_introduce.jsp - 도서관 소개 페이지
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp - 도서관 소개 페이지 생성하면서 소개 문구 미세 변경
      * src/main/java/com/libraryManage/Controller/MainController.java - 경로 설정
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 디자인 변경

2021-06-02:

   * 희망 도서 페이지
      * src/main/webapp/WEB-INF/VIEWS/member_hope.jsp - 희망 도서 페이지 생성
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 경로 추가
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp - 조금의 코드 디자인 변경
      * src/main/java/com/libraryManage/Controller/MemberController.java  - 경로 세팅

   * 공지사항 페이지
      * src/main/webapp/WEB-INF/VIEWS/notice_unified_search.jsp - 공지사항 목차 페이지 생성
      * src/main/java/com/libraryManage/Controller/NoticeController.java - 콘트롤러 작성 및 경로 세팅
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 경로 지정
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp - 경로 지정

   * 공지사항 상세 페이지 및 자유 게시판 상세 페이지
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp - 자유게시판 상세 페이지 네비게이션 디자인 변경
      * src/main/webapp/WEB-INF/VIEWS/notice_detail.jsp - 공지 사항 상세 페이지 생성

   * 게시판 글쓰기 페이지
      * src/main/webapp/WEB-INF/VIEWS/board_write.jsp - 게시판 글쓰기 페이지
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp - 경로 지정
      * src/main/java/com/libraryManage/Controller/BoardController.java - 경로 세팅
      * src/main/webapp/WEB-INF/VIEWS/member_hope.jsp - 경로 지정
      * src/main/resources/static/js/scripts.js  - 글자 제한 제대로 안됨(기능은 추가)

   * 댓글 작성 기능 구현
      * src/main/java/com/libraryManage/Controller/AdminBookController.java
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/java/com/libraryManage/DAO/BookDAO.java
      * src/main/java/com/libraryManage/DTO/BookDTO.java
      * src/main/java/com/libraryManage/Service/BoardService.java
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp
      * src/main/java/com/libraryManage/DAO/CommentDAO.java
      * src/main/java/com/libraryManage/DTO/CommentDTO.java

   * 도서 신청 기능 구현 및 관리자 측 신청 도서 조회
      * src/main/java/com/libraryManage/DTO/HopeDTO.java
      * src/main/java/com/libraryManage/Controller/AdminMemberController.java
      * src/main/java/com/libraryManage/Controller/MemberController.java
      * src/main/java/com/libraryManage/DAO/HopeDAO.java
      * src/main/webapp/WEB-INF/VIEWS/admin_member_hope.jsp
      * src/main/webapp/WEB-INF/VIEWS/member_hope.jsp

   * 마이 페이지 생성
      * src/main/java/com/libraryManage/Controller/MemberController.java - 경로 세팅
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 변수 변경
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp - 경로 지정
      * src/main/webapp/WEB-INF/VIEWS/member_my_page.jsp - 마이 페이지 생성

   * 비밀번호 잊어버렸을 시 이메일을 입력했을 때, 해당하는 계정이 있다면 이메일로 임시 비밀번호 문자열을 생성해 전송
      * pom.xml - 의존성 추가
      * src/main/java/com/libraryManage/DAO/MemberDAO.java - 비밀번호 변경 쿼리문 추가
      * src/main/java/com/libraryManage/Service/MemberService.java - 이메일 보내는 기능 

2021-06-03:
   * 도서 반납 및 연장 기능 구현 완료
      * src/main/java/com/libraryManage/Controller/BooKController.java
      * src/main/java/com/libraryManage/Controller/MemberController.java
      * src/main/java/com/libraryManage/DAO/BookDAO.java
      * src/main/java/com/libraryManage/DAO/CheckOutDAO.java
      * src/main/java/com/libraryManage/DTO/CheckOutDTO.java
      * src/main/webapp/WEB-INF/VIEWS/member_my_page.jsp

   * 비밀 번호 변경 페이지 구현
      * src/main/webapp/WEB-INF/VIEWS/member_change_password.jsp - 비밀 번호 변경 페이지 생성
      * src/main/webapp/WEB-INF/VIEWS/member_forgotPwd.jsp - 잘못된 경로 고침
      * src/main/webapp/WEB-INF/VIEWS/member_login.jsp - 필요없는 버튼 삭제
      * src/main/webapp/WEB-INF/VIEWS/member_my_page.jsp - 잘못된 경로 고침

   * 비밀번호 변경 기능 완성 및 로그인 시 오류 처리
      * src/main/webapp/WEB-INF/VIEWS/member_change_password.jsp
      * src/main/java/com/libraryManage/Controller/MemberController.java

   * 세션 로그인에 따른 메인 네비게이션 바 기능 처리
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_write.jsp
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/book_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/index.jsp
      * src/main/webapp/WEB-INF/VIEWS/library_introduce.jsp
      * src/main/webapp/WEB-INF/VIEWS/member_hope.jsp
      * src/main/webapp/WEB-INF/VIEWS/notice_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/notice_unified_search.jsp 

   * 세션 로그인에 따른 서브 네비게이션 바 기능 처리
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/board_write.jsp
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/book_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/index.jsp
      * src/main/webapp/WEB-INF/VIEWS/member_hope.jsp
      * src/main/webapp/WEB-INF/VIEWS/notice_detail.jsp
      * src/main/webapp/WEB-INF/VIEWS/notice_unified_search.jsp

   * 인덱스 페이지에 공지사항 최신 5개 조회, 신간 도서 5권 조회, 사서 추천 도서 3권 조회 가능, 게시글 최근 3개 조회 가능, 링크도 걸어놨음
      * src/main/java/com/libraryManage/Controller/MainController.java - 주소 매핑 및 각 데이터 개수 출력
      * src/main/java/com/libraryManage/DAO/BoardDAO.java - 게시글 최근 3권
      * src/main/java/com/libraryManage/DAO/BookDAO.java - 신간 도서 5권
      * src/main/java/com/libraryManage/DAO/GoodDAO.java - 사서 추천 도서 3권 (도서 측에서 ISBN 으로 이미지도 가져옴)
      * src/main/java/com/libraryManage/DAO/NoticeDAO.java - 공지사항 최신 5개

   * 사서 추천 도서 목록 페이지 구현
      * src/main/webapp/bookImageStorage/800x0_2.jpg - 도서 추가하면서 넣어진 이미지
      * src/main/webapp/WEB-INF/VIEWS/good_unified_search.jsp - 추천 도서 목록 페이지
      * src/main/java/com/libraryManage/Controller/GoodController.java - 경로 세팅
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 경로 지정 및 추천 도서 목록 섹션 사이즈 변경
      * src/main/java/com/libraryManage/Controller/MainController.java - 경로 세팅
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp

   * 사서 추천 도서 상세 페이지 구현
      * src/main/webapp/WEB-INF/VIEWS/good_detail.jsp - 추천 도서 상세 페이지 작성
      * src/main/java/com/libraryManage/Controller/GoodController.java - 경로 세팅
      * src/main/java/com/libraryManage/DAO/GoodDAO.java - 추천 도서 상세 페이지에 이미지까지 따오도록 조정하는 함수 구현

2020-06-05 :

   * 인기 도서 섹션 추가
      * src/main/webapp/WEB-INF/VIEWS/hit_book_unified_search.jsp - 인기 도서(대여 5번 이상) 인 도서 목록만 가져오는 페이지 생성
      * src/main/java/com/libraryManage/Controller/BookController.java - 경로 세팅
      * src/main/java/com/libraryManage/DAO/BookDAO.java - SQL 작성
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - 인기 도서 섹션 구현
      * src/main/java/com/libraryManage/Controller/MainController.java - 경로 세팅

   * 상세 페이지 밑단 관련 장르 도서 출력
      * src/main/webapp/bookImageStorage/800x3.jpg - 테스팅 이미지
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp - 상세 페이지 밑단 관련 장르 도서 출력 구현
      * src/main/webapp/WEB-INF/VIEWS/book_unified_search.jsp - URL 경로 변수 추가
      * src/main/java/com/libraryManage/Controller/BookController.java - 경로 세팅
      * src/main/java/com/libraryManage/DAO/BookDAO.java - SQL 작성
      * src/main/webapp/WEB-INF/VIEWS/index.jsp - URL 경로 변수 추가

   * 상세 페이지 밑단 관련 업데이트 (현재 설명하는 도서를 제외한 관련 장르 도서 소개 및 5번 이상 빌린 도서일 경우 히트 태그 추가)
      * src/main/webapp/WEB-INF/VIEWS/book_detail.jsp
      * src/main/java/com/libraryManage/Controller/BookController.java
      * src/main/java/com/libraryManage/DAO/BookDAO.java
      * src/main/webapp/WEB-INF/VIEWS/hit_book_unified_search.jsp
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp 

   * 신간 도서 페이지 생성
      * src/main/webapp/WEB-INF/VIEWS/new_book_unified_search.jsp - 신간 도서 
      * src/main/java/com/libraryManage/Controller/BookController.java
      * src/main/java/com/libraryManage/DAO/BookDAO.java
      * src/main/java/com/libraryManage/DTO/BookDTO.java
      * src/main/webapp/WEB-INF/VIEWS/index.jsp
      * src/main/webapp/WEB-INF/VIEWS/member_index.jsp 

   * 마이 페이지 명언 기능 제공
      * src/main/java/com/libraryManage/DAO/PhraseDAO.java
      * src/main/webapp/WEB-INF/VIEWS/member_my_page.jsp 

   * 댓글 기능 수정 완료
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/java/com/libraryManage/DAO/BoardDAO.java
      * src/main/java/com/libraryManage/DAO/CommentDAO.java
      * src/main/java/com/libraryManage/DTO/CommentDTO.java
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp

   * 게시글 작성 기능 구현 및 도서 세부 페이지 URL 수정
      * src/main/java/com/libraryManage/DAO/BoardDAO.java
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/java/com/libraryManage/Controller/BookController.java
      * src/main/java/com/libraryManage/Service/MemberService.java
      * src/main/webapp/WEB-INF/VIEWS/board_write.jsp

   * 게시글 삭제 기능 구현
      * src/main/java/com/libraryManage/Controller/AdminBoardController.java
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/java/com/libraryManage/DAO/BoardDAO.java
      * src/main/java/com/libraryManage/DAO/CommentDAO.java
      * src/main/java/com/libraryManage/Service/BoardService.java
      * src/main/webapp/WEB-INF/VIEWS/board_detail.jsp

   * 도서 수정 기능 구현
      * src/main/java/com/libraryManage/Controller/AdminBookController.java
      * src/main/webapp/WEB-INF/VIEWS/admin_book_update.jsp

   * 도서 삭제 처리
      * src/main/java/com/libraryManage/Controller/AdminBookController.java
      * src/main/java/com/libraryManage/DAO/CheckOutDAO.java
   
   * 인기 도서 게시판은 인기도가 보이도록 제공 및 도서 추가하면서 생긴 이미지 삽입
      * src/main/webapp/WEB-INF/VIEWS/hit_book_unified_search.jsp
      
   * 마이페이지 도서관 소개 문구 변경
      * src/main/webapp/WEB-INF/VIEWS/member_my_page.jsp

   * 게시글 공개인 것만 보이게 설정
      * src/main/java/com/libraryManage/Controller/BoardController.java
      * src/main/java/com/libraryManage/DAO/BoardDAO.java
      * src/main/java/com/libraryManage/DAO/BoardDAO.java