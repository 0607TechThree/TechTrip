package VO;

import java.util.ArrayList;

public class TreviewSet {
	private TreviewVO treviewVO;
	private ArrayList<TreplyVO> rList;
	public TreviewVO getTreviewVO() {
		return treviewVO;
	}
	public void setTreviewVO(TreviewVO treviewVO) {
		this.treviewVO = treviewVO;
	}
	public ArrayList<TreplyVO> getrList() {
		return rList;
	}
	public void setrList(ArrayList<TreplyVO> rList) {
		this.rList = rList;
	}
	@Override
	public String toString() {
		return "TreviewSet [treviewVO=" + treviewVO + ", rList=" + rList + "]";
	}
	
}
