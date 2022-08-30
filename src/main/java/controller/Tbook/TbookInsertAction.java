package controller.Tbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TbookDAO;
import VO.TbookVO;
import controller.TActionForward;
import controller.TInterface;

public class TbookInsertAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		
		String paramTupk=request.getParameter("tupk");
		String paramTrpk=request.getParameter("trpk");
		
		tbvo.setTupk(Integer.parseInt(paramTupk));
		tbvo.setTrpk(Integer.parseInt(paramTrpk));
		
		if(tbdao.insert(tbvo)) {
			forward=new TActionForward();
			forward.setPath("troomdetail"+"trpk"+".jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "예약자 추가 실패");
			System.out.println("log: TbookInsertAction");
		}
		return forward;
	}

}
