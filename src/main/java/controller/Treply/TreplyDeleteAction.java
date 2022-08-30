package controller.Treply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreplyDAO;
import VO.TreplyVO;
import controller.TActionForward;
import controller.TInterface;

public class TreplyDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreplyDAO trdao=new TreplyDAO();
		TreplyVO trvo=new TreplyVO();
		
		String paramTppk=request.getParameter("tppk");
		
		trvo.setTppk(Integer.parseInt(paramTppk));
		
		if(trdao.delete(trvo)) {
			forward=new TActionForward();
			forward.setPath("###.jsp"); //어디로 보낼지?
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "댓글 삭제 실패");
			System.out.println("log: TreplyDeleteAction");
		}
		return forward;
	}

}
