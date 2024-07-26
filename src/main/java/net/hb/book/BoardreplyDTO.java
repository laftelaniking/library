package net.hb.book;



public class BoardreplyDTO {
	
	//게시판댓글관련변수
	int dnum;
	int bnum;
	String dcontent;
	String bid;

	
	int Gtotal;
	int pay,hit ;
	java.util.Date wdate ;
	String name ;
	String title ;
	String email ;
	int rn;
	
	
	//게시판댓글관련변수
	public int getDnum() {	return dnum;}
	public void setDnum(int dnum) {	this.dnum = dnum;}
	public String getDcontent() {	return dcontent;}
	public void setDcontent(String dcontent) {	this.dcontent = dcontent;}
	public String getBid() {	return bid;}
	public void setBid(String bid) {	this.bid = bid;}
	public int getGtotal() {	return Gtotal;}	
	public void setGtotal(int gtotal) {	Gtotal = gtotal;}
	public int getPay() {	return pay;}
	public void setPay(int pay) {	this.pay = pay;}
	public int getHit() {	return hit;}
	public void setHit(int hit) {	this.hit = hit;}
	public java.util.Date getWdate() {	return wdate;}
	public void setWdate(java.util.Date wdate) {	this.wdate = wdate;}
	public String getName() {	return name;}
	public void setName(String name) {	this.name = name;}
	public String getTitle() {	return title;}
	public void setTitle(String title) {	this.title = title;}
	public String getEmail() {	return email;}
	public void setEmail(String email) {	this.email = email;}
	public int getRn() {	return rn;}
	public void setRn(int rn) {	this.rn = rn;}
	public int getBnum() {	return bnum;}
	public void setBnum(int bnum) {	this.bnum = bnum;}
	
	


	

	
}//class BlogDTO END
