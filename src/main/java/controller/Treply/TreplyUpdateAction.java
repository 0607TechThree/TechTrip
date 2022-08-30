package controller.Treply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreplyDAO;
import VO.TreplyVO;
import controller.TActionForward;
import controller.TInterface;

public class TreplyUpdateAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreplyDAO trdao=new TreplyDAO();
		TreplyVO trvo=new TreplyVO();
		
		String paramTppk=request.getParameter("tppk");
		//String paramTpmsg=request.getParameter("tpmsg");
		
		trvo.setTppk(Integer.parseInt(paramTppk));
		//trvo.setTpmsg(paramTpmsg);

		if(trdao.update(trvo)) {
			forward=new TActionForward();
			forward.setPath("###.jsp"); //어디로 보낼지?
			forward.setRedirect(false);
		}else {
			request.setAttribute("errormsg", "댓글 수정 실패");
			System.out.println("log: TreplyUpdateAction");
		}
		return forward;
	}

}
