package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TuserDAO;
import VO.TuserVO;

public class SNSLoginAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		TActionForward forward = null;
		
		String paramLocation=request.getParameter("location");
		ArrayList<Integer> cart = new ArrayList<Integer>(); // 장바구니 세션
		
		TuserVO tuvo = new TuserVO();
		TuserDAO tudao = new TuserDAO();
		
		String paramkemail = null;
		String paramnemail = null;
		String paramuserh = null;
		
		if(request.getParameter("kemail") != null) {
			paramkemail = request.getParameter("kemail");
			request.setAttribute("kemail", paramkemail);
			tuvo.setKemail(paramkemail);
		}else{
			paramnemail = request.getParameter("nemail");
			request.setAttribute("nemail", paramnemail);
			paramuserh = request.getParameter("userh");
			request.setAttribute("userh", paramuserh);
			tuvo.setNemail(paramnemail);
		}
		tuvo = tudao.selectOne(tuvo);
		System.out.println("snslogaction에서의 tuvo "+tuvo);
		if(tuvo==null) {
			forward=new TActionForward();
			forward.setPath("/join.jsp");
			forward.setRedirect(false);
		}else {
			session.setAttribute("logininfo", tuvo); // 로그인한 회원정보
			session.setAttribute("cart", cart); // 장바구니
			forward=new TActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		return forward;
	}

}
