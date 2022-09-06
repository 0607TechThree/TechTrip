package controller.Tuser;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TuserDAO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class LoginAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		String uri = request.getHeader("REFERER"); // 로그인을 누를 시 frontcontroller를 거치는데, 이 때 거치기 전 페이지의 주소를 저장
		System.out.println("uri : "+uri);
		String location = uri.substring(31); // uri에서 필요한 action만 자름
		System.out.println(location);
		
		request.setAttribute("location", location);
		forward=new TActionForward();
		forward.setPath("login.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
