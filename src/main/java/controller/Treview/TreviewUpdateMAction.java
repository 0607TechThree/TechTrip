package controller.Treview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TreviewDAO;
import VO.TreviewVO;
import controller.TActionForward;
import controller.TInterface;

public class TreviewUpdateMAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TreviewDAO trdao=new TreviewDAO();
		TreviewVO trvo=new TreviewVO();
		
		String paramTboard=request.getParameter("tboard");
		String paramTvpk=request.getParameter("tvpk");
		
		trvo.setTboard(paramTboard);
		trvo.setTvpk(Integer.parseInt(paramTvpk));
		
		if(trdao.update_S(trvo)) {
			forward=new TActionForward();
			forward.setPath("###.jsp"); //어디로 보낼지?
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "리뷰 수정 실패");
			System.out.println("log: TreviewUpdateMAction");
		}
		return forward;
	}

}
