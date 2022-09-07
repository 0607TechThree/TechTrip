package controller.Treply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreplyDAO;
import VO.TreplyVO;
import controller.TActionForward;
import controller.TInterface;

public class TreplyInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreplyDAO trdao=new TreplyDAO();
		TreplyVO trvo=new TreplyVO();
		
		String paramTrpk=request.getParameter("trpk");
		String paramTvpk=request.getParameter("tvpk");
		String paramTupk=request.getParameter("tupk");
		String paramTpmsg=request.getParameter("tpmsg");
		
		trvo.setTvpk(Integer.parseInt(paramTvpk));
		trvo.setTupk(Integer.parseInt(paramTupk));
		trvo.setTpmsg(paramTpmsg);

		if(trdao.insert(trvo)) {
			request.setAttribute("trpk", paramTrpk);
			forward=new TActionForward();
			forward.setPath("troomselectone.do");
			forward.setRedirect(false);
		}else {
			request.setAttribute("errormsg", "댓글 추가 실패");
			System.out.println("log: TreplyInsertAction");
		}
		return forward;
	}

}
