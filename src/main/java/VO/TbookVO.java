package VO;

public class TbookVO {
	private int tbpk;
	private int tupk;
	private int trpk;
	public int getTbpk() {
		return tbpk;
	}
	public void setTbpk(int tbpk) {
		this.tbpk = tbpk;
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
	@Override
	public String toString() {
		return "TbookVO [tbpk=" + tbpk + ", tupk=" + tupk + ", trpk=" + trpk + "]";
	}
	
}
