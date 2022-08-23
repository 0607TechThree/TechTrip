package VO;

public class TuserVO {
	private int tupk;
	private String tuid;
	private String tupw;
	private String turole;
	private String tunickname;
	private int tudel;
	private String tugender;
	private String tubirth;
	private String tuph;
	private int tuaddresszipcode;
	private String tuaddress;
	private String tuaddressdetail;
	private String tunation;
	public int getTupk() {
		return tupk;
	}
	public void setTupk(int tupk) {
		this.tupk = tupk;
	}
	public String getTuid() {
		return tuid;
	}
	public void setTuid(String tuid) {
		this.tuid = tuid;
	}
	public String getTupw() {
		return tupw;
	}
	public void setTupw(String tupw) {
		this.tupw = tupw;
	}
	public String getTurole() {
		return turole;
	}
	public void setTurole(String turole) {
		this.turole = turole;
	}
	public String getTunickname() {
		return tunickname;
	}
	public void setTunickname(String tunickname) {
		this.tunickname = tunickname;
	}
	public int getTudel() {
		return tudel;
	}
	public void setTudel(int tudel) {
		this.tudel = tudel;
	}
	public String getTugender() {
		return tugender;
	}
	public void setTugender(String tugender) {
		this.tugender = tugender;
	}
	public String getTubirth() {
		return tubirth;
	}
	public void setTubirth(String tubirth) {
		this.tubirth = tubirth;
	}
	public String getTuph() {
		return tuph;
	}
	public void setTuph(String tuph) {
		this.tuph = tuph;
	}
	public int getTuaddresszipcode() {
		return tuaddresszipcode;
	}
	public void setTuaddresszipcode(int tuaddresszipcode) {
		this.tuaddresszipcode = tuaddresszipcode;
	}
	public String getTuaddress() {
		return tuaddress;
	}
	public void setTuaddress(String tuaddress) {
		this.tuaddress = tuaddress;
	}
	public String getTuaddressdetail() {
		return tuaddressdetail;
	}
	public void setTuaddressdetail(String tuaddressdetail) {
		this.tuaddressdetail = tuaddressdetail;
	}
	public String getTunation() {
		return tunation;
	}
	public void setTunation(String tunation) {
		this.tunation = tunation;
	}
	@Override
	public String toString() {
		return "TuserVO [tupk=" + tupk + ", tuid=" + tuid + ", tupw=" + tupw + ", turole=" + turole + ", tunickname="
				+ tunickname + ", tudel=" + tudel + ", tugender=" + tugender + ", tubirth=" + tubirth + ", tuph=" + tuph
				+ ", tuaddresszipcode=" + tuaddresszipcode + ", tuaddress=" + tuaddress + ", tuaddressdetail="
				+ tuaddressdetail + ", tunation=" + tunation + "]";
	}
	
}
