package controller.Treview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.TActionForward;
import controller.TInterface;

public class TreviewSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 리뷰를 조회할 일이 없음
		return null;
	}

}
