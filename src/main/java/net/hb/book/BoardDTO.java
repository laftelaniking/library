package net.hb.book;



public class BoardDTO {
	int code ;
	int Gtotal;
	int pay,hit ;
	java.util.Date wdate ;
	String name ;
	
	//회원가입관련 변수
	String title ;
	String email ;
	int rn;
	String id ;
	String pass ;
	int birth ;
	String address ;
	String address_detail ;
	String phone ;
	String zipcode ;
	
	//도서관련 변수
		int bcode, issue ;
	 String mytitle, bname, wname, genre, publisher, poster;
	 java.util.Date publisheddate  ;
	 
	//페이징 및 검색관련 변수
  	String pnum = "1";
  	int pageNUM, pagecount;
  	int start, end;
  	int startpage, endpage;
  	int temp;
  	String sqry;
  	String skey="", sval="";
  	String returnpage="";
  	String returnsearch="";
  	int Stotal;
  	
  	//게시판관련 변수
  	int bnum;
		String bid;
  	String btitle;
  	String bcontent;
  	java.util.Date bdate;
  	
	 
	

	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public int getRn() {return rn;}
	public void setRn(int rn) {this.rn = rn;}
	public int getGtotal() {return Gtotal;}
	public void setGtotal(int gtotal) {Gtotal = gtotal;}
	public int getCode() {return code;}
	public void setCode(int code) {this.code = code;}
	public int getPay() {return pay;}
	public void setPay(int pay) {this.pay = pay;}
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	public java.util.Date getWdate() {return wdate;}
	public void setWdate(java.util.Date wdate) {this.wdate = wdate;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public int getBcode() {	return bcode;}
	public void setBcode(int bcode) {	this.bcode = bcode;}
	public int getIssue() {	return issue;}
	public void setIssue(int issue) {	this.issue = issue;}
	public String getMytitle() {	return mytitle;}
	public void setMytitle(String mytitle) {	this.mytitle = mytitle;}
	public String getBname() {	return bname;}
	public void setBname(String bname) {	this.bname = bname;}
	public String getWname() {	return wname;}
	public void setWname(String wname) {	this.wname = wname;}
	public String getGenre() {	return genre;}
	public void setGenre(String genre) {	this.genre = genre;}
	public String getPublisher() {	return publisher;}
	public void setPublisher(String publisher) {	this.publisher = publisher;}
	public String getPoster() {	return poster;}
	public void setPoster(String poster) {	this.poster = poster;}
	public String getPnum() {	return pnum;}
	public void setPnum(String pnum) {	this.pnum = pnum;}
	public int getPageNUM() {	return pageNUM;}
	public void setPageNUM(int pageNUM) {	this.pageNUM = pageNUM;}
	public int getPagecount() {	return pagecount;}
	public void setPagecount(int pagecount) {	this.pagecount = pagecount;}
	public int getStart() {	return start;}
	public void setStart(int start) {	this.start = start;}
	public int getEnd() {	return end;}
	public void setEnd(int end) {	this.end = end;}
	public int getStartpage() {	return startpage;}
	public void setStartpage(int startpage) {	this.startpage = startpage;}
	public int getEndpage() {	return endpage;}
	public void setEndpage(int endpage) {	this.endpage = endpage;}
	public int getTemp() {	return temp;}
	public void setTemp(int temp) {	this.temp = temp;}
	public String getSqry() {	return sqry;}
	public void setSqry(String sqry) {	this.sqry = sqry;}
	public String getSkey() {	return skey;}
	public void setSkey(String skey) {	this.skey = skey;}
	public String getSval() {	return sval;}
	public void setSval(String sval) {	this.sval = sval;}
	public String getReturnpage() {	return returnpage;}
	public void setReturnpage(String returnpage) {	this.returnpage = returnpage;}
	public String getReturnsearch() {	return returnsearch;}
	public void setReturnsearch(String returnsearch) {	this.returnsearch = returnsearch;}
	public int getStotal() {	return Stotal;}
	public void setStotal(int stotal) {	Stotal = stotal;}
	
	public java.util.Date getPublisheddate() {	return publisheddate;}
	public void setPublisheddate(java.util.Date publisheddate) {	this.publisheddate = publisheddate;}
	
	
	
	
	//회원가입
	public String getId() {	return id;}
	public void setId(String id) {	this.id = id;}
	public String getPass() {	return pass;}
	public void setPass(String pass) {	this.pass = pass;}
	public int getBirth() {	return birth;}
	public void setBirth(int birth) {	this.birth = birth;}
	public String getAddress() {	return address;}
	public void setAddress(String address) {	this.address = address;}
	public String getAddress_detail() {	return address_detail;}
	public void setAddress_detail(String address_detail) {	this.address_detail = address_detail;}
	public String getPhone() {	return phone;}
	public void setPhone(String phone) {	this.phone = phone;}
	public String getZipcode() {	return zipcode;}
	public void setZipcode(String zipcode) {	this.zipcode = zipcode;}
	
	
	
	//게시판 변수
	public int getBnum() {	return bnum;}
	public void setBnum(int bnum) {	this.bnum = bnum;}
	public String getBid() {	return bid;}
	public void setBid(String bid) {	this.bid = bid;}
	public String getBtitle() {	return btitle;}
	public void setBtitle(String btitle) {	this.btitle = btitle;}
	public String getBcontent() {	return bcontent;}
	public void setBcontent(String bcontent) {	this.bcontent = bcontent;}
	public java.util.Date getBdate() {	return bdate;}
	public void setBdate(java.util.Date bdate) {	this.bdate = bdate;}
	
	

	
	
	
	
	
	
}//class BlogDTO END
