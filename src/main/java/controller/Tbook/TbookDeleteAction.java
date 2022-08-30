package controller.Tbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TbookDAO;
import VO.TbookVO;
import controller.TActionForward;
import controller.TInterface;

public class TbookDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		
		String paramTbpk=request.getParameter("tbpk");
		
		tbvo.setTbpk(Integer.parseInt(paramTbpk));
		
		if(tbdao.delete(tbvo)) {
			forward=new TActionForward();
			forward.setPath("mypage.jsp");
			forward.setRedirect(true);
		}else {
			request.setAttribute("errormsg", "예약자 삭제 실패");
			System.out.println("log: TbookDeleteAction");
		}
		return forward;
	}

}
