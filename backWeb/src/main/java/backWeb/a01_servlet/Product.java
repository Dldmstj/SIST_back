package backWeb.a01_servlet;

public class Product {
	private String pname;
	private int price;
	private int pcnt;
	private String pinfo;
	
	public Product() {}
	
	public Product(String pname, int price, int pcnt, String pinfo) {
		this.pname = pname;
		this.price = price;
		this.pcnt = pcnt;
		this.pinfo = pinfo;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	
	
}
