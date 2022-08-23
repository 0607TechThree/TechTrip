package VO;

public class TreplyVO {
	private int tppk;
	private int tupk;
	private int tvpk;
	private String tpmsg;
	public int getTppk() {
		return tppk;
	}
	public void setTppk(int tppk) {
		this.tppk = tppk;
	}
	public int getTupk() {
		return tupk;
	}
	public void setTupk(int tupk) {
		this.tupk = tupk;
	}
	public int getTvpk() {
		return tvpk;
	}
	public void setTvpk(int tvpk) {
		this.tvpk = tvpk;
	}
	public String getTpmsg() {
		return tpmsg;
	}
	public void setTpmsg(String tpmsg) {
		this.tpmsg = tpmsg;
	}
	@Override
	public String toString() {
		return "TreplyVO [tppk=" + tppk + ", tupk=" + tupk + ", tvpk=" + tvpk + ", tpmsg=" + tpmsg + "]";
	}
	
}
