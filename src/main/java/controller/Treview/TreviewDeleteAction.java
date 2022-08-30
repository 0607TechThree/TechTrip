package controller.Treview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import VO.TreviewVO;
import controller.TActionForward;
import controller.TInterface;

public class TreviewDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreviewDAO trdao=new TreviewDAO();
		TreviewVO trvo=new TreviewVO();
		
		String paramTvpk=request.getParameter("tvpk");
		String paramTrpk=request.getParameter("trpk");
		
		trvo.setTvpk(Integer.parseInt(paramTvpk));
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		
		if(trdao.delete(trvo)) {
			forward=new TActionForward();
			forward.setPath("troomdetail"+"trpk"+".jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "리뷰 삭제 실패");
			System.out.println("log: TreviewDeleteAction");
		}
		return forward;
	}

}
