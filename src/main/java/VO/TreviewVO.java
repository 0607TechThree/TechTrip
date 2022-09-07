package VO;

public class TreviewVO {
	private int tvpk;
	private int tupk;
	private int trpk;
	private int tstar;
	private String tboard;
	public int getTvpk() {
		return tvpk;
	}
	public void setTvpk(int tvpk) {
		this.tvpk = tvpk;
	}
	public int getTupk() {
		return tupk;
	}
	public void setTupk(int tupk) {
		this.tupk = tupk;
	}
	public int getTrpk() {
		return trpk;
	}
	public void setTrpk(int trpk) {
		this.trpk = trpk;
	}
	public int getTstar() {
		return tstar;
	}
	public void setTstar(int tstar) {
		this.tstar = tstar;
	}
	public String getTboard() {
		return tboard;
	}
	public void setTboard(String tboard) {
		this.tboard = tboard;
	}
	@Override
	public String toString() {
		return "TreviewVO [tvpk=" + tvpk + ", tupk=" + tupk + ", trpk=" + trpk + ", tstar=" + tstar + ", tboard="
				+ tboard + "]";
	}
	
}
