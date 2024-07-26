package net.hb.book;


public class HbookDTO { //디티오=VO
	
	
	//희망도서 관련
	 String hname, hwname, hpublisher, hid;
	 int hprice ;
	 
	 int code ;
		int Gtotal;
		int pay,hit ;
		java.util.Date wdate ;
		String name ;
		String title ;
		String email ;
		int rn; //행번호 
		
		//페이징관련 필드 
		String pnum = "1" ;
		int pageNUM, pagecount ;
		int start, end ;    
		int startpage, endpage ;      
		int temp ;
		
		//검색관련 필드 
		String sqry ; 
		String skey="";
		String sval="" ;
		String returnpage ="";  
		String returnsearch =""; 
		int Stotal;
		
		
		
	 
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHwname() {
		return hwname;
	}
	public void setHwname(String hwname) {
		this.hwname = hwname;
	}
	public String getHpublisher() {
		return hpublisher;
	}
	public void setHpublisher(String hpublisher) {
		this.hpublisher = hpublisher;
	}
	public int getHprice() {
		return hprice;
	}
	public void setHprice(int hprice) {
		this.hprice = hprice;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getGtotal() {
		return Gtotal;
	}
	public void setGtotal(int gtotal) {
		Gtotal = gtotal;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public java.util.Date getWdate() {
		return wdate;
	}
	public void setWdate(java.util.Date wdate) {
		this.wdate = wdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public int getPageNUM() {
		return pageNUM;
	}
	public void setPageNUM(int pageNUM) {
		this.pageNUM = pageNUM;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public String getSqry() {
		return sqry;
	}
	public void setSqry(String sqry) {
		this.sqry = sqry;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public String getReturnpage() {
		return returnpage;
	}
	public void setReturnpage(String returnpage) {
		this.returnpage = returnpage;
	}
	public String getReturnsearch() {
		return returnsearch;
	}
	public void setReturnsearch(String returnsearch) {
		this.returnsearch = returnsearch;
	}
	public int getStotal() {
		return Stotal;
	}
	public void setStotal(int stotal) {
		Stotal = stotal;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	
	
	
	 
	 
	
}//class BoardDTO END
