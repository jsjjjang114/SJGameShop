package game;

import java.sql.Timestamp;

public class GameBean {
	private int gnum;
	private String gtitle;
	private String gdeveloper;
	private int gprice;
	private String ggenre;
	private String gcontent;
	private Timestamp grel_date;
	private String grating;
	private String gimage;
	private String platform;
	private int sales;
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGtitle() {
		return gtitle;
	}
	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}
	public String getGdeveloper() {
		return gdeveloper;
	}
	public void setGdeveloper(String gdeveloper) {
		this.gdeveloper = gdeveloper;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public String getGgenre() {
		return ggenre;
	}
	public void setGgenre(String ggenre) {
		this.ggenre = ggenre;
	}
	public String getGcontent() {
		return gcontent;
	}
	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}
	public Timestamp getGrel_date() {
		return grel_date;
	}
	public void setGrel_date(Timestamp grel_date) {
		this.grel_date = grel_date;
	}
	public String getGrating() {
		return grating;
	}
	public void setGrating(String grating) {
		this.grating = grating;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
}
