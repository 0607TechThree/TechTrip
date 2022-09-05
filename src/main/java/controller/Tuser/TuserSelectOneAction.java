package controller.Tuser;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TuserDAO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class TuserSelectOneAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward=null;
		
		TuserDAO tudao=new TuserDAO();
		TuserVO tuvo=new TuserVO();
				
		String paramTuid=request.getParameter("tuid");
		String paramTupw=request.getParameter("tupw");
		String paramLocation=request.getParameter("location");
		ArrayList<Integer> cart = new ArrayList<Integer>(); // 장바구니 세션
		
		tuvo.setTuid(paramTuid);
		tuvo.setTupw(paramTupw);
		
		TuserVO data=tudao.selectOne(tuvo);
		if(data != null) { // 로그인
			session.setAttribute("logininfo", data); // 로그인한 회원정보
			session.setAttribute("cart", cart); // 장바구니
			forward=new TActionForward();
			forward.setPath(paramLocation);
			forward.setRedirect(false);
		}
		else {
			request.setAttribute("errormsg", "로그인실패");
		}
		return forward;
	}

}
