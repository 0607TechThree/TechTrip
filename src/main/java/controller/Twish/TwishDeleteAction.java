package controller.Twish;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TwishDAO;
import VO.TwishVO;
import controller.TActionForward;
import controller.TInterface;

public class TwishDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TwishDAO twdao=new TwishDAO();
		TwishVO twvo=new TwishVO();
		
		String paramTwpk=request.getParameter("twpk");
		
		twvo.setTwpk(Integer.parseInt(paramTwpk));
		
		if(twdao.delete(twvo)) {
			forward=new TActionForward();
			forward.setPath("mypage.jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "찜 삭제 실패");
			System.out.println("log: TwishDeleteAction");
		}
		return forward;
	}

}
