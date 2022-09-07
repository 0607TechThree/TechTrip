package controller.Tbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.TActionForward;
import controller.TInterface;

public class TbookUpdateAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 예약 정보를 수정할 일이 없음
		return null;
	}

}
