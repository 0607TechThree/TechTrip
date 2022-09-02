package controller.Tbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TbookDAO;
import DAO.TroomDAO;
import VO.TbookVO;
import VO.TroomVO;
import controller.TActionForward;
import controller.TInterface;

public class TbookInsertAction implements TInterface{ // payd

	@Override
	public TActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		TActionForward forward=null;
		
		TbookDAO tbdao=new TbookDAO();
		TbookVO tbvo=new TbookVO();
		TroomVO trvo=new TroomVO();
		TroomDAO trdao=new TroomDAO();
		
		String paramTupk=request.getParameter("tupk");
		String paramTrpk=request.getParameter("trpk");
		
		tbvo.setTupk(Integer.parseInt(paramTupk));
		tbvo.setTrpk(Integer.parseInt(paramTrpk));
		
		trvo.setTrpk(Integer.parseInt(paramTrpk));
		
		if(tbdao.insert(tbvo)) {
			if(trdao.delete(trvo)) {				
				forward=new TActionForward();
				forward.setPath("main.do");
				forward.setRedirect(true);
			}else {
				request.setAttribute("errormsg", "예약 추가로 인한 troom delete 실패");
				System.out.println("log: TroomDeleteAction");
			}
		}else {
			request.setAttribute("errormsg", "예약 추가 실패");
			System.out.println("log: TbookInsertAction");
		}
		return forward;
	}

}
