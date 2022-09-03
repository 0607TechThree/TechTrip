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
		
		String paramTupk=request.getParameter("tupk");
		String paramTrpk=request.getParameter("trpk");
		String paramTboard=request.getParameter("tboard");
		String paramTstar=request.getParameter("tstar");

		trvo.setTupk(Integer.parseInt(paramTupk));
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		trvo.setTboard(paramTboard);
		trvo.setTstar(Integer.parseInt(paramTstar));
		
		if(trdao.insert(trvo)) {
			request.setAttribute("trpk", paramTrpk);
			forward=new TActionForward();
			forward.setPath("troomselectone.do");
			forward.setRedirect(false);
		}else {
			request.setAttribute("errormsg", "리뷰 추가 실패");
			System.out.println("log: TreviewInsertAction");
		}
		return forward;
	}

}
