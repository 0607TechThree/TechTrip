package controller.Tbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TbookDAO;
import DAO.TroomDAO;
import VO.TbookVO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TbookDeleteAction implements TInterface{

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		TroomDAO trdao=new TroomDAO();
		TroomVO trvo=new TroomVO();
		
		String paramTrpk=request.getParameter("trpk");
		
		tbvo.setTrpk(Integer.parseInt(paramTrpk));
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		
		if(tbdao.delete(tbvo) && trdao.deletere(trvo)) {
			forward=new TActionForward();
			forward.setPath("/mypage.do");
			forward.setRedirect(false);
		}else {
			request.setAttribute("errormsg", "예약 삭제 실패");
			System.out.println("log: TbookDeleteAction");
		}
		return forward;
	}

}
