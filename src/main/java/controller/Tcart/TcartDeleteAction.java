package controller.Tcart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.TActionForward;
import controller.TInterface;

public class TcartDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward=null;
		
		String paramIndexNum=request.getParameter("indexNum");
		
		ArrayList<Integer> cart = (ArrayList<Integer>)session.getAttribute("cart");
		cart.remove(Integer.parseInt(paramIndexNum));
		
		forward=new TActionForward();
		forward.setPath("/mypage.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
