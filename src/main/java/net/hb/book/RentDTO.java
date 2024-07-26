package net.hb.book;



public class RentDTO {
	
	//댓글관련변수
	int num;
	String content;
	String id;
	int bcode ;
	int bname ;
	
	int Gtotal;
	int pay,hit ;
	java.util.Date wdate ;
	String name ;
	String title ;
	String email ;
	int rn;
	
	
	//댓글관련변수
	public int getNum() {	return num;}
	public void setNum(int num) {	this.num = num;}
	public String getContent() {	return content;}
	public void setContent(String content) {	this.content = content;	}
	public String getId() {	return id;}
	public void setId(String id) {	this.id = id;}
	public int getBcode() {	return bcode;}
	public void setBcode(int bcode) {	this.bcode = bcode;}
	public int getBname() {	return bname;}
	public void setBname(int bname) {	this.bname = bname;}
	
	
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
	

	
}//class BlogDTO END
