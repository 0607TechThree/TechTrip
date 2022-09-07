package controller.Tuser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TuserDAO;
import VO.TuserVO;
import controller.TActionForward;
import controller.TInterface;

public class TuserUpdateAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		HttpSession session = request.getSession();
		
		TuserDAO tudao=new TuserDAO();
		TuserVO tuvo=new TuserVO();
				
		String paramTuid=request.getParameter("tuid");
		String paramTunickname=request.getParameter("tunickname");
		TuserVO logindata = (TuserVO)session.getAttribute("logininfo");
		
		tuvo.setTuid(paramTuid);
		tuvo.setTunickname(paramTunickname);
		
		if(tudao.update(tuvo)) {
			logindata = tudao.selectOne(logindata);
			session.setAttribute("logininfo", logindata);
			forward=new TActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "회원 정보 수정 실패");
			System.out.println("log: TuserUpdateAction");
		}
		return forward;
	}

}
