package controller.Twish;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TwishDAO;
import VO.TwishVO;
import controller.TActionForward;
import controller.TInterface;

public class TwishInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TwishDAO twdao=new TwishDAO();
		TwishVO twvo=new TwishVO();
		
		String paramTupk=request.getParameter("tupk");
		String paramTrpk=request.getParameter("trpk");
		
		twvo.setTupk(Integer.parseInt(paramTupk));
		twvo.setTrpk(Integer.parseInt(paramTrpk));
		
		if(twdao.insert(twvo)) {
			forward=new TActionForward();
			forward.setPath("troomdetail"+"trpk"+".jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "찜 추가 실패");
			System.out.println("log: TwishInsertAction");
		}
		return forward;
	}

}
