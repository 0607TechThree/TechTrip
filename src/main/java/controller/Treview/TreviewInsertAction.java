package controller.Treview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import VO.TreviewVO;
import controller.TActionForward;
import controller.TInterface;

public class TreviewInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreviewDAO trdao=new TreviewDAO();
		TreviewVO trvo=new TreviewVO();
		
		String paramTvpk=request.getParameter("tvpk");
		String paramTupk=request.getParameter("tupk");
		String paramTrpk=request.getParameter("trpk");
		String paramTstar=request.getParameter("tstar");

		trvo.setTvpk(Integer.parseInt(paramTvpk));
		trvo.setTupk(Integer.parseInt(paramTupk));
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		trvo.setTstar(Integer.parseInt(paramTstar));
		
		if(trdao.insert(trvo)) {
			forward=new TActionForward();
			forward.setPath("/troomdetail.jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "리뷰 추가 실패");
			System.out.println("log: TreviewInsertAction");
		}
		return forward;
	}

}
