package controller.Tcart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.TActionForward;
import controller.TInterface;

public class TcartInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward=null;
		
		String paramTrpk=request.getParameter("trpk");
		
		ArrayList<Integer> cart = (ArrayList<Integer>)session.getAttribute("cart");
		cart.add(Integer.parseInt(paramTrpk));
		
		System.out.println(cart);
		
		forward=new TActionForward();
		request.setAttribute("trpk", paramTrpk);
		forward.setPath("troomselectone.do");
		forward.setRedirect(false);
		return forward;
	}

}	