package controller.Treview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import VO.TreviewVO;
import controller.TActionForward;
import controller.TInterface;

public class TreviewUpdateSAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreviewDAO trdao=new TreviewDAO();
		TreviewVO trvo=new TreviewVO();
		
		String paramTstar=request.getParameter("tstar");
		String paramTvpk=request.getParameter("tvpk");
		
		trvo.setTstar(Integer.parseInt(paramTstar));
		trvo.setTvpk(Integer.parseInt(paramTvpk));
		
		if(trdao.update_S(trvo)) {
			forward=new TActionForward();
			forward.setPath("###.jsp"); //어디로 보낼지?
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "별점 수정 실패");
			System.out.println("log: TreviewUpdateSAction");
		}
		return forward;
	}

}
