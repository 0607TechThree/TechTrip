package VO;

public class TroomVO {
	private int trpk;
	private String trcategory;
	private String traddress;
	private String trregion;
	private String trname;
	private int trprice;
	private String trinfo;
	private int tupk;
	private int trdel;
	private String checkin;
	private String checkout;
	public int getTrpk() {
		return trpk;
	}
	public void setTrpk(int trpk) {
		this.trpk = trpk;
	}
	public String getTrcategory() {
		return trcategory;
	}
	public void setTrcategory(String trcategory) {
		this.trcategory = trcategory;
	}
	public String getTraddress() {
		return traddress;
	}
	public void setTraddress(String traddress) {
		this.traddress = traddress;
	}
	public String getTrregion() {
		return trregion;
	}
	public void setTrregion(String trregion) {
		this.trregion = trregion;
	}
	public String getTrname() {
		return trname;
	}
	public void setTrname(String trname) {
		this.trname = trname;
	}
	public int getTrprice() {
		return trprice;
	}
	public void setTrprice(int trprice) {
		this.trprice = trprice;
	}
	public String getTrinfo() {
		return trinfo;
	}
	public void setTrinfo(String trinfo) {
		this.trinfo = trinfo;
	}
	public int getTupk() {
		return tupk;
	}
	public void setTupk(int tupk) {
		this.tupk = tupk;
	}
	public int getTrdel() {
		return trdel;
	}
	public void setTrdel(int trdel) {
		this.trdel = trdel;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	@Override
	public String toString() {
		return "TroomVO [trpk=" + trpk + ", trcategory=" + trcategory + ", traddress=" + traddress + ", trregion="
				+ trregion + ", trname=" + trname + ", trprice=" + trprice + ", trinfo=" + trinfo + ", tupk=" + tupk
				+ ", trdel=" + trdel + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
}
