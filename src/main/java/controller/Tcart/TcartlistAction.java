package controller.Tcart;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TroomDAO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TcartlistAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward=null;
		
		TroomDAO trdao = new TroomDAO();
		TroomVO trvo = new TroomVO();
		
		ArrayList<Integer> cart = (ArrayList<Integer>)session.getAttribute("cart");
		
		ArrayList<TroomVO> cartlist = new ArrayList<TroomVO>();
		for (int i = 0; i < cart.size(); i++) {
			trvo.setTrpk(cart.get(i));
			cartlist.add(trdao.selectOne(trvo));
		}
		System.out.println("카트리스트 : " + cartlist);
		
		forward=new TActionForward();
		request.setAttribute("cartlist", cartlist);
		forward.setPath("cart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
