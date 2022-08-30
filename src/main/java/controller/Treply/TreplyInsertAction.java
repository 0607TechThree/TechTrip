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
		
		String paramTppk=request.getParameter("tppk");
		String paramTupk=request.getParameter("tupk");
		String paramTpmsg=request.getParameter("tpmsg");
		
		trvo.setTppk(Integer.parseInt(paramTppk));
		trvo.setTupk(Integer.parseInt(paramTupk));
		trvo.setTpmsg(paramTpmsg);

		if(trdao.insert(trvo)) {
			forward=new TActionForward();
			forward.setPath("troomdetail"+"trpk"+".jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "댓글 추가 실패");
			System.out.println("log: TreplyInsertAction");
		}
		return forward;
	}

}
