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
		
		String uri = request.getHeader("REFERER");
		System.out.println("uri : "+uri);
		String location = uri.substring(31);
		System.out.println(location);
		
		request.setAttribute("location", location);
		forward=new TActionForward();
		forward.setPath("login.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
