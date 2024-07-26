package net.hb.book;

public class LoginDTO {
	String userid;
	String pwd;
	
	//Èñ¸Áµµ¼­
	int hcode;
	String hname, hwname, hpublisher, hid;
	int hprice;
	
	//¿¹¸Åµµ¼­
	String bname, wname, publisher;
	
	@Override
	public String toString() {
		return "Login [userid=" + userid + ", pwd=" + pwd + "]";
	}//end

	public String getUserid() {	return userid;}

	public void setUserid(String userid) {	this.userid = userid;}

	public String getPwd() {	return pwd;}

	public void setPwd(String pwd) {	this.pwd = pwd;}

	public int getHcode() {	return hcode;}

	public void setHcode(int hcode) {	this.hcode = hcode;}

	public String getHname() {	return hname;}

	public void setHname(String hname) {	this.hname = hname;}

	public String getHwname() {	return hwname;}

	public void setHwname(String hwname) {	this.hwname = hwname;}

	public String getHpublisher() {	return hpublisher;}

	public void setHpublisher(String hpublisher) {	this.hpublisher = hpublisher;}

	public String getHid() {	return hid;}

	public void setHid(String hid) {	this.hid = hid;}

	public int getHprice() {	return hprice;}

	public void setHprice(int hprice) {	this.hprice = hprice;}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {	this.bname = bname;}

	public String getWname() {	return wname;}

	public void setWname(String wname) {	this.wname = wname;}

	public String getPublisher() {	return publisher;}

	public void setPublisher(String publisher) {	this.publisher = publisher;}
	
	
	
	
	
}//LoginDTO class End
