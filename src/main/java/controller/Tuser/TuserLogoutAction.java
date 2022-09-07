package controller.Tuser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.TActionForward;
import controller.TInterface;

public class TuserLogoutAction implements TInterface{
	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.invalidate(); // 세션 정보 삭제
		
		TActionForward forward=new TActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		return forward;
	}
}
